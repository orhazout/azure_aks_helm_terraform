resource "azurerm_resource_group" "default" {
  name     = var.rg_name
  location = var.project_location
}

module "virtual_network" {
  source = "./modules/virtual_network"
    vnet_rg_name  = "aks_vnet_rg"
    vnet_location = var.project_location
    virtual_network_name = "aks_virtual_network"
    aks_nsg = "aks_vnet_nsg"
    aks_subnet = "aks_subnet"
}

module "ad_service_principal" {
  source = "./modules/ad_service_principal"

    application_name = "aks_app"
}

module "aks_cluster" {
  source = "./modules/aks_cluster"

    rg_name        = var.rg_name
    aks_location   = var.project_location
    vnet_subnet_id = module.virtual_network.subnet_id
    sp_id          = module.ad_service_principal.sp_id
    sp_secret      = module.ad_service_principal.client_secret
    key_data       = jsondecode(azapi_resource_action.ssh_public_key_gen.output).publicKey

    depends_on = [module.virtual_network, module.ad_service_principal]
}


module "cluster_build" {
  source = "./modules/cluster_build"
  namespace1 = "cicd"
}

module "helm_chart" {
  source = "./modules/helm_chart"
  namespace_cicd              = module.cluster_build.namespace1_name
  kube_host                   = module.aks_cluster.host
  kube_client_certificate     = base64decode(module.aks_cluster.client_certificate)
  kube_client_key             = base64decode(module.aks_cluster.client_key)
  kube_cluster_ca_certificate = base64decode(module.aks_cluster.cluster_ca_certificate)
}

