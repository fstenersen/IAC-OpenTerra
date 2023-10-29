variable "virtnet_rg_name" {
    type    = string
    description = "Name of the resource group"
    default = "ot_rg_virtnet"
}

variable "virtnet_location" {
    type    = string
    description = "Location of the resource group"
    default = "westeurope"
}

variable "virtnet_name" {
    type    = string
    description = "Name of the virtual network"
    default = "operaterra-virt-net"
}

variable "subnet1_name" {
    type    = string
    description = "Name of the first subnet"
    default = "AnsattNettverk"
}

variable "subnet2_name" {
    type    = string
    description = "Name of the second subnet"
    default = "Gjestenettverk"
}