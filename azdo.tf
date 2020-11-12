resource "azuredevops_project" "project" {
    project_name    =   "Terraform Sample"  
    visibility      =   "public"
    version_control =   "Git"
}

resource "azuredevops_git_repository" "repository" {
  project_id = azuredevops_project.project.id
  name       = "Sample Repo"
  parent_repository_id = "f4c1907c-c0bf-4df9-86ef-7d272fd8e3ad"
  initialization {
    init_type = "Clean"
  }
}

resource "azuredevops_build_definition" "build" {
  project_id = azuredevops_project.project.id
  name       = "Sample Build Definition"
  path       = "\\ExampleFolder"

  ci_trigger {
    use_yaml = true
  }

  repository {
    repo_type   = "TfsGit"
    repo_id     = azuredevops_git_repository.repository.id
    branch_name = azuredevops_git_repository.repository.default_branch
    yml_path    = "azure-pipelines.yml"
  }
}

resource "azuredevops_serviceendpoint_kubernetes" "aks_se" {
  project_id            = azuredevops_project.project.id
  service_endpoint_name = "Kubernetes"
  apiserver_url         = azurerm_kubernetes_cluster.default.kube_config.0.host
  authorization_type    = "AzureSubscription"

  azure_subscription {
    subscription_id   = data.azurerm_subscription.current.subscription_id
    subscription_name = data.azurerm_subscription.current.display_name
    tenant_id         = data.azurerm_subscription.current.tenant_id
    resourcegroup_id  = azurerm_resource_group.default.name
    cluster_name      = azurerm_kubernetes_cluster.default.name
  }
}

resource "azuredevops_serviceendpoint_dockerregistry" "otherregistry" {
    project_id              = azuredevops_project.project.id
    service_endpoint_name   = "ACR"
    docker_registry         = data.azurerm_container_registry.acrdata.login_server
    registry_type           = "Others"
    docker_username         = azurerm_container_registry.acr.admin_username
    docker_password         = azurerm_container_registry.acr.admin_password
}