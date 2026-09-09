IGEL OS Creator  
===============

Firmware version 12.7.3  
Release date 2025-10-28  
Last update of this document 2025-10-28  


Supported Devices  
-------------------------------------------------------------------------------

[> Supported IGEL OS 12 devices](https://kb.igel.com/os12-supported-hardware)


Component Versions
-------------------------------------------------------------------------------

| Components                                |                                  |
|-------------------------------------------|----------------------------------|
| MESA OpenGL Stack                         | 25.0.3-1igel1744090649           |
| VDPAU Library Version                     | 1.5-2                            |
| Graphics Driver INTEL                     | 2.99.917+git20210115-1igel1654609037     |
| Graphics Driver ATI/RADEON                | 22.0.0-1igel1704966675           |
| Graphics Driver ATI/AMDGPU                | 23.0.0-1igel1705669076           |
| Graphics Driver Nouveau (Nvidia Legacy)   | 1.0.18-1igel1739362211           |
| Graphics Driver VMware                    | 13.3.0-3igel1713934792           |
| Graphics Driver QXL (Spice)               | 0.1.6-1igel1687782644            |
| Graphics Driver FBDEV                     | 0.5.0-2igel1654609009            |
| Graphics Driver VESA                      | 2.6.0-2igel1739365508            |
| Input Driver Evdev                        | 2.11.0-1igel1738822597           |
| Input Driver Elographics                  | 1.4.3-1igel1678083379            |
| Input Driver Synaptics                    | 1.9.2-1+b1igel1683803726         |
| Input Driver VMMouse                      | 13.1.0-1ubuntu2igel1628499891    |
| Input Driver Wacom                        | 1.2.3-1igel1738566034            |
| Kernel                                    | 6.12.20 #mainline-lxos12-g1760430111     |
| Xorg X11 Server                           | 21.1.16-1.3igel1750654224        |
| Lightdm Graphical Login Manager           | 1.26.0-8igel1756470008           |
| XFCE4 Window Manager                      | 4.14.5-1~18.04igel1643191202     |
| ISC DHCP Client                           | 4.4.3-P1-2                       |
| ModemManager                              | 1.22.0-3+b2igel1731393568        |
| WebKit2Gtk                                | 2.48.7-1igel1758790938           |
| Python3                                   | 3.11.2                           |
| Virtualbox Guest Utils                    | 7.1.10-dfsg-1igel1749619644      |
| Virtualbox X11 Guest Utils                | 7.1.10-dfsg-1igel1749619644      |
| Open VM Tools                             | 12.2.0-1+deb12u3                 |
| Open VM Desktop Tools                     | 12.2.0-1+deb12u3                 |


Release Notes of installable IGEL OS 12 base system
================================================================================

# Changes since: 12.7.2

## New Features
- Added: Enabled BTF (BPF Type Format) in the kernel to provide additional type information for security software.
- Added: In Setup Assistant, users can now enter an optional structure tag before onboarding with their email address.
- **Hardware**
	- Added hardware support for Lenovo ThinkStation P3 Ultra SFF Gen2.
	- Added hardware support for LG Gram 14Z(D)90RU
	- Added special function key support for LG Gram 14Z(D)90RU:
	    - Fn+F2: Brightness down
	    - Fn+F3: Brightness up
	    - Fn+F5: Touchpadd on/off
	    - Fn+F6: Airplane mode on/off
	    - Fn+F7: Display configuration
	    - Fn+F8: Keyboard backlight
	    - Fn+F9: Reader mode
	    - Fn+F10: Volume off
	    - Fn+F11: Volume down
	    - Fn+F12: Volume up
	- Added support for newer Intel GPUs with the XE driver.
	Added registry key for XE DRM Intel driver
		|  Parameter  |  Registry   |  Type       |  Value      |  Range      |
		| ------ | ------ | ------ | ------ | ------ |
		|  `Prefer XE DRM kernel driver over i915 one.`  |  `x.drivers.intel.prefer_xe`  |  bool  |  *Auto*  |  [Auto][True][False]  |
		|  `Disable the loading of the xe DRM driver.`  |  `x.drivers.intel.disable_xe`  |  bool  |  enabled / *disabled* (default)  |  |
	- Added hardware support for Lenovo V100q
- **IGEL Desktop**
	- Added ability to lock down the file chooser to its initial startup folder. When the registry key userinterface.gtk.filechooser.lock_to_startup_folder is enabled, users can no longer browse the filesystem using the path bar or side panel buttons in the file chooser.
		|  Parameter       |  Registry        |  Value           |
		| ------ | ------ | ------ |
		|  `Access only to initial folder`  |  `userinterface.gtk.filechooser.lock_to_startup_folder`  |  enabled / **disabled** (default)   |
- **OSCW**
	- Added support for 802.1x network settings and certificate rollout via OSCW during conversion to IGEL OS12.

## Security Fixes
- Updated Intel Microcode to version 20250812.
- Updated AMD cpu microcode to version from July 29 2025.
- Fixed udisks2 security issue CVE-2025-8067.
- Fixed ffmpeg security issues CVE-2025-22919, CVE-2025-0518, CVE-2024-35368, CVE-2024-35367, CVE-2024-31582, CVE-2023-6605, CVE-2023-6604, CVE-2023-6602, CVE-2023-50008, CVE-2023-50007 and CVE-2023-49502.
- Fixed libxml2 security issues CVE-2025-7425, CVE-2025-6170, CVE-2025-6021, CVE-2025-49796 and CVE-2025-49794.
- Fixed libxslt security issues CVE-2025-7424 and CVE-2023-40403.
- Fixed wpa security issue CVE-2022-37660.
- Fixed glibc security issue CVE-2025-8058.
- Fixed libsoup3 security issues CVE-2025-8058, CVE-2024-52531, CVE-2024-52532, CVE-2025-32051, CVE-2025-32052, CVE-2025-32053, CVE-2025-32050, CVE-2025-2784, CVE-2025-2784, CVE-2024-52531, CVE-2024-52532, CVE-2024-52531, CVE-2024-52530, CVE-2025-32909, CVE-2025-32910, CVE-2025-32911, CVE-2025-32913, CVE-2025-46420, CVE-2025-32910, CVE-2025-32912, CVE-2025-32906 and CVE-2025-46421.
- Fixed setuptools security issue CVE-2025-47273.
- Fixed libarchive security issues CVE-2025-5917, CVE-2025-5916, CVE-2025-5915 and CVE-2025-5914.
- Fixed cjson security issues CVE-2025-57052, CVE-2023-53154 and CVE-2023-26819.
- Fixed curl security issue CVE-2023-27534.
- Fixed expat security issues CVE-2024-8176, CVE-2024-50602 and CVE-2023-52425.
- Fixed iperf3 security issues CVE-2025-54350 and CVE-2025-54349.
- Fixed jq security issue CVE-2025-48060.
- Fixed openjpeg2 security issue CVE-2025-50952.
- Fixed perl security issues CVE-2025-40909 and CVE-2023-31484.
- Fixed libsndfile security issues CVE-2024-50612 and CVE-2022-33065.
- Fixed sqlite3 security issue CVE-2025-6965.
- Fixed python-zipp security issue CVE-2024-5569.
- Fixed cups security issues CVE-2025-58364 and CVE-2025-58060.
- Fixed webkit2gtk security issues CVE-2025-6558, CVE-2025-43368, CVE-2025-43356, CVE-2025-43342, CVE-2025-43272, CVE-2025-43265, CVE-2025-43240, CVE-2025-43228, CVE-2025-43227, CVE-2025-43216, CVE-2025-43212, CVE-2025-43211, CVE-2025-31278, CVE-2025-31273, CVE-2025-31257, CVE-2025-31215, CVE-2025-31206, CVE-2025-31205, CVE-2025-31204, CVE-2025-24223, CVE-2025-24189, CVE-2023-42970 and CVE-2023-42875.
- Fixed openssl security issues CVE-2025-9232 and CVE-2025-9230.
- Fixed libarchive security issues CVE-2025-5917, CVE-2025-5916, CVE-2025-5915, CVE-2025-5914, CVE-2025-1632, CVE-2024-26256 and CVE-2024-20696.

## Resolved Issues
- Fixed ghostscript font substitution of Microsoft web fonts like Arial.
- Fixed: When the system is configured as a Wake-on-LAN proxy, shutdown, reboot, or suspend operations are now properly inhibited. A warning notification is displayed to inform users that the system must remain running permanently.
- Fixed issue where "Lid close action" = "Turn off display" causes external screen to turn off only when internal screen is disabled before lid is closed
- The shortcut key combinations CTRL + ALT + Numpad (+) and CTRL + ALT + Numpad (−) are now correctly recognized within Remote Desktop sessions.
- Fixed: Damaged filesystem after power loss.
- **WiFi**
	- Fixed connection issues with mt7925e Wi-Fi driver.
- **Shadowing/VNC**
	- Fixed mouse cursor handling with Shadowing/VNC:
	- Added `Cursor Options` parameter:
	 - Fixed-arrow: The viewer always sees a fixed arrow, regardless of the client’s cursor.
	 - Dynamic: The cursor shape changes dynamically; the viewer sees client's cursor shapes.
	 - Dynamic + Fixed-arrow: The viewer sees both, the fixed arrow and the client's cursor.
		|  Parameter  |  Registry   |  Range      |  Value      |
		| ------ | ------ | ------ | ------ |
		|  `Cursor Options`  |  `network.vncserver.cursor_mode`  |  [Fixed-arrow (Default)][Dynamic][Dynamic+Fixed-arrow]  |  *Fixed-arrow (Default)*  |
- **Audio**
	- Fixed: Audio speaker behavior on Lenovo M75q Gen 5 (AMD) when a jack was inserted. Both devices can now be selected and are working correctly.
	- Fixed: Volume set by UMS was only applied after a reboot; it now correctly takes effect whenever a new device is connected.
- **Hardware**
	- Added registry key to encapsulate the fix for "keyboard input loss in screen lock after monitor changes, such as when adding or removing a docking station".
		|  Registry    |  Range       |
		| ------ | ------ |
		|  `x.xserver0.quirks.hotplug_lockscreen`  |  [ *default* ][always][never]                        |
	- Fixed device type for Lenovo V100q in "About" page.
- **Remote Management**
	- Fixed CIC profiles using custom data partition.
	- Fixed exceeded string limit of the error string in the apps status disturbing the UMS communication.
	- Fixed visibility of user notifications — messages and dialogs related to remote management now appear on the lock screen.
	- Fixed a possible failure of the remote management while interacting with the IGEL apps management.
- **IGEL Desktop**
	- Fixed wrong reset of mirror mode to custom mode in display tray app.
	- Fixed: Keyboard input loss in screen lock after monitor changes, such as when adding or removing a docking station.
	- Fixed long (5 min) boot time when local Window Manager is disabled.
		|  Parameter  |  Registry  |  Type  |  Value  |
		| ------ | ------ | ------ | ------ |
		|  `Local Windows Manager for this Display`  |  `windowmanager.wm0.enabled`  |  bool  |  *enabled* (default) / disabled  |
- **Virtualization**
	- Fixed IGEL OS running as a virtual machine on a SINA Workstation S:
		- Added detection method to identify SINA WS host from IGEL OS.
		- Removed the VBoxClient clipboard and drag&drop services.
		- Added VBoxClient vmsvga support.
	- Revised VirtualBox service detection

## Known Issues
- In very rare cases all apps are lost after an update. Should this be the case, an error message is shown "Opening system App Journal failed." - if the device is manged, the apps will be reinstalled after a reboot.
- Increased writeable cache partition size (by default). First boot with 12.4.x and newer may take more time (once) when updating from a 12.2.x or older base system app.
- Automatic proxy configuration: PAC file URL does not support https scheme.
- When TPM PCR+PIN device encryption is enabled, an additional PIN entry is required the first time a new base system release is booted.
- **App Management**
	- Downgrades to versions prior to 12.7.0 are possible - despite the implemented downgrade limit - via the Local App Portal or using igelpkgctl through local terminal. In UMS-managed environments, disabling the Local App Portal is recommended to ensure version control. If the older shim bootloader signature (in 12.6.1 PR1 or earlier) is revoked and Secure Boot is enabled, the device may become unbootable. Verify boot compatibility before downgrading.
- **Chromium**
	- Downgrading base system to earlier versions may result in reset of the Chromium profile partition.
- **Network**
	- In some cases, network is not working in combination of Lenovo K14 Gen1 (AMD) and Lenovo Universal Dock. There is a kernel bugreport open but no proper fix so far.
	- Device configured as Wake on LAN proxy can be shut down by the user or admin
	- Proxy passthrough authentication together with AD auto logon does work despite of shown error message during logon.
- **WiFi**
	- WiFi chipset BE200 does not work reliable in WiFi 7 networks.
- **HID**
	- Some touchpads are recognized as touchpad and mouse. This results in showing possible user settings for both variants.
- **Setup Assistant**
	- Timezone auto-detection is currently not functional (due to discontinued location service). The timezone must be set manually (as interims / alternative solution).
- **Audio**
	- Headset mic via jack is not working on LG 27CN650 and LG 34CN650.
	- Audio devices may not be available in audio tray app. Workaround: Enable Pulseaudio backend by registry key:
		|  Parameter  |  Registry   |  Range      |  Value      |
		| ------ | ------ | ------ | ------ |
		|  `Audiobackend`  |  `multimedia.audiobackend`  |  [pipewire][pulseaudio]  |  *pipewire*  |
	- The Audio Tray App may incorrectly display a plugged-in Audio-Jack-Headset as Built-in Audio / HDMI / DiplayPort instead of the correct headset name. Audio and Microphone functionality would still work correctly.
- **Multimedia**
	- Lenovo L13 Gen5 and L14 Gen5  Intel video codec errors (graphic glitches during accelerated video playback)
- **Hardware**
	- Wake on LAN is not functional on Lenovo K14 Gen1
	- Built-in fingerprint sensor is not supported on HP mt440 G3 and mt645 G7/G8.
	- If using 6 x 4K@60Hz monitors on HP t755/t740 with the additional graphic card, one or two of the monitors may stay black after coming back from DPMS off state.
	  This is caused by using the additional graphic card as primary, which only has 512MB VRAM (the VRAM is not sufficient in this configuration). Possible solution: Increasing the VRAM size of the iGPU to 2048MiB in BIOS (maybe 1024MiB may also work) and activate IGEL registry key `x.drivers.swap_card0_with_card1` so the iGPU will become the Primary GPU. Connector names will be changed with that!
	- Wake up from suspend via UMS does not work on HP mt645 G7 devices. Workaround: Disable system suspend and use shutdown instead.
	- Rotation of displays connected to the Lenovo ThinkPad USB-C Hybrid Dock may fail.
	- Display configuration of displays connected to HP G5 Docking Station may fail on HP t655. Furthermore displays connected to HP G5 Docking Station may not work anymore after system suspend and resume independent from the used hardware.
	- On Lenovo ThinkPad L13 Intel Gen5, the functions keys Ctrl+Fn+F9, Ctrl+Fn+F10 and Ctrl+Fn+F11 are not mapped.
	- On Lenovo ThinkPad models equipped with AMD graphics, when connected to a USB-C Universal Dock driving multiple 4K displays via DisplayPort, system boot or reboot may result in incomplete display initialization. In these cases, one or more external displays may remain black while others function normally. Disconnecting and reconnecting the dock restores full multi-display functionality.
	- When using an HP G5 Dock, disconnecting and reconnecting the dock may cause display configurations (such as display order, resolution, and orientation) to be lost. After reconnection, displays may revert to default settings, requiring manual reconfiguration. For some devices, this issue can be mitigated by setting the registry key `x.xserver0.quirks.dp_mst_hotplug` to “Never.”
- **Dual Boot BC/DR (IGEL OS)**
	- The IGEL Dual Boot menu sometimes does not accurately reflect the presence of a UD-Pocket:
	  - If the "fast boot" BIOS option is turned on for HP devices, the state won't be updated between reboots. Turning off "fast boot" provides accurate detection.
	  - The boot loader doesn't currently detect UD Pockets on Lenovo devices. Using the Lenovo boot menu (F12) allows booting from UD Pockets directly but the "fast boot" BIOS option also interfere with the detection of USB boot devices.
- **IGEL Desktop**
	- On-screen keyboard sporadically crashes when typing.
	- If two monitors are configured in a vertical layout (one above the other), and those monitors are configured with "auto-detect" resolution, saving leads to a wrong layout order.
	- There are some UI elements that are not yet translated in all available user interface languages.
	- In very rare cases, the Start menu or panel may not be visible after boot. A reboot will restore visibility in such cases.
- **Licensing**
	- Manual deployment of add-on licenses for IGEL Agent for Imprivata licenses (via UMS) is only possible after finished installation of IGEL Agent for Imprivata app on device.
	- Endpoints that have a Starter License but no Workspace Edition license will not receive device settings or app management from UMS if add-on licenses are installed.
	Workaround: Either remove the add-on licenses or assign a valid Workspace Edition (or Workspace Edition Demo) license.
- **Mobile Broadband**
	- F11 flight mode function key does not switch off mobile broadband on HP Elite mt645 G7. (Deactivate mobile broadband in Network / Mobile Broadband settings)
