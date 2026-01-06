# HOWTO Terraform

HashiCorp Terraform is an infrastructure as code tool that lets you define both cloud and on-prem resources in human-readable configuration files that you can version, reuse, and share. You can then use a consistent workflow to provision and manage all of your infrastructure throughout its lifecycle. Terraform can manage low-level components like compute, storage, and networking resources, as well as high-level components like DNS entries and SaaS features.

-----

-----

## Install Terraform on IGEL OS

- Use [IGEL KB: IGEL App Creator Portal](https://kb.igel.com/igel-app-creator/current/igel-app-creator-portal) with the [Terraform Recipe](https://github.com/IGEL-Community/IGEL-OS-APP-RECIPES/tree/main/APP_Source/Apps/terraform)

-----

-----

## Use Terraform to Build Docker Container for Debian Bookworm

Steps:

- Create `main.tf`
- Run `terraform`
- Run `docker` to start container. [Docker recipe](https://github.com/IGEL-Community/IGEL-OS-APP-RECIPES/tree/main/APP_Source/Apps/docker)

### Save the following as `main.tf`

```terraform
terraform {
  required_version = ">= 1.5.0"

  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

# Pull Debian Bookworm image
resource "docker_image" "debian_bookworm" {
  name         = "debian:bookworm"
  keep_locally = true
}

# Create a container
resource "docker_container" "bookworm" {
  name  = "debian-bookworm"
  image = docker_image.debian_bookworm.image_id

  # Keep it running (Debian exits immediately otherwise)
  command = ["sleep", "infinity"]

  # Install packages on startup (simple)
  # Add to docker_container:
  #command = ["bash", "-lc", "apt-get update && apt-get install -y curl ca-certificates && sleep infinity"]

  # Optional: set a hostname
  hostname = "bookworm"

  # Optional: environment variables
  env = [
    "DEBIAN_FRONTEND=noninteractive"
  ]

  # Optional: port mapping example (uncomment if you run a service)
  # ports {
  #   internal = 8080
  #   external = 8080
  # }

  # Optional: mount a host directory into the container
  # volumes {
  #   host_path      = "${path.module}/data"
  #   container_path = "/data"
  #   read_only      = false
  # }
}

output "container_name" {
  value = docker_container.bookworm.name
}

output "container_id" {
  value = docker_container.bookworm.id
}
```

### Save the following as `run-terraform.sh`

```bash
#!/bin/bash
# set -x
# trap read debug

terraform init
terraform apply
```

### Save the following as `run-docker.sh`

```bash
#!/bin/bash
# set -x
# trap read debug

# run script as root

docker exec -it debian-bookworm bash
```

-----

-----

## Use Terraform to setup Azure Application Gateway as Reverse Proxy for IGEL UMS

Steps:

- Create `main.tf`
- Run `terraform`

### [IGEL KB: Configure the UMS to Integrate Reverse Proxy with SSL Offloading](https://kb.igel.com/en/universal-management-suite/current/configure-the-ums-to-integrate-reverse-proxy-with-)

### [IGEL KB: Azure Application Gateway Example Configuration as Reverse Proxy in IGEL UMS with SSL Offloading](https://kb.igel.com/en/universal-management-suite/current/azure-application-gateway-example-configuration-as)


**NOTE: Code under development**

<!---

### Save the following as `main.tf`

```terraform
terraform {
  required_version = ">= 1.4"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.90"
    }
  }
}

provider "azurerm" {
  features {}
}

# -------------------------
# Variables (edit these)
# -------------------------
variable "location"            { type = string  default = "eastus" }
variable "resource_group_name" { type = string  default = "rg-appgw-demo" }
variable "appgw_name"          { type = string  default = "appgw-demo" }
variable "vnet_name"           { type = string  default = "vnet-appgw-demo" }
variable "vnet_cidr"           { type = string  default = "10.10.0.0/16" }
variable "appgw_subnet_cidr"   { type = string  default = "10.10.1.0/24" }

# For demo: a backend FQDN. Replace with your app’s hostname (or switch to IPs)
variable "backend_fqdn"        { type = string  default = "example.com" }

# -------------------------
# Resource Group
# -------------------------
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# -------------------------
# Networking
# -------------------------
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = [var.vnet_cidr]
}

resource "azurerm_subnet" "appgw" {
  name                 = "snet-appgw"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.appgw_subnet_cidr]
}

resource "azurerm_public_ip" "pip" {
  name                = "pip-${var.appgw_name}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  allocation_method = "Static"
  sku               = "Standard"
}

# -------------------------
# Application Gateway v2
# -------------------------
resource "azurerm_application_gateway" "appgw" {
  name                = var.appgw_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  sku {
    name     = "WAF_v2"
    tier     = "WAF_v2"
    capacity = 2
  }

  waf_configuration {
    enabled          = true
    firewall_mode    = "Prevention"
    rule_set_type    = "OWASP"
    rule_set_version = "3.2"
  }

  gateway_ip_configuration {
    name      = "gwipcfg"
    subnet_id = azurerm_subnet.appgw.id
  }

  frontend_port {
    name = "feport-80"
    port = 80
  }

  frontend_ip_configuration {
    name                 = "feip"
    public_ip_address_id = azurerm_public_ip.pip.id
  }

  backend_address_pool {
    name  = "be-pool"
    fqdns = [var.backend_fqdn]
  }

  backend_http_settings {
    name                  = "be-http"
    cookie_based_affinity = "Disabled"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 30
    pick_host_name_from_backend_address = true
    probe_name            = "probe-http"
  }

  probe {
    name                = "probe-http"
    protocol            = "Http"
    path                = "/"
    interval            = 30
    timeout             = 30
    unhealthy_threshold = 3
    pick_host_name_from_backend_http_settings = true

    match {
      status_code = ["200-399"]
    }
  }

  http_listener {
    name                           = "listener-80"
    frontend_ip_configuration_name = "feip"
    frontend_port_name             = "feport-80"
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = "rule-basic"
    rule_type                  = "Basic"
    http_listener_name         = "listener-80"
    backend_address_pool_name  = "be-pool"
    backend_http_settings_name = "be-http"
    priority                   = 100
  }
}

output "appgw_public_ip" {
  value = azurerm_public_ip.pip.ip_address
}
```

### Save the following as `run-terraform.sh`

```bash
#!/bin/bash
# set -x
# trap read debug

terraform init
terraform apply -auto-approve
```

-->