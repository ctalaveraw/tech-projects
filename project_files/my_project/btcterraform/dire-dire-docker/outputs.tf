## OUTPUT BLOCK
output "container_name" { # this is an output variable to grab the container's assigned name
  value       = docker_container.ddd_nodeRED_container_1[*].name
  description = "The assigned name of the created container"
}

output "container_socket" { # this is an output variable to grab the container's IP
  value       = [for created_loop_1 in docker_container.ddd_nodeRED_container_1[*] : join(":", [created_loop_1.ip_address], created_loop_1.ports[*]["external"])]
  description = "The IPv4 address assigned to the running container, and external port, which is automatically assigned"
}

## END OUTPUT BLOCK