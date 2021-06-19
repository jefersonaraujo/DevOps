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
  name     = var.droplet_names[count.index]
  region   = var.droplet_region
  size     = var.droplet_size
  ssh_keys = var.droplet_ssh_keys

  lifecycle {
    create_before_destroy = true
    ignore_changes = [
      ssh_keys
    ]
  }

  # provisioner "remote-exec" {
  #   connection {
  #     type        = "ssh"
  #     user        = "root"
  #     host        = self.ipv4_address
  #     timeout     = "5m"
  #     private_key = file(var.private_key_path)
  #   }

  #   inline = [
  #     "curl -fsSL https://get.docker.com | sh",
  #     "docker run -d -p 80:80 nginx"
  #   ]

  # }

  count = length(var.droplet_names)

}

resource "digitalocean_loadbalancer" "public" {
  name   = "loadbalancer-1"
  region = var.droplet_region

  forwarding_rule {
    entry_port     = 80
    entry_protocol = "http"

    target_port     = 80
    target_protocol = "http"
  }

  healthcheck {
    port     = 22
    protocol = "tcp"
  }

  droplet_ids = digitalocean_droplet.web[*].id
}

# resource "digitalocean_database_cluster" "postgres" {
#   name       = var.pg_cluster_name
#   engine     = "pg"
#   version    = var.pg_cluster_version
#   size       = var.pg_cluster_size
#   region     = var.droplet_region
#   node_count = 1
# }

# resource "digitalocean_database_db" "database" {
#   cluster_id = digitalocean_database_cluster.postgres.id
#   name       = var.database_name
# }

# resource "digitalocean_database_user" "username" {
#   cluster_id = digitalocean_database_cluster.postgres.id
#   name       = var.database_username
# }

resource "digitalocean_firewall" "web" {
  name = var.firewall_name

  droplet_ids = digitalocean_droplet.web[*].id

  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  inbound_rule {
    protocol                  = "tcp"
    port_range                = "80"
    source_load_balancer_uids = [digitalocean_loadbalancer.public.id]
  }

  inbound_rule {
    protocol         = "icmp"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "udp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

}