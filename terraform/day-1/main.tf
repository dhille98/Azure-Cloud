# Create a resource group
resource "azurerm_resource_group" "azb45-rg-1" {
  name     = "azb45-rg1"
  location = "westus"
}
resource "azurerm_resource_group" "azb45-rg-2" {
  name     = "azb45-rg2"
  location = "westus"
}

resource "azurerm_resource_group" "azb45-rg-3" {
  name     = "azb45-rg2"
  location = "westus"
}

