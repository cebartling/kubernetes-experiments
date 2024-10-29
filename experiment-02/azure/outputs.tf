output "resource_group_name" {
  value = azurerm_resource_group.default.name
}

output "kubernetes_cluster_name" {
  value = azurerm_kubernetes_cluster.default.name
}

output "host" {
  value     = azurerm_kubernetes_cluster.default.kube_config.0.host
  sensitive = true
}

output "client_key" {
  value     = azurerm_kubernetes_cluster.default.kube_config.0.client_key
  sensitive = true
}

output "client_certificate" {
  value     = azurerm_kubernetes_cluster.default.kube_config.0.client_certificate
  sensitive = true
}

output "kube_config" {
  value     = azurerm_kubernetes_cluster.default.kube_config_raw
  sensitive = true
}

output "cluster_username" {
  value     = azurerm_kubernetes_cluster.default.kube_config.0.username
  sensitive = true
}

output "cluster_password" {
  value     = azurerm_kubernetes_cluster.default.kube_config.0.password
  sensitive = true
}

# Output the grafana url for usability
# output "grafana_url" {
#   value = azurerm_dashboard_grafana.default.endpoint
# }

output "monitoring_account_id" {
  value = azurerm_monitor_workspace.default.id
}

output "application_insights_instrumentation_key" {
  value = azurerm_application_insights.default.instrumentation_key
  sensitive = true
}

output "application_insights_app_id" {
  value = azurerm_application_insights.default.app_id
}
