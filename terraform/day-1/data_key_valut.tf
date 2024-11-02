data "azurerm_key_vault" "azb45_keyvault" {
  name                = "azb45kv-certr"
  resource_group_name = azurerm_resource_group.rg.name
}

output "vault_id" {
  value = data.azurerm_key_vault.azb45_keyvault.id
}

data "azurerm_key_vault_secret" "testvm1" {
  name         = "secret-sauce"
  key_vault_id = data.azurerm_key_vault.azb45_keyvault.id
}

output "secret_value" {
  value     = data.azurerm_key_vault_secret.testvm1.value
  sensitive = true
}