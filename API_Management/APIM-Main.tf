

resource "azurerm_api_management" "apim_eastus" {
  name                = "apim-${var.EnvShortName}-eastus-${var.CompanyAbbreviation}New"
  location            = var.location_eastus
  resource_group_name = var.rg_eastus_name
  publisher_name      = var.apim_publisher_name
  publisher_email     = var.apim_publisher_email

  sku_name = "Developer_1"

  identity {
    type = "SystemAssigned"
  }
  public_network_access_enabled = true

  virtual_network_type = "External"

  virtual_network_configuration {
    subnet_id = var.subnetid_eastus
  }
  depends_on = [var.subnetid_eastus]
}

resource "azurerm_api_management_named_value" "openai_east_us_named_value" {
  name                = "openai-dev-eastus-key"
  resource_group_name = var.rg_eastus_name
  api_management_name = azurerm_api_management.apim_eastus.name
  display_name        = "openai-dev-eastus-key"
  secret              = true
  value               = var.cogacct_eastus_key1

  depends_on = [
    azurerm_api_management.apim_eastus,
    var.cogacct_eastus_key1
  ]
}

resource "azurerm_api_management_backend" "example" {
  name                = "openai-${var.EnvShortName}-eastus-backend"
  resource_group_name = var.rg_eastus_name
  api_management_name = azurerm_api_management.apim_eastus.name
  protocol            = "http"
  url                 = "${var.cogacct_eastus_endpoint}openai"

tls {
  validate_certificate_chain = true
  validate_certificate_name = true 
}
  credentials {
    header = {
      "api-key" = "${var.cogacct_eastus_key1}"
    }
  }

  depends_on = [
    azurerm_api_management.apim_eastus
  ]
}

resource "azurerm_api_management_product" "product_apim" {
  product_id            = "${var.CompanyAbbreviation}GenAI"
  api_management_name   = azurerm_api_management.apim_eastus.name
  resource_group_name   = var.rg_eastus_name
  display_name          = "${var.CompanyAbbreviation}GenAI"
  subscription_required = true
  subscriptions_limit   = "40"
  published             = true
  depends_on = [
    azurerm_api_management.apim_eastus
  ]
}





