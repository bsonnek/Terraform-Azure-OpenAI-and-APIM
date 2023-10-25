output "cogacct_eastus_key1_out" {
  sensitive = true
  value = azurerm_cognitive_account.cogacct_eastus.primary_access_key
}

output "cogacct_eastus_endpoint_out" {
  value = azurerm_cognitive_account.cogacct_eastus.endpoint
}

