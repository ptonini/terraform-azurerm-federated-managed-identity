output "this" {
  value = var.identity_id == null ? module.managed_identity[0].this : null
}

output "helm_release_values" {
  value = var.identity_id == null ? module.managed_identity[0].helm_release_values : null
}