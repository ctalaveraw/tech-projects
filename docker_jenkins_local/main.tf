# Resource block for the Jenkins Docker image
resource "docker_image" "jenkins_server" {
  name = "jenkins/jenkins:jdk11"
}

# Resource block for the container running Jenkins
resource "docker_container" "jenkins_server" {
  name  = "jenkins_local"
  image = docker_image.jenkins_server.name
  ports {
    internal = "8080"
    external = "8080"
  }
}
