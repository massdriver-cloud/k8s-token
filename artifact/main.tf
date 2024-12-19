data "kubernetes_secret_v1" "token" {
  metadata {
    name      = "${var.md_metadata.name_prefix}-token"
    namespace = var.namespace
  }
}