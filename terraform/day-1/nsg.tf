resource "azurerm_network_security_group" "nsg" {
  name                = "azb45-rg-nsg"
  location            = azurerm_resource_group.azb45-rg.location
  resource_group_name = azurerm_resource_group.azb45-rg.name



  tags = {
    environment = "Dev"
  }
}

resource "azurerm_network_security_rule" "nsg-rule-1" {
  name                        = "open-ssh"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.azb45-rg.name
  network_security_group_name = azurerm_network_security_group.nsg.name

  lifecycle {
    create_before_destroy = false
  }
}
resource "azurerm_network_security_rule" "nsg-rule-2" {
  name                        = "open-http"
  priority                    = 120
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3387"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.azb45-rg.name
  network_security_group_name = azurerm_network_security_group.nsg.name
  lifecycle {
    create_before_destroy = false
  }
}
resource "azurerm_network_security_rule" "nsg-rule-3" {
  name                        = "open-sql"
  priority                    = 130
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.azb45-rg.name
  network_security_group_name = azurerm_network_security_group.nsg.name
  lifecycle {
    create_before_destroy = false
  }
}

resource "azurerm_subnet_network_security_group_association" "sub-aso-1" {
  subnet_id                 = azurerm_subnet.azb45-rg-subnet-1.id
  network_security_group_id = azurerm_network_security_group.nsg.id
  depends_on = [ azurerm_network_security_group.nsg, azurerm_subnet.azb45-rg-subnet-1 ]
}
resource "azurerm_subnet_network_security_group_association" "sub-aso-2" {
  subnet_id                 = azurerm_subnet.azb45-rg-subnet-2.id
  network_security_group_id = azurerm_network_security_group.nsg.id
  depends_on = [ azurerm_network_security_group.nsg, azurerm_subnet.azb45-rg-subnet-2 ]
}