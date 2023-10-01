variable "company_shortname" {
  type        = string
  description = "Navn på firmaet"
  default     = "OT"
}

variable "project_name" {
  type        = string
  description = "Navn på prosjektet"
  default     = "konsulentprosjekt"
}

variable "vm_rg_location" {
    description = "Lokasjon for ressursgruppen for virtuelt nettverk"
    default     = "westeurope"
}

variable "nic_name" {
    description = "Navn på nettverkskortet"
    default     = "Nettverkskort"
}

variable "admin_username" {
    description = "Administratorrukernavn for virtuell maskin"
    default     = "admin"
}

variable "virtnet_rg_name" {
    type    = string
    description = "Name of the resource group"
}

variable "virtnet_location" {
    type    = string
    description = "Location of the resource group"
}

variable "virtnet_name" {
    type    = string
    description = "Name of the virtual network"
}

variable "subnet1_name" {
    type    = string
    description = "Name of the first subnet"
}

variable "subnet2_name" {
    type    = string
    description = "Name of the second subnet"
}