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
  name  = join("-", ["nodeRED", random_string.random_container_name.result])
  image = docker_image.nodered_image_base.latest
  ports {
    internal = 1880
    external = 1880
  }
}

output "container_socket" { # this is an output variable to grab the container's IP
  value = join(":", [docker_container.ddd_nodeRED_container_1.ip_address, docker_container.ddd_nodeRED_container_1.ports[0].external])
  description = "The IPv4 address assigned to the running container"
}

output "container_name" { # this is an output variable to grab the container's assigned name
  value = docker_container.ddd_nodeRED_container_1.name
  description = "The assigned name of the created container"
}

resource "random_string" "random_container_name" {
  length = 4
  special = false
  upper = false
}