# peering connctions

resource "azurerm_virtual_network_peering" "vnet1-vnet2" {
  name                      = "vnet1-vnet2"
  resource_group_name       = azurerm_resource_group.rg.name
  virtual_network_name      = azurerm_virtual_network.vnet.name
  remote_virtual_network_id = azurerm_virtual_network.vnet_2.id
}

resource "azurerm_virtual_network_peering" "vnet2-vnet1" {
  name                      = "vnet2-vnet1"
  resource_group_name       = azurerm_resource_group.rg.name
  virtual_network_name      = azurerm_virtual_network.vnet_2.name
  remote_virtual_network_id = azurerm_virtual_network.vnet.id
}