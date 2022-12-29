# terraform-tfe-workspace

This example will show how to define Terraform Cloud variable sets containing all type of variables

## Usage

To run this example, you need to execute the following commands:

```shell
$ terraform init
$ terraform plan
$ terraform apply
```

:memo: **Note:** You will need a Terraform Cloud/Enterprise API token for authentication.
You'll be prompted to insert it to provide a value for "tfc_token" variable.
See [here](https://www.terraform.io/cloud-docs/users-teams-organizations/api-tokens)
for further information.

:memo: **Note:** This root modules defines other several sensitive variables.
You'll be prompted to insert the required values by default on every "plan" and "apply" action
Choose the appropriate method to automatically specify these values, like described [here](https://www.terraform.io/language/values/variables#assigning-values-to-root-module-variables)

:warning: **Warning:** This example may create resources that cost money. Execute the command
`terraform destroy` when the resources are no longer needed.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.2.0 |
| <a name="requirement_tfe"></a> [tfe](#requirement\_tfe) | ~> 0.39.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_tfe"></a> [tfe](#provider\_tfe) | ~> 0.39.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_complete_specific_variable_set"></a> [complete\_specific\_variable\_set](#module\_complete\_specific\_variable\_set) | ../../ | n/a |
| <a name="module_global_variable_set"></a> [global\_variable\_set](#module\_global\_variable\_set) | ../../ | n/a |
| <a name="module_workspace"></a> [workspace](#module\_workspace) | flowingis/workspace/tfe | 0.4.0 |

## Resources

| Name | Type |
|------|------|
| [tfe_organization.myorg](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/data-sources/organization) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_key_id"></a> [access\_key\_id](#input\_access\_key\_id) | Access Key ID to access AWS Account | `string` | n/a | yes |
| <a name="input_list_of_secret_values"></a> [list\_of\_secret\_values](#input\_list\_of\_secret\_values) | A list of strings containing sensitive values | `list(string)` | n/a | yes |
| <a name="input_map_of_secret_values"></a> [map\_of\_secret\_values](#input\_map\_of\_secret\_values) | A map containing sensitive values | `map(any)` | n/a | yes |
| <a name="input_secret_access_key"></a> [secret\_access\_key](#input\_secret\_access\_key) | Secret Access Key to access AWS Account | `string` | n/a | yes |
| <a name="input_secret_token"></a> [secret\_token](#input\_secret\_token) | A secret token used in some resource configuration | `string` | n/a | yes |
| <a name="input_tfc_token"></a> [tfc\_token](#input\_tfc\_token) | Token for Terraform Cloud Authentication | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_complete_specific_variable_set_id"></a> [complete\_specific\_variable\_set\_id](#output\_complete\_specific\_variable\_set\_id) | The ID of Terraform Cloud variable\_set applied to specific organization workspaces |
| <a name="output_global_variable_set_id"></a> [global\_variable\_set\_id](#output\_global\_variable\_set\_id) | The ID of Terraform Cloud variable\_set applied to all organization workspaces |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
