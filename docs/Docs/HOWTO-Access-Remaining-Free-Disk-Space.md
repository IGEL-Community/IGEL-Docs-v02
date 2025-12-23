# HOWTO Access Remaining Free Disk Space on IGEL OS 12 Device

-----

## IGEL OS 12 and 64GB File System

IGEL OS 12 currently, as of 7 June 2025, only uses 64GB of the disk drive.

The following steps can be used to get access to the remaining disk drive.

-----

## Use GParted Live iso to add partition

### Steps to be done on PC:

- Download ISO image [GParted Live iso](https://gparted.org/download.php)
- Image USB device [Windows OS](https://kb.igel.com/en/igel-os/current/create-usb-installation-medium-windows) or [IGEL Community: HOWTO Create USB installation medium](HOWTO-Create-USB-Installation-medium.md)

### Steps to be done on IGEL OS:

- Configure the IGEL Setup (or UMS Profile), to enable Storage Hotplug at **Devices->Storage Devices->Storage Hotplug** and **User browse directory**
- Plug in USB device created on PC
- Make USB device bootable (open a terminal window as root)

```bash linenums="1"
cd /media/USB_Device_Name/utils/linux
bash makeboot.sh /dev/device_mount_point (lsblk can be used to determine device_mount_point)
```

- Reboot PC from USB created GParted
- Select the `VGA display option` and then select the defaults for the remaining items
- Create and add/save a new partition from free space remaining on PC
- Format the new partition as btrfs
- Reboot into IGEL OS and remove USB device

-----

## Script to link /media/hostname to /media mount point

```bash linenums="1"
#!/bin/bash
#set -x
#trap read debug

# 
# Custom Commands: Desktop: Final Desktop Command
#
# After using GParted to format rest of desk
#
# Link /media/hostname to /media mount point
# 

ACTION="cc-base-4fic-linkmediadisk"

# output to systemlog with ID amd tag
LOGGER="logger -it ${ACTION}"

MOUNTPOINT=$(mount | grep "/media" | cut -d " " -f 3)
NEWLINK="/media/$(hostname)"

# exit if no media mount point
if [ "${MOUNTPOINT}" == "" ]; then
  echo "No media mount point to link to." | $LOGGER
  exit 0
fi

if [ -L ${NEWLINK} ]; then
  echo "Unlinking ${NEWLINK}" | $LOGGER
  unlink ${NEWLINK} | $LOGGER
elif [  -d ${NEWLINK} ]; then
  echo "${NEWLINK} is a directory. Not linking ${NEWLINK} to ${MOUNTPOINT}" | $LOGGER
  exit 1
fi

ln -svf ${MOUNTPOINT} ${NEWLINK} | $LOGGER
```
