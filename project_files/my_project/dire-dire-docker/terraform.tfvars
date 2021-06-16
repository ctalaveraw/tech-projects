## variables for different environments
source_docker_image_nodered = {
    dev = "nodered/node-red:latest"
    prod = "nodered/node-red:latest-minimal"
  }

## variables for container attributes
container_port_internal = 1880
container_port_external = {
    dev = [1979, 1980]
    prod = [1879, 1880]
}
container_name_length = 5


