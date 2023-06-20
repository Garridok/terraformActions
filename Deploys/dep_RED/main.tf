# Proveedor de la nube.
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.97.0"
    }
  }

}

# Configuración de provider.
provider "azurerm" {
  features {}
}

# DATA para el grupo de recursos.
data "azurerm_resource_group" "rgroup_data" {
  name = var.rgroup
}

# Módulo de RED.
module "mod_red" {
  source = "../../Modules/mod_red"

  # Foreach para el MAP de red.
  for_each = var.red_map

  # Grupo de recursos / Location.
  rgroup   = data.azurerm_resource_group.rgroup_data.name
  location = data.azurerm_resource_group.rgroup_data.location

  # Nombre de la VNET y Address List.
  vnet_name         = each.key
  vnet_address_list = each.value.vnet_address_list

  # Mapa de Subnets.
  subnet_map        = each.value.subnet_map

}
