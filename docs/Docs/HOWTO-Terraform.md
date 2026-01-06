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
############################################
# main.tf — Azure Application Gateway (WAF_v2)
# IGEL UMS Reverse Proxy (UMS-only, end-to-end TLS)
# - Two HTTPS listeners: 443 (Onboarding) + 8443 (WebSocket/mTLS)
# - Path-based routing: ONLY allow UMS Reverse Proxy endpoints:
#     /device-connector/device/*
#     /device-connector/device/ws-connect
#     /device-connector/device/portforwarding
#     /device-connector/device/.well-known/est/*
#     /ums-appproxy/*
# - Frontend min TLS: TLSv1.3 via CustomV2 SSL policy (TLS 1.3 ciphers included by default) :contentReference[oaicite:0]{index=0}
# - End-to-end TLS to UMS: backend HTTPS + trusted_root_certificate
# - mTLS on 8443 via ssl_profile + trusted_client_certificate_names :contentReference[oaicite:1]{index=1}
# - Forward client cert to backend via rewrite header X-SSL-CERT={var_client_certificate} :contentReference[oaicite:2]{index=2}
############################################

terraform {
  required_version = ">= 1.6.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0"
    }
  }
}

provider "azurerm" {
  features {}
}

#####################
# Variables
#####################
variable "location" { type = string }
variable "resource_group_name" { type = string }

variable "vnet_name" { type = string  default = "vnet-ums-appgw" }
variable "vnet_cidr" { type = string  default = "10.50.0.0/16" }

# App Gateway must be in a dedicated subnet
variable "appgw_subnet_name" { type = string default = "snet-appgw" }
variable "appgw_subnet_cidr" { type = string default = "10.50.1.0/24" }

variable "appgw_name" { type = string default = "appgw-ums" }

# Public DNS name used by devices/users (must match listener cert SAN/CN)
variable "frontend_fqdn" { type = string }

# UMS backend targets (prefer FQDN for end-to-end TLS)
variable "ums_backend_fqdns" {
  type        = list(string)
  description = "Private DNS names for UMS reachable from the AppGW subnet (FQDN strongly recommended for e2e TLS)."
}

# Must match the CN/SAN on the UMS backend certificate presented on ums_web_port
variable "ums_backend_tls_host" {
  type        = string
  description = "Hostname that AppGW uses for Host/SNI to UMS; MUST match backend certificate CN/SAN."
}

# UMS Web Port (default 8443)
variable "ums_web_port" { type = number default = 8443 }

# Listener TLS certificate (PFX) for the public listeners (443 + 8443)
variable "listener_pfx_path" { type = string }
variable "listener_pfx_password" {
  type      = string
  sensitive = true
}

# Backend trust: Root CA (PEM/CRT/CER) that issued the UMS backend certificate
variable "ums_root_cert_path" { type = string }

# mTLS CA for device/client certificates (EST CA client cert exported from UMS, PEM)
variable "est_ca_client_cert_path" { type = string }

# “Deny” backend for everything not explicitly allowed by path rules.
# Point this to a tiny internal service that returns 404/403 (recommended).
variable "deny_backend_fqdn" {
  type        = string
  default     = "deny.internal.local"
  description = "FQDN of a simple internal 'deny' endpoint that returns 404/403."
}
variable "deny_backend_port" { type = number default = 80 }

#####################
# Resource Group
#####################
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

#####################
# Network
#####################
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = [var.vnet_cidr]
}

resource "azurerm_subnet" "appgw" {
  name                 = var.appgw_subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.appgw_subnet_cidr]
}

resource "azurerm_public_ip" "pip" {
  name                = "${var.appgw_name}-pip"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

#####################
# Application Gateway
#####################
locals {
  fe_ip_name        = "feip"
  ipcfg_name        = "appgw-ipcfg"

  fe_port_443_name  = "feport-443"
  fe_port_8443_name = "feport-8443"

  listener_cert_name       = "ums-listener-cert"
  trusted_root_cert_name   = "ums-root-ca"
  trusted_client_cert_name = "ums-est-ca"

  be_pool_ums_name     = "be-ums"
  be_setting_ums_name  = "be-https-ums"
  probe_ums_name       = "probe-ums"

  be_pool_deny_name    = "be-deny"
  be_setting_deny_name = "be-deny-http"

  listener_443_name    = "lstn-443-onboarding"
  listener_8443_name   = "lstn-8443-websocket"

  ssl_profile_name     = "sslprofile-websocket-mtls"

  rewrite_set_name     = "rwset-forward-clientcert"
  rewrite_rule_name    = "rw-forward-clientcert"

  url_path_map_443     = "upm-443"
  url_path_map_8443    = "upm-8443"

  rule_443_name        = "rule-443-onboarding"
  rule_8443_name       = "rule-8443-websocket"
}

resource "azurerm_application_gateway" "appgw" {
  name                = var.appgw_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  sku {
    name = "WAF_v2"
    tier = "WAF_v2"
  }

  autoscale_configuration {
    min_capacity = 1
    max_capacity = 3
  }

  # Enforce TLSv1.3 from clients (device communication is always TLSv1.3)
  # CustomV2 includes TLS 1.3 ciphers by default :contentReference[oaicite:3]{index=3}
  ssl_policy {
    policy_type          = "CustomV2"
    min_protocol_version = "TLSv1_3"
  }

  gateway_ip_configuration {
    name      = local.ipcfg_name
    subnet_id = azurerm_subnet.appgw.id
  }

  frontend_ip_configuration {
    name                 = local.fe_ip_name
    public_ip_address_id = azurerm_public_ip.pip.id
  }

  frontend_port {
    name = local.fe_port_443_name
    port = 443
  }

  frontend_port {
    name = local.fe_port_8443_name
    port = 8443
  }

  ######################################
  # Certificates
  ######################################
  ssl_certificate {
    name     = local.listener_cert_name
    data     = filebase64(var.listener_pfx_path)
    password = var.listener_pfx_password
  }

  trusted_root_certificate {
    name = local.trusted_root_cert_name
    data = filebase64(var.ums_root_cert_path)
  }

  trusted_client_certificate {
    name = local.trusted_client_cert_name
    data = filebase64(var.est_ca_client_cert_path)
  }

  ######################################
  # Backend Pools
  ######################################
  backend_address_pool {
    name  = local.be_pool_ums_name
    fqdns = var.ums_backend_fqdns
  }

  backend_address_pool {
    name  = local.be_pool_deny_name
    fqdns = [var.deny_backend_fqdn]
  }

  ######################################
  # Probe (UMS, end-to-end TLS)
  ######################################
  probe {
    name                = local.probe_ums_name
    protocol            = "Https"
    path                = "/"
    interval            = 30
    timeout             = 30
    unhealthy_threshold = 3

    # Ensure probe uses the same host as the UMS backend cert CN/SAN
    host = var.ums_backend_tls_host

    match {
      status_code = ["200-399"]
    }
  }

  ######################################
  # Backend HTTP Settings
  ######################################
  backend_http_settings {
    name                  = local.be_setting_ums_name
    protocol              = "Https"
    port                  = var.ums_web_port
    request_timeout       = 130
    probe_name            = local.probe_ums_name
    pick_host_name_from_backend_address = false

    # Critical for e2e TLS/SNI: must match backend certificate CN/SAN
    host_name = var.ums_backend_tls_host

    trusted_root_certificate_names = [local.trusted_root_cert_name]
  }

  backend_http_settings {
    name            = local.be_setting_deny_name
    protocol        = "Http"
    port            = var.deny_backend_port
    request_timeout = 30
  }

  ######################################
  # SSL Profile (mTLS) for 8443 listener only :contentReference[oaicite:4]{index=4}
  ######################################
  ssl_profile {
    name                            = local.ssl_profile_name
    trusted_client_certificate_names = [local.trusted_client_cert_name]
    verify_client_certificate_revocation = "None"
  }

  ######################################
  # Listeners
  ######################################
  http_listener {
    name                           = local.listener_443_name
    frontend_ip_configuration_name = local.fe_ip_name
    frontend_port_name             = local.fe_port_443_name
    protocol                       = "Https"
    host_name                      = var.frontend_fqdn
    ssl_certificate_name           = local.listener_cert_name
  }

  http_listener {
    name                           = local.listener_8443_name
    frontend_ip_configuration_name = local.fe_ip_name
    frontend_port_name             = local.fe_port_8443_name
    protocol                       = "Https"
    host_name                      = var.frontend_fqdn
    ssl_certificate_name           = local.listener_cert_name

    # mTLS only here
    ssl_profile_name               = local.ssl_profile_name
  }

  ######################################
  # Rewrite rule set (forward client certificate) :contentReference[oaicite:5]{index=5}
  ######################################
  rewrite_rule_set {
    name = local.rewrite_set_name

    rewrite_rule {
      name          = local.rewrite_rule_name
      rule_sequence = 10

      request_header_configuration {
        header_name  = "X-SSL-CERT"
        header_value = "{var_client_certificate}"
      }
    }
  }

  ######################################
  # URL Path Maps — allow only required UMS Reverse Proxy endpoints
  # URL path-based routing overview :contentReference[oaicite:6]{index=6}
  ######################################
  url_path_map {
    name                               = local.url_path_map_443
    default_backend_address_pool_name  = local.be_pool_deny_name
    default_backend_http_settings_name = local.be_setting_deny_name

    # OS12 device connector endpoints
    path_rule {
      name  = "allow-device-connector"
      paths = [
        "/device-connector/device/*",
        "/device-connector/device/ws-connect",
        "/device-connector/device/portforwarding",
        "/device-connector/device/.well-known/est/*"
      ]
      backend_address_pool_name  = local.be_pool_ums_name
      backend_http_settings_name = local.be_setting_ums_name
    }

    # UMS Web App proxy
    path_rule {
      name  = "allow-ums-appproxy"
      paths = ["/ums-appproxy/*"]
      backend_address_pool_name  = local.be_pool_ums_name
      backend_http_settings_name = local.be_setting_ums_name
    }
  }

  url_path_map {
    name                               = local.url_path_map_8443
    default_backend_address_pool_name  = local.be_pool_deny_name
    default_backend_http_settings_name = local.be_setting_deny_name

    path_rule {
      name  = "allow-device-connector"
      paths = [
        "/device-connector/device/*",
        "/device-connector/device/ws-connect",
        "/device-connector/device/portforwarding",
        "/device-connector/device/.well-known/est/*"
      ]
      backend_address_pool_name  = local.be_pool_ums_name
      backend_http_settings_name = local.be_setting_ums_name
    }

    path_rule {
      name  = "allow-ums-appproxy"
      paths = ["/ums-appproxy/*"]
      backend_address_pool_name  = local.be_pool_ums_name
      backend_http_settings_name = local.be_setting_ums_name
    }
  }

  ######################################
  # Routing Rules (PathBasedRouting) :contentReference[oaicite:7]{index=7}
  ######################################
  request_routing_rule {
    name               = local.rule_443_name
    rule_type          = "PathBasedRouting"
    http_listener_name = local.listener_443_name
    url_path_map_name  = local.url_path_map_443
    priority           = 100
  }

  request_routing_rule {
    name                  = local.rule_8443_name
    rule_type             = "PathBasedRouting"
    http_listener_name    = local.listener_8443_name
    url_path_map_name     = local.url_path_map_8443
    priority              = 110

    # Forward client cert header (typically needed with mTLS flows)
    rewrite_rule_set_name = local.rewrite_set_name
  }

  ######################################
  # WAF (minimal defaults; tune to your policy)
  ######################################
  waf_configuration {
    enabled          = true
    firewall_mode    = "Prevention"
    rule_set_type    = "OWASP"
    rule_set_version = "3.2"
  }

  depends_on = [azurerm_public_ip.pip]
}

output "appgw_public_ip" {
  value = azurerm_public_ip.pip.ip_address
}
```

### Minimal terraform.tfvars example

```terraform
location            = "eastus"
resource_group_name = "rg-ums-appgw"

frontend_fqdn          = "ums.company.com"

ums_backend_fqdns      = ["ums01.internal.company.com"]
ums_backend_tls_host   = "ums01.internal.company.com"
ums_web_port           = 8443

listener_pfx_path      = "./certs/ums-listener.pfx"
listener_pfx_password  = "REDACTED"

ums_root_cert_path         = "./certs/ums-root-ca.cer"
est_ca_client_cert_path    = "./certs/est-ca-client.pem"

deny_backend_fqdn       = "deny.internal.company.com"
deny_backend_port       = 80
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