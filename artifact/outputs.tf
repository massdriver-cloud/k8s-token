output "artifact_token" {
  sensitive = true
  value =  {
    infrastructure = { for k, v in var.kubernetes_cluster.infrastructure : k => v if v != null }
    authentication = {
      cluster = var.kubernetes_cluster.authentication.cluster
      user = {
        token = lookup(data.kubernetes_secret_v1.token.data, "token")
      }
    }
    specs = var.kubernetes_cluster.specs
  }
}
