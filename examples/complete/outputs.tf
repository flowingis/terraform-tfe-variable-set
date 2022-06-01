output "global_variable_set_id" {
  description = "The ID of Terraform Cloud variable_set applied to all organization workspaces"
  value       = module.global_variable_set.id
}

output "complete_specific_variable_set_id" {
  description = "The ID of Terraform Cloud variable_set applied to specific organization workspaces"
  value       = module.complete_specific_variable_set.id
}
