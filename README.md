# Deploy an Azure Devops Project with AKS and ACR

Based on this tutorial: https://github.com/hashicorp/learn-terraform-provision-aks-cluster

## Requirements
Terraform 0.12.x+
Azure CLI

## Before running
You will need an Azure subscription.

You must create an Azure AD service principal with the Contributor role. You should save the appId and secret.

You will also need to create an Azure Devops Organization and retrieve a Personal Access Token with owner privileges for it.

## Running
You can deploy this configuration simply by running `terraform init` and then `terraform apply` and following the prompts.  
Optionally, you may create a `.tfvars` file to automatically populate variables.

## Teardown
Run `terraform destroy` to remove all resources created by this configuration.

## Caveats
You will have to either manually approve the service connections for each pipeline or manually configure the service connections to be available for all pipelines.

You will have to modify the pipeline and kubernetes manifest files to be appropriate for your project.