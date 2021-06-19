## VARIABLE BLOCK
variable "source_docker_images" {
  type = map
  description = "Variable storing the source Docker images for container deployment"
  sensitive = false
}

variable "container_name_length" {
  type    = number
  sensitive = false
}
variable "container_port_internal" {
  type    = number
  sensitive = false
  validation {
    condition     = var.container_port_internal == 1880
    error_message = "The external port number must be 1880."
  }
}

variable "container_port_external" { 
  type    = map
  sensitive = false

  validation { # validation for production environment
    condition     = max(var.container_port_external["dev"]...) <= 65535 && min(var.container_port_external["dev"]...) > 1880
    error_message = "The external port number must be valid. Acceptable values are between 1881 to 65535."
  }
  validation { #validation for development environment
    condition     = max(var.container_port_external["prod"]...) <= 1880 && min(var.container_port_external["prod"]...) > 0
    error_message = "The external port number must be valid. Acceptable values are between 1 to 1880."
  }
}

## END VARIALE BLOCK

## BEGIN LOCALS BLOCK

locals {
  container_count = length(var.container_port_external[terraform.workspace])
}

## END LOCALS BLOCK