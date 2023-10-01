terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.73.0"
    }
  }
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}


module "lagring" {
  source            = "./lagring"
  lagring_rgname    = var.lagring_rgname
  lagring_location  = var.lagring_location
  lagring_base_name = var.lagring_base_name
  # Egentlig skal tags her men får no error greier, prioriteres ikke nu
}

module "nettverk" {
  source           = "./nettverk"
  virtnet_rg_name  = var.virtnet_rg_name
  virtnet_location = var.virtnet_location
  virtnet_name     = var.virtnet_name
  subnet1_name     = var.subnet1_name
  subnet2_name     = var.subnet2_name
  # Egentlig skal tags her men får no error greier, prioriteres ikke nu
}

module "vm" {
  source            = "./vm"
  company_shortname = var.company_shortname
  vm_rg_location    = var.vm_rg_location
  nic_name          = var.nic_name
  admin_username    = var.admin_username
  virtnet_rg_name   = var.virtnet_rg_name
  virtnet_location  = var.virtnet_location
  virtnet_name      = var.virtnet_name
  subnet1_name      = var.subnet1_name
  subnet2_name      = var.subnet2_name
}

output "subnet2_name_value" {
  value = var.subnet2_name
}

output "subnet1_name_value" {
  value = var.subnet1_name
}

output "lagring_rgname_value" {
  value = var.lagring_rgname
}