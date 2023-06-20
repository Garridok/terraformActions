# Grupo y Location
variable "rgroup" {
  type        = string
  description = "Nombre del Grupo de Recursos."
}

variable "location" {
  type        = string
  description = "Location del GR"
}

variable "vnet_name" { # Nombre VNET
  type        = string
  description = "Nombre VNET"
}

variable "subnet_name" { #Nombre Subnet
  type        = string
  description = "Nombre Subnet"
}

# Módulo VM
variable "nic_name" { # Nombre NIC
  type        = string
  description = "Nombre de la NIC."
}

variable "nsg_name" { # Nombre NSG
  type        = string
  description = "Nombre de la NSG."
}

variable "vm_name" { # Nombre Máquina Virtual
  type        = string
  description = "Nombre de la VM"
}

variable "vm_size" { # Tamaño VM
  type        = string
  description = "Tamaño de la VM"
}

variable "admin_user" { # Usuario Administrador.
  type        = string
  description = "Usuario Admin"
}

variable "os_sta_type" { # Tipo STA del Sistema
  type        = string
  description = "Tipo de STA del sistema."
}

variable "os_sku" {
  type        = string
  description = "SKU"
}

variable "pem_name" { # Nombre del archivo PEM.
  type        = string
  description = "Nombre archivo PEM"
}

variable "pubip_name" { #Nombre de la IP pública.
  type        = string
  description = "Nombre IP pública"
}

variable "vnet" {}

variable "vnet_id" {}

variable "subnet_id" {}

variable "tls_pub" {}