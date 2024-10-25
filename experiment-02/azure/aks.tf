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

  service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }

  role_based_access_control_enabled = true

  oms_agent {
    log_analytics_workspace_id = azurerm_log_analytics_workspace.default.id
  }

  tags = {
    environment = var.tag_environment
  }
}
