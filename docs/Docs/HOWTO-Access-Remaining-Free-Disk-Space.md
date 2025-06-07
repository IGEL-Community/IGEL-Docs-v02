# HOWTO Access Remaining Free Disk Space on IGEL OS 12 Device

-----

## IGEL OS 12 and 64GB File System

IGEL OS 12 currently, as of 7 June 2025, only uses 64GB of the disk drive.

The following steps can be used to get access to the remaining disk drive.

-----

## Use GParted Live iso to add partition

### Steps to be done on PC:

- Download ISO image [GParted Live iso](https://gparted.org/download.php)
- Image USB device [Windows OS](https://kb.igel.com/en/igel-os/11.10/create-usb-installation-medium-windows) or [MacOS](HOWTO-Create-USB-Installation-medium-MacOS)

### Steps to be done on IGEL OS:

- Configure the IGEL Setup (or UMS Profile), to enable Storage Hotplug at **Devices->Storage Devices->Storage Hotplug** and **User browse directory**
- Plug in USB device created on PC
- Make USB device bootable (open a terminal window as root)

```bash linenums="1"
cd /media/USB_Device_Name/utils/linux
bash makeboot.sh /dev/device_mount_point (lsblk can be used to determine device_mount_point)
```
- Reboot PC from USB created GParted
- Select the VGA display option and select the defaults for the remaining items
- Create a new partition from free space remaining on PC
- Format the new partition as btrfs
- Reboot into IGEL OS and remove USB device

-----

## Script to rename the default /media/long-folder-name to /media/hostname-of-the-device

```bash linenums="1"
#!/bin/bash
#set -x
#trap read debug

# 
# After using GParted to format rest of desk
#
# Change /media mount point to be hostname
# 
MOUNTPOINT=$(ls /media)
NEWMP="/media/$(hostname)"

if [ "${MOUNTPOINT}" != "$(hostname)" ]; then
 MOUNTDEV=$(df -H | grep media | cut -d " " -f 1)
 umount ${MOUNTDEV}
 if [ ! -e ${NEWMP} ]; then
   mkdir -p "${NEWMP}"
 fi
 mount ${MOUNTDEV} ${NEWMP}
fi
```
