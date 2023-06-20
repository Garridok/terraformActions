# Grupo de recursos.
rgroup = "agarrido"

red_map = {
  # Datos VNET1.
  "vnet1" = {
    vnet_address_list = ["10.0.0.0/16"] # Lista de prefijos VNET.
    subnet_map = {
      "subnet01" = {
        # Lista de prefijos de la subred.
        subnet_address_list = ["10.0.1.0/24"]
      }
      "subnet02" = {
        subnet_address_list = ["10.0.2.0/24"]
      }
    }
  }
  # Datos VNET2.
  "vnet2" = {

    vnet_address_list = ["10.0.0.0/16"] # Lista de prefijos VNET.

    subnet_map = {
      "subnet11" = {
        # Lista de prefijos de la subred.
        subnet_address_list = ["10.0.1.0/24"]
      }
      "subnet12" = {
        subnet_address_list = ["10.0.2.0/24"]
      }
    }
  }
}
