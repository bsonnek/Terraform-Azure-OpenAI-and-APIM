# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.75.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.azure-subscription-id
  client_id       = var.azure-client-id
  client_secret   = var.azure-client-secret
  tenant_id       = var.azure-tenant-id
}

module "ResourceGroups" {
  source              = "./ResourceGroups"
  EnvShortName        = var.EnvShortName
  CompanyAbbreviation = var.CompanyAbbreviation
  location_uksouth    = var.location_uksouth
  location_ncus       = var.location_ncus
  location_eastus2    = var.location_eastus2
  location_eastus     = var.location_eastus
}

module "api_management" {
  source                  = "./api_management"
  EnvShortName            = var.EnvShortName
  CompanyAbbreviation     = var.CompanyAbbreviation
  apim_publisher_name     = var.apim_publisher_name
  apim_publisher_email    = var.apim_publisher_email
  location_eastus         = module.ResourceGroups.location_eastus_out
  rg_eastus_name          = module.ResourceGroups.rg_eastus_name_out
  subnetid_eastus         = module.virtual_network.vnet_eastus_subnet_apim_out["APIM-Subnet-10-20-50-0"]
  cogacct_eastus_key1     = module.openai.cogacct_eastus_key1_out
  cogacct_eastus_endpoint = module.openai.cogacct_eastus_endpoint_out
  kv_secret_eastus_id     = module.key_vault.kv_secret_eastus_id_out
}

module "openai" {
  source              = "./openai"
  EnvShortName        = var.EnvShortName
  CompanyAbbreviation = var.CompanyAbbreviation
  ## Location Variables
  location_uksouth = module.ResourceGroups.location_uks_out
  location_ncus    = module.ResourceGroups.location_ncus_out
  location_eastus2 = module.ResourceGroups.location_eastus2_out
  location_eastus  = module.ResourceGroups.location_eastus_out
  ## Resource Group Variables
  rg_uksouth_name = module.ResourceGroups.rg_uks_name_out
  rg_ncus_name    = module.ResourceGroups.rg_ncus_name_out
  rg_eastus2_name = module.ResourceGroups.rg_eastus2_name_out
  rg_eastus_name  = module.ResourceGroups.rg_eastus_name_out
  ## vNet Names
  vnet_uksouth_name = module.virtual_network.vnet_uksouth_name_out
  vnet_ncus_name    = module.virtual_network.vnet_ncus_name_out
  vnet_eastus2_name = module.virtual_network.vnet_eastus2_name_out
  vnet_eastus_name  = module.virtual_network.vnet_eastus_name_out
}

module "key_vault" {
  source               = "./key_vault"
  EnvShortName         = var.EnvShortName
  CompanyAbbreviation  = var.CompanyAbbreviation
  location_eastus      = module.ResourceGroups.location_eastus_out
  rg_eastus_name       = module.ResourceGroups.rg_eastus_name_out
  cogacct_eastus_key1  = module.openai.cogacct_eastus_key1_out
  apim_eastus_identity = module.api_management.apim_eastus_identity_out
  apim_eastus_tenantid = module.api_management.apim_eastus_tenantid_out
}


module "virtual_network" {
  depends_on = [
    module.ResourceGroups.rg_uks_name_out,
    module.ResourceGroups.rg_ncus_name_out,
    module.ResourceGroups.rg_eastus2_name_out,
    module.ResourceGroups.rg_eastus_name_out
  ]

  source              = "./virtual_network"
  EnvShortName        = var.EnvShortName
  CompanyAbbreviation = var.CompanyAbbreviation
  location_uksouth    = module.ResourceGroups.location_uks_out
  rg_uksouth_name     = module.ResourceGroups.rg_uks_name_out
  location_ncus       = module.ResourceGroups.location_ncus_out
  rg_ncus_name        = module.ResourceGroups.rg_ncus_name_out
  location_eastus2    = module.ResourceGroups.location_eastus2_out
  rg_eastus2_name     = module.ResourceGroups.rg_eastus2_name_out
  location_eastus     = module.ResourceGroups.location_eastus_out
  rg_eastus_name      = module.ResourceGroups.rg_eastus_name_out

}
