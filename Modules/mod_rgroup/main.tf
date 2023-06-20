# Grupo de recursos.
resource "azurerm_resource_group" "grupo" {
  name     = var.rgroup
  location = var.location
}
