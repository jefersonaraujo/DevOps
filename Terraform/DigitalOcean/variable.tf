

variable "droplet_image" {
  type        = string
  description = "Imagem base do droplet"
  default     = "ubuntu-20-04-x64"

}

variable "droplet_region" {
  type        = string
  description = "Regiao onde os  droplets vao ser criados"
  default     = "ams3"

}

variable "droplet_size" {
  type        = string
  description = "Tamanho do droplet"
  default     = "s-1vcpu-1gb"

}

variable "droplet_ssh_keys" {
  type        = list(string)
  description = "Lista de chaves para acesso ao droplet"
  default     = ["27:51:6b:74:32:ff:2e:8a:d4:d7:ba:c7:f5:d3:1f:f9"]

}

variable "droplet_names" {
  type    = list(string)
  default = ["terraform", "consul"]
}

variable "private_key_path" {
  type        = string
  description = "Caminho para a chave"
  default     = "/root/.ssh/id_rsa"
}

variable "lb" {
  type        = string
  description = "Nome do load balancer"
  default     = "hashicorp"
}

variable "pg_cluster_name" {
  type        = string
  description = "Nome cluster de pg. "
  default     = "postgres-cluster"

}

variable "pg_cluster_version" {
  type        = string
  description = "Versão pg"
  default     = "12"
}

variable "pg_cluster_size" {
  type        = string
  description = "Tamanho node pg"
  default     = "db-s-1vcpu-1gb"
}

variable "pg_node_count" {
  type        = number
  description = "Numero de  nodes pg"
  default     = 1
}

variable "database_name" {
  type        = string
  description = "Nome do banco de dados"
  default     = "limerick"
}

variable "database_username" {
  type        = string
  description = "Nome do user banco de dados"
  default     = "irlanda"
  sensitive   = true
}

variable "firewall_name" {
  type        = string
  description = "Nome do fw"
  default     = "braum"
}

variable "troubleshooting" {
  type        = bool
  description = "Liberar fw"
  default     = true
}
