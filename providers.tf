provider "azurerm" {
  features {}
}

terraform {
  required_version = ">= 1.2.1"
  required_providers {
    azapi = {
      source  = "azure/azapi"
      version = "~>1.5"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
    time = {
      source  = "hashicorp/time"
      version = "0.9.1"
    }
    azuread = {
      version = ">= 2.23.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.8.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.17.0"
    }
  }
}

provider "kubernetes" {
    host                   = module.aks_cluster.host
    username               = module.aks_cluster.cluster_username
    password               = module.aks_cluster.cluster_password
    client_certificate     = base64decode(module.aks_cluster.client_certificate)
    client_key             = base64decode(module.aks_cluster.client_key)
    cluster_ca_certificate = base64decode(module.aks_cluster.cluster_ca_certificate)
}