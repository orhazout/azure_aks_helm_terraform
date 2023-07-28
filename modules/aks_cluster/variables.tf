variable "rg_name" {
  description = "Name of the resource group"
  type        = string
}

variable "aks_location" {
  description = "location of the aks"
  type        = string
}

variable "vnet_subnet_id" {
  description = "location of the aks"
  type        = string
}

variable "sp_id" {
  description = "service principal id"
  type        = string
}

variable "sp_secret" {
  description = "service principal password"
  type        = string
}

variable "key_data" {
    description = "ssh key data"
}
