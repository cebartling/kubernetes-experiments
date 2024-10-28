resource "azurerm_log_analytics_workspace" "default" {
  location            = azurerm_resource_group.default.location
  name                = "experiment-02-log-analytics"
  resource_group_name = azurerm_resource_group.default.name
  sku                 = "PerGB2018"
  retention_in_days   = 30

  tags = {
    environment = var.tag_environment
  }
}

resource "azurerm_log_analytics_solution" "default" {
  solution_name         = "ContainerInsights"
  location              = azurerm_log_analytics_workspace.default.location
  resource_group_name   = azurerm_resource_group.default.name
  workspace_resource_id = azurerm_log_analytics_workspace.default.id
  workspace_name        = azurerm_log_analytics_workspace.default.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ContainerInsights"
  }

  tags = {
    environment = var.tag_environment
  }
}

