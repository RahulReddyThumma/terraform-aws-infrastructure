# AWS Infrastructure Provisioning with Terraform

This repository contains the Terraform code to provision infrastructure on AWS. It includes the necessary resources for creating a VPC, subnets, and an EC2 instance with Nginx installed.

## Prerequisites

Before you begin, ensure you have the following:

- An AWS account with the necessary permissions to create the resources
- Terraform installed on your machine
- An existing EC2 Key Pair in your AWS region for SSH access

## Project Structure

- `main.tf` - Contains the main set of Terraform configuration files
- `variables.tf` - Defines the variables used across the Terraform configuration
- `virtual.tf` - Specifies the vpc subnet and security group
- `.github/workflows` - Contains the GitHub Actions workflow for CI/CD

## Setting Up

1. **Configure AWS Credentials**: Set up your AWS credentials as GitHub Secrets with the names `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`.

2. **Fork/Clone the Repository**: Get a copy of this repository so that you can manage your infrastructure using Terraform.

3. **Review Terraform Files**: Look through the `.tf` files to make sure they describe the infrastructure you expect. Update any variables or settings as needed.

## Usage

To provision the infrastructure:

1. **Initialize Terraform**:

    ```sh
    terraform init
    ```

2. **Create a Terraform Plan**:

    ```sh
    terraform plan
    ```

3. **Apply the Terraform Plan**:

    ```sh
    terraform apply
    ```

4. **SSH into the EC2 Instance**:

    ```sh
    ssh -i /path/to/your/private/key.pem ec2-user@<EC2-instance-public-IP>
    ```

Replace `/path/to/your/private/key.pem` with the path to your private key file, and `<EC2-instance-public-IP>` with the actual public IP of the EC2 instance created by Terraform.

## Automation with GitHub Actions

This repository is configured with GitHub Actions to automatically run Terraform's plan and apply on pushes to the `main` branch. The workflow performs the following steps:

- **Format Check**: Verifies that the Terraform files are properly formatted.
- **Initialization**: Initializes the Terraform backend.
- **Validation**: Validates the Terraform files for correctness.
- **Planning**: Creates an execution plan to determine what actions are necessary to achieve the desired state.
- **Application**: Applies the changes to reach the desired state of the configuration.

## Contributing

Contributions to this project are welcome. Please adhere to the following guidelines:

- Fork the repository and create a new branch for your feature or fix.
- Write clear and descriptive commit messages.
- Make sure your code adheres to the existing style.
- Open a pull request with a clear title and description.


Remember to replace the placeholders with actual data relevant to your project, and provide
