# Eksempel kommentar. Dette er variabler i en egen fil
variable "location" {
  type        = string
  description = "Location"
  default     = "West Europe"
}

variable "rgname" {
  type        = string
  description = "Resource Group Name"
  default     = "rg-demo-terraform"
}

variable "saname" {
  type        = string
  description = "Storage account name"
}
