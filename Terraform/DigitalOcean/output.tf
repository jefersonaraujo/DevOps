
output "ip_do_droplet" {
  value = digitalocean_droplet.web[*].ipv4_address
}