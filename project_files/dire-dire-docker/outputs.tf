output "container_basic_info" {
  description = "This has the name and the socket for each running container"
  value       = [for loop_container_info in module.docker-containers[*] : loop_container_info]
}