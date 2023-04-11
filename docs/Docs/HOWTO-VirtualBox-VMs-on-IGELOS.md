# HOWTO Run VirtualBox Virtual Machines on IGEL OS

-----

## Content based on post by Fredrik Brattstig @virtualbrat

[Living Remote – Eating dogfood, Part 2 – Running VM’s in a “Thin Client” operating system. What??!? and WHY??!?](https://virtualbrat.com/2022/02/02/living-remote-eating-dogfood-part-2-running-vms-in-a-thin-client-operating-system-what-and-why/)

### Overview of steps to setup on IGEL OS 11.06.210 or later

- X86 PC (minimum configuration: 8GB RAM, 100GB Disk)
- Add NTFS partition to disk using [GParted Live iso](https://gparted.org/liveusb.php)
- Configure the IGEL Setup (or UMS Profile), to enable Storage Hotplug at **Devices->Storage Devices->Storage Hotplug**
- Configure VirtualBox on IGEL OS
- Setup VirtualBox profile in UMS and deploy

-----

## Use GParted Live iso to add NTFS partition

### Steps to be done on PC:

- Download ISO image [GParted Live iso](https://gparted.org/download.php)
- Image USB device [Windows OS](https://kb.igel.com/igelos-11.08.200/en/create-usb-installation-medium-windows-69178228.html) or [MacOS](https://github.com/IGEL-Community/IGEL-Docs/blob/main/Docs/HOWTO-Create-USB-Installation-medium-MacOS.md)

### Steps to be done on IGEL OS:

- Configure the IGEL Setup (or UMS Profile), to enable Storage Hotplug at **Devices->Storage Devices->Storage Hotplug**
- Plug in USB device created on PC
- Make USB device bootable (open a terminal window as root)

```bash linenums="1"
cd /media/USB_Device_Name/utils/linux
bash makeboot.sh /dev/device_mount_point (for example from dmesg: /dev/sda1)
```
- Reboot PC from USB created GParted
- Create a new partition from free space remaining on PC
- Format the new partition as NTFS
- Reboot into IGEL OS and remove USB device

-----

## Configure VirtualBox on IGEL OS

<a href="../Profiles/HOWTO-Run-VirtualBox-VMs-on-IGELOS-VirtualBox-profile.xml" download>LINK to Sample VirtualBox UMS Profile</a>



### Steps to be done on IGEL OS:

- The following command can be added to a profile to start VirtualBox as root:

```bash linenums="1"
pkexec -u root env DISPLAY=$DISPLAY XAUTHORITY=$XAUTHORITY /usr/bin/virtualbox
```

- The following script can be added to profile


```bash linenums="1"
 #!/bin/bash
 #set -x
 #trap read debug

 # Configure IGEL OS for VirtualBox VMs
MOUNTPOINT=$(ls /media)
NEWMP="/media/VBoxMachines"
VB_Config1="/media/VBoxMachines/config/VirtualBox"
VB_Config2="/root/.config/VirtualBox"
VB_ExtPack="/media/VBoxMachines/download/Oracle_VM_VirtualBox_Extension_Pack-6.1.22.vbox-extpack"

if [ "${MOUNTPOINT}" != "VBoxMachines" ]; then
 MOUNTDEV=$(df -H | grep media | cut -d " " -f 1)
 umount ${MOUNTDEV}
 if [ ! -e ${NEWMP} ]; then
   mkdir -p "${NEWMP}"
 fi
 mount ${MOUNTDEV} ${NEWMP}
fi

if [ ! -e "${VB_Config1}" ]; then
 mkdir -p "${VB_Config1}"
fi

if [ -d "${VB_Config2}" ]; then
 rm -rf "${VB_Config2}"
fi

if [ -L "${VB_Config2}" ]; then
 unlink "${VB_Config2}"
fi

ln -sf "${VB_Config1}" "${VB_Config2}"

if [ ! -e "${VB_ExtPack}" ]; then
  mkdir -p $(dirname "${VB_ExtPack}")
  wget -O "${VB_ExtPack}" https://download.virtualbox.org/virtualbox/6.1.22/Oracle_VM_VirtualBox_Extension_Pack-6.1.22.vbox-extpack
fi

modprobe vboxdrv
modprobe vboxnetflt
echo "y" | vboxmanage extpack install "${VB_ExtPack}"
```
