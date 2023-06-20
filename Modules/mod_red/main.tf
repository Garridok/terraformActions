# VNET
resource "azurerm_virtual_network" "vnet" {
  depends_on = [
    var.rgroup   # Depende de el grupo de recursos.
  ]

  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.rgroup
  address_space       = var.vnet_address_list # Lista de prefijos de la VNET.

}

# Subnet
resource "azurerm_subnet" "subnet" {
  depends_on = [
    azurerm_virtual_network.vnet   # Depende de la VNET.
  ]

  for_each = var.subnet_map   # Foreach para el MAP de Subnet.

  name                 = each.key
  resource_group_name  = azurerm_virtual_network.vnet.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = each.value.subnet_address_list # Lista de prefijos de la Subnet.
}
