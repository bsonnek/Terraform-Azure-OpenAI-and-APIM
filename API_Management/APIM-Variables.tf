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
variable "subnetid_eastus" {
  type = string
}
variable "cogacct_eastus_key1" {
  type = string  
}
variable "cogacct_eastus_endpoint" {
  type = string
}
variable "kv_secret_eastus_id" {
  type = string
  sensitive = true
}

variable "base_api_policy" {
  type = string
  default = <<XML
  <policies>
      <inbound>
        <base />
        <set-backend-service backend-id="openai-DEV-eastus-backend" />
      </inbound>
  </policies>
  XML
}