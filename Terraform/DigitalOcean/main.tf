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
  image    = "ubuntu-20-04-x64"
  name     = "web-1"
  region   = "nyc1"
  size     = "s-1vcpu-1gb"
  ssh_keys = ["27:51:6b:74:32:ff:2e:8a:d4:d7:ba:c7:f5:d3:1f:f9"]

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