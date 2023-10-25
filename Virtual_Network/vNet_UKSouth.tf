# Create Virtual Network and Subnets
resource "azurerm_virtual_network" "vnet_uksouth" {
  name                = "vnet-${var.EnvShortName}-uks-${var.CompanyAbbreviation}GenAI"
  location            = var.location_uksouth
  resource_group_name = var.rg_uksouth_name
  address_space       = ["10.20.192.0/18"]

  tags = {
    environment = "${var.EnvShortName}"
  }

  depends_on = [var.rg_uksouth_name]

}

resource "azurerm_subnet" "uksouth_subnets" {
  for_each             = var.uksouth_subnet
  resource_group_name  = var.rg_uksouth_name
  virtual_network_name = "vnet-${var.EnvShortName}-uks-${var.CompanyAbbreviation}GenAI"
  name                 = each.value["name"]
  address_prefixes     = each.value["address_prefixes"]

  depends_on = [azurerm_virtual_network.vnet_uksouth]
}

