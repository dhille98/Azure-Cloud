reresource_group_name = "azb45-rg"
location              = "West Us"
vnet_name             = "azb45-rg-vnet"
vnet_address_space    = ["10.0.0.0/16"]
subnet_names          = ["azb45-rg-subnet-1", "azb45-rg-subnet-2"]
subnet_prefixes       = ["10.0.1.0/24", "10.0.2.0/24"]

nsg_name = "myNSG"
nsg_rules = [
  {
    name                       = "AllowSSH"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  },
  {
    name                       = "AllowHTTP"
    priority                   = 120
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  },
  {
    name                       = "AllowMYQL"
    priority                   = 130
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3306"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
]