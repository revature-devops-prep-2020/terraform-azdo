resource "azurerm_container_registry" "acr" {
  name                     = "${replace(random_pet.prefix.id, "-", "")}ACR"
  resource_group_name      = azurerm_resource_group.default.name
  location                 = azurerm_resource_group.default.location
  sku                      = "Standard"
  admin_enabled            = true

  tags = {
    environment = "Demo"
  }
}

data "azurerm_container_registry" "acrdata" {
  name                = azurerm_container_registry.acr.name
  resource_group_name = azurerm_resource_group.default.name
}
