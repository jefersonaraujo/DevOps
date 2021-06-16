provider "digitalocean" {
  token = var.do_token
}

variable "do_token" {}

terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
  }
}

resource "digitalocean_droplet" "web" {
  image    = var.droplet_image
  name     = "web-1"
  region   = var.droplet_region
  size     = var.droplet_size
  ssh_keys = var.droplet_ssh_keys

  lifecycle {
    create_before_destroy = true
    ignore_changes = [
      ssh_keys
    ]
  }

}

output "ip_do_droplet" {
  value = digitalocean_droplet.web.ipv4_address
}