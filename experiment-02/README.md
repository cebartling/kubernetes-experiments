# Kubernetes Experiment 2: Next.js Deployed to Azure Kubernetes Service (AKS)

This is a simple Next.js application that is deployed to Azure Kubernetes Service (AKS).

## Implementation

### Azure Cloud Provisioning

1. Change directory to the `./azure` directory:

    ```bash
    cd azure
    ```

2. Create the `terraform.tfvars` file in the `./azure` directory and populate it with the following variables from your Azure subscription:

    ```bash
    client_id       = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
    client_secret   = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    subscription_id = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
    ```

3. Run the following command to initialize the Terraform configuration:

    ```bash
    terraform init
    ```
4. Run the following commands to provision the Azure resources in your subscription:

    ```bash
    terraform apply
    ```
