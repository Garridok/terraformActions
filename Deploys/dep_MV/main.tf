# Proveedor de la nube.
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.97.0"
    }
  }

  required_version = ">= 1.1.0"
}


# Provider de azure.
provider "azurerm" {
  features {}
}

# DATA grupo de recursos.
data "azurerm_resource_group" "rgroup_data" {
  name = var.rgroup
}

# Data VNET.
data "azurerm_virtual_network" "vnet_data1" {
  name                = "vnet1"
  resource_group_name = data.azurerm_resource_group.rgroup_data.name
}

data "azurerm_virtual_network" "vnet_data2" {
  name                = "vnet2"
  resource_group_name = data.azurerm_resource_group.rgroup_data.name
}

data "azurerm_subnet" "subnet_data" {
  virtual_network_name = data.azurerm_virtual_network.vnet_data1.name
  resource_group_name  = data.azurerm_resource_group.rgroup_data.name
  name                 = "subnet01"
}

  # Variables para la SSH Key
  resource "tls_private_key" "linux_key" {
    algorithm = "RSA"
    rsa_bits  = 4096
  }

  # Archivo PEM
  resource "local_file" "linuxkey" {
    filename = "linuxkey.pem"
    content  = tls_private_key.linux_key.private_key_pem
  }

# Módulo VM.
module "mod_vm" {
  source = "../../Modules/mod_VM"

  # Grupo de recursos.
  rgroup   = data.azurerm_resource_group.rgroup_data.name
  location = data.azurerm_resource_group.rgroup_data.location

  for_each = var.mv_map

  tls_pub = tls_private_key.linux_key.public_key_openssh

  # Nombre VNET.
  vnet_name = data.azurerm_virtual_network.vnet_data1.name
  vnet_id   = data.azurerm_virtual_network.vnet_data1.id
  vnet      = data.azurerm_virtual_network.vnet_data1

  # Datos Subnet.
  subnet_id   = data.azurerm_subnet.subnet_data.id
  subnet_name = data.azurerm_subnet.subnet_data.name

  # Nombre de NIC & NSG
  nic_name = each.value.nic_name
  nsg_name = each.value.nsg_name

  # IP Pública.
  pubip_name = each.value.pubip_name

  # Datos de la VM.
  vm_name     = each.value.vm_name
  vm_size     = each.value.vm_size
  os_sta_type = each.value.os_sta_type
  os_sku      = each.value.os_sku

  # Usuario Admin
  admin_user = each.value.admin_user

  # Archivo PEM.
  pem_name = "linuxkey.pem"
}
