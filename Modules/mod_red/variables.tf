# Grupo y localización
variable "rgroup" {
  type        = string
  description = "Nombre del Grupo de Recursos"
}

variable "location" {
  type        = string
  description = "Localización del GR"
}

# Variables Modulo Red
# VNET
variable "vnet_name" {
  type = string
  description = "Nombre de la VNET"
}

variable "vnet_address_list" {
  type = list(any)
  description = "Lista de direcciones de subred."
}

variable "subnet_map" {
  type        = map(any)
  description = "MAP del módulo red"
}
