# terraform-tfe-variable-set
Terraform module to provision and manage Terraform Cloud variable sets

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_tfe"></a> [tfe](#requirement\_tfe) | >= 0.39.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_tfe"></a> [tfe](#provider\_tfe) | >= 0.39.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [tfe_variable.this](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable_set.this](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable_set) | resource |
| [tfe_workspace_variable_set.this](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/workspace_variable_set) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | (Optional) A description for the variable set | `string` | `""` | no |
| <a name="input_environment_sensitive_variables"></a> [environment\_sensitive\_variables](#input\_environment\_sensitive\_variables) | (Optional) Map of sensitive variables of 'environment' category used in the variable set<br><br>  Item syntax:<br>  {<br>    variable1\_name = value1<br>    variable2\_name = value2<br>    ...<br>  } | `map(any)` | `{}` | no |
| <a name="input_environment_variables"></a> [environment\_variables](#input\_environment\_variables) | (Optional) Map of variables of 'environment' category used in the variable set<br><br>  Item syntax:<br>  {<br>    variable1\_name = value1<br>    variable2\_name = value2<br>    ...<br>  } | `map(any)` | `{}` | no |
| <a name="input_global"></a> [global](#input\_global) | (Optional) Whether or not the variable set applies to all workspaces in the organization | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | (Required) Name of the variable set | `string` | n/a | yes |
| <a name="input_organization"></a> [organization](#input\_organization) | (Required) Name of the organization | `string` | n/a | yes |
| <a name="input_terraform_hcl_sensitive_variables"></a> [terraform\_hcl\_sensitive\_variables](#input\_terraform\_hcl\_sensitive\_variables) | (Optional) Map of sensitive variables in HCL format of 'Terraform' category used in the variable set<br><br>  Item syntax:<br>  {<br>    variable1\_name = value1<br>    variable2\_name = value2<br>    ...<br>  }<br><br>NOTE: you can specifies values in HCL format directly, like this:<br><br>  {<br>    variable\_list = ["item1","item2"]<br><br>    variable\_map = {<br>      key1 = value1<br>      key2 = value2<br>    }<br>  } | `any` | `{}` | no |
| <a name="input_terraform_hcl_variables"></a> [terraform\_hcl\_variables](#input\_terraform\_hcl\_variables) | (Optional) Map of variables in HCL format of 'Terraform' category used in the variable set<br><br>  Item syntax:<br>  {<br>    variable1\_name = value1<br>    variable2\_name = value2<br>    ...<br>  }<br><br>NOTE: you can specifies values in HCL format directly, like this:<br><br>  {<br>    variable\_list = ["item1","item2"]<br><br>    variable\_map = {<br>      key1 = value1<br>      key2 = value2<br>    }<br>  }<br>} | `any` | `{}` | no |
| <a name="input_terraform_sensitive_variables"></a> [terraform\_sensitive\_variables](#input\_terraform\_sensitive\_variables) | (Optional) Map of sensitive variables of 'Terraform' category used in the variable set<br><br>Item syntax:<br>{<br>  variable1\_name = value1<br>  variable2\_name = value2<br>  ...<br>} | `map(any)` | `{}` | no |
| <a name="input_terraform_variables"></a> [terraform\_variables](#input\_terraform\_variables) | (Optional) Map of variables of 'Terraform' category used in the workspace<br><br>  Item syntax:<br>  {<br>    variable1\_name = value1<br>    variable2\_name = value2<br>    ...<br>  } | `map(any)` | `{}` | no |
| <a name="input_variables_descriptions"></a> [variables\_descriptions](#input\_variables\_descriptions) | (Optional) Map of descriptions applied to variable set variables<br><br>  Item syntax:<br>  {<br>    variable1\_name = "description"<br>    variable2\_name = "description"<br>    ...<br>  } | `map(string)` | `{}` | no |
| <a name="input_workspace_ids"></a> [workspace\_ids](#input\_workspace\_ids) | (Optional) IDs of the workspaces that use the variable set. Must not be set if global is true | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the variable set |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
