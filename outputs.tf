output "id" {
  description = "The ID of the variable set"
  value       = tfe_variable_set.this.id
}

output "variable_ids" {
  description = "The ID of the variables contained in the variable set"
  value = {
    for key, variable in tfe_variable.this : key => variable.id
  }
}
