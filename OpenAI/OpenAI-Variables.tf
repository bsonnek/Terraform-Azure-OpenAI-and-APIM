# Resource Group Names
variable "EnvShortName" {
  type = string
}

variable "CompanyAbbreviation" {
  type = string
}

# UK South
####################
variable "rg_uksouth_name" {
  description = "Resource Group Value"
  type        = string
}
variable "location_uksouth" {
  description = "Azure Location Value"
  type        = string
}
variable "vnet_uksouth_name" {
  description = "Azure vNet for UK South"
  type = string  
}

# North Central US
####################
variable "rg_ncus_name" {
  description = "Resource Group Value"
  type        = string
}
variable "location_ncus" {
  description = "Azure Location Value"
  type        = string
}
variable "vnet_ncus_name" {
  description = "Azure vNet for North Central US"
  type = string  
}

# East US 2 
####################
variable "rg_eastus2_name" {
  description = "Resource Group Value"
  type        = string
}
variable "location_eastus2" {
  description = "Azure Location Value"
  type        = string
}
variable "vnet_eastus2_name" {
  description = "Azure vNet for East US 2"
  type = string  
}

# East US
####################
variable "rg_eastus_name" {
  description = "Resource Group Value"
  type        = string
}
variable "location_eastus" {
  description = "Azure Location Value"
  type        = string
}
variable "vnet_eastus_name" {
  description = "Azure vNet for East US"
  type = string  
}
