resource "azurerm_kubernetes_cluster" "default" {
  name                = var.aks_cluster_name
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name
  dns_prefix          = var.dns_prefix
  kubernetes_version  = "1.30.5"

  default_node_pool {
    name            = "default"
    node_count      = 2
    vm_size         = var.vm_size
    os_disk_size_gb = 30
  }

  identity {
    type = "SystemAssigned"
  }

  role_based_access_control_enabled = true

  monitor_metrics {
    annotations_allowed = var.metric_annotations_allowlist
    labels_allowed      = var.metric_labels_allowlist
  }

  tags = {
    environment = var.tag_environment
  }
}
