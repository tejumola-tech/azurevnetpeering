variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
}

variable "rg" {
  description = "Resourec group name"
  type        = string
}

variable "location" {
  description = "Map of locations for different VNets"
  type        = map(string)
}

variable "CoreServiceVnet_address_space" {
  description = "Address space for CoreServiceVnet"
  type        = list(string)
}

variable "CoreServiceVnet_subnets" {
  description = "Subnets for CoreServiceVnet"
  type        = map(string)
}


variable "ManufacturingVnet_address_space" {
  description = "Address space for the Manufacturing VNet"
  type        = list(string)
}

variable "ManufacturingVnet_subnets" {
  description = "Subnets for Manufacturing VNet"
  type        = map(string)
}



