terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0" # or the version you need
    }
  }

  required_version = ">= 0.12" # specify your Terraform version requirement

  backend "azurerm" {
    resource_group_name = "AZB45-HUB-RG"
    storage_account_name = "terraform45"
    container_name = "state-file"
    key = "terraform.tfstate"
    
  }
}

provider "azurerm" {
  features {}
}


