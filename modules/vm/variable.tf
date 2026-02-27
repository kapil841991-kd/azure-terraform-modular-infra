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

variable "nic_ids" {
  type = map(string)
}