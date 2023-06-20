rgroup = "agarrido"

#MAP Modulo MV
mv_map = {
  # Máquina Virtual 1
  mv1 = {
    # Nombre VNET.
    vnet_name = "vnet1"

    # Datos de Subnet.
    subnet_name    = "subnet1"
    subnet_address = "10.0.1.0/24"

    # Nombre de NIC & NSG.
    nic_name = "nic1"
    nsg_name = "nsg1"

    # Datos VM.
    vm_name     = "vm1"
    os_sta_type = "Standard_LRS"
    os_sku      = "18.04-LTS"
    vm_size     = "Standard_B2ms"

    # Usuario admin.
    admin_user = "linuxuser"

    # Archivo PEM.
    pem_name = "linuxkey"

    # IP Pública.
    pubip_name = "pubip1"
  }

  # Máquina Virtual 2
  mv2 = {
    # Nombre VNET.
    vnet_name = "vnet1"

    # Datos Subnet.
    subnet_name    = "subnet2"
    subnet_address = "10.0.2.0/24"

    # Nombre de NIC & NSG.
    nic_name = "nic2"
    nsg_name = "nsg2"

    # Datos VM.
    vm_name     = "vm2"
    os_sta_type = "Standard_LRS"
    os_sku      = "18.04-LTS"
    vm_size     = "Standard_B2ms"

    # Usuario admin.     
    admin_user = "linuxuser"

    # Archivo PEM.
    pem_name = "linuxkey"

    # Nombre IP Pública.
    pubip_name = "pubip2"
  }
}
