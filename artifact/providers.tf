terraform {
  required_version = ">= 1.0"
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 3.0"
    }
  }
}

provider "kubernetes" {
  host                   = var.kubernetes_cluster.authentication.cluster.server
  cluster_ca_certificate = base64decode(var.kubernetes_cluster.authentication.cluster.certificate-authority-data)
  token                  = var.kubernetes_cluster.authentication.user.token
}