resource "azurerm_virtual_network" "azb45-rg-vnet" {
  name                = "azb45-rg-vnet"
  location            = azurerm_resource_group.azb45-rg.location
  resource_group_name = azurerm_resource_group.azb45-rg.name
  address_space       = ["10.0.0.0/16"]
  


  tags = {
    environment = "Dev"
  }
}

resource "azurerm_subnet" "azb45-rg-subnet-1" {
  name                 = "azb45-rg-subnet-1"
  resource_group_name  = azurerm_resource_group.azb45-rg.name
  virtual_network_name = azurerm_virtual_network.azb45-rg-vnet.name
  address_prefixes     = ["10.0.1.0/24"]


}
resource "azurerm_subnet" "azb45-rg-subnet-2" {
  name                 = "azb45-rg-subnet-2"
  resource_group_name  = azurerm_resource_group.azb45-rg.name
  virtual_network_name = azurerm_virtual_network.azb45-rg-vnet.name
  address_prefixes     = ["10.0.2.0/24"]


}