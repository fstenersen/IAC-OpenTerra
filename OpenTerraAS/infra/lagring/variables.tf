variable "lagring_rgname" {
  type = string
  description = "Navn til ressursgruppen for lagring"
  default = "ot_rg_lagring-fls"
}

variable "lagring_location" {
  type = string
  description = "Lokasjon til ressursgruppen for lagring"
  default = "westeurope"
}

variable "lagring_base_name" {
  type = string
  description = "Grunn-navn til for storage account"
  default = "otlagring"
}

variable "lagring_repl_type" {
  type = string
  description = "Typen storage account replikkering"
  default = "GRS"
}

variable "lagring_acc_tier" {
  type = string
  description = "Tier for storage account"
  default = "Standard"
}

variable "lagring_container_name" {
  type = string
  description = "Navn til storage container"
  default = "otcontainer"
}

variable "lagring_container_access_type" {
  type = string
  description = "Access type til storage container"
  default = "private"
}