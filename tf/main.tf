# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "tf-rg"
  location = var.rg-location
}

# Create a virtual network within the resource group
resource "azurerm_virtual_network" "tf-vpc" {
  name                = "VNetTF"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = var.tf-vpc-address
}

resource "azurerm_subnet" "tf-subnet" {
  name                 = "default"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.tf-vpc.name
  address_prefixes     = var.tf-subnet-address
}

resource "azurerm_network_security_group" "tf-sg" {
  name                = "tf-sg"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  dynamic "security_rule" {
    for_each = var.tf-sg-var
    content {
      name                       = security_rule.value.name
      priority                   = 1001
      direction                  = security_rule.value.direction
      access                     = security_rule.value.access
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = security_rule.value.destination_port_range
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }

  tags = {
    environment = "tf"
  }
}
