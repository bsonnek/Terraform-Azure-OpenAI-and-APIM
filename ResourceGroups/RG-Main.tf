# Build Resource Groups
resource "azurerm_resource_group" "rg_uks" {
  name     = "rg-${var.EnvShortName}-uks-${var.CompanyAbbreviation}-GenAI"
  location = var.location_uksouth
}

resource "azurerm_resource_group" "rg_ncus" {
  name     = "rg-${var.EnvShortName}-ncus-${var.CompanyAbbreviation}-GenAI"
  location = var.location_ncus
}

resource "azurerm_resource_group" "rg_eastus2" {
  name     = "rg-${var.EnvShortName}-eastus2-${var.CompanyAbbreviation}-GenAI"
  location = var.location_eastus2
}

resource "azurerm_resource_group" "rg_eastus" {
  name     = "rg-${var.EnvShortName}-eastus-${var.CompanyAbbreviation}-GenAI"
  location = var.location_eastus
}

