variable "location" {
  default = "West US"
}

variable "resource_group_name" {
  default = "experiment-02-rg"
}

variable "resource_group_location" {
  default = "West US 2"
}

variable "aks_cluster_name" {
  default = "experiment-02-aks-cluster"
}

variable "dns_prefix" {
  default = "experiment-02-k8s"
}

variable "tag_environment" {
  default = "Demo"
}

variable "client_id" {
  description = "Azure Kubernetes Service Cluster service principal"
}

variable "client_secret" {
  description = "Azure Kubernetes Service Cluster password"
}

variable "subscription_id" {
  description = "Azure Subscription ID"
}

variable "vm_size" {
  default = "Standard_D2_v2"
}

variable "metric_labels_allowlist" {
  default = null
}

variable "metric_annotations_allowlist" {
  default = null
}