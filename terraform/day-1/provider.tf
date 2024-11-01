terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.6.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  alias           = "Free Trial"
  subscription_id = "b59b4f26-580b-4477-b69c-40a4ac038382"
  features {

 }
}