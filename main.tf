module "managed_identity" {
  source  = "ptonini/managed-identity/azurerm"
  version = "~> 1.0.0"
  count   = var.identity_id == null ? 1 : 0
  name    = var.name
  rg      = var.rg
  scopes  = var.scopes
}

resource "azurerm_federated_identity_credential" "this" {
  parent_id           = var.identity_id == null ? module.managed_identity[0].this.id : var.identity_id
  name                = var.name
  resource_group_name = var.rg.name
  audience            = var.audience
  issuer              = var.issuer
  subject             = var.subject
}