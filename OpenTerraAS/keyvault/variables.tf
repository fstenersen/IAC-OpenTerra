variable "keyvault_rgname" {
  type = string
  description = "Navn på ressursgruppe for keyvault"
  default = "rg_keyvault"
}

variable "keyvault_location" {
  type = string
  description = "Lokasjon for keyvault"
  default = "westeurope"
}

variable "keyvault_access_key_name" {
  type = string
  description = "Navn på keyvault secret for lagring access key"
  default = "kv_access_key"
  sensitive = true
}

variable "keyvault_name" {
  type = string
  description = "Navn på keyvault"
  default = "keyvault_name"
}

variable "vm_brukernavn" {
  type = string
  description = "Brukernavn for VM"
  default = "admin"
  sensitive = true
}

variable "vm_passord" {
  type = string
  description = "Passord for VM"
  default = "securepassword"
  sensitive = true
}

variable "lagring_access_key" {
  type = string
  description = "Access key for lagring"
  sensitive = true
  default = "" 
}