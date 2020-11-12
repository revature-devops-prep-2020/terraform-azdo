terraform {
  required_version = ">= 0.13"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.35.0"
    }
    azuredevops = {
      source  = "terraform-providers/azuredevops"
      version = ">= 0.0.1"
    }
  }
}

provider "azurerm" {
  version = "~> 2.0"
  features {}
  subscription_id = var.azSubscriptionId
  tenant_id = var.azTenantId
}

provider "azuredevops" {
  version = ">= 0.0.1"
  org_service_url = var.organizationURL
  personal_access_token = var.organizationPAT
}

data "azurerm_subscription" "current" {
}