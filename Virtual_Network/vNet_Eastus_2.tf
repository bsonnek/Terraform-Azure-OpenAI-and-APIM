
# Create Virtual Network and Subnets
resource "azurerm_virtual_network" "vnet_eastus2" {
  name                = "vnet-${var.EnvShortName}-eastus2-${var.CompanyAbbreviation}GenAI"
  location            = var.location_eastus2
  resource_group_name = var.rg_eastus2_name
  address_space       = ["10.20.64.0/18"]

  tags = {
    environment = "${var.EnvShortName}"
  }
  depends_on = [var.rg_eastus2_name]
}

resource "azurerm_subnet" "eastus2_subnets" {
  for_each             = var.eastus2_subnet
  resource_group_name  = var.rg_eastus2_name
  virtual_network_name = "vnet-${var.EnvShortName}-eastus2-${var.CompanyAbbreviation}GenAI"
  name                 = each.value["name"]
  address_prefixes     = each.value["address_prefixes"]

  depends_on = [azurerm_virtual_network.vnet_eastus2]
}
