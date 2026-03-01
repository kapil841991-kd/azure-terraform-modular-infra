############################################
# RG MODULE
############################################
module "rg" {
  source = "../../modules/rg"
  rgs    = var.rgs
}

############################################
# VNET MODULE
############################################
module "vnet" {
  source = "../../modules/vnet"
  vnets  = var.vnets

  depends_on = [module.rg]
}

############################################
# SUBNET + NSG MODULE
############################################
module "nsg" {
  source  = "../../modules/nsg"
  subnets = var.subnets

  depends_on = [module.vnet]
}

############################################
# NIC MODULE
############################################
module "nic" {
  source     = "../../modules/nic"
  nics       = var.nics
  subnet_ids = module.nsg.subnet_ids

  depends_on = [module.nsg]
}

############################################
# VM MODULE
############################################
module "vm" {
  source  = "../../modules/vm"
  vms     = var.vms
  nic_ids = module.nic.nic_ids

  depends_on = [module.nic]
}

############################################
# LOAD BALANCER MODULE
############################################
module "lb" {
  source              = "../../modules/lb"
  location            = var.location
  resource_group_name = var.resource_group_name
  lb_name             = var.lb_name
  public_ip_name      = var.public_ip_name
  backend_pool_name   = var.backend_pool_name
  nic_ids = module.nic.nic_ids 

  depends_on = [module.vm]
}

############################################
# BASTION MODULE
############################################

module "bastion" {
  source = "../../modules/bastion"

  location            = var.location
  resource_group_name = module.rg.rg_names["rg1"]
  bastion_subnet_id   = module.nsg.subnet_ids["AzureBastionSubnet"]

  depends_on = [
    module.nsg
  ]
}


###############################################
# SQL MODULE
###############################################
module "sql" {
  source          = "../../modules/sql"
  sql_server_name = "sql-dev-0804"
  sql_db_name     = "sql-db-dev-0804"
  rg_name         = "rg-dev"
  location        = "Central India"
  admin_username  = "admin123"
  admin_password  = "P@ssw01rd@123"
  max_size_gb     = 2

  tags = {
    environment = "dev"
  }

  depends_on = [module.rg]
}