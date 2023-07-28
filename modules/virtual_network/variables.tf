variable "vnet_rg_name" {
  description = "Name of the vnet resource group"
  type        = string
}

variable "vnet_location" {
  description = "Name of the aks vnet location"
  type        = string
}

variable "virtual_network_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "aks_subnet" {
  description = "Name of the aks subnet"
  type        = string
}

variable "aks_nsg" {
  description = "Name of the aks network security group"
  type        = string
}

