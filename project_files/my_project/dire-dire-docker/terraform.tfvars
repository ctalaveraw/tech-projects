## variables for different environments
source_docker_image_nodered = {
    dev = "nodered/node-red:latest"
    prod = "nodered/node-red:latest-minimal"
    testing = "nodered/node-red:latest"
    default = "nodered/node-red:latest"
  }

## variables for container attributes
container_port_internal = 1880
container_port_external = {
    dev = [1979, 1980]
    prod = [1879, 1880]
    testing = [9999, 10000]
    default = [19999, 20000]
}
container_name_length = 5


