module "backend" {
  source = "./backend"
  backend_rg_name = var.backend_rg_name
  backend_rg_location = var.backend_rg_location
  backend_sa_basename = var.backend_sa_basename
  backend_container_name = var.backend_container_name
  backend_kv_basename = var.backend_kv_basename
  backend_kv_location = var.backend_kv_location
  backend_sa_access_key_name = var.backend_sa_access_key_name
}

module "lagring" {
  source            = "./lagring"
  lagring_rgname    = var.lagring_rgname
  lagring_location  = var.lagring_location
  lagring_base_name = var.lagring_base_name
}

module "nettverk" {
  source           = "./nettverk"
  virtnet_rg_name  = var.virtnet_rg_name
  virtnet_location = var.virtnet_location
  virtnet_name     = var.virtnet_name
  subnet1_name     = var.subnet1_name
  subnet2_name     = var.subnet2_name
}

module "vm" {
  source            = "./vm"
  vm_rg_name        = var.vm_rg_name
  vm_rg_location    = var.vm_rg_location
  nic_name          = var.nic_name
  virtnet_rg_name   = var.virtnet_rg_name
  virtnet_location  = var.virtnet_location
  virtnet_name      = var.virtnet_name
  subnet1_id        = module.nettverk.subnet1_id
}


module "keyvault" {
  source                   = "./keyvault"
  keyvault_rgname          = var.keyvault_rgname
  keyvault_location        = var.keyvault_location
  keyvault_name            = var.keyvault_name
  keyvault_access_key_name = var.keyvault_access_key_name
  lagring_access_key       = var.lagring_access_key
}

