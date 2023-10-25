data "azurerm_client_config" "current" {}


resource "azurerm_key_vault" "kv-eastus" {
  name                = "kv-${var.EnvShortName}-eastus-${var.CompanyAbbreviation}"
  location            = var.location_eastus
  resource_group_name = var.rg_eastus_name
  tenant_id           = data.azurerm_client_config.current.tenant_id

  enabled_for_disk_encryption     = false
  enabled_for_deployment          = false

  soft_delete_retention_days = 7
  purge_protection_enabled   = false
  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions     = var.kv-key-permissions-full
    secret_permissions  = var.kv-secret-permissions-full
    storage_permissions = var.kv-storage_permissions-full
  }

}

resource "azurerm_key_vault_access_policy" "kv_access_apim" {
  key_vault_id = azurerm_key_vault.kv-eastus.id
  tenant_id    = var.apim_eastus_tenantid
  object_id    = var.apim_eastus_identity

  secret_permissions = [
    "Get",
    "List"
  ]

  certificate_permissions = [
    "Get",
    "List"
  ]

  key_permissions = [
    "Get",
    "List"
  ]

  depends_on = [
    azurerm_key_vault.kv-eastus,
    var.apim_eastus_tenantid
  ]
}

resource "azurerm_key_vault_secret" "openai_key_eastus" {
  name         = "openai-key-eastus"
  value        = var.cogacct_eastus_key1
  key_vault_id = azurerm_key_vault.kv-eastus.id
  depends_on = [
    azurerm_key_vault.kv-eastus,
    azurerm_key_vault_access_policy.kv_access_apim
  ]
}
