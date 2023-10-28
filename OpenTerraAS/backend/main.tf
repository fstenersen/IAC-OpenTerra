provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
}

data "azurerm_client_config" "current" {}

resource "random_pet" "sa_name" {
  length    = 1
  separator = "-"
}

resource "random_pet" "kv_name" {
  length = 1
  separator = "-"
}

resource "azurerm_resource_group" "backend_rg" {
  name = var.backend_rg_name
  location = var.backend_rg_location
}

resource "azurerm_storage_account" "backend_sa" {
  name = "${lower(var.backend_sa_basename)}${random_pet.sa_name.id}"
  resource_group_name = azurerm_resource_group.backend_rg.name
  location = azurerm_resource_group.backend_rg.location
  account_tier = "Standard"
  account_replication_type = "LRS"  
}

resource "azurerm_storage_container" "backend_container" {
  name = var.backend_container_name
  storage_account_name = azurerm_storage_account.backend_sa.name
  container_access_type = "private"
}

resource "azurerm_key_vault" "backend_kv" {
  name                        = "${lower(var.backend_kv_basename)}${random_pet.kv_name.id}"
  location                    = azurerm_resource_group.backend_rg.location
  resource_group_name         = azurerm_resource_group.backend_rg.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Backup", "Create", "Decrypt", "Delete", "Encrypt", "Get", "Import", "List", "Purge", "Recover", "Restore", "Sign", "UnwrapKey", "Update", "Verify", "WrapKey", "Release", "Rotate", "GetRotationPolicy", "SetRotationPolicy"
    ]

    secret_permissions = [
      "Backup", "Delete", "Get", "List", "Purge", "Recover", "Restore", "Set"
    ]

    storage_permissions = [
      "Backup", "Delete", "DeleteSAS", "Get", "GetSAS", "List", "ListSAS", "Purge", "Recover", "RegenerateKey", "Restore", "Set", "SetSAS", "Update"
    ]
  }
}

resource "azurerm_key_vault_secret" "backend_sa_access_key" {
  name         = var.backend_sa_access_key_name
  value        = azurerm_storage_account.backend_sa.primary_access_key
  key_vault_id = azurerm_key_vault.backend_kv.id
}