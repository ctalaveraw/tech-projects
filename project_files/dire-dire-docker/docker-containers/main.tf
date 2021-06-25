resource "random_string" "random_container_name" { #Random string for unique container IDs upon creation
  count   = var.module_input_container_count
  length  = var.module_input_container_namelength
  special = false
  upper   = false
}


resource "docker_container" "container-app-1" {
  count = var.module_input_container_count
  name  = join("-", [var.module_input_container_name, terraform.workspace, random_string.random_container_name[count.index].result])
  image = var.module_input_container_image
  ports {
    internal = var.module_input_container_ports_internal[count.index]
    external = var.module_input_container_ports_external[count.index]
  }
  dynamic "volumes" {
    for_each = var.module_input_volume_path_container
    content {
      container_path = volumes.value["path_container_each"]
      volume_name    = docker_volume.volume-app-1[volumes.key].name
    }
  }
  provisioner "local-exec" { #Creates a containers.txt file with container info
    when       = create
    on_failure = continue
    command    = "echo ${self.name}: ${self.ip_address}:${join(" ", [for x in self.ports[*]["external"] : x])} >> ${path.cwd}/../containers.txt"
  }
  provisioner "local-exec" { #Destroys the created containers.txt file
    when       = destroy
    on_failure = continue
    command    = "rm -f ${path.cwd}/../containers.txt"
  }
}

resource "docker_volume" "volume-app-1" {
  count = length(var.module_input_volume_path_container)
  name  = "${var.module_input_container_name}-${count.index}.result-volume"
  lifecycle {
    prevent_destroy = false
  }
  provisioner "local-exec" { #Creates a directory for volume backups
    when       = destroy
    on_failure = continue
    command    = "mkdir ${path.cwd}/../backup"
  }
  provisioner "local-exec" { #Creates a ZIP archive of all volume contents
    when       = destroy
    on_failure = fail
    command    = "sudo tar -czvf ${path.cwd}/../backup/${self.name}.tar.gz ${self.mountpoint}/"
  }
}
