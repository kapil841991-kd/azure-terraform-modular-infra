############################################
# GLOBAL LB VALUES
############################################
variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "lb_name" {
  type = string
}

variable "public_ip_name" {
  type = string
}

variable "backend_pool_name" {
  type = string
}

############################################
# RESOURCE GROUPS
############################################
variable "rgs" {
  type = map(object({
    name       = string
    location   = string
    tags       = optional(map(string))
    managed_by = optional(string)
  }))
}

############################################
# VNETS
############################################
variable "vnets" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
  }))
}

############################################
# SUBNETS
############################################
variable "subnets" {
  type = map(object({
    name                = string
    address_prefix      = string
    resource_group_name = string
    vnet_name           = string
    location            = string
  }))
}

############################################
# NICS
############################################
variable "nics" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    subnet_key          = string
  }))
}

############################################
# VMS
############################################
variable "vms" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    nic_key             = string
    size                = string
    admin_username      = string
    admin_password      = string
  }))
}