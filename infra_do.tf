terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }   
    kubernetes = {}
  }
}

variable "do_token" {}

provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_kubernetes_cluster" "spsw" {
  name   = "spsw"
  region = "nyc1"
  version = "1.21.5-do.0"

  node_pool {
    name       = "worker-pool"
    size       = "s-2vcpu-2gb"
    node_count = 2
  }
}

resource "digitalocean_container_registry" "spsw" {
  name                   = "spsw"
  subscription_tier_slug = "starter"
}

