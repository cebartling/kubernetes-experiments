resource "azurerm_application_insights" "default" {
  name                = "experiment-02-appinsights"
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name
  application_type    = "web"
}