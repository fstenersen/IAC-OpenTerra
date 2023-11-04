######## Generelle variabler ########
variable "company_shortname" {
  type        = string
  description = "Navn på firmaet"
  default     = "OT"
}

variable "project_name" {
  type        = string
  description = "Navn på prosjektet"
  default     = "Konsulentprosjekt"
}

######## Lagring variabler ########
variable "lagring_rgname" {
  type        = string
  description = "Navn til ressursgruppen for lagring"
  default     = "ot_rg_lagring"
}

variable "lagring_location" {
  type        = string
  description = "Lokasjon til ressursgruppen for lagring"
  default     = "westeurope"
}

variable "lagring_base_name" {
  type        = string
  description = "Grunn-navn til for storage account"
  default     = "otlagring"
}

variable "lagring_repl_type" {
  type        = string
  description = "Typen storage account replikkering"
  default     = "GRS"
}

variable "lagring_acc_tier" {
  type        = string
  description = "Tier for storage account"
  default     = "Standard"
}

variable "lagring_container_name" {
  type        = string
  description = "Navn til storage container"
  default     = "otcontainer"
}

variable "lagring_container_access_type" {
  type        = string
  description = "Access type til storage container"
  default     = "private"
}
variable "lagring_access_key" {
  type        = string
  description = "Access key for lagring"
  sensitive   = true
  default     = ""
}


######## Nettverk variabler ########
variable "vm_rg_name" {
  type        = string
  description = "Navn på ressursgruppen for virtuelt nettverk"
  default     = "ot_rg_vm"
}

variable "vm_rg_location" {
  description = "Lokasjon for ressursgruppen for virtuelt nettverk"
  default     = "westeurope"
}

variable "nic_name" {
  description = "Navn på nettverkskortet"
  default     = "Nettverkskort"
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

variable "subnet1_id" {
  description = "ID of subnet number 1"
  default     = ""
}

variable "sku" {
  type        = string
  description = "SKU for imaget"
  default     = "20_04-lts"
}

variable "vm_size" {
  type        = string
  description = "Størrelse på virtuell maskin"
  default     = "Standard_F2"
}

variable "vm_image_offer" {
  type        = string
  description = "Image offer"
  default     = "0001-com-ubuntu-server-focal"
}

variable "vm_publisher" {
  type        = string
  description = "Publisher for imaget"
  default     = "Canonical"
}

variable "vm_public_ip" {
  type        = string
  description = "Public IP for VM"
  default     = "20.126.72.140"
}

variable "vm_brukernavn" {
  type        = string
  description = "Brukernavn for VM"
  default     = "vmadmin"
  sensitive   = true
}

variable "vm_passord" {
  type        = string
  description = "Passord for VM"
  default     = "Securepassword!"
  sensitive   = true
}


######## Key vault variabler ########
variable "keyvault_rgname" {
  type        = string
  description = "Navn på ressursgruppe for keyvault"
  default     = "rg_keyvault"
}

variable "keyvault_location" {
  type        = string
  description = "Lokasjon for keyvault"
  default     = "westeurope"
}

variable "keyvault_access_key_name" {
  type        = string
  description = "Navn på keyvault secret for lagring access key"
  default     = "ot-lagring-access-key"
  sensitive   = true
}

variable "keyvault_name" {
  type        = string
  description = "Navn på keyvault"
  default     = "ot-keyvault-termite"
}