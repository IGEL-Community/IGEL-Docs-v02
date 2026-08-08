IGEL OS Creator  
===============

Firmware version 12.7.5  
Release date 2026-02-09  
Last update of this document 2026-02-09  


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
| Kernel                                    | 6.12.20 #mainline-lxos12-g1769149139     |
| Xorg X11 Server                           | 21.1.20-1igel1761803077          |
| Lightdm Graphical Login Manager           | 1.26.0-8igel1756470008           |
| XFCE4 Window Manager                      | 4.14.5-1~18.04igel1643191202     |
| ISC DHCP Client                           | 4.4.3-P1-2                       |
| ModemManager                              | 1.22.0-3+b2igel1731393568        |
| WebKit2Gtk                                | 2.50.1-1~deb12u1igel1761716819   |
| Python3                                   | 3.11.2                           |
| Virtualbox Guest Utils                    | 7.1.10-dfsg-1igel1749619644      |
| Virtualbox X11 Guest Utils                | 7.1.10-dfsg-1igel1749619644      |
| Open VM Tools                             | 12.2.0-1+deb12u4                 |
| Open VM Desktop Tools                     | 12.2.0-1+deb12u4                 |


Release Notes of installable IGEL OS 12 base system
================================================================================

# Changes since: 12.7.4

## New Features
- Added support for Hebrew keyboard layout. This is configurable on User Interface > Language setup page.
- **HID**
	- Added new `Multitouch Gestures` setup page in IGEL Setup.
	    - This new page can be found in User Interface > Input > Touchscreen.
	- Added new parameters for handling different touchscreen gestures.
		|  Parameter  |  Registry   |  Type       |  Value      |
		| ------ | ------ | ------ | ------ |
		|  `3 fingers swipe down to show desktop`  |  `userinterface.touchscreen.multitouchgestures.threefingershowdesktop`  |  bool  |  enabled / *disabled* (default)  |
		|  `Enable multitouch gestures`  |  `userinterface.touchscreen.multitouchgestures.enabled`  |  bool  |  enabled / *disabled* (default)  |
		|  `2 fingers right click`  |  `userinterface.touchscreen.multitouchgestures.twofingersrightclick`  |  bool  |  enabled / *disabled* (default)  |
		|  `2 fingers scroll`  |  `userinterface.touchscreen.multitouchgestures.twofingerscroll`  |  bool  |  enabled / *disabled* (default)  |
	    - `2 fingers scroll` : Enables scrolling in all directions (left, right, up and down).
	    - `3 fingers swipe down to show desktop` : If the desktop is already being shown, restore all the windows.
- **Driver**
	- Added Linux bonding driver module
- **Hardware**
	- Added hardware support for Lenovo ThinkStation P3 Tiny Gen 2.
	- Added hardware support for Lenovo ThinkCentre Neo 50q Gen 5.
	- Added hardware support for Esterline Medigenic keyboard.
	- Added hardware support for LG 24CR660 and LG 24CR661.
	- Added Quectel EM160R-GL WWAN and Quectel RM520N-GL WWAN support for Lenovo T14 Gen 6 (AMD).
- **Accessibility**
	- Added: Accessibility option to magnify on-screen content.
		- Path: IGEL Setup -> User Interface -> Accessibility -> Screen magnifier
- **SSO**
	- Added support for configurable SSO redirect URIs. While the default remains `http://localhost/callback`, using `http://127.0.0.1/callback` is now recommended. Ensure the configured value matches the redirect URI in your Identity Provider (IdP).
		|  Parameter  |  Registry   |  Type       |  Value      |
		| ------ | ------ | ------ | ------ |
		|  `Redirect URI`  |  `auth.cloudidp.redirect_uri`  |  string  |  http://localhost/callback *Default*  |

## Security Fixes
- Fixed pam security issue CVE-2025-6020.
- Fixed open-vm-tools security issue CVE-2025-41244.
- Fixed openvpn security issues CVE-2025-13086 and CVE-2025-12106.
- Fixed gdk-pixbuf security issue CVE-2025-7345.
- Fixed cups-filters security issues CVE-2025-64524, CVE-2025-64503 and CVE-2025-57812.
- Fixed samba security issues CVE-2018-14628, CVE-2025-10230 and CVE-2025-9640.
- Fixed libpng1.6 security issues CVE-2025-66293, CVE-2025-65018, CVE-2025-64720, CVE-2025-64506 and CVE-2025-64505.
- Fixed libsodium security issue CVE-2025-69277.
- Fixed libssh security issues CVE-2025-8277, CVE-2025-8114, CVE-2025-5987, CVE-2025-5372, CVE-2025-5351, CVE-2025-5318, CVE-2025-4878 and CVE-2025-4877.
- Fixed libxml2 security issues CVE-2025-9714 and CVE-2025-7425.
- Fixed gnupg2 security issue CVE-2025-68973.
- Fixed rsync security issue CVE-2025-10158.
- Fixed qemu security issue CVE-2025-11234.
- Fixed nvidia-graphics-drivers security issues CVE-2025-23286 and CVE-2025-23279.
- Fixed llvm-toolchain-19 security issue CVE-2024-7883.
- Fixed libarchive security issue CVE-2025-60753.

## Resolved Issues
- Fixed calendar appearing on the wrong screen in a multi-monitor configuration
- Improved mouse acceleration configuration
	|  Parameter  |  Registry   |  Type       |  Value      |
	| ------ | ------ | ------ | ------ |
	|  `Enable mouse acceleration (only for new accel variant)`  |  `userinterface.mouse.enable_acceleration`  |  bool  |  *enabled* (default) / disabled  |
	|  `Use new mouse accel variant`  |  `userinterface.mouse.use_new_accel_variant`  |  bool  |  enabled / *disabled* (default)  |
- Fixed a 90-second timeout on LG Thin Clients and All-in-Ones that occurred when shutting down the system using the power button.
- Added input validation in Setup under Security>Active Directory/Kerberos>Domain List, parameter Domain Controller.
- Fixed a delay when logging in with AD/Kerberos, Single Sign-On, or UMS as Identity Broker.
- Fixed setting the logged on user at AD/Kerberos login.
- Fixed applying OpenSSH client modifications on boot - settings in IGEL Setup should now be applied even if the OpenSSH server is disabled.
- **Network**
	- Proxy support: Disabled DNS WPAD usage, if there is a PAC URL configured or received via DHCP. Additionally, the PAC cache is no longer purged when credentials are present.
- **Audio**
	- Updated KB article about default audio device configuration:  https://kb.igel.com/en/igel-os-base-system/current/audio-in-igel-os-12
	  - With this new parameter the last default audio device is restored after reboot:
		|  Parameter  |  Registry   |  Type       |  Value      |
		| ------ | ------ | ------ | ------ |
		|  `Force default audio device after reboot`  |  `multimedia.force_default_after_reboot`  |  bool  |  enabled / *disabled* (default)  |
- **Hardware**
	- Fixed boot issues on Dell Wyse 5000 series devices (including Wyse 5070 and Wyse 5470 AIO) after a bootcode update. EFI boot variables are now recreated automatically.
	- Lowered power consumption of Lenovo M70q Gen6 by changing the default ethernet driver to the RealTek r8168 ethernet driver.
	- Fixed issues with laptop_mode power saving quirk.
	- Fixed that touchscreen devices were always enabled.
- **Remote Management**
	- Fixed: Reconnection to UMS in case of network interruptions.
	- Fixed: Send the IP from the VPN connection if it is used for UMS connection.
- **Virtualization**
	- Fixed: Bootsplash issue with SINA workstation

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
	- When using an HP G5 Dock, disconnecting and reconnecting the dock may cause display configurations (such as display order, resolution, and orientation) to be lost. After reconnection, displays may revert to default settings, requiring manual reconfiguration. For some devices, this issue can be mitigated by setting the registry key `x.xserver0.quirks.dp_mst_hotplug` to "Never."
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
