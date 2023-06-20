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

# Configuración provider.
provider "azurerm" {
  features {}
}

# DATA grupo de recursos.
data "azurerm_resource_group" "rgroup_data" {
  name = "${var.rgroup}"
}

# Módulo STA.
module "mod_sta" {
    source = "../../Modules/mod_sta"
    
    # Grupo de recursos.
    rgroup = data.azurerm_resource_group.rgroup_data.name
    location = data.azurerm_resource_group.rgroup_data.location

    for_each = var.sta_map

    # Nombre STA
    sta_name = each.value.sta_name

  depends_on = [ 
    data.data.azurerm_resource_group.rgroup_data
  ]
}