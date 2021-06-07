## when executing a `terraform apply` command
## all files with a .tf extention will be read.
## the first one read will be "main.tf"

## this project will be called "dire-dire-docker"
## (Super Mario!) and will be dealing with Terraform
## and Docker. This file will be the main.tf file.

## the first block needs to be defined, the "terraform: block"
## this will specify what providers will be used. in this project
## Docker is the provider

## next, the `provider` block needs to specify information about
## Docker and it's configuration

## terraform {
##    required_providers {
##        docker = {
##            source = "terraform-providers/docker"
##        }
##    }
## }
##
## provider "docker" {}

## for this example, just an empty set of brackets will pull
## the latest provider info from the public docker repo.
## at this point, the file can be saved and `terraform init` can 
## be run to use Terraform in this working directory
## best practice is to specify version so updates don't break code



## for the real code, the provider will be specified.
## the version number has to be between 2.7.2 and 2.7.9


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
  name  = "nodeRED_1"
  image = docker_image.nodered_image_base.latest
  ports {
    internal = 1880
    external = 1880
  }
}
