# Create Virtual Network and Subnets
resource "azurerm_virtual_network" "vnet_eastus" {
  name                = "vnet-${var.EnvShortName}-eastus-${var.CompanyAbbreviation}GenAI"
  location            = var.location_eastus
  resource_group_name = var.rg_eastus_name
  address_space       = ["10.20.0.0/18"]

  tags = {
    environment = "Dev-Lab"
  }

  depends_on = [var.rg_eastus_name]
}

resource "azurerm_subnet" "eastus_subnets" {
  for_each             = var.eastus_subnet
  resource_group_name  = var.rg_eastus_name
  virtual_network_name = "vnet-${var.EnvShortName}-eastus-${var.CompanyAbbreviation}GenAI"
  name                 = each.value["name"]
  address_prefixes     = each.value["address_prefixes"]

  depends_on = [azurerm_virtual_network.vnet_eastus]
}
