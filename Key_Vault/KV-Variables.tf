# Resource Group Names
variable "EnvShortName" {
  type = string
}

variable "CompanyAbbreviation" {
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

variable "cogacct_eastus_key1" {
  description = "Azure OpenAI apikey"
  type        = string
}



#############################
# Azure Key Vault variables #
#############################


variable "sku_name" {
  type        = string
  description = "Select Standard or Premium SKU"
  default     = "standard"
}

variable "apim_eastus_identity" {
  type = string
}

variable "apim_eastus_tenantid" {
  type = string
}

# Admin permission
variable "kv-key-permissions-full" {
  type        = list(any)
  description = "List of key permissions, must be one or more from the following: backup, create, decrypt, delete, encrypt, get, import, list, purge, recover, restore, sign, unwrapKey, update, verify and wrapKey."
  default     = ["Backup", "Create", "Decrypt", "Delete", "Encrypt", "Get", "Import", "List", "Purge", "Recover", "Restore", "Sign", "UnwrapKey", "Update", "Verify", "WrapKey"]

}
variable "kv-secret-permissions-full" {
  type        = list(string)
  description = "List of full secret permissions, must be one or more from the following: Backup, Delete, Get, List, Purge, Recover, Restore and Set"
  default     = ["Backup", "Delete", "Get", "List", "Purge", "Recover", "Restore", "Set"]
}

variable "kv-storage_permissions-full" {
  type        = list(string)
  description = "List of storage permissions, must be one or more from the following: backup, delete, deletesas, get, getsas, list, listsas, purge, recover, regeneratekey, restore, set, setsas and update."
  default     = ["Backup", "DeleteSAS", "Delete", "GetSAS", "Get", "ListSAS", "List", "Purge", "Recover", "Restore", "RegenerateKey", "Set", "SetSAS", "Update"]
}


