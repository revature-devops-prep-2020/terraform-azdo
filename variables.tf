variable "appId" {
  description = "Azure Kubernetes Service Cluster service principal"
}

variable "password" {
  description = "Azure Kubernetes Service Cluster password"
}

variable "organizationURL"{
    description = "Azure Devops organization service URL"
}

variable "organizationPAT"{
    description = "Azure Devops organization personal access token"
}

variable "azSubscriptionId"{
    description = "Azure Subscription id"
}

variable "azTenantId" {
    description = "Tenant ID for Azure Subscription"
}