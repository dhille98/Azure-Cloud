terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0" # or the version you need
    }
  }

  required_version = ">= 0.12" # specify your Terraform version requirement
}

provider "azurerm" {
  features {}
}


