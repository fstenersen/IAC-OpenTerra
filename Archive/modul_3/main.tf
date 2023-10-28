terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.69.0"
    }
  }
}

provider "azurerm" {
  features {

  }
}


resource "azurerm_resource_group" "rg-storage" {
  name     = "rg-storage"
  location = var.az_regions[0]
  tags     = local.common_tags
}


resource "azurerm_storage_account" "sa1" {
  name                     = "sa1fredriks"
  resource_group_name      = azurerm_resource_group.rg-storage.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = local.common_tags
}

resource "azurerm_storage_account" "sa2" {
  name                     = "sa2fredriks"
  resource_group_name      = azurerm_resource_group.rg-storage.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = local.common_tags
}

resource "azurerm_storage_account" "sa3" {
  name                     = "sa3fredriks"
  resource_group_name      = azurerm_resource_group.rg-storage.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = local.common_tags
}

resource "azurerm_resource_group" "rg-network" {
  name     = "rg-network"
  location = var.az_regions[0]
  tags     = local.common_tags
}

resource "azurerm_network_security_group" "nsg" {
  name                = "nsg-vnet01"
  location            = azurerm_resource_group.rg-network.location
  resource_group_name = azurerm_resource_group.rg-network.name
}


resource "azurerm_virtual_network" "vnet01" {
  name                = "vnet-01-we"
  location            = azurerm_resource_group.rg-network.location
  resource_group_name = azurerm_resource_group.rg-network.name
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
  name                = "vnet-02-01-we"
  location            = azurerm_resource_group.rg-network.location
  resource_group_name = azurerm_resource_group.rg-network.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "sn-01-02-we"
    address_prefix = "10.0.1.0/24"
    security_group = azurerm_network_security_group.nsg.id
  }

  subnet {
    name           = "sn-01-we"
    address_prefix = "10.0.2.0/24"
    security_group = azurerm_network_security_group.nsg.id
  }
}


variable "vmsize" {
  type = map
  default = {
    "small" = "Standard_B1s"
    "medium" = "Standard_B2s"
    "large" = "Standard_B4ms"

  }
}

output "said1" {
  value = azurerm_storage_account.sa1.id
}

output "said2" {
  value = azurerm_storage_account.sa2.id
}

output "said3" {
  value = azurerm_storage_account.sa3.id
}