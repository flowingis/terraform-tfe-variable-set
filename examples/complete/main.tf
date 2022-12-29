terraform {
  required_version = "~> 1.2.0"

  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "~> 0.39.0"
    }
  }
}

provider "tfe" {
  token = var.tfc_token
}

data "tfe_organization" "myorg" {
  name = "myorg"
}

module "global_variable_set" {
  source = "../../"

  name         = "global-variable-set"
  organization = data.tfe_organization.myorg.name
  description  = "A global Terraform Cloud variable set applied to all organization workspaces"
  global       = true

  terraform_variables = {
    common_variable = "foo"
  }

  variables_descriptions = {
    common_variable = "This variable is defined in all workspaces"
  }
}

module "complete_specific_variable_set" {
  source = "../../"

  name         = "complete-specific-variable-set"
  organization = data.tfe_organization.myorg.name
  description  = "A complete Terraform Cloud variable set applied to specific organization workspaces"

  terraform_variables = {
    string_variable = "stringvalue"
    number_variable = 1
    bool_variable   = true
  }

  terraform_sensitive_variables = {
    secret_token = var.secret_token #NOTE: sensitive value
  }

  terraform_hcl_variables = {
    list_of_values = ["a", "b", "c"]
    map_of_values = {
      key1 = "value1"
      key2 = "value2"
      key3 = 12345
    }
  }

  terraform_hcl_sensitive_variables = {
    list_of_secret_values = var.list_of_secret_values #NOTE: sensitive values
    map_of_secret_values  = var.map_of_secret_values  #NOTE: sensitive values
  }

  environment_variables = {
    TG_LOG = "trace"
  }

  environment_sensitive_variables = {
    AWS_ACCESS_KEY_ID     = var.access_key_id     #NOTE: sensitive value
    AWS_SECRET_ACCESS_KEY = var.secret_access_key #NOTE: sensitive value
  }

  variables_descriptions = {
    string_variable       = "A variable containing a value in string format"
    number_variable       = "A variable containing a value in number format"
    bool_variable         = "A variable containing a value in boolean format"
    list_of_values        = "A variable in HCL format containing a value in list of strings format"
    map_of_values         = "A variable in HCL format containing a value in map of items"
    list_of_secret_values = "A variable in HCL format containing a sensitive value in list of strings format"
    map_of_secret_values  = "A variable in HCL format containing a sensitive value in map of items"
    TF_LOG                = "Enables detailed logs to appear on stderr which is useful for debugging"
    AWS_ACCESS_KEY_ID     = "Access Key ID to access AWS Account"
    AWS_SECRET_ACCESS_KEY = "Secret Access Key to access AWS Account"
  }
}

module "workspace" {
  source  = "flowingis/workspace/tfe"
  version = "0.4.0"

  name         = "my-workspace-1"
  description  = "A simple Terraform Cloud/Enterprise workspace"
  organization = data.tfe_organization.myorg.name

  terraform_version = "1.3.6"

  variable_set_ids = [
    module.complete_specific_variable_set.id
  ]
}
