# resource "azurerm_dashboard_grafana" "default" {
#   name                              = "experiment-02-grafana"
#   resource_group_name               = azurerm_resource_group.default.name
#   location                          = azurerm_resource_group.default.location
#   api_key_enabled                   = true
#   deterministic_outbound_ip_enabled = true
#   public_network_access_enabled     = true
#   grafana_major_version             = 10
#
#   identity {
#     type = "SystemAssigned"
#   }
#
#   azure_monitor_workspace_integrations {
#     resource_id = azurerm_monitor_workspace.default.id
#   }
#
#   tags = {
#     environment = var.tag_environment
#   }
# }
#
# # Add required role assignment over resource group containing the Azure Monitor Workspace
# # resource "azurerm_role_assignment" "grafana" {
# #   scope                = azurerm_resource_group.default.id
# #   role_definition_name = "Monitoring Reader"
# #   principal_id         = azurerm_dashboard_grafana.default.identity[0].principal_id
# # }
#
# # Add role assignment to Grafana so an admin user can log in
# # resource "azurerm_role_assignment" "grafana-admin" {
# #   scope                = azurerm_dashboard_grafana.default.id
# #   role_definition_name = "Grafana Admin"
# #   principal_id         = var.adminGroupObjectIds[0]
# # }
#
