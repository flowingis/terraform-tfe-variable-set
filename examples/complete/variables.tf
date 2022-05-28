variable "tfc_token" {
  description = "Token for Terraform Cloud Authentication"
  type        = string
  sensitive   = true
}

variable "secret_token" {
  description = "A secret token used in some resource configuration"
  type        = string
  sensitive   = true
}

variable "list_of_secret_values" {
  description = "A list of strings containing sensitive values"
  type        = list(string)
  sensitive   = true
}

variable "map_of_secret_values" {
  description = "A map containing sensitive values"
  type        = map(any)
  sensitive   = true
}

variable "access_key_id" {
  description = "Access Key ID to access AWS Account"
  type        = string
  sensitive   = true
}

variable "secret_access_key" {
  description = "Secret Access Key to access AWS Account"
  type        = string
  sensitive   = true
}
