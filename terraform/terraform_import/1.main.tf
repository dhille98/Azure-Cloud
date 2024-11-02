# Create a resource group

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location

  tags = {
    "environment" = var.environment
  }
}

resource "azurerm_resource_group" "terraform-import" {
  name     = "terraform-import"
  location = "East US"  # Make sure the location matches the actual resource
}

# /subscriptions/b59b4f26-580b-4477-b69c-40a4ac038382/resourceGroups/terraform-import
# terraform import azurerm_resource_group.terraform-import /subscriptions/b59b4f26-580b-4477-b69c-40a4ac038382/resourceGroups/terraform-import
