terraform {
  required_version = ">= 0.15, <= 1.0.0"
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = ">= 2.5, <= 2.9"
    }
  }
}