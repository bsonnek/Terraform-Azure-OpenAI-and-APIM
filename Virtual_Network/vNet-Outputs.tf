# Virtual Network Outputs

# East US Vnet Details Output 
output "vnet_eastus_name_out" {
  description = "Specifies the name of the East US vNet Name"
  value       = azurerm_virtual_network.vnet_eastus.name
}
output "vnet_eastus_location_out" {
  description = "Specifies the name of the UK South location Name"
  value       = azurerm_virtual_network.vnet_eastus.location
}
output "vnet_uksouth_name_out" {
  description = "Specifies the name of the UK South vNet Name"
  value       = azurerm_virtual_network.vnet_uksouth.name
}
output "vnet_ncus_name_out" {
  description = "Specifies the name of the NorthCentral US Name"
  value       = azurerm_virtual_network.vnet_ncus.name
}
output "vnet_eastus2_name_out" {
  description = "Specifies the name of the East US 2 Name"
  value       = azurerm_virtual_network.vnet_eastus2.name
}

output "vnet_eastus_subnet_apim_out" {
  description = "Specifies the name of the UK South location Name"
  value       = { for eastus_subnets in azurerm_subnet.eastus_subnets : eastus_subnets.name => eastus_subnets.id }
}
