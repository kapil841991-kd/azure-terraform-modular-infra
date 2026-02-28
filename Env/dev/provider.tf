terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.61.0"
    }
  }
    backend "azurerm" {
    resource_group_name  = "rg-storage"
    storage_account_name = "backendstorage2026"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}