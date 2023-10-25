# Create Virtual Network and Subnets
resource "azurerm_virtual_network" "vnet_ncus" {
  name                = "vnet-${var.EnvShortName}-ncus-${var.CompanyAbbreviation}GenAI"
  location            = var.location_ncus
  resource_group_name = var.rg_ncus_name
  address_space       = ["10.20.128.0/18"]

  tags = {
    environment = "${var.EnvShortName}"
  }

  depends_on = [var.rg_ncus_name]
}

resource "azurerm_subnet" "ncus_subnets" {
  for_each             = var.ncus_subnet
  resource_group_name  = var.rg_ncus_name
  virtual_network_name = "vnet-${var.EnvShortName}-ncus-${var.CompanyAbbreviation}GenAI"
  name                 = each.value["name"]
  address_prefixes     = each.value["address_prefixes"]

  depends_on = [azurerm_virtual_network.vnet_ncus]
}
