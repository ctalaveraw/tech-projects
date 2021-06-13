## VARIABLE BLOCK

variable "container_count" {
  type    = number
  sensitive = true
}
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

# variable "container_port_external" { # duplicate external ports on host not supported, so cannot be manually set
#   type    = number
#   default = 1880

#   validation {
#     condition     = var.container_port_external <= 65535 && var.container_port_external > 0
#     error_message = "The external port number must be valid. Acceptable values are between 0 to 65535."
#   }
# }

## END VARIALE BLOCK