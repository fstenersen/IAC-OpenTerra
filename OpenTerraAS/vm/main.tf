module "nettverk" {
  source = "../nettverk"
}

resource "azurerm_resource_group" "vm-rg" {
  name     = "${var.company_shortname}_vm_rg"
  location = var.vm_rg_location
}

resource "azurerm_public_ip" "publicip" {
  name                = "${var.company_shortname}_publicip"
  location            = azurerm_resource_group.vm-rg.location
  resource_group_name = azurerm_resource_group.vm-rg.name
  allocation_method   = "Dynamic"
}

resource "azurerm_network_interface" "nic" {
  name                = var.nic_name
  location            = azurerm_resource_group.vm-rg.location
  resource_group_name = azurerm_resource_group.vm-rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = module.nettverk.subnet1_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.publicip.id
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                = "VM-${var.company_shortname}-${var.project_name}"
  resource_group_name = azurerm_resource_group.vm-rg.name
  location            = azurerm_resource_group.vm-rg.location
  size                = "Standard_F2"
  admin_username      = "${var.company_shortname}-${var.admin_username}"
  admin_password = "Password1234!"
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.nic.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }

  tags = local.common_tags
}