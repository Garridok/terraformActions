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

resource "azurerm_storage_account" "sta" {
  name                     = "sta1garrido"
  resource_group_name      = "agarrido"
  location                 = "westeurope"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "stacont" {
  name                  = "tfstgarrido"
  storage_account_name  = "sta1garrido"
  container_access_type = "private"

  depends_on = [ azurerm_storage_account.sta ]
}