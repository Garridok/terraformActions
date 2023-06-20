output "ip_priv" {
  value = "${azurerm_network_interface.nic.private_ip_address}"
}

output "ip_pub" {
  value = "${azurerm_public_ip.public_ip.ip_address}"
}