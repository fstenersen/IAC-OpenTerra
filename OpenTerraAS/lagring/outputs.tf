output "lagring_access_key" {
    value        = azurerm_storage_account.lagring.primary_access_key
}

output "lagring_rgname_value" {
  value = azurerm_resource_group.ot_rg_lagring.name
}