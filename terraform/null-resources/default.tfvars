
resource_group_name = "azb45-rg"
location            = "westus"
vnet_name           = "azb45-rg-vnet"
vnet2_name           = "azb45-rg-vnet2"
environment = "Dev"
app_version = "1.1"
vnet_address_space  = ["10.0.0.0/16"]
vnet2_address_space  = ["192.168.0.0/16"]
subnet_names        = ["subnet-1", "subnet-2"]
subnet_prefixes     = ["10.0.1.0/24", "10.0.2.0/24"]
nsg_name            = "azb45-rg-nsg"
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
vm_name        = "azb45-rg-vm"
vm_size        = "Standard_D2s_v3"
admin_username = "adminsree"
