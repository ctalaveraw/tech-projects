resource "docker_image" "app-nodered" {
    name = var.module_input_image_nodered
#   name = var.source_docker_image_nodered[terraform.workspace]
}