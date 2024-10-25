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

variable "tag_environment" {
  default = "Demo"
}

variable "appId" {
  description = "Azure Kubernetes Service Cluster service principal"
}

variable "password" {
  description = "Azure Kubernetes Service Cluster password"
}
