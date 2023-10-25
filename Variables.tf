# Resource Group Names
variable "EnvShortName" {
  type = string
}
variable "CompanyAbbreviation" {
  type = string
}
variable "apim_publisher_name" {
  type = string
}
variable "apim_publisher_email" {
  type = string
}

#Location Variables
variable "location_uksouth" {
  description = "Azure Location Value"
  type        = string
  default     = "uksouth"
}
variable "location_ncus" {
  description = "Azure Location Value"
  type        = string
  default     = "northcentralus"
}
variable "location_eastus2" {
  description = "Azure Location Value"
  type        = string
  default     = "eastus2"
}
variable "location_eastus" {
  description = "Azure Location Value"
  type        = string
  default     = "eastus"
}
