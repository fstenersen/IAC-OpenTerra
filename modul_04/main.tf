terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.71.0"
    }
  }
}

provider "azurerm" {
  features {}
}

module "ResourceGroup" {
  source    = "./ResourceGroup"
  base_name = "modul04"
  location  = "West Europe"
}

module "StorageAccount" {
  source              = "./StorageAccount"
  base_name           = "modul04"
  rgname              = module.ResourceGroup.rg_name_output
  location            = "West Europe"
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}

resource "azurerm_network_security_group" "nsg-demo" {
  name                = "nsg-sn01-demo"
  location            = azurerm_resource_group.rg.vnet.location     # Ikke laget enda
  resource_group_name = azurerm_resource_group.rg-vnet.name         # Ikke laget enda

  security_rule {
    name                       = "Allow-public-IP"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "104.28.31.34"                     # Mulig denne må endres om æ fær heim evt bruk VPN!
    destination_address_prefix = "*"
  }

  tags = {
    environment = "Production"
  }
}

resource "azurerm_subnet_network_security_group_association" "example" {
  subnet_id                 = azurerm_subnet.demo-sn.id                         # Ikke laget enda
  network_security_group_id = azurerm_network_security_group.nsg-demo.id
}