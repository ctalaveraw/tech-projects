# Resource block for the PostgreSQL DB Docker image
resource "docker_image" "postgres_db" {
  name = "postgres:13.4"
}

# Resource block for the container running PostgreSQL DB
resource "docker_container" "postgres_db" {
  name  = "PostgreSQL-DB"
  image = docker_image.postgres_db.name
  env   = ["POSTGRES_PASSWORD=mysecretpassword"]
  ports { # ports are set to bind to 8080
    internal = "8080"
    external = "8080"
  }
}
