## VARIABLE BLOCK


variable "container_name_length" {
  type    = number
  sensitive = true
}
variable "container_port_internal" {
  type    = number
  sensitive = true
  validation {
    condition     = var.container_port_internal == 1880
    error_message = "The external port number must be 1880."
  }
}

variable "container_port_external" { 
  type    = list
  sensitive = false

  validation {
    condition     = max(var.container_port_external...) <= 65535 && min(var.container_port_external...) > 0
    error_message = "The external port number must be valid. Acceptable values are between 0 to 65535."
  }
}

## END VARIALE BLOCK

## BEGIN LOCALS BLOCK

locals {
  container_count = length(var.container_port_external)
}

## END LOCALS BLOCK