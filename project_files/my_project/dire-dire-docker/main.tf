terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

provider "docker" {}

## NULL-RESOUCES

resource "null_resource" "create_docker_volume_1" {
  provisioner = "local-exec" {
    command = "mkdir /home/$USERNAME/Documents/Development/git/github_repositories/development/project_files/my_project/volumes && sudo chown -R 100:100"
  }
}


## END NULL RESOUCES

## INFRASTRUCTURE RESOURCES

resource "docker_image" "nodered_image_base" {
  name = "nodered/node-red:latest"
}
resource "docker_container" "ddd_nodeRED_container_1" {
  count = var.container_count
  name  = join("-", ["nodeRED", random_string.random_container_name[count.index].result])
  image = docker_image.nodered_image_base.latest
  ports {
    internal = var.container_port_internal
    # external = var.container_port_external # duplicate external ports on host not supported, so cannot be manually set
  }
}
## END INFRASTRUCTURE RESOUCES


## 'RANDOM' GENERATOR RESOURCES 
resource "random_string" "random_container_name" {
  count   = var.container_count
  length  = var.container_name_length
  special = false
  upper   = false
}

## END 'RANDOM' GENERATOR RESOURCES