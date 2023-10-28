variable "location" {
  type        = string
  description = "Deployment location"
  default     = "West Europe"
}

variable "rgname" {
  type        = string
  description = "Resource Group Name"
  default     = "rg-demo-test"
}

variable "saname" {
  type        = string
  description = "Storage Account Name"
}

variable "company" {
  type        = string
  description = "Company Name"
}

variable "project" {
  type        = string
  description = "Project Name"
}


variable "environment" {
  type        = string
  description = "Environment Name"
}

variable "costcenter" {
  type        = string
  description = "Costcenter Name"
}

variable "owner" {
  type        = string
  description = "Owner Name"
  default     = "Fredrik Leonard Stenersen"
}

variable "billing_code" {
  type        = string
  description = "Billing Code"
}

variable "az_regions" {
  type        = list(string)
  description = "Azure region for resources"
  default     = ["northeurope", "westeurope"]
}