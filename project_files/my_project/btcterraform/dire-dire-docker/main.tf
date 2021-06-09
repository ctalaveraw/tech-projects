terraform {
  required_providers {
    docker = {
      source  = "terraform-providers/docker"
      version = "~> 2.7.2"
    }
  }
}

provider "docker" {}

resource "docker_image" "nodered_image_base" {
  name = "nodered/node-red:latest"
}

resource "docker_container" "ddd_nodeRED_container_1" {
  count = 2
  name  = join("-", ["nodeRED", random_string.random_container_name[count.index].result])
  image = docker_image.nodered_image_base.latest
  ports {
    internal = 1880
    external = 1880
  }
}

output "container_0_socket" { # this is an output variable to grab the container's IP
  value = join(":", [docker_container.ddd_nodeRED_container_1[0].ip_address, docker_container.ddd_nodeRED_container_1[0].ports[0].external])
  description = "The IPv4 address assigned to the running container"
}

output "container_1_socket" { # this is an output variable to grab the container's IP
  value = join(":", [docker_container.ddd_nodeRED_container_1[1].ip_address, docker_container.ddd_nodeRED_container_1[1].ports[0].external])
  description = "The IPv4 address assigned to the running container"
}

output "container_0_name" { # this is an output variable to grab the container's assigned name
  value = docker_container.ddd_nodeRED_container_1[0].name
  description = "The assigned name of the created container"
}

output "container_1_name" { # this is an output variable to grab the container's assigned name
  value = docker_container.ddd_nodeRED_container_1[1].name
  description = "The assigned name of the created container"
}

resource "random_string" "random_container_name" {
  count = 2
  length = 4
  special = false
  upper = false
}