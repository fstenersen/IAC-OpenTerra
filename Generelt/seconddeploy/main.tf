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

resource "azurerm_resource_group" "rgwe" {
  name     = var.rgname
  location = var.location
}

resource "azurerm_storage_account" "sa-demo" {
  name                     = var.saname
  resource_group_name      = azurerm_resource_group.rgwe.name
  location                 = azurerm_resource_group.rgwe.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

resource "azurerm_network_security_group" "nsg" {
  name                = "nsg-vnet01"
  location            = azurerm_resource_group.rgwe.location
  resource_group_name = azurerm_resource_group.rgwe.name
}

resource "azurerm_virtual_network" "vnet01" {
  name                = "vnet-01-we"
  location            = azurerm_resource_group.rgwe.location
  resource_group_name = azurerm_resource_group.rgwe.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "sn-01-we"
    address_prefix = "10.0.1.0/24"
    security_group = azurerm_network_security_group.nsg.id
  }

  subnet {
    name           = "sn-02-we"
    address_prefix = "10.0.2.0/24"
    security_group = azurerm_network_security_group.nsg.id
  }
}

resource "azurerm_virtual_network" "vnet02" {
  name                = "vnet-02-we"
  location            = azurerm_resource_group.rgwe.location
  resource_group_name = azurerm_resource_group.rgwe.name
  address_space       = ["10.10.0.0/16"]
  dns_servers         = ["10.10.0.4", "10.0.0.5"]

  subnet {
    name           = "sn-02-01-we"
    address_prefix = "10.10.1.0/24"
    security_group = azurerm_network_security_group.nsg.id
  }

  subnet {
    name           = "sn-02-02-we"
    address_prefix = "10.10.2.0/24"
    security_group = azurerm_network_security_group.nsg.id
  }
}