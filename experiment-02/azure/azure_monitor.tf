resource "azurerm_monitor_workspace" "default" {
  name                = "experiment-02-monitor-workspace"
  resource_group_name = azurerm_resource_group.default.name
  location            = azurerm_resource_group.default.location

  tags = {
    environment = var.tag_environment
  }
}

resource "azurerm_monitor_data_collection_endpoint" "default" {
  name = substr("MSProm-${azurerm_resource_group.default.location}-${var.aks_cluster_name}", 0, min(44, length("MSProm-${azurerm_resource_group.default.location}-${var.aks_cluster_name}")))
  resource_group_name = azurerm_resource_group.default.name
  location            = azurerm_resource_group.default.location
  kind                = "Linux"
}

# # Logic to determine region mismatch
#  locals {
#   dce_region_mismatch = var.cluster_region != var.amw_region
# }
#
# # Create another DCE if the regions don't match and is_private_cluster is true
# resource "azurerm_monitor_data_collection_endpoint" "dce_mismatch" {
#   count               = (local.dce_region_mismatch && var.is_private_cluster) ? 1 : 0
#   name = substr("MSProm-PL-${azurerm_resource_group.default.location}-${var.aks_cluster_name}", 0, min(44, length("MSProm-PL-${azurerm_resource_group.default.location}-${var.aks_cluster_name}")))
#   resource_group_name = azurerm_resource_group.default.name
#   location            = var.cluster_region
#   kind                = "Linux"
# }
#
# resource "azurerm_monitor_data_collection_rule" "dcr" {
#   name = substr("MSProm-${azurerm_resource_group.default.location}-${var.cluster_name}", 0, min(64, length("MSProm-${azurerm_resource_group.default.location}-${var.cluster_name}")))
#   resource_group_name         = azurerm_resource_group.default.name
#   location                    = azurerm_resource_group.default.location
#   data_collection_endpoint_id = azurerm_monitor_data_collection_endpoint.dce.id
#   kind                        = "Linux"
#
#   destinations {
#     monitor_account {
#       monitor_account_id = azurerm_monitor_workspace.amw.id
#       name               = "MonitoringAccount1"
#     }
#   }
#
#   data_flow {
#     streams = ["Microsoft-PrometheusMetrics"]
#     destinations = ["MonitoringAccount1"]
#   }
#
#   data_sources {
#     prometheus_forwarder {
#       streams = ["Microsoft-PrometheusMetrics"]
#       name = "PrometheusDataSource"
#     }
#   }
#
#   description = "DCR for Azure Monitor Metrics Profile (Managed Prometheus)"
#   depends_on = [
#     azurerm_monitor_data_collection_endpoint.dce
#   ]
# }
#
# resource "azurerm_monitor_data_collection_rule_association" "dcra" {
#   name                    = "MSProm-${azurerm_resource_group.default.location}-${var.aks_cluster_name}"
#   tadefaultet_resource_id = azurerm_kubernetes_cluster.default.id
#   data_collection_rule_id = azurerm_monitor_data_collection_rule.dcr.id
#   description             = "Association of data collection rule. Deleting this association will break the data collection for this AKS Cluster."
#   depends_on = [
#     azurerm_monitor_data_collection_rule.dcr
#   ]
# }
#
# resource "azurerm_monitor_data_collection_rule_association" "dcra_mismatch" {
#   count                       = (local.dce_region_mismatch && var.is_private_cluster) ? 1 : 0
#   tadefaultet_resource_id     = azurerm_kubernetes_cluster.k8s.id
#   data_collection_endpoint_id = local.dce_region_mismatch ? azurerm_monitor_data_collection_endpoint.dce_mismatch[0].id
#     : azurerm_monitor_data_collection_endpoint.dce.id
#   description                 = "Association of data collection endpoint for private link clusters. Deleting this association will break the data collection for this AKS Cluster."
#   depends_on = [
#     azurerm_monitor_data_collection_endpoint.dce
#   ]
# }
