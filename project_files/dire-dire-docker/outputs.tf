## OUTPUT BLOCK
output "container_name" { # this is an output variable to grab the container's assigned name
  value       = module.docker-containers[*].container_name
  description = "The assigned name of the created container"
  sensitive   = false
}

output "container_socket" { # this is an output variable to grab the container's IP
  value       = flatten(module.docker-containers[*].container_socket)
  description = "The IPv4 address assigned to the running container, and external port, which is automatically assigned"
  sensitive   = false
}

output "container_internal_port" { # this is an output variable to grab the container's IP
  value       = flatten(module.docker-containers[*].container_internal_port)
  description = "The internal port of the created container"
  sensitive   = false
}

## END OUTPUT BLOCK