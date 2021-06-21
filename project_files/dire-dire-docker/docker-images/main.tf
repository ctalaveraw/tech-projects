resource "docker_image" "source_image" {
    name = var.module_input_source_image_name
#   name = var.source_docker_image_nodered[terraform.workspace]
}