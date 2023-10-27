module "nettverk" {
  source = "../nettverk"
}

module "keyvault" {
  source                   = "../keyvault"
  keyvault_rgname          = var.keyvault_rgname
  keyvault_location        = var.keyvault_location
  keyvault_name            = var.keyvault_name
  keyvault_access_key_name = var.keyvault_access_key_name
  
  vm_brukernavn = var.vm_brukernavn
  vm_passord    = var.vm_passord
}
  
resource "azurerm_resource_group" "vm-rg" {
  name     = "${var.company_shortname}_vm_rg"
  location = var.vm_rg_location
}

resource "azurerm_public_ip" "publicip" {
  name                = "${var.company_shortname}-publicip"
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
    subnet_id                     = var.subnet1_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.publicip.id
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                = "VM-${var.company_shortname}-${var.project_name}"
  resource_group_name = azurerm_resource_group.vm-rg.name
  location            = azurerm_resource_group.vm-rg.location
  size                = var.vm_size
  admin_username      = var.vm_brukernavn
  admin_password      = var.vm_passord
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.nic.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.vm_publisher
    offer     = var.vm_image_offer
    sku       = var.sku
    version   = "latest"
  }

  tags = local.common_tags
}