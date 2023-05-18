# HOWTO Work from Home Notes

-----

## Home router DNS

The DNS servers used for some home network may not pick up locally attached devices, such as network printers.

An example of this in the US is with xfinity (Comcast) that uses 75.75.75.75 and 75.75.76.76 for DNS servers. Changing the DNS to use 10.0.0.1 (local router) will allow for resolving the the name(s) of network attached printer(s) on the home network.

### Steps to override default DNS with 10.0.0.1

On the IGEL OS:

 - Open up IGEL Setup. ++ctrl+alt+s++
 - Select **Network > LAN Interfaces**
 - Select **Enable DNS**
 - Set Nameserver to **10.0.0.1**
 - Set **Manually overwrite DHCP settings**
 - Select **Ok**.


**NOTE:** Other IP addresses can be **192.168.10.1** or **192.168.1.1**

[IGEL KB - LAN Interfaces](https://kb.igel.com/igelos-11.08/en/lan-interfaces-63804926.html)

-----

## Setting up Home Network Printer(s)

[Work from Home: Add all network printers](https://github.com/IGEL-Community/IGEL-Custom-Partitions/tree/master/CP_Source/Tools_Drivers/WFH-Add-Network-Printers)

-----

## Access terminal console, terminal log screen, or setup

- Access to terminal console: ++ctrl+alt+f12++
- Switch back to GUI: ++ctrl+alt+f1++
- Access terminal log screen: ++ctrl+alt+f10++
- Access IGEL setup: ++ctrl+alt+s++

-----

## Having issues connecting with wireless?

Try using iNet Wireless Daemon (iwd) for Wi-Fi backend.

### On IGEL OS 11.05.133 or later version of 11.05

Steps to enable:

  - Create file, /wfs/IWD (touch /wfs/IWD)
  - Reboot.

### On 11.06.120 or later version of 11.06

Steps to enable:

  - Open up IGEL Setup. ++ctrl+alt+s++
  - Select **System > Registry**.
  - Select **network.interfaces.wirelesslan.wireless_backend**.
  - Wi-Fi backend set to **iNet Wireless Daemon (iwd)**.
  - Select **Ok**.
  - Reboot the device.
