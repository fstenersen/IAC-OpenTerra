variable "backend_rg_name" {
    type = string
    description = "Name of the backend resource group"
}

variable "backend_rg_location" {
    type = string
    description = "Location of the backend resource group"
}

variable "backend_sa_basename" {
    type = string
    description = "Name of the backend storage account"
}

variable "backend_container_name" {
    type = string
    description = "Name of the backend storage container"
}

variable "backend_kv_basename" {
    type = string
    description = "Name of the backend key vault"
}

variable "backend_kv_location" {
    type = string
    description = "Location of the backend key vault"
}

variable "backend_sa_access_key_name" {
    type = string
    description = "Name of the backend storage account access key"
}