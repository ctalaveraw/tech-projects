##DOCKER INFRASTRUCTURE MODULES

module "docker-images" {
  source = "./docker-images"
  module_input_image_nodered = var.source_docker_image_nodered[terraform.workspace]
}
module "docker-containers" {
  source = "./docker-containers"
  count = local.container_count
  module_input_container_name  = join("-", ["nodeRED", terraform.workspace, random_string.random_container_name[count.index].result])
  module_input_container_image = module.docker-images.module_output_image_nodered
  module_input_container_ports_internal = var.container_port_internal
  module_input_container_ports_external = var.container_port_external[terraform.workspace][count.index]
  module_input_container_volumes_path_container = "/data"
  module_input_container_volumes_path_host = "${path.cwd}/local_docker_files/volumes/nodered"
}

## END MODULES

## 'RANDOM' GENERATOR RESOURCES 
resource "random_string" "random_container_name" {
  count   = local.container_count
  length  = var.container_name_length
  special = false
  upper   = false
}

## END 'RANDOM' GENERATOR RESOURCES
