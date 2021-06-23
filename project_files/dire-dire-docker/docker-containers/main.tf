resource "random_string" "random_container_name" {
  count   = var.module_input_container_count
  length  = var.module_input_container_namelength
  special = false
  upper   = false
}


resource "docker_container" "container-app-1" {
  count = var.module_input_container_count
  name  = join("-", [var.module_input_container_name, terraform.workspace, random_string.random_container_name[count.index].result])
  image = var.module_input_container_image
  ports {
    internal = var.module_input_container_ports_internal[count.index]
    external = var.module_input_container_ports_external[count.index]
  }
  volumes {
    container_path = var.module_input_container_volumes_path_container
    volume_name    = docker_volume.volume-app-1[count.index].name
  }
}

resource "docker_volume" "volume-app-1" {
  count = var.module_input_container_count
  name  = "${var.module_input_container_name}-${random_string.random_container_name[count.index].result}-volume"
  lifecycle { #commenting this out for the time being
    # prevent_destroy = true
  }
}
