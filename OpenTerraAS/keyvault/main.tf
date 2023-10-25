provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
}

module "lagring" {
  source = "../lagring"
}

data "azurerm_client_config" "current" {}
  
resource "azurerm_resource_group" "key_vault_rg" {
  name     = var.keyvault_rgname
  location = var.keyvault_location
}

resource "azurerm_key_vault" "keyvault" {
  name                        = var.keyvault_name
  location                    = azurerm_resource_group.key_vault_rg.location
  resource_group_name         = azurerm_resource_group.key_vault_rg.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
      "Delete",  # Add "Delete" permission to allow destruction of secrets, fixes errors when destroying the keyvault
      "Set",   # Ensure "set" permission is granted for setting secrets
      "Purge",   # Ensure "Purge" permission is granted for permanently deleting secrets
      "Recover",  # Ensure "Recover" permission is granted for recovering deleted secrets

    ]

    storage_permissions = [
      "Get",
    ]
  }
}

resource "azurerm_key_vault_secret" "vm_brukernavn" {
  name         = "vm-brukernavn"
  value        = var.vm_brukernavn
  key_vault_id = azurerm_key_vault.keyvault.id
}

resource "azurerm_key_vault_secret" "vm_passord" {
  name         = "vm-passord"
  value        = var.vm_passord
  key_vault_id = azurerm_key_vault.keyvault.id
}


resource "azurerm_key_vault_secret" "lagring_access_key" {
  name         = var.keyvault_access_key_name
  value        = module.lagring.lagring_access_key
  key_vault_id = azurerm_key_vault.keyvault.id
}