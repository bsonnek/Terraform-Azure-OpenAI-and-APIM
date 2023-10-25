### Output - API_managment
output "apim_eastus_identity_out" {
  value = azurerm_api_management.apim_eastus.identity[0].principal_id
}

output "apim_eastus_tenantid_out" {
  value = azurerm_api_management.apim_eastus.identity[0].tenant_id
}