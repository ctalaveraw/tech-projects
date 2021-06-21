## "main.tf" FILE IN root MODULE
## LOCALS BLOCK

locals {
  docker_deployment_info = {
    nodered = {
      image_type            = var.source_docker_images["nodered"][terraform.workspace]
      volume_path_container = "/data"
      volume_path_host      = "${path.cwd}/local_docker_files/volumes/nodered"
      internal_port         = 1880
      external_port         = var.container_port_external["nodered"][terraform.workspace]
    }
    influxdb = {
      image_type            = var.source_docker_images["influxdb"][terraform.workspace]
      volume_path_container = "/var/lib/influxdb"
      volume_path_host      = "${path.cwd}/local_docker_files/volumes/influxdb"
      internal_port         = 8086
      external_port         = var.container_port_external["influxdb"][terraform.workspace]
    }
  }
}

## END LOCALS BLOCK

##DOCKER INFRASTRUCTURE MODULES
module "docker-images" {
  source                         = "./docker-images"
  for_each                       = local.docker_deployment_info
  module_input_source_image_name = each.value.image_type
}
module "docker-containers" {
  source                                        = "./docker-containers"
  for_each                                      = local.docker_deployment_info
  module_input_container_ports_internal         = each.value.internal_port
  module_input_container_ports_external         = each.value.external_port[0]
  module_input_container_volumes_path_container = each.value.volume_path_container
  module_input_container_volumes_path_host      = each.value.volume_path_host
  module_input_container_image                  = module.docker-images[each.key].module_output_source_image
  module_input_container_name                   = join("-", [each.key, terraform.workspace, random_string.random_container_name[each.key].result])
}

## END MODULES

## 'RANDOM' GENERATOR RESOURCES 
resource "random_string" "random_container_name" {
  for_each = local.docker_deployment_info
  length  = var.container_name_length
  special = false
  upper   = false
}

## END 'RANDOM' GENERATOR RESOURCES
