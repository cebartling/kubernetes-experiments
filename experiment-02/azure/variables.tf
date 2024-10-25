variable "location" {
  default = "West US"
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
