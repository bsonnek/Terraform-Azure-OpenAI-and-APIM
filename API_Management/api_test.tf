resource "azurerm_api_management_api" "api_opeanai_test" {
  name                = "openai-test"
  resource_group_name = var.rg_eastus_name
  api_management_name = azurerm_api_management.apim_eastus.name
  revision            = "1"
  display_name        = "openai-test"
  path                = "example"
  protocols           = ["https"]

  import {
    content_format = "openapi"
    content_value  = file("${path.module}/AOAI-Template.openapi+json.json")
  }
  depends_on = [
    azurerm_api_management.apim_eastus
  ]
}

resource "azurerm_api_management_api_policy" "api_opeanai_test_policy" {
  api_name            = azurerm_api_management_api.api_opeanai_test.name
  api_management_name = azurerm_api_management.apim_eastus.name
  resource_group_name = var.rg_eastus_name

  xml_content = var.base_api_policy

  depends_on = [
    azurerm_api_management.apim_eastus,
    azurerm_api_management_api.api_opeanai_test
  ]
}
