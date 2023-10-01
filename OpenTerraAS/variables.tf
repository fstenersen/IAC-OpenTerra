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

variable "lagring_rgname" {
  type        = string
  description = "Navn til ressursgruppen for lagring"
}

variable "lagring_location" {
  type        = string
  description = "Lokasjon til ressursgruppen for lagring"
}

variable "lagring_base_name" {
  type        = string
  description = "Grunn-navn til for storage account"
}

variable "virtnet_rg_name" {
  type        = string
  description = "Name of the resource group"
  default     = "ot_rg_virtnet"
}

variable "virtnet_location" {
  type        = string
  description = "Location of the resource group"
  default     = "westeurope"
}

variable "virtnet_name" {
  type        = string
  description = "Name of the virtual network"
  default     = "operaterra-virt-net"
}

variable "subnet1_name" {
  type        = string
  description = "Name of the first subnet"
  default     = "AnsattNettverk"
}

variable "subnet2_name" {
  type        = string
  description = "Name of the second subnet"
  default     = "Gjestenettverk"
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