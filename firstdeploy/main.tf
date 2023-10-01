terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.71.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "fd-rg" {
  name     = "rg-demo-we"
  location = "West Europe"
}

resource "azurerm_storage_account" "sa-demo" {
  name                     = "fredrikdemo28aug"
  resource_group_name      = azurerm_resource_group.fd-rg.name
  location                 = azurerm_resource_group.fd-rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

// terraform plan - planlegger det som skal gjøres
// terraform apply - utfører
// terraform destroy - sletter hele infrastrukturen