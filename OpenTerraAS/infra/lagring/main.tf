resource "random_string" "tilfeldig_streng" {
    length = 6
    special = false
    upper = false
}

resource "azurerm_resource_group" "ot_rg_lagring" {
  name     = local.lagring_rgname
  location = var.lagring_location

  tags     = local.common_tags
}

resource "azurerm_storage_account" "lagring" {
  name                     = local.lagring_sa_name
  resource_group_name      = azurerm_resource_group.ot_rg_lagring.name
  location                 = azurerm_resource_group.ot_rg_lagring.location
  account_tier             = var.lagring_acc_tier
  account_replication_type = var.lagring_repl_type

  tags     = local.common_tags
}

resource "azurerm_storage_container" "lagring_container" {
  name                  = local.lagring_container_name
  storage_account_name  = azurerm_storage_account.lagring.name
  container_access_type = var.lagring_container_access_type
}

# CHange to main