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

variable "nic_ids" {
  type = map(string)
}