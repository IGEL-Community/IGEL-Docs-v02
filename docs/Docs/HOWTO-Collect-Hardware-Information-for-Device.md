# HOWTO Collect Hardware Information for a Device

-----

## Collect Logs for IGEL Support

- [KB: UMS - Save Support Information / Send Log Files to Support](https://kb.igel.com/en/universal-management-suite/12.07.100/save-support-information-send-log-files-to-support)

- [KB: Debugging / How to Collect and Send Device Log Files to IGEL Support](https://kb.igel.com/en/how-to-start-with-igel/current/debugging-how-to-collect-and-send-device-log-files)

Command to run to collect logs, `/tmp/tclogs.zip`, for IGEL support.

```bash linenums="1"
/config/bin/create_support_information
```

**NOTE:** Details on [UMS Logs](https://igel-community.github.io/IGEL-Docs-v02/Docs/Cheatsheet-IGELCommunity/#ums-files)

### Troubleshooting Links

- [IGEL FAQ](https://igel-community.github.io/IGEL-Docs-v02/Docs/HOWTO-COSMOS/)
- [IGEL Communication Ports](https://igel-community.github.io/IGEL-Docs-v02/Docs/HOWTO-Setup-Lab-Sandbox-Environment/?h=nc#ums-tofrom-igel-os-11-communication-ports-no-icg)
- [Microsoft Teams](https://igel-community.github.io/IGEL-Docs-v02/Docs/HOWTO-Microsoft-Teams-Optimization/#how-to-check-communication-to-the-microsoft-api-urls-and-ips)

-----

## Recommendation: Do not enable "Overwrite Session" on any profiles without explicit request from IGEL support

- Profile(s) should `NEVER` have `Overwrite Sessions` set on it!
- For example, enabling `Overwrite Sessions` in a profile means that `only` those settings will apply for all registry keys that have multiple session (end in a % in the registry).

![image08](Images/HOWTO-Collect-Hardware-Information-for-Device-08.png)

-----

## Steps to collect the data

- Format a USB thumb drive on your PC (FAT or NTFS)
- Copy the collection script (see below) to USB thumb drive
- Enable Storage Hotplug (Devices > Storage Devices > Storage Hotplug)
- Plug USB thumb drive in IGEL OS device (auto mounted in /media folder)
- Open terminal window (as Root)
- Run collection script
- Safely remove USB thumb drive (Start > System > Safely Remove Hardware)
- Send zip file to your contact

-----

## Collection Script

Collection script (collect_data.sh) to copy onto thumb drive

```bash linenums="1"
#!/bin/bash
#set -x
#trap read debug

mkdir data_dump
cd data_dump

# For OS 12 list installed applications
if [ -e /usr/bin/igelpkgctl ]; then
  igelpkgctl list installed > igelpkgctl_list_installed.txt
fi

lshw > lshw_ouptut.txt
lsusb > lsusb_output.txt
lspci > lspci_output.txt
dmesg > dmesg_output.txt
alsa-info --no-upload --output alsa-infor_output.txt
rfkill list all > rfkill_list_all.txt
journalctl > journalctl_output.txt
cp /var/log/Xorg.0.log Xorg.0.log
cp /etc/os-release etc-os-release.txt
cp /wfs/group.ini wfs-group.ini
cp /wfs/setup.ini wfs-setup.ini
cat /proc/bus/input/devices > proc_bus_input_devices.txt
xrandr > xrandr.txt
ip address > ip_address.txt
tar cvjf var-log.tar.bz2 /var/log

# uncomment following lines for Citrix
#mkdir citrix-logs
#cp -R /userhome/.ICAClient/logs citrix-logs

# uncomment following lines for VMware Horizon
# When you gather horizon logs manually from /tmp/vmware-user/
# then the Horizon client needs to be running: The remote session
# can be over or have failed, but the client window must still be there.
# After the client ends the logs will be gathered and the last 3 runs can
# be found in /var/log/vmware-view/ as tar archives.
#mkdir vmware-logs
#cp -R /tmp/vmware-user vmware-logs

# uncomment following lines for OpenSC Smart Card (scard.pkcs11.opensc.default.debug = 9 ; scard.pkcs11.opensc.default.debug_file = /tmp/opensc.log)
#mkdir opensc-logs
#cp -R /tmp/opensc.log opensc-logs

# uncomment following line if using Imprivata
#/services/imprivata/bin/fetch_support_info imprivata_logs_$(date +%y%m%d%H%M).zip

#The log files for IGEL Agent for Imprivata on IGEL OS
#/var/log/user/IGELImprivataAgent.log

# uncomment following lines for Cisco JDVI
#/usr/bin/collect-files
#cp /tmp/VXC-* .

# run IGEL log collection
/config/bin/create_support_information
mkdir tclogs
unzip /tmp/tclogs.zip -d tclogs

cd ..

zip -r data_dump.zip data_dump
```

**NOTE:** Additional logging notes:

- AVD log collection OS 11: `sessions.wvd%.options.client-log-level` set to `Debug`

- AVD log collection OS 12: `System > Registry > app > avd > sessions > avd0 > options > client-log-level` set to `Debug`

- Citrix log collection: `ica.logging.debug` set to `Enabled`

- Zoom VDI log collection: [Using the VDI log tool](https://support.zoom.us/hc/en-us/articles/360057873792-Using-the-VDI-log-tool)

-----

## Search for string (audio) in data_dump files

- Create a listing of files that has string

```bash linenums="1"
grep -irl audio
```

- Create a file with content of search results by file name

```bash linenums="1"
find . -type f -exec echo "File NAME:  ===>> " {} \; -exec grep -i audio {} \; > /tmp/find_string_in_data_dump.txt
```

-----

## Use Microsoft Visual Studio Code to View Log Files

- Install [Microsoft Visual Studio Code](https://code.visualstudio.com/?wt.mc_id=vscom_downloads) on your PC
- Add Extension to Microsoft Visual Studio Code [Log File Highlighter](https://github.com/emilast/vscode-logfile-highlighter)
- Un-Zip log files
- Open the folder in Microsoft Visual Studio Code
- Search for string in Microsoft Visual Studio Code, such as `audio`

![image09](Images/HOWTO-Collect-Hardware-Information-for-Device-09.png)

-----


## Enable Storage Hotplug (Devices > Storage Devices > Storage Hotplug)

![image01](Images/HOWTO-Collect-Hardware-Information-for-Device-01.png)

-----

## Run Collection Script (Open Terminal Window)

```bash linenums="1"
login as "user" or "root": root
 # df -H | grep media
 /dev/sda1    17G   44M     17G   1%  /media/B2B0AB93
 # cd /media/B2B0AB93
 # ls
 collect_data.sh
 # /bin/bash collect_data.sh
 # ls
 collect_data.sh
 data_dump
 data_dump.zip
 # exit
```

-----

## Safely remove USB thumb drive (Start > System > Safely Remove Hardware)

![image02](Images/HOWTO-Collect-Hardware-Information-for-Device-02.png)

-----

## Create Profile with all settings for a Device

These device profiles can be used to see all settings for a device and can also be used to compare two devices.

- [IGEL KB: How to Export Device Settings as a Profile in the IGEL UMS Web App](https://kb.igel.com/en/universal-management-suite/12.07.100/how-to-export-device-settings-as-a-profile-in-the-)

- [IGEL KB - Import Devices as Profiles](https://kb.igel.com/en/universal-management-suite/12.07.100/how-to-import-devices-as-profiles-in-the-igel-ums)

- [IGEL KB - Comparing Profiles in the IGEL UMS](https://kb.igel.com/en/universal-management-suite/12.07.100/comparing-profiles-in-the-igel-ums)

The following steps will:

- Export device settings as a profile
- Import device settings as a profile

![image01](Images/HOWTO-Collect-Hardware-Information-for-Device-05.png)
![image01](Images/HOWTO-Collect-Hardware-Information-for-Device-06.png)
![image01](Images/HOWTO-Collect-Hardware-Information-for-Device-07.png)

-----

## Tips for prepping PC for IGEL OS install

- Make sure BIOS is at latest version. Check [Linux Vendor Firmware Service (LVFS)](https://fwupd.org/lvfs/docs/users). IGEL OS 11.08.XXX or newer supports [LVFS for BIOS from UMS](https://kb.igel.com/en/igel-os/11.10/bios-update-for-devices-supported-by-lvfs)
- Make sure BIOS is set back to default settings.
- Check for and apply BIOS settings for Ubuntu 18.04.

-----

## Video driver and booting (blacklist framebuffer driver)

Framebuffer drivers are generally buggy and poorly-supported, and cause suspend failures, kernel panics and general mayhem.  For this reason we never load them automatically.

If PC firmware has a Legacy Boot option, it might interfere with the kernel’s ability to use the framebuffer during boot.

The kernel may hang on framebuffer driver. As first step in debugging, blacklist the framebuffer driver in file /etc/modprobe.d/blacklist-framebuffer.conf

 For example, add the following entry to the System/Firmware Customization/Custom Commands/Base Initialization section of IGEL Setup:

echo “blacklist efifb” >> /etc/modprobe.d/blacklist-framebuffer.conf

Save the change and reboot without the “Force VESA driver” option being set.

![image03](Images/HOWTO-Collect-Hardware-Information-for-Device-03.jpg)

[IGEL OS Boot Menu Explained – Video](https://videos.igelcommunity.com/igel-os-boot-menu-explained-video/)

[IGEL KB - Boot Menu](https://kb.igel.com/en/igel-os/11.10/boot-menu)

### Try VESA only boot

Steps:

- Reboot device
- Keep hitting ++esc++
- Select > `VESA only boot`

-----

## Improve sound quality for internal speakers or HDMI / DP

Setting to improve sound quality:

System > Registry > multimedia.pulseaudio.daemon.resample-method > speex-float-3

-----

## Touchscreen debugging

Obtain the touchscreen vendor information from the following script:

```bash linenums="1"
#!/bin/bash
tmp_dir=$(mktemp -d)
pushd $tmp_dir > /dev/null
# Export whole database
udevadm info --export-db > udevdb.txt
csplit -s udevdb.txt /^$/ {*}
FILES=./xx*
for f in $FILES
do
  if [[ ! -z $(grep ID_INPUT_TOUCHSCREEN=1 $f) ]] && [[ ! -z $(grep " NAME=*" $f) ]];
  then
        # Extract touchscreen name
        grep " NAME=*" $f | cut -d "=" -f 2
  fi
done
popd > /dev/null
rm -rf $tmp_dir
```

-----

## Access terminal console, terminal log screen, or setup

- Access to terminal console: ++ctrl+alt+f12++
- Switch back to GUI: ++ctrl+alt+f1++
- Access terminal log screen: ++ctrl+alt+f10++
- Access IGEL setup: ++ctrl+alt+s++

-----

## Extended Logging With Syslog, Tcpdump and Netlog

The IGEL Linux Registry offers a number of extended logging options that can help customers, Support and PreSales debug system and network issues.

[IGEL - KB - Extended Logging With Syslog, Tcpdump and Netlog](https://kb.igel.com/en/igel-os/11.10/extended-logging-with-syslog-tcpdump-and-netlog)

-----

## Steps to update firmware from USB drive

- [Download OS 11 -> Firmware Updates -> lxos_[VERSION]_public.zip](https://www.igel.com/software-downloads/workspace-edition/)
- Format USB Drive on PC (FAT)
- Unzip lxos_[VERSION]_public.zip to USB drive
- Configure IGEL OS to take new firmware from USB drive
- Run update

```
1. Configure at least one hotplug USB device:
   setparam devices.hotplug.usb-storage.numdevices 1
2. Apply your changes:
   kill_postsetupd
3. Connect the USB storage device to the device.
4. Wait for the USB storage device to be mounted automatically.
5. Determine the mount point:
   ls /media/
6. Configure the update parameters:
   setparam update.protocol file
   setparam update.file.path /media/<name of USB storage device>
7. Start the update process in the / directory using the command update
   update
```

Sample script:

```bash linenums="1"
#!/bin/bash

setparam devices.hotplug.usb-storage.numdevices 1
kill_postsetupd
sleep 5
setparam update.protocol file
# next command only works if one device is mounted into /media
setparam update.file.path /media/$(ls /media)
update
```

-----

<!---
This is a comment section

## Updating to IGEL OS - Current Version

Configure Firmware Update settings with the following parameters and then select "Update firmware":

| Parameter | Setting | Comment |
|-----------|---------|---------|
| Protocol | https | |
| Server name | fw.igelize.me | North America |
| Server name | fwemea.igelize.me | Western Europe |
| Port | 443 | |
| Server path | igelos/current | |

![image04](Images/HOWTO-Collect-Hardware-Information-for-Device-04.png)

Sample script:

```bash linenums="1"
#!/bin/bash

# Updating to IGEL OS - Current Version

# Configure the update server
setparam update.protocol https

# North America
setparam update.https.server fw.igelize.me

# Western Europe
#setparam update.https.server fwemea.igelize.me

setparam update.https.port 443
setparam update.https.path igelos/current

#Start the update process
update
```

### North America fw.igelize.me server layout

| The layout path structure: |
|----------------------------|
| igelos/amd64 |
| igelos/arm64 |
| igelos/current |

| Under the igelos/amd64 and igelos/arm64 paths, the subpaths for the various versions of IGEL OS public and private. |
|-----------------------|
| igelos/amd64/11.09.310 |
| igelos/amd64/11.08.440 |
| igelos/amd64/11.07.920 |
| igelos/amd64/11.07.170 |
| igelos/arm64/11.02.120 |

-->

-----

## Hardware Notes

- HP Laptops - Selected Boot Image Did Not Authenticate Message Appears before Windows Starts

     ![image10](Images/HOWTO-Collect-Hardware-Information-for-Device-10.png)

    After powering on the computer, the following message may appear prior to booting: `Selected boot image did not authenticate`.

    This occurs when using a 3rd party UEFI software tool (such as a bootloader or endpoint encryption software), or when using hardware with an option ROM that is not appropriately signed per Microsoft’s Secured-core PC requirements.

    Microsoft’s Secured-core PC requirements no longer allow computers to run UEFI code signed using the Microsoft 3rdParty UEFI CA. As such, HP disables the option to use this Certificate of Authority (CA) by default. Microsoft’s decision to disallow authentication for software signed this way is meant to address potential security risks with 3rd party bootloaders by limiting the code that a given computer is allowed to execute before boot.

    Computers that do not support Modern Standby, or that do not have Intel vPro or AMD Ryzen Pro technology, are not affected. Computers that were ordered as Linux-ready are not affected, since these need to use a 3rdparty bootloader (e.g. Grub).

    **Note:** Customers can order affected computers with the third-party key enabled by contacting their HP representative, who can add the appropriate option to their BOM.

    The "Enable MS UEFI CA key" BIOS setting controls the ability to utilize 3rd-party bootloaders.

    Perform the following steps to enable the Microsoft UEFI CA key. This setting can be changed by performing the following steps:

    - Enter the System BIOS by pressing F10 at power on

    - Navigate to the Security tab

    - Select the BIOS Sure Startoption
    
    - Uncheck Sure Start Secure Boot Keys Protection
    
    - Press Esc to exit the BIOS, saving changes
    
    - When prompted for a 4-digit PIN to confirm the BIOS setting changes, enter the PIN shown onscreen

    - Restart the PC and enter the System BIOS again
    
    - Navigate to the Security tab again
    
    - Select the Secure Boot Configuration option
    
    - Check Enable MS UEFI CA key
    
    - Press Esc to return to the previous menu
    
    - Select the BIOS Sure Start option again
    
    - Check Sure Start Secure Boot Keys Protection
    
    - Press Esc to exit the BIOS

    - Save changes

- [Secured-Core PCs: Microsoft 3d-Party UEFI Certificate for Secure Boot](https://kb.igel.com/security-safety/current/secured-core-pcs-microsoft-3rd-party-uefi-certific)

- [Dynabook Setup TECRA A40-J (PMM10U) || Version: PMM10U-00101U](https://github.com/IGEL-Community/IGEL-Docs/blob/main/Docs/HOWTO-Dynabook-Setup.md)

- [Lenovo - PSREF Product Specifications Reference](https://psref.lenovo.com/)

- [Lenovo - BIOS simulator](https://download.lenovo.com/bsco/) shows how to navigate the BIOS for each hardware type.

- [Lenovo - ThinkLMI - Lenovo BIOS Setup using Linux WMI - Deployment Guide](https://download.lenovo.com/pccbbs/mobiles_pdf/lenovo_bios_setup_linux_wmi_sysfs_1.2.pdf)

  - <a href="../Scripts/HOWTO-Collect-Hardware-Information-for-Device-set-BOOT-PWD.sh" download>Sample script to set BIOS password</a>

- [Laptop Docking Station - HP USB-C Dock G5](https://kb.igel.com/en/igel-os/11.10/resolved-issues-11-10-100). Link to HP's web site -- [LINK](https://www.hp.com/us-en/shop/pdp/hp-usb-c-dock-g5-p-5tw10aa-aba-1). This device will work for other laptops that support USB-C docks. IGEL UMS supports firmware updates to this dock.

- [Microsoft Surface: If a feature requires linux-surface kernel then that feature will not work with IGEL](https://github.com/linux-surface/linux-surface/wiki/Supported-Devices-and-Features#feature-matrix)

- [How to reset USB controllers](https://unix.stackexchange.com/questions/704341/how-to-reset-usb-controllers)

```bash linenums="1"
#!/bin/bash
#set -x
#trap read debug
# Resets all USB host controllers of the system.
# This is useful in case one stopped working
# due to a faulty device having been connected to it.

base="/sys/bus/pci/drivers"
sleep_secs="1"

# This might find a sub-set of these:
# * 'ohci_hcd' - USB 3.0
# * 'ehci-pci' - USB 2.0
# * 'xhci_hcd' - USB 3.0
echo "Looking for USB standards ..."
for usb_std in "$base/"?hci*
do
    echo "* USB standard '$usb_std' ..."
    for dev_path in "$usb_std/"*:*
    do
        dev="$(basename "$dev_path")"
        echo "  - Resetting device '$dev' ..."
        printf '%s' "$dev" | sudo tee "$usb_std/unbind" > /dev/null
        sleep "$sleep_secs"
        printf '%s' "$dev" | sudo tee "$usb_std/bind" > /dev/null
        echo "    done."
    done
    echo "  done."
done
echo "done."
```

-----

## KVM (Keybaord Video Monitor) Switch

- [ATEN CS1924m KVM](https://assets.aten.com/product/manual/cs1922m-cs1924m_um_w_2021-10-08.pdf)
- Script for KVM: `/etc/igel/kms/kvm-workaround.sh`

-----

## USB always on (Printer, Scanner, Audio, etc.)

System > Firmware Customization > Custom Commands > Desktop

```bash linenums="1"
echo on | tee /sys/bus/usb/devices/*/power/level > /dev/null
```