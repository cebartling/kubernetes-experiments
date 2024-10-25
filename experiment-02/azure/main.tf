provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

resource "azurerm_resource_group" "default" {
  name     = var.resource_group_name
  location = var.resource_group_location

  tags = {
    environment = var.tag_environment
  }
}

resource "azurerm_kubernetes_cluster" "default" {
  name                = var.aks_cluster_name
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name
  dns_prefix          = var.dns_prefix
  kubernetes_version  = "1.30.2"

  default_node_pool {
    name            = "default"
    node_count      = 2
    vm_size         = "Standard_D2_v2"
    os_disk_size_gb = 30
  }

  service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }

  role_based_access_control_enabled = true

  tags = {
    environment = var.tag_environment
  }
}