resource "azurerm_kubernetes_cluster" "aks" {
  name                = "${var.rg_name}-aks"
  location            = var.aks_location
  resource_group_name = var.rg_name
  dns_prefix          = "${var.rg_name}-k8s"

#   identity {
#     type = "SystemAssigned"
#   }

  default_node_pool {
    name                     = "default"
    node_count               = 2
    max_count                = 5
    min_count                = 2
    type                     = "VirtualMachineScaleSets"
    enable_auto_scaling      = true
    vm_size                  = "Standard_B2s"
    os_disk_size_gb          = 30
    vnet_subnet_id           = var.vnet_subnet_id
  
  }
    
  linux_profile {
    admin_username = "ubuntu"

    ssh_key {
      key_data = var.key_data
    }
  }

  network_profile {
    network_plugin    = "kubenet"
    load_balancer_sku = "standard"
    # network_plugin = "azure"
    # network_policy = "azure"
    service_cidr = "10.0.4.0/24"
    dns_service_ip = "10.0.4.10"

  }

  service_principal {
    client_id     = var.sp_id
    client_secret = var.sp_secret
  }

  role_based_access_control_enabled = true

}

