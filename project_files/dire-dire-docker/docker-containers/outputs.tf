output "container_basic_info" {
  value = { for loop_container_info in docker_container.container-app-1[*] : loop_container_info.name => join(":", [loop_container_info.ip_address], loop_container_info.ports[*]["external"]) }
}
