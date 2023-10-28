output "subnet2_name_value" {
  value = var.subnet2_name
}

output "subnet1_name_value" {
  value = var.subnet1_name
}

output "lagring_rgname_value" {
  value = var.lagring_rgname
}

output "public_ip_address_id" {
  value = module.vm.public_ip_address_id.ip_address
}