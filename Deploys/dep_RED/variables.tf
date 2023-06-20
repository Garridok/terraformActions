# MAP Modulo Red
variable "red_map" {
  type        = map(any)
  description = "MAP del módulo red"
}

# Grupo y localización
variable "rgroup" {
  type        = string
  description = "Nombre del Grupo de Recursos"
}
