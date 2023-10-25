# Resource Group Outputs

# UK South RG Output 
output rg_uks_name_out {
  description = "Specifies the name of the UK South RG Name"
  value       = azurerm_resource_group.rg_uks.name
}
output location_uks_out {
  description = "Specifies the name of the UK South location Name"
  value       = azurerm_resource_group.rg_uks.location
}

# North Central US RG Output 
output rg_ncus_name_out {
  description = "Specifies the name of the North Central US RG Name"
  value       = azurerm_resource_group.rg_ncus.name
}
output location_ncus_out {
  description = "Specifies the name of the North Central US location Name"
  value       = azurerm_resource_group.rg_ncus.location
}

# East US 2 RG Output 
output rg_eastus2_name_out {
  description = "Specifies the name of the East US 2 RG Name"
  value       = azurerm_resource_group.rg_eastus2.name
}
output location_eastus2_out {
  description = "Specifies the name of the East US 2 location Name"
  value       = azurerm_resource_group.rg_eastus2.location
}

# East US RG Output 
output rg_eastus_name_out {
  description = "Specifies the name of the East US RG Name"
  value       = azurerm_resource_group.rg_eastus.name
}
output location_eastus_out {
  description = "Specifies the name of the East US location Name"
  value       = azurerm_resource_group.rg_eastus.location
}
