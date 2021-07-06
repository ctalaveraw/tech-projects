output "module_output_volume_name" {
  value = docker_volume.volume-app-1[*].name
}