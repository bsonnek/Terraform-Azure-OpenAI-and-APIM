
resource "azurerm_cognitive_account" "cogacct_eastus" {
  name                = "openai-${var.EnvShortName}-eastus-${var.CompanyAbbreviation}AI"
  location            = var.location_eastus
  resource_group_name = var.rg_eastus_name
  kind                = "OpenAI"

  custom_subdomain_name = "openai-${var.EnvShortName}-eastus-${var.CompanyAbbreviation}AI"
  sku_name              = "S0"

  depends_on = [var.vnet_eastus_name]
  lifecycle {
    ignore_changes = [
      custom_subdomain_name
    ]
  }
}

resource "azurerm_cognitive_deployment" "gpt35turbo_eastus" {
  name                 = "gpt-35-turbo"
  cognitive_account_id = azurerm_cognitive_account.cogacct_eastus.id

  model {
    format  = "OpenAI"
    name    = "gpt-35-turbo"
    version = "0301"
  }

  scale {
    type = "Standard"
  }

  depends_on = [azurerm_cognitive_account.cogacct_eastus]
}
