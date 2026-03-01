############################################
# GLOBAL LB VALUES
############################################
location            = "Central India"
resource_group_name = "rg-dev"
lb_name             = "todo-lb"
public_ip_name      = "lb-public-ip"
backend_pool_name   = "backend-pool"

############################################
# RESOURCE GROUP
############################################
rgs = {
  rg1 = {
    name       = "rg-dev"
    location   = "Central India"
    managed_by = "teamA-devops"
    tags = {
      environment = "development"
      project     = "todo-app"
    }
  }
}

############################################
# VNET
############################################
vnets = {
  vnet1 = {
    name                = "vnet-dev"
    location            = "Central India"
    resource_group_name = "rg-dev"
    address_space       = ["10.0.0.0/16"]
  }
}

############################################
# SUBNETS
############################################
subnets = {
  frontend = {
    name                = "frontend"
    address_prefix      = "10.0.1.0/24"
    resource_group_name = "rg-dev"
    vnet_name           = "vnet-dev"
    location            = "Central India"
  }
  backend = {
    name                = "backend"
    address_prefix      = "10.0.2.0/24"
    resource_group_name = "rg-dev"
    vnet_name           = "vnet-dev"
    location            = "Central India"
  }
    AzureBastionSubnet = {
    name                = "AzureBastionSubnet"   # ⚠ NAME CHANGE MAT KARNA
    resource_group_name = "rg-dev"
    vnet_name           = "vnet-dev"
    address_prefix      = "10.0.3.0/26"          # ⚠ Minimum /26
    location            = "Central India"
  }
}

############################################
# NICS
############################################
nics = {
  nic-frontend = {
    name                = "nic-frontend"
    location            = "Central India"
    resource_group_name = "rg-dev"
    subnet_key          = "frontend"
  }
  nic-backend = {
    name                = "nic-backend"
    location            = "Central India"
    resource_group_name = "rg-dev"
    subnet_key          = "backend"
  }
}

############################################
# VMS
############################################
vms = {
  frontend_vm = {
    name                = "vm-frontend"
    location            = "Central India"
    resource_group_name = "rg-dev"
    nic_key             = "nic-frontend"
    size                = "Standard_B2ats_v2"
    admin_username      = "azureuser"
    admin_password      = "Password@1234"
  }
  backend_vm = {
    name                = "vm-backend"
    location            = "Central India"
    resource_group_name = "rg-dev"
    nic_key             = "nic-backend"
    size                = "Standard_B2ats_v2"
    admin_username      = "azureuser"
    admin_password      = "Password@1234"
  }
}