variable "name" {
  description = "(Required) Name of the variable set"
  type        = string
}

variable "organization" {
  description = "(Required) Name of the organization"
  type        = string
}

variable "description" {
  description = "(Optional) A description for the variable set"
  type        = string
  default     = ""
}

variable "global" {
  description = "(Optional) Whether or not the variable set applies to all workspaces in the organization"
  type        = bool
  default     = false
}

variable "workspace_ids" {
  description = " (Optional) IDs of the workspaces that use the variable set. Must not be set if global is true"
  type        = list(string)
  default     = []
}

variable "terraform_variables" {
  description = <<EOF
(Optional) Map of variables of 'Terraform' category used in the workspace

  Item syntax:
  {
    variable1_name = value1
    variable2_name = value2
    ...
  }
EOF

  type    = map(any)
  default = {}
}

variable "terraform_hcl_variables" {
  description = <<EOF
(Optional) Map of variables in HCL format of 'Terraform' category used in the variable set

  Item syntax:
  {
    variable1_name = value1
    variable2_name = value2
    ...
  }

NOTE: you can specifies values in HCL format directly, like this:

  {
    variable_list = ["item1","item2"]

    variable_map = {
      key1 = value1
      key2 = value2
    }
  }
}
EOF

  type    = any
  default = {}
}

variable "terraform_sensitive_variables" {
  description = <<EOF
(Optional) Map of sensitive variables of 'Terraform' category used in the variable set

Item syntax:
{
  variable1_name = value1
  variable2_name = value2
  ...
}
EOF

  type    = map(any)
  default = {}
}

variable "terraform_hcl_sensitive_variables" {
  description = <<EOF
(Optional) Map of sensitive variables in HCL format of 'Terraform' category used in the variable set

  Item syntax:
  {
    variable1_name = value1
    variable2_name = value2
    ...
  }

NOTE: you can specifies values in HCL format directly, like this:

  {
    variable_list = ["item1","item2"]

    variable_map = {
      key1 = value1
      key2 = value2
    }
  }
EOF

  type    = any
  default = {}
}

variable "environment_variables" {
  description = <<EOF
(Optional) Map of variables of 'environment' category used in the variable set

  Item syntax:
  {
    variable1_name = value1
    variable2_name = value2
    ...
  }
EOF

  type    = map(any)
  default = {}
}

variable "environment_sensitive_variables" {
  description = <<EOF
(Optional) Map of sensitive variables of 'environment' category used in the variable set

  Item syntax:
  {
    variable1_name = value1
    variable2_name = value2
    ...
  }
EOF

  type    = map(any)
  default = {}
}

variable "variables_descriptions" {
  description = <<EOF
(Optional) Map of descriptions applied to variable set variables

  Item syntax:
  {
    variable1_name = "description"
    variable2_name = "description"
    ...
  }
EOF

  type    = map(string)
  default = {}
}
