output "artifact_token" {
  sensitive = true
  value =  {
    data = {
      infrastructure = var.kubernetes_cluster.data.infrastructure
      authentication = {
        cluster = var.kubernetes_cluster.data.authentication.cluster
        user = {
          token = lookup(data.kubernetes_secret_v1.token.data, "token")
        }
      }
    }
    specs = var.kubernetes_cluster.specs
  }
}
