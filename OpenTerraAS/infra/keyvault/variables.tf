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
  default = "ot-lagring-access-key"
  sensitive = true
}

variable "keyvault_name" {
  type = string
  description = "Navn på keyvault"
  default = "ot-keyvault-termite"
}

variable "vm_brukernavn" {
  type = string
  description = "Brukernavn for VM"
  default = "otadmin"
  sensitive = true
}

variable "vm_passord" {
  type = string
  description = "Passord for VM"
  default = "Passord1234!"
  sensitive = true
}

variable "lagring_access_key" {
  type = string
  description = "Access key for lagring"
  sensitive = true
  default = "" 
}