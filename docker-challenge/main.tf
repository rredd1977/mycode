# updated main.tf
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 4.0.0"
    }
  }
}

provider "docker" {
# Explicitly points to the standard Ubuntu Docker socket
  host = "unix:///var/run/docker.sock"
}


resource "docker_image" "simplegoservice" {
  name         = "registry.gitlab.com/alta3/simplegoservice"
  keep_locally = true      // keep image after "destroy"
}


resource "docker_container" "simplegoservice" {
  image = docker_image.simplegoservice.image_id
  network_mode = "bridge"
  name = "simple_service"
  ports {
    # internal and external are now defined by variables
    internal = var.internal_port
    external = var.external_port
  }
}



