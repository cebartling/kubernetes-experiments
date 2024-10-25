# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.7.0"
    }
    azapi = {
      source  = "Azure/azapi"
      version = "2.0.1"
    }
  }

  required_version = ">= 1.1.0"
}
