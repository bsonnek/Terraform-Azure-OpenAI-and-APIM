# TFvars Inputs
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

variable "uksouth_subnet" {
  description = "UK South VNET Subnets"
  type        = map(any)
  default = {
    subnet_1 = {
      name             = "OpenAI-Subnet-10-20-193-0"
      address_prefixes = ["10.20.193.0/24"]
    }
  }
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

variable "ncus_subnet" {
  description = "North Central US VNET Subnets"
  type        = map(any)
  default = {
    subnet_1 = {
      name             = "OpenAI-Subnet-10-20-129-0"
      address_prefixes = ["10.20.129.0/24"]
    }
  }
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

variable "eastus2_subnet" {
  description = "East US 2 VNET Subnets"
  type        = map(any)
  default = {
    subnet_1 = {
      name             = "OpenAI-Subnet-10-20-65-0"
      address_prefixes = ["10.20.65.0/24"]
    }
  }
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

variable "eastus_subnet" {
  description = "East US VNET Subnets"
  type        = map(any)
  default = {
    subnet_1 = {
      name             = "OpenAI-Subnet-10-20-10-0"
      address_prefixes = ["10.20.10.0/24"]
    }
    subnet_2 = {
      name             = "Monitoring-Subnet-10-20-20-0"
      address_prefixes = ["10.20.20.0/24"]
    }
    subnet_3 = {
      name             = "Security-Subnet-10-20-30-0"
      address_prefixes = ["10.20.30.0/24"]
    }
    subnet_4 = {
      name             = "APIM-Subnet-10-20-50-0"
      address_prefixes = ["10.20.50.0/24"]
    }
    subnet_5 = {
      name             = "WebApp-Subnet-10-20-35-0"
      address_prefixes = ["10.20.35.0/24"]
    }
    subnet_5 = {
      name             = "WAF-Subnet-10-20-36-0"
      address_prefixes = ["10.20.36.0/24"]
    }
  }
}
