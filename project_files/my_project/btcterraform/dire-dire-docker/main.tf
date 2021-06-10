terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
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
    # external = 1880 # duplicate external ports on host not supported, so cannot be manually set
  }
}

resource "random_string" "random_container_name" {
  count   = 2
  length  = 4
  special = false
  upper   = false
}

output "container_name" { # this is an output variable to grab the container's assigned name
  value       = docker_container.ddd_nodeRED_container_1[*].name
  description = "The assigned name of the created container"
}

output "container_socket" { # this is an output variable to grab the container's IP
  value       = [for created_loop_1 in docker_container.ddd_nodeRED_container_1[*] : join(":", [created_loop_1.ip_address], created_loop_1.ports[*]["external"])]
  description = "The IPv4 address assigned to the running container, and external port"
}