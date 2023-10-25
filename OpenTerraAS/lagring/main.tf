resource "random_string" "tilfeldig_streng" {
    length = 6
    special = false
    upper = false
}

resource "azurerm_resource_group" "ot_rg_lagring" {
  name     = var.lagring_rgname
  location = var.lagring_location
}

resource "azurerm_storage_account" "lagring" {
  name                     = "${lower(var.lagring_base_name)}${random_string.tilfeldig_streng.result}"
  resource_group_name      = azurerm_resource_group.ot_rg_lagring.name
  location                 = azurerm_resource_group.ot_rg_lagring.location
  account_tier             = var.lagring_acc_tier
  account_replication_type = var.lagring_repl_type
}

resource "azurerm_storage_container" "lagring_container" {
  name                  = var.lagring_container_name
  storage_account_name  = azurerm_storage_account.lagring.name
  container_access_type = var.lagring_container_access_type
}