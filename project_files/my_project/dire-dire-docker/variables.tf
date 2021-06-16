## VARIABLE BLOCK

variable "tf_project_env" {
  type = string
  description = "The 'Environment' that will be deployed to "
  sensitive = false
  default = "dev"
}
variable "source_docker_image_nodered" {
  type = map
  description = "NodeRED Docker image for container deployment"
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
  container_count = length(lookup(var.container_port_external, var.tf_project_env))
}

## END LOCALS BLOCK