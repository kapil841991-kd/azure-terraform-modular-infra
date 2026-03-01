variable "sql_server_name" {
  type = string
}

variable "sql_db_name" {
  type = string
}

variable "rg_name" {
  type = string
}

variable "location" {
  type = string
}

variable "admin_username" {
  type = string
}

variable "admin_password" {
  type      = string
  sensitive = true
}

variable "max_size_gb" {
  type = number
}

variable "tags" {
  type = map(string)
}