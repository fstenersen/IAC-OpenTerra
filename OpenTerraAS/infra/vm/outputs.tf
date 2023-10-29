output "vm_name" {
  value = azurerm_linux_virtual_machine.vm.name
}

output "public_ip_address_id" {
  value = azurerm_public_ip.publicip
}