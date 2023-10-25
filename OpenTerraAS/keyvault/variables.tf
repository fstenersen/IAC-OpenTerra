variable "keyvault_rgname" {
  type = string
  description = "Navn på ressursgruppe for keyvault"
  default = "ot_rg_keyvault"
}

variable "keyvault_location" {
  type = string
  description = "Lokasjon for keyvault"
  default = "westeurope"
}

variable "keyvault_access_key_name" {
  type = string
  description = "Navn på keyvault secret for lagring access key"
  default = "otkvaccesskey"
}

variable "keyvault_name" {
  type = string
  description = "Navn på keyvault"
  default = "ot-keyvault-flsiac"
}

variable "vm_brukernavn" {
  type = string
  description = "Brukernavn for VM"
  default = "otadmin"
}

variable "vm_passord" {
  type = string
  description = "Passord for VM"
  default = "Passord1234!"
}