# HOWTO Setup Lab Sandbox Environment

-----

## IGEL Security Ports One Pager

```mermaid
flowchart TD
  A[UMS Console]-- Port 5900 TCP SSL Tunnel Encrypted VNC-data --> B[\Intranet OS 11 Devices/]
  A[UMS Console]-- Port 8443 TCP --> C{UMS Server}
  C{UMS Server}<-- Port 8443 TCP --> B[\Intranet OS 11 Devices/]
  C{UMS Server}-- MS Active Directory Services Port --> D[(MS Active Directory Services)]
  C{UMS Server}-- DB Port--> E[(UMS DB)]
  C{UMS Server}-- Port 30022 TCP --> B[\Intranet OS 11 Devices/]
  C{UMS Server}-- Port 30005 TCP UDP --> B[\Intranet OS 11 Devices/]
  C{UMS Server}-- Port 8443/443 TCP --> F{IGEL Cloud Gateway}
  B[\Intranet OS 11 Devices/]-- Port 30001 TCP --> C{UMS Server}
  G[/Internet OS 11 Devices\]-- Port 8443/443 TCP --> H((Internet Connection))
  H((Internet Connection))<-- Port 8443/443 TCP --> F{IGEL Cloud Gateway}
  C{UMS Server}-- Port 443 TCP --> H((Internet Connection))
  H((Internet Connection))-- Port 443 TCP --> I[[UMS Download Server]]
  H((Internet Connection))-- Port 443 TCP --> J[[UMS Licensing Server]]
  K[/OS 12 Devices\]<-- Port 8443 TCP --> C{UMS Server}
  L[UMS Web App]-- Port 443 TCP --> C{UMS Server}
```

-----

### IGEL OS 12 Devices

- Port 8443 (TCP) Incoming / Outgoing

-----

**NOTE:** The Unified Protocol is used for all communication between the UMS and OS 12 devices. This single path of communication is now accomplished with a WebSocket connection, enabling persistent, bi-directional, full-duplex TCP connectivity between UMS 12 and OS 12 devices.

-----

### IGEL Devices

- Port 5900 (TCP) Incoming
- Port 30005 (TCP/UDP) Incoming
- Port 30001 (TCP) Outgoing
- Port 8443 (TCP) Incoming / Outgoing
- Port 30022 (TCP) Incoming

### UMS Console

- Port 5900 (TCP) Outgoing for invoking VNC session
- Port 8443 (TCP) Outgoing

### UMS Server

- Port 443 (TCP) Outgoing
- Port 8443 (TCP) Incoming / Outgoing
- Port 30001 (TCP) Incoming

### UMS Server 1+n with Loadbalancer on same server

- Port 30002 (TCP)

### Microsoft Active Directory Services

- LDAP: Port 389 (TCP) Outgoing
- LDAPS: Port 636 (TCP) Outgoing

### UMS DB

- Microsoft SQL: Port 1433 (TCP) Incoming
- Oracle: Port 1521 (TCP) Incoming
- Apache Derby: Port 1527 (TCP) Incoming
- PostgreSQL: Port 5432 (TCP) Incoming

### UMS Licensing Server

- fwus.igel.com
- susi.igel.com
- Port 443 TCP Incoming

### UMS Download Server

- fwus.igel.com
- Port 443 TCP Incoming

-----

## Summary of Steps to Create Lab Sandbox Environment

-	Setup PC file system
-	Install Virtual Box
-	Install Linux and Windows virtual machines
-	Install UMS on Linux (Ubuntu 18.04)
-	Create IGEL OS clients
-	Optional install ICG from UMS (ICG runs on Linux (Ubuntu 18.04))
-	Optional – Advanced – Setting up firewall with pfSense (ICG <--> UMS)

-----

## Using other Hypervisors

IGEL OS using VMware:

- Create new Virtual Machine (select IGEL ISO image)
- Choose Operating System (Other > Other 64-bit)
- Choose Firmware Type (Legacy BIOS)
- Change memory from 256 MB to 4096 MB
- Change Network Adapter to Bridged Networking > Autodetect

IGEL OS on Hyper-V:

- Allocated at least 4GB (4096 MB) of memory
- Create Generation 1 VM
- Remove the Network adapter
- Add a Legacy Network adapter

-----

## Setup PC File System and Downloads

Create a folder called igel-lab to hold:

-	igel-download/ - `Installers (UMS, ICG, IGEL OS)`
-	igel-packages/ - `Custom partitions from` [IGEL Community GitHub](https://github.com/IGEL-Community/IGEL-Custom-Partitions)
-	guest-download/ - `Installers (Ubuntu, Windows, pfSense, Zenmap)`
-	manuals/ - `Manuals (IGEL, VirtualBox, misc. documents)`

Download software:

-	[VirtualBox](https://www.virtualbox.org/) and install. IGEL OS 11 / 12 has VirtualBox Guest Additions built in to support shared folders.
-	Linux ISO [Ubuntu Desktop 18.04]( https://releases.ubuntu.com/18.04/)
-	Linux ISO [Ubuntu Desktop 20.04]( https://releases.ubuntu.com/20.04/)
-	Optional – [Windows Server 2019 ISO - 180 day trial](https://www.microsoft.com/en-us/evalcenter/evaluate-windows-server-2019?filetype=ISO)
-	[IGEL Software](https://www.igel.com/software-downloads) - OS 11 / 12, UMS - Workspace Edition, ICG - Enterprise Management Pack
-	[Custom Partitions](https://github.com/IGEL-Community/IGEL-Custom-Partitions)

-----

## Create Linux VM for UMS Install

- Follow VirtualBox guide for installing ISO image (Ubuntu 64 bit; 12GB RAM; 100GB Disk, take defaults for the rest; Shared folder to mount PC file system for images and packages)
- After install then install time synchronization, update OS and upgrade OS

```bash linenums="1"
sudo apt install chrony -y
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt autoremove -y
sudo apt-get install build-essential gcc make perl dkms -y
sudo reboot now
```

- Mount VirtualBox Guest Additions CD image `VitrualBox VM > Devices > Insert Guest Additions CD image...`
- Install VirtualBox Guest Additions `cd /media/.../VBox_GA...; sudo ./VBoxLinuxAdditions.run`
- Add login account to vboxfs group `sudo vi /etc/group; sudo reboot now`

-----

## Install UMS on Linux

- Follow IGEL Linux installation notes -- [LINK](https://kb.igel.com/endpointmgmt-12.01/en/igel-ums-installation-under-linux-81494549.html)
- sudo ./setup-igel-ums-linux-[version].bin

**Note** Steps to install on Windows -- [LINK](https://kb.igel.com/endpointmgmt-12.01/en/igel-ums-installation-under-windows-77864446.html)

- IGEL Community on GitHub UMS Console setup - [LINK](https://github.com/IGEL-Community/IGEL-Scripts/tree/main/Script_Source/Server/UMS_Console_Ubuntu_Build)
-----

## Create IGEL OS Clients

VirtualBox > New

- Name: `name of IGEL OS system`
- Type: `Linux`
- Version: `Ubuntu (64-bit)`
- Memory size: `4096 MB`
- `Defaults for the rest`
- `Create`
- `Settings > Network > Attached to Bridged Adapter`
- Folder Name: `igel-lab`
- `automount`
- `OK`
- Start VM
- Disk file to install from: `path to IGEL OS 11 / 12 ISO file`
- Start

Follow IGEL OS 11 installation procedures - [LINK](https://kb.igel.com/igelos-11.08.200/en/installation-procedure-69178239.html)

Follow IGEL OS 12 installation procedures - [LINK](https://kb.igel.com/howtocosmos/en/installing-the-base-system-via-igel-os-creator-osc-77865870.html)

-----

## Registering Devices on the UMS Server

- UMS endpoint management (see searching for devices) - [LINK](https://kb.igel.com/endpointmgmt-12.01/en/registering-igel-os-devices-on-the-ums-server-77864528.html)

-----

## Run UMS Web App

- Start UMS Web App - `https://<UMS-Server>:8443/webapp/#/login`
- UMS Web App help - [LINK](https://kb.igel.com/endpointmgmt-12.01/en/igel-ums-web-app-77865357.html)

-----

## UMS to/from IGEL OS 11 Communication ports (NO ICG)

[UMS Communication Ports](https://kb.igel.com/endpointmgmt-12.01/en/igel-ums-communication-ports-77869550.html)

### Core Communication UMS / OS 11

- Core (scanning for device) : 30005 (TCP/UDP) : (UMS agent) Device : The device responds to a broadcast sent by the UMS during a scan. The port number to be used is contained in the UDP packet sent by the UMS. From UMS Server: `nc -v -z IGEL-OS-IP-ADDRESS 30005`

- Core (direct device communication) : 30001 (TCP) : UMS Server (Windows: service IGELRMGUIServer; Linux: daemon igelRMServer). From IGEL OS: `nc -v -z UMS-SERVER-IP-ADDRESS 30001`

- Core (file transfer, firmware customization, licenses, Universal Firmware Update) : 8443 (TCP) : UMS Server (Windows: service IGELRMGUIServer; Linux: daemon igelRMServer). Request for files. From IGEL OS: `nc -v -z UMS-SERVER-IP-ADDRESS 8443`

### Optional Communication UMS / OS 11

- Core (secure terminal) : 30022 (TCP) : Device (UMS agent). From UMS Server: `nc -v -z IGEL-OS-IP-ADDRESS 30022`

- Core (shadowing) via UMS Web App : 5900 (TCP) : Device (UMS agent). From UMS Server / Console: `nc -v -z IGEL-OS-IP-ADDRESS 5900`

- Core (Wake on LAN) : 9 (UDP). The UMS Server sends magic packets to the devices. From UMS Server: `nc -u -v -z IGEL-OS-IP-ADDRESS 9`

**NOTE:** Shadowing from UMS Web App triggers the UMS Server to initiate a VNC session for shadowing. The VNC session is routed through the UMS Server.

-----

## ICG to/from IGEL OS 11 Communication ports (443 or 8443)

All communication over 8443 (default) or 443 as defined during installation of ICG.

Core (with ICG) : 8443 (default) or 443. From IGEL OS: `nc -v -z ICG-SERVER-IP-ADDRESS 8443` or `nc -v -z ICG-SERVER-IP-ADDRESS 443`

**NOTES:**

- The only supported option for ICG is to have direct access to port 8443/443 over a public facing IP address. Confirm that `NOTHING (NO - load balancer, Web Application Firewall, or security appliance that is manipulating traffic)` is between the ICG and IGEL OS devices.
- Also make sure the ICG, UMS, and IGEL OS clients are using [NTP](https://en.wikipedia.org/wiki/Network_Time_Protocol) for time services.
- Connect to ICG via HTTPS URL to confirm the health of the server: `https://<icg FQDN>:port/usg/server-status` where port is either 8443 or 443.
-----

## Optional - Install ICG from UMS (OS 11)

- Follow VirtualBox guide for installing ISO image (Ubuntu 64 bit; 4GB RAM; 25GB Disk, take defaults for the rest)
- After install then install time synchronization, update OS and upgrade OS

```bash linenums="1"
sudo apt install chrony -y
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt autoremove -y
sudo reboot now
```

- Follow IGEL ICG install from UMS - [LINK](https://kb.igel.com/igelicg-2.05/en/installing-the-igel-cloud-gateway-57324362.html)
- IGEL Community GitHub ICG setup script - [LINK](https://github.com/IGEL-Community/IGEL-Scripts/tree/main/Script_Source/Server/ICG_Ubuntu_Build)

-----

## Optional - Advanced - Setting up Firewall with pfSense

The IGEL Cloud Gateway (ICG) is required if the UMS and the devices are not in the same network. The following scenarios are typical use cases for the ICG:

-	The endpoint devices (IGEL UD, UD Pocket or devices converted by UDC3/OSC) of all geographically dispersed branches of a company are to be managed by one central UMS.
-	UD Pocket or devices converted by UDC3/OSC are to be managed by the UMS which is residing on premises.

Use pfSense to create firewall (DMZ)

-	Place the ICG and IGEL OS clients outside the firewall (internet)
-	Place the UMS inside the firewall (company network)
-	Follow this guide for setting up pfSense - [LINK](https://resources.infosecinstitute.com/topic/setting-pentest-lab-pfsense-virtualbox/)
-	Setup network discovery and security auditing software (Zenmap) to probe the servers and find open ports - [LINK](https://nmap.org/zenmap/)

![image01](Images/HOWTO-Setup-Lab-Sandbox-Environment-01.png)
![image02](Images/HOWTO-Setup-Lab-Sandbox-Environment-02.png)
![image03](Images/HOWTO-Setup-Lab-Sandbox-Environment-03.png)
![image04](Images/HOWTO-Setup-Lab-Sandbox-Environment-04.png)

-----

## Appendix - Linux Scripts

- [Linux Scripts](https://github.com/rneher-igel/Linux-Scripts/tree/master)
- [Linux UMS and X11 forwarding to IGEL OS endpoint](https://github.com/IGEL-Community/IGEL-Scripts/tree/main/Script_Source/Server/UMS_Console_Ubuntu_Build)

-----

## Appendix - IGEL Downloads

| Name | Description - Link |
|------|--------------------|
| UMS 12 | <a href="https://az743625.vo.msecnd.net/files/IGEL_UNIVERSAL_MANAGEMENT_SUITE/WINDOWS/setup-igel-ums-windows_12.01.110.exe" download>UMS 12 for Windows Server</a> |
| UMS 12 | <a href="https://az743625.vo.msecnd.net/files/IGEL_UNIVERSAL_MANAGEMENT_SUITE/LINUX/setup-igel-ums-linux_12.01.110.bin" download>UMS 12 for Linux Server</a> |
| UMS 6 | <a href="https://az743625.vo.msecnd.net/files/IGEL_UNIVERSAL_MANAGEMENT_SUITE/WINDOWS/setup-igel-ums-windows_6.10.140.exe" download>UMS 6 for Windows Server</a> |
| UMS 6 | <a href="https://az743625.vo.msecnd.net/files/IGEL_UNIVERSAL_MANAGEMENT_SUITE/LINUX/setup-igel-ums-linux_6.10.140.bin" download>UMS 6 for Linux Server</a> |
| OSC - OS 12 | <a href="https://az743625.vo.msecnd.net/files/IGEL_OS_12/OSC/osc_12.01.110.1.zip" download>OSC - OS 12</a> |
| OSC - OS 11 | <a href="https://az743625.vo.msecnd.net/files/IGEL_OS_11/OSC/OSC_11.08.330.zip" download>OSC - OS 11</a> |
| OS Update - OS 11 | <a href="https://az743625.vo.msecnd.net/files/IGEL_OS_11/updates/lxos_11.08.330_public.zip" download>OS Update Firmware - OS 11</a> |
| ICG 12 | <a href="https://az743625.vo.msecnd.net/files/IGEL_CLOUD_GATEWAY/installer-12.01.100.bin" download>ICG 12</a> |
| ICG 2 | <a href="https://az743625.vo.msecnd.net/files/IGEL_CLOUD_GATEWAY/installer-2.05.110.bin" download>ICG 2</a> |

```bash linenums="1"
#!/bin/bash

#IGEL Cosmos (OS 12 / UMS 12 / ICG 12):
#OSC 12: 
wget https://az743625.vo.msecnd.net/files/IGEL_OS_12/OSC/osc_12.01.110.1.zip

#UMS 12:
wget https://az743625.vo.msecnd.net/files/IGEL_UNIVERSAL_MANAGEMENT_SUITE/WINDOWS/setup-igel-ums-windows_12.01.110.exe
wget https://az743625.vo.msecnd.net/files/IGEL_UNIVERSAL_MANAGEMENT_SUITE/LINUX/setup-igel-ums-linux_12.01.110.bin

#ICG 12:
wget https://az743625.vo.msecnd.net/files/IGEL_CLOUD_GATEWAY/installer-12.01.100.bin

#IGEL OS 11 / UMS 6 / ICG 2)
#OSC 11:
wget https://az743625.vo.msecnd.net/files/IGEL_OS_11/OSC/OSC_11.08.330.zip

#OS 11 Update:
wget https://az743625.vo.msecnd.net/files/IGEL_OS_11/updates/lxos_11.08.330_public.zip

#UMS 6:
wget https://az743625.vo.msecnd.net/files/IGEL_UNIVERSAL_MANAGEMENT_SUITE/WINDOWS/setup-igel-ums-windows_6.10.140.exe
wget https://az743625.vo.msecnd.net/files/IGEL_UNIVERSAL_MANAGEMENT_SUITE/LINUX/setup-igel-ums-linux_6.10.140.bin

#IGEL ICG:
wget https://az743625.vo.msecnd.net/files/IGEL_CLOUD_GATEWAY/installer-2.05.110.bin
```


<!---
Remove for now
# [Basic Setup Guide](HOWTO-Basic-Setup-Guide.md)

Guide follows KB article, `First Steps with IGEL OS 11`, and adds optional IGEL Cloud Gateway (ICG) setup.
-->
