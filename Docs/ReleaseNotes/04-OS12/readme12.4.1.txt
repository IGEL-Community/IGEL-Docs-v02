IGEL OS Creator  
===============

Firmware version 12.4.1  
Release date 2024-05-31  
Last update of this document 2024-05-31  


Supported Devices  
-------------------------------------------------------------------------------

[> Supported IGEL OS 12 devices](https://kb.igel.com/os12-supported-hardware)


Component Versions
-------------------------------------------------------------------------------

| Components                                |                                  |
|-------------------------------------------|----------------------------------|
| OpenSSL                                   | 1.1.1f-1ubuntu2.21               |
| Bluetooth Stack (bluez)                   | 5.71-1igel1704700934             |
| MESA OpenGL Stack                         | 24.0.5-1igel1714385672           |
| VDPAU Library Version                     | 1.5-2igel1677954724              |
| Graphics Driver INTEL                     | 2.99.917+git20210115-1igel1647250103     |
| Graphics Driver ATI/RADEON                | 19.1.0-3igel1657777718           |
| Graphics Driver ATI/AMDGPU                | 23.0.0-1igel1677481842           |
| Graphics Driver Nouveau (Nvidia Legacy)   | 1.0.17-2igel1644486678           |
| Graphics Driver Nvidia                    | 525.147.05-0ubuntu0.20.04.1      |
| Graphics Driver VMware                    | 13.3.0-3igel1628859075           |
| Graphics Driver QXL (Spice)               | 0.1.5-3+git20200331-2igel1647014792    |
| Graphics Driver FBDEV                     | 0.5.0-2igel1644486279            |
| Graphics Driver VESA                      | 2.5.0-1+b1igel1647004096         |
| Input Driver Evdev                        | 2.10.6-2+b1igel1647004239        |
| Input Driver Elographics                  | 1.4.3-1igel1678083379            |
| Input Driver Synaptics                    | 1.9.2-1+b1igel1683803726         |
| Input Driver VMMouse                      | 13.1.0-1ubuntu2igel1628499891    |
| Input Driver Wacom                        | 0.39.0-0ubuntu1igel1629136980    |
| Kernel                                    | 6.6.22 #mainline-lxos12-g1716531569    |
| Xorg X11 Server                           | 21.1.12-1igel1714385806          |
| Lightdm Graphical Login Manager           | 1.30.0-0ubuntu4~20.04.2igel1649274243      |
| XFCE4 Window Manager                      | 4.14.5-1~18.04igel1643191202     |
| ISC DHCP Client                           | 4.4.1-2.1ubuntu5.20.04.5         |
| ModemManager                              | 1.22.0-3igel1706595056           |
| WebKit2Gtk                                | 2.42.5-1igel1707390006           |
| Python3                                   | 3.8.10                           |
| Virtualbox Guest Utils                    | 7.0.8-dfsg-2igel1682408222       |
| Virtualbox X11 Guest Utils                | 7.0.8-dfsg-2igel1682408222       |
| Open VM Tools                             | 11.3.0-2ubuntu0~ubuntu20.04.7    |
| Open VM Desktop Tools                     | 11.3.0-2ubuntu0~ubuntu20.04.7    |
| Xen Guest Utilities                       | 7.10.0-0ubuntu2                  |
| Spice Vdagent                             | 0.22.1-3+b2igel1680584586        |
| Qemu Guest Agent                          | 8.0.4+dfsg-3+b1igel1692901316    |


Release Notes of installable IGEL OS 12 base system
================================================================================

# Changes since: 12.4.0

## New Features
- Changed default of power saving settings for screen getting dimmed to 20% after 120 seconds inactivity.
	|  Setup  |  Parameter  |  Registry  |  Type  |  Value  |
	| ------ | ------ | ------ | ------ | ------ |
	|  `System > Power Options > Display > Brightness Reduction`  |  `On inactivity reduce to`  |  `x.xserver%.brightness_level_ac`  |  integer  |  20 *Default*  |
	|  `System > Power Options > Display > Brightness Reduction`  |  `Reduce after`  |  `x.xserver%.brightness_on_ac`  |  integer  |  120 *Default*  |
	|  `System > Power Options > Display > Brightness Reduction`  |  `Reduce after`  |  `x.xserver%.brightness_on_battery`  |  integer  |  120 *Default*  |
- Added further registry keys for influencing power consumption (Auto means active on all Lenovo devices with battery):
	|  Parameter  |  Registry   |  Range      |  Value      |  Type       |
	| ------ | ------ | ------ | ------ | ------ |
	|  `Call idle actions on battery after this time of inactivity (greater 10 seconds, value 9 or lower is never)`  |  `system.powersave.idle_action_on_battery`  |  |  50 *Default*  |  integer  |
	|  `Use powertop auto tune to reduce power usage`  |  `system.powersave.powertop_auto_tune`  |  [Auto][Enable][Disable]  |  *Auto*  |  |
	|  `Use laptop mode to reduce power usage`  |  `system.powersave.laptop_mode`  |  [Auto][Enable][Disable]  |  *Auto*  |  |
	|  `Clock down AMDGPU if system is idle (idle action time reached).`  |  `system.powersave.clock_down_amdgpu_on_idle`  |  [Auto][Enable][Disable]  |  *Auto*  |  |
	|  `Clock down Intel GPU if system is idle (idle action time reached).`  |  `system.powersave.clock_down_i915_on_idle`  |  [Auto][Enable][Disable]  |  *Auto*  |  |
	|  `Set Ryzen CPU to power save mode if system is idle (idle action time reached).`  |  `system.powersave.use_ryzenadj_on_idle`  |  [Auto][Enable][Disable]  |  *Auto*  |  |
	|  `Set Intel CPU to power save mode if system is idle (idle action time reached).`  |  `system.powersave.use_energy_policy_on_idle`  |  [Auto][Enable][Disable]  |  *Auto*  |  |
	|  `Call idle actions on AC after this time of inactivity (greater 10 seconds, value 9 or lower is never)`  |  `system.powersave.idle_action_on_ac`  |  |  50 *Default*  |  integer  |
- Updated kernel to version 6.6.22
- Added option to set hardware clock. The default, Auto, will look for Windows partitions and, if present, assume that Windows is installed and the real time clock is set to local time.
	|  Setup  |  Parameter   |  Registry    |  Range  |
	| ------ | ------ | ------ | ------ |
	|  System > Time and Date  |  `HW clock timezone`   |  `system.time.hwclock_timezon`  |  [Auto (default)] [UTC] [localtime]  |
- Added: Strace and tcpdump debug tools are part of IGEL OS base system.
- Added usage of minimal cursor size in X11 which helps reducing power consumption on Intel devices.
 - Added Registry key to disable minimal cursor size quirk:
	|  Parameter  |  Registry   |  Type       |  Value      |
	| ------ | ------ | ------ | ------ |
	|  `Disable minimal cursor size quirk.`  |  `x.drivers.modesetting.no_min_cursor_size`  |  bool  |  enabled / *disabled* (default)  |
- **OSC Installer**
	- Changed the size of the dummy partition from 1GB to 100MB or 10MB, depending on the storage capacity.
	- Added installation option `Force Legacy (non UEFI) boot`. If enabled, BIOS boot will be used for installed IGEL OS - even if OSC was started in EFI mode
	  - In OS 11 the option is known as `Force Legacy`.
	- Added new options for factory image creation:
	  - With the "Reset after first boot" option a deployed image can be tested and any change is resetted after boot.
	  -  With the "Automatically shutdown at first boot" option a deployed image does a self-check and automatically shuts down afterwards. A log file of this deployment self-check is written to the 1st partition.
	- Changed: Reduced size of 1st partition on UD Pocket - effective with new installations (via OSC) or factory deployment of 12.4.1 or later.
- **WiFi**
	- Added option for DHCP refresh after roaming (within the same network).
		|  Parameter  |  Registry   |  Type       |  Value      |
		| ------ | ------ | ------ | ------ |
		|  `Refresh DHCP after roaming`  |  `network.interfaces.wirelesslan.device0.roam_refresh_dhcp`  |  bool  |  enabled / *disabled* (default)  |
- **Print-Center**
	- Added print-center tray app to search and connect local or network printers. The tray app requires the CUPS printing app and uses Avahi to discover available network printers. For best results use CUPS printing app >= 1.2.0 older versions do not support auto discovery.
		 - New parameter were added to enable/disable the tray app and to enable/disable Avahi for auto discovery
			|  Setup  |  Parameter  |  Registry  |  Type  |  Value  |
			| ------ | ------ | ------ | ------ | ------ |
			|  `Apps > Avahi Daemon`  |  `Enable the Avahi daemon`  |  `app.avahi_daemon.enable`  |  boolean  |  true *default* / false  |
			|  `User Interface > Desktop > Taskbar Items`  |  `Show print-center tray icon on desktop`  |  `userinterface.system_tray.printer.desktop`  |  boolean  |  true *default* / false  |
			|  `User Interface  > Screenlock / Screensaver > Taskbar`  |  `Show print-center tray icon on screenlock`  |  `userinterface.system_tray.printer.lockscreen`  |  boolean  |  true / false *default*  |
- **Audio**
	- Changed: On first boot (after installation) all devices are set to 50% volume.
- **Hardware**
	- Added support for Quectel CAT16 WW SKU - EM160R-GL Gen2 and Quectel CAT 6 WW SKU - EM061K-GL on Lenovo ThinkPads L14 Intel/AMD Gen5 and L16 Intel/AMD Gen1
	- Added hardware support for Lenovo ThinkPad L14 Intel Gen5.
	- Added support for Poly Voyager Focus 2.
	- Added hardware support for HP Elite mt645 G8.
	- Changed energy savings settings for HP Elite mt645 G8.
- **Remote Management**
	- Added option to set rank of UMS connectors. UMS version 12.04.120 or later is required.
		|  Parameter   |  Registry    |  Type        |  Value       |
		| ------ | ------ | ------ | ------ |
		|  `connector type`   |  `system.remotemanager.connector%.type`           |  string                                |  ums/icg/*undefined*(default)      |
	- This parameter is set automaticly by UMS.
		|  Parameter   |  Registry    |  Type        |  Value       |
		| ------ | ------ | ------ | ------ |
		|  `Ranking of connectors`   |  `system.remotemanager.connectorranking`           |  string                                |  *no preference*(default) / prefer UMS /   prefer ICG  |
	-  If connectorranking is set to "prefer ICG", the rmagent tries to connect to an ICG and only connects to an UMS server, if no ICG is reachable or configured.
	-  If connectorranking is set to "prefer UMS", the rmagent tries to connect to an UMS and only connects to an ICG, if no UMS is reachable or configured.
	-  If connectorranking is set to "no preference", the rmagent connects randomly to any configured device-connector.
- **SSO**
	- Changed / renamed Azure AD IDP to Microsoft Entra ID.
	- Changed / improved error messages for SSO login.

## Security Fixes
- Fixed tiff security issues CVE-2023-6277, CVE-2023-6228 and CVE-2023-52356.
- Fixed libxml2 security issue CVE-2024-25062.
- Fixed python-cryptography security issue CVE-2023-50782.
- Fixed dnsmasq security issues CVE-2023-50868 and CVE-2023-50387.
- Fixed vim security issue CVE-2024-22667.
- Fixed nss security issues CVE-2023-6135, CVE-2023-5388 and CVE-2023-4421.
- Fixed shadow security issue CVE-2023-4641.
- Fixed glibc security issue CVE-2024-2961.
- Fixed gnutls28 security issue CVE-2024-28834.
- Fixed nghttp2 security issue CVE-2024-28182.
- Fixed pillow security issue CVE-2024-28219.
- Fixed less security issue CVE-2024-32487.
- Fixed xorg-server security issues CVE-2024-31080, CVE-2024-31081 and CVE-2024-31083.
- Added registry key to enable support for byteswapped clients, disabled by default for security reasons:
	|  Parameter  |  Registry   |  Type       |  Value      |
	| ------ | ------ | ------ | ------ |
	|  `Enable support for byteswapped X clients.`  |  `x.xserver%.allowbyteswappedclients`  |  bool  |  enabled / *disabled* (default)  |

## Resolved Issues
- Fixed: UMS connectors are shown only once in setup.
- Fixed: Proxy configuration issue in combination with AD/Kerberos
- **Network**
	- Fixed network configuration on Hyper-V virtualization.
- **Custom Partition**
	- Improved custom partition handling on slow devices - to avoid timeout.
	- Fixed custom partition download by adding UMS trust-store certificates to the valid chain for download. Additionally the host name check was removed and more debug output is generated.
- **Hardware**
	- Fixed missing firmware file for intel 9462ngw WiFi chipset.
- **Remote Management**
	- Implemented automatic upgrade of a valid UMS registration to Unified Protocol if the device was upgraded by the IGEL OSC12 remaining old settings.
	- Fixed installing of TLS certificates assigned by the UMS into the web browser's CA certificates storage.
- **IGEL Desktop**
	- Fixed: Set audio volume back to 100% after disabling overamplification.
- **Mobile Broadband**
	- Fixed: On devices supporting mobile broadband (physical) and eSim, an automatic switch to the physical SIM slot is performed if eSim has no profile assigned.

## Known Issues
- Browser apps may not recognize custom certificates rolled out via UMS file transfer. The certificates are not correctly synchronized in the browser specific certificate stores/databases.
- Increased writeable cache partition size (by default). First boot with 12.4.x may take more time (once) when updating from a 12.2.x or older base system app.
- In very rare cases all apps are lost after an update. Should this be the case, an error message is shown "Opening system App Journal failed." - if the device is manged, the apps will be reinstalled after a reboot.
- The downgrade to base system 12.00.900 or 12.00.910 is not supported.
- **Chromium**
	- Downgrading base system to earlier versions may result in reset of the Chromium profile partition.
- **Network**
	- In some cases, network is not working in combination of Lenovo K14 Gen1 (AMD) and Lenovo Universal Dock. There is a kernel bugreport open but no proper fix so far.
- **WiFi**
	- Globally configured WiFi static IP is not used if establishing WiFi connection via WiFi system tray
- **HID**
	- Some touchpads are recognized as touchpad and mouse. This results in showing possible user settings for both variants.
- **Setup Assistant**
	- Timezone auto-detection is currently not functional (due to discontinued location service). The timezone must be set manually (as interims / alternative solution).
- **Audio**
	- Headset mic via jack is not working on LG 27CN650 and LG 34CN650.
- **Hardware**
	- L14 Gen5 video codec errors (graphic glitches during accelerated video playback)
	- L14 Gen5 mic mute function button LED will always stay on
	- L14 Gen5 display brightness can be completely turned off
	- L14 Gen5 Intel disconnect / reconnect of LAN takes unusal long
	- The suspend/resume functionality on HP mt645 G8 laptops is currently broken due to an incompatibility with recent BIOS versions and the Linux 6.6.x kernel. As a result, affected laptops won't resume or resume incompletely and have to be restarted.
	- Display configuration of displays connected to HP G5 Docking Station may fail on HP t655.
	- Rotation of displays connected to the Lenovo ThinkPad USB-C Hybrid Dock may fail.
	- Wake up from suspend via UMS does not work on HP mt645 G7 devices. Workaround: Disable system suspend and use shutdown instead.
	- If using 6 x 4K@60Hz monitors on HP t755/t740 with the additional graphic card, one or two of the monitors may stay black after coming back from DPMS off state.
	 - This is caused by using the additional graphic card as primary, which only has 512MB VRAM (the VRAM is not sufficient in this configuration). Possible solution: Increasing the VRAM size of the iGPU to 2048MiB in BIOS (maybe 1024MiB may also work) and activate IGEL registry key `x.drivers.swap_card0_with_card1` so the iGPU will become the Primary GPU. Connector names will be changed with that!
	- Built-in fingerprint sensor is not supported on HP mt440 and mt645 G7/G8.
	- Wake on LAN is not functional on Dell OptiPlex 3000 and Lenovo K14 Gen1
- **IGEL Desktop**
	- Connecting a new audio device during running audio playback / stream may result in failure of audio tray.
	- External display mode not functional on ThinkPad L14 Gen3 AMD
	- Disabled compositing (transparency effects) in window manager to circumvent issues with screen lock. Registry key `windowmanager.wm0.variables.usecompositing` is not configurable anymore.
	- If two monitors are configured in a vertical layout (one above the other), and those monitors are configured with "auto-detect" resolution, saving leads to a wrong layout order.
	- On-screen keyboard sporadically crashes when typing.
- **Licensing**
	- Manual deployment of add-on licenses for IGEL Agent for Imprivata licenses (via UMS) is only possible after finished installation of IGEL Agent for Imprivata app on device.
