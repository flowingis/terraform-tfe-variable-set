locals {
  terraform_variables = { for k, v in var.terraform_variables : k =>
    {
      value       = v
      category    = "terraform"
      description = lookup(var.variables_descriptions, k, null)
    }
  }

  terraform_hcl_variables = { for k, v in var.terraform_hcl_variables : k =>
    {
      #NOTE: using @osterman trick https://github.com/hashicorp/terraform-provider-tfe/issues/188#issuecomment-700212045
      value       = replace(jsonencode(v), "/(\".*?\"):/", "$1 = ")
      category    = "terraform"
      hcl         = true
      description = lookup(var.variables_descriptions, k, null)
    }
  }

  terraform_sensitive_variables = { for k, v in var.terraform_sensitive_variables : k =>
    {
      value       = v
      category    = "terraform"
      description = lookup(var.variables_descriptions, k, null)
      sensitive   = true
    }
  }

  terraform_hcl_sensitive_variables = { for k, v in var.terraform_hcl_sensitive_variables : k =>
    {
      #NOTE: using @osterman trick https://github.com/hashicorp/terraform-provider-tfe/issues/188#issuecomment-700212045
      value       = replace(jsonencode(v), "/(\".*?\"):/", "$1 = ")
      category    = "terraform"
      description = lookup(var.variables_descriptions, k, null)
      hcl         = true
      sensitive   = true
    }
  }

  environment_variables = { for k, v in var.environment_variables : k =>
    {
      value       = v
      category    = "env"
      description = lookup(var.variables_descriptions, k, null)
    }
  }

  environment_sensitive_variables = { for k, v in var.environment_sensitive_variables : k =>
    {
      value       = v
      category    = "env"
      description = lookup(var.variables_descriptions, k, null)
      sensitive   = true
    }
  }

  all_variables = merge(
    local.terraform_variables,
    local.terraform_hcl_variables,
    local.terraform_sensitive_variables,
    local.terraform_hcl_sensitive_variables,
    local.environment_variables,
    local.environment_sensitive_variables
  )
}

resource "tfe_variable_set" "this" {
  name         = var.name
  description  = var.description
  organization = var.organization
  global       = var.global
}

resource "tfe_variable" "this" {
  for_each = local.all_variables

  key             = each.key
  value           = each.value.value
  hcl             = try(each.value.hcl, null)
  category        = each.value.category
  description     = try(each.value.description, null)
  sensitive       = try(each.value.sensitive, false)
  variable_set_id = tfe_variable_set.this.id
}

resource "tfe_workspace_variable_set" "this" {
  count = length(var.workspace_ids)

  variable_set_id = tfe_variable_set.this.id
  workspace_id    = var.workspace_ids[count.index]
}
