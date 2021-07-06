resource "docker_volume" "volume-app-1" {
  count = var.module_input_volume_count
  name  = "${var.module_input_volume_name}-${count.index}"
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
