## variables for different environments
source_docker_images = {
  nodered = {
    dev     = "nodered/node-red:latest"
    prod    = "nodered/node-red:latest-minimal"
    testing = "nodered/node-red:latest"
    default = "nodered/node-red:latest"
  }
  influxdb = {
    dev     = "influxdb/influxdb:latest"
    prod    = "influxdb/influxdb:latest"
    testing = "influxdb/influxdb:latest"
    default = "influxdb/influxdb:latest"
  }
}


## variables for container attributes
container_port_internal = 1880
container_name_length   = 5

container_port_external = {
  nodered = {
    dev     = [1979]
    prod    = [1879]
    testing = [2079]
    default = [10099]
  }
  influxdb = {
    dev     = [2179]
    prod    = [2279]
    testing = [2399]
    default = [10199]

  }
}