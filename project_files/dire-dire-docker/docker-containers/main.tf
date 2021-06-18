resource "docker_container" "ddd_nodeRED_container_1" {
  name  = var.module_input_container_name
  image = var.module_input_container_image
  ports {
    internal = var.module_input_container_ports_internal
    external = var.module_input_container_ports_external
  }
  volumes { 
    container_path = var.module_input_container_volumes_path_container
    volume_name = docker_volume.docker_volume_nodered.name
  }
}

resource "docker_volume" "docker_volume_nodered" {
  name = "${var.module_input_container_name}-volume"
}