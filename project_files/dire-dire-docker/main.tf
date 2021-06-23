## "main.tf" FILE IN root MODULE
## LOCALS BLOCK

locals {
  docker_deployment_info = {
    nodered = {
      container_count       = length(var.container_port_external["nodered"][terraform.workspace])
      image_type            = var.source_docker_images["nodered"][terraform.workspace]
      volume_path_container = "/data"
      volume_path_host      = "${path.cwd}/local_docker_files/volumes/nodered"
      internal_port         = var.container_port_internal["nodered"][terraform.workspace]
      external_port         = var.container_port_external["nodered"][terraform.workspace]
      name_length           = var.container_name_length
    }
    influxdb = {
      container_count       = length(var.container_port_external["influxdb"][terraform.workspace])
      image_type            = var.source_docker_images["influxdb"][terraform.workspace]
      volume_path_container = "/var/lib/influxdb"
      volume_path_host      = "${path.cwd}/local_docker_files/volumes/influxdb"
      internal_port         = var.container_port_internal["influxdb"][terraform.workspace]
      external_port         = var.container_port_external["influxdb"][terraform.workspace]
      name_length           = var.container_name_length
    }
    grafana = {
      container_count       = length(var.container_port_external["grafana"][terraform.workspace])
      image_type            = var.source_docker_images["grafana"][terraform.workspace]
      volume_path_container = "/var/lib/grafana"
      volume_path_host      = "${path.cwd}/local_docker_files/volumes/grafana"
      internal_port         = var.container_port_internal["grafana"][terraform.workspace]
      external_port         = var.container_port_external["grafana"][terraform.workspace]
      name_length           = var.container_name_length
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
  module_input_container_namelength             = each.value.name_length
  module_input_container_count                  = each.value.container_count
  module_input_container_ports_internal         = each.value.internal_port
  module_input_container_ports_external         = each.value.external_port
  module_input_container_volumes_path_container = each.value.volume_path_container
  module_input_container_volumes_path_host      = each.value.volume_path_host
  module_input_container_image                  = module.docker-images[each.key].module_output_source_image
  module_input_container_name                   = each.key
}

## END MODULES
## TEST