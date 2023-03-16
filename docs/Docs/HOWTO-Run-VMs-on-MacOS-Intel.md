# HOWTO Run Virtual Machines on MacOS (Intel)

-----

## MacOS (Intel) Ventura (13.x) bridged Networking works with VirtualBox (7.0.4)

VirtualBox (7.0.4) supports bridged networking on MacOS (Intel) Ventura.

Details for creating IGEL OS VM on VirtualBox can be found in:

[HOWTO Setup Lab Sandbox Environment](HOWTO-Setup-Lab-Sandbox-Environment.md)

-----

## MacOS Monterey broke VirtualBox bridged Networking

VirtualBox, 6.1.32, [does not support bridged networking on MacOS Monterey](https://forums.virtualbox.org/viewtopic.php?f=8&t=105174&p=513054&hilit=bridged#p513054).

VMware Fusion supports bridged networking.

-----

## Steps to setup IGEL OS VM using VMware Fusion version

- Create new Virtual Machine (select IGEL ISO image > OSC11.08.230.iso)
- Choose Operating System (Other > Other 64-bit)
- Choose Firmware Type (Legacy BIOS)
- Change memory from 256 MB to 4096 MB
- Change Network Adapter to Bridged Networking > Autodetect
