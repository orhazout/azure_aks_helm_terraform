resource "azurerm_resource_group" "vnet" {
  name     = var.vnet_rg_name
  location = var.vnet_location
}


resource "azurerm_virtual_network" "virtual_network" {
  name                = var.virtual_network_name
  resource_group_name = var.vnet_rg_name
  address_space       = ["10.0.0.0/16"]
  location            = var.vnet_location

  depends_on = [azurerm_resource_group.vnet]
}

output "network_id" {
  value = azurerm_virtual_network.virtual_network.id
}

resource "azurerm_subnet" "aks_subnet" {
  name                 = var.aks_subnet
  resource_group_name  = var.vnet_rg_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = ["10.0.1.0/24"]

  depends_on = [azurerm_resource_group.vnet, azurerm_virtual_network.virtual_network]
}

output "subnet_id" {
  value = azurerm_subnet.aks_subnet.id
}


resource "azurerm_network_security_group" "aks_nsg" {
  name                = var.aks_nsg
  location            = var.vnet_location
  resource_group_name = var.vnet_rg_name

  security_rule {
    name                       = "Allow_Web_Port_8080"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "8080"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }




  security_rule {
    name                       = "Allow_Web_Port_80"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }


  security_rule {
    name                       = "Allow_Web_Port_5000"
    priority                   = 102
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "5000"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  depends_on =[azurerm_resource_group.vnet, azurerm_virtual_network.virtual_network]
}


# resource "azurerm_subnet" "subnet_db" {
#   name                 = var.subnet_db_name
#   resource_group_name  = var.vnet_rg_name
#   virtual_network_name = var.virtual_network_name
#   address_prefixes     = ["10.0.1.0/24"]
# }


# resource "azurerm_network_security_group" "nsg_db" {
#   name                = var.nsg_db_name
#   location            = var.vnet_location
#   resource_group_name = var.vnet_rg_name

#   security_rule {
#     name                       = "Allow_DB_Subnet_Inbound"
#     priority                   = 104
#     direction                  = "Inbound"
#     access                     = "Allow"
#     protocol                   = "Tcp"
#     source_port_range          = "*"
#     destination_port_range     = "5432"
#     source_address_prefix      = "10.0.2.0"
#     destination_address_prefix = "*"
#   }

#   security_rule {
#     name                       = "Allow_DB_Subnet_SSH"
#     priority                   = 105
#     direction                  = "Inbound"
#     access                     = "Allow"
#     protocol                   = "Tcp"
#     source_port_range          = "*"
#     destination_port_range     = "22"
#     source_address_prefix      = "176.230.143.97"
#     destination_address_prefix = "*"
#   }
