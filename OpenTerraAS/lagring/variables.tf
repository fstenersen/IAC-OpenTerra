variable "lagring_rgname" {
  type = string
  description = "Navn til ressursgruppen for lagring"
}

variable "lagring_location" {
  type = string
  description = "Lokasjon til ressursgruppen for lagring"
}

variable "lagring_base_name" {
  type = string
  description = "Grunn-navn til for storage account"
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