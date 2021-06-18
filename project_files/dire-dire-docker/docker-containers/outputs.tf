## OUTPUT BLOCK

output "container_name" { # this is an output variable to grab the container's assigned name
  value       = docker_container.ddd_nodeRED_container_1.name
  description = "The assigned name of the created container"
  sensitive = false
}

output "container_socket" { # this is an output variable to grab the container's IP
  value       = [for loop_container_socket in docker_container.ddd_nodeRED_container_1[*] : join(":", [loop_container_socket.ip_address], loop_container_socket.ports[*]["external"])]
  description = "The IPv4 address assigned to the running container, and external port, which is automatically assigned"
  sensitive = false
}

output "container_internal_port" { # this is an output variable to grab the container's IP
  value       = docker_container.ddd_nodeRED_container_1[*].ports[*].internal
  description = "The internal port of the created container"
  sensitive = false
}

## END OUTPUT BLOCK