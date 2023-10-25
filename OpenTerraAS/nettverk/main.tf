resource "azurerm_resource_group" "virt_net_rg" {
  name     = var.virtnet_rg_name
  location = var.virtnet_location
}

resource "azurerm_network_security_group" "nsg" {
  name                = var.virtnet_name
  location            = azurerm_resource_group.virt_net_rg.location
  resource_group_name = azurerm_resource_group.virt_net_rg.name
}

resource "azurerm_virtual_network" "virt_net" {
  name                = var.virtnet_name
  location            = azurerm_resource_group.virt_net_rg.location
  resource_group_name = azurerm_resource_group.virt_net_rg.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]
}

resource "azurerm_subnet" "subnet1" {
  name = var.subnet1_name
  resource_group_name = azurerm_resource_group.virt_net_rg.name
  virtual_network_name = azurerm_virtual_network.virt_net.name
  address_prefixes = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "subnet2" {
  name = var.subnet2_name
  resource_group_name = azurerm_resource_group.virt_net_rg.name
  virtual_network_name = azurerm_virtual_network.virt_net.name
  address_prefixes = ["10.0.2.0/24"]
}

resource "azurerm_subnet_network_security_group_association" "nsg_subnet1_association" {
  subnet_id                 = azurerm_subnet.subnet1.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

resource "azurerm_subnet_network_security_group_association" "nsg_subnet2_association" {
  subnet_id                 = azurerm_subnet.subnet2.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

resource "azurerm_network_security_rule" "innbound_ssh_from_NTNU" {
  name                        = "SSHInboundMyIP"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "129.241.0.0/16"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.virt_net_rg.name
  network_security_group_name = azurerm_network_security_group.nsg.name
}
