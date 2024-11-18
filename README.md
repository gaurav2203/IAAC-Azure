# Terraform Azure Resources Deployment

## Description
This project demonstrates how to use **Terraform** to deploy and manage Azure resources. The project focuses on automating the provisioning of Azure infrastructure such as **Resource Groups**, **Virtual Networks**, **Network Security Groups (NSGs)**, and an **Ubuntu Virtual Machine (VM)**. Each challenge guides through the process of building, managing, and securing these resources with Terraform.

## Table of Contents
- [Description](#description)
- [Table of Contents](#table-of-contents)
- [Installation](#installation)
  - [Prerequisites](#prerequisites)
  - [Getting Started](#getting-started)

## Installation

### Prerequisites
- **Azure Account**: Set up an Azure account at Azure portal. Here, I am using the Azure student account.

### Getting Started
1. Clone the repository to your local machine:
   ```bash
   git clone https://github.com/yourusername/terraform-azure-deployment.git
   ```
2. Install all the dependencies. Here, I have provided the shell script to install terraform to the Linux VM.
  ```bash
  cd IAAC-Azure/
  bash ./env/terraform.sh
  ```
3. Initialize the terraform provider.
  ```bash
  cd tf/
  terraform init
  ```
This command will download all the necessary files that are required by the terraform to create the resources onto the Azure Portal.

4. Create all the resources by using the terraform tool.
  ```bash
  terraform apply --auto-approve
  ```

