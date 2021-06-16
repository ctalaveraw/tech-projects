terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

provider "docker" {}

## NULL-RESOUCES

resource "null_resource" "create_docker_volume_1" { #This creates a Docker volume in the working directory
  provisioner "local-exec" {
    command = "mkdir ${path.cwd}/Docker/volumes || true && sudo chown -R 1000:1000 ${path.cwd}/Docker/volumes"
  }
}


## END NULL RESOUCES

## INFRASTRUCTURE RESOURCES

resource "docker_image" "app-nodered" {
  name = lookup(var.source_docker_image_nodered, var.tf_project_env)
}
resource "docker_container" "ddd_nodeRED_container_1" {
  count = local.container_count
  name  = join("-", ["nodeRED", random_string.random_container_name[count.index].result])
  image = docker_image.app-nodered.latest
  ports {
    internal = var.container_port_internal
    external = lookup(var.container_port_external, var.tf_project_env)[count.index]
  }
  volumes {
    container_path = "/data"
    host_path = "${path.cwd}/Docker/volumes"
  }
}
## END INFRASTRUCTURE RESOUCES


## 'RANDOM' GENERATOR RESOURCES 
resource "random_string" "random_container_name" {
  count   = local.container_count
  length  = var.container_name_length
  special = false
  upper   = false
}

## END 'RANDOM' GENERATOR RESOURCES
