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

# Configuración de provider.
provider "azurerm" {
  features {}
}

# Módulo Grupo de recursos.
module "mod_rgroup" {
    source = "../../Modules/mod_rgroup"

    for_each = var.rgroup_map

    rgroup = each.value.rgroup
    location = each.value.location
}