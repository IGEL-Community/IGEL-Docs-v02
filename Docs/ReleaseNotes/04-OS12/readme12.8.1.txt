IGEL OS Creator  
===============

Firmware version 12.8.1  
Release date 2026-04-29  
Last update of this document 2026-04-29  


Supported Devices  
-------------------------------------------------------------------------------

[> Supported IGEL OS 12 devices](https://kb.igel.com/os12-supported-hardware)


Component Versions
-------------------------------------------------------------------------------

| Components                                |                                  |
|-------------------------------------------|----------------------------------|
| MESA OpenGL Stack                         | 25.0.7-2igel1750243685           |
| VDPAU Library Version                     | 1.5-2                            |
| Graphics Driver INTEL                     | 2.99.917+git20210115-1igel1654609037     |
| Graphics Driver ATI/RADEON                | 22.0.0-1igel1704966675           |
| Graphics Driver ATI/AMDGPU                | 25.0.0-1igel1763123370           |
| Graphics Driver Nouveau (Nvidia Legacy)   | 1.0.18-1igel1739362211           |
| Graphics Driver VMware                    | 13.3.0-3igel1713934792           |
| Graphics Driver QXL (Spice)               | 0.1.6-1.1igel1742818532          |
| Graphics Driver FBDEV                     | 0.5.0-2igel1654609009            |
| Graphics Driver VESA                      | 2.6.0-2igel1739365508            |
| Input Driver Evdev                        | 2.11.0-1igel1772008331           |
| Input Driver Elographics                  | 1.4.4-1igel1746697619            |
| Input Driver Synaptics                    | 1.9.2-1+b2igel1742818828         |
| Input Driver VMMouse                      | 13.1.0-1ubuntu2igel1628499891    |
| Input Driver Wacom                        | 1.2.4-1igel1772694990            |
| Kernel                                    | 6.18.6 #mainline-lxos12-g1774356671    |
| Xorg X11 Server                           | 21.1.22-1igel1776231630          |
| Lightdm Graphical Login Manager           | 1.26.0-8igel1772701866           |
| ISC DHCP Client                           | 4.4.3-P1-2                       |
| ModemManager                              | 1.24.2-2igel1763114076           |
| WebKit2Gtk                                | 2.50.4-1~deb12u1igel1767851277   |
| Python3                                   | 3.11.2                           |
| Virtualbox Guest Utils                    | 7.2.4-dfsg-1igel1763634473       |
| Virtualbox X11 Guest Utils                | 7.2.4-dfsg-1igel1763634473       |
| Open VM Tools                             | 12.2.0-1+deb12u4                 |
| Open VM Desktop Tools                     | 12.2.0-1+deb12u4                 |


Release Notes of installable IGEL OS 12 base system
================================================================================

# Changes since: 12.8.0

## New Features
- Added a dual-signed shim bootloader (Microsoft 2011 and 2023) to ensure Secure Boot compatibility on both legacy and newer systems as the 2011 certificates start expiring in June 2026.
- **Hardware**
	- Added prerequisite components for future Microsoft Surface Pro 10 support by integrating missing kernel modules (battery, touchscreen, hardware buttons, auto-rotation). The device is not yet officially supported.

## Security Fixes
- Fixed openvpn security issue CVE-2025-15497.
- Fixed bind9 security issues CVE-2025-13878 and CVE-2026-1519.
- Fixed openssl security issues CVE-2026-31790, CVE-2026-31789, CVE-2026-28390, CVE-2026-28389, CVE-2026-28387, CVE-2026-22796, CVE-2026-22795, CVE-2025-69421, CVE-2025-69420, CVE-2025-69419, CVE-2025-69418, CVE-2025-68160 and CVE-2025-15467.
- Fixed python-urllib3 security issues CVE-2026-21441, CVE-2025-66418 and CVE-2025-50181.
- Fixed libpng1.6 security issues CVE-2026-33636, CVE-2026-33416, CVE-2026-25646, CVE-2026-22801 and CVE-2026-22695.
- Fixed libvpx security issues CVE-2026-2447 and CVE-2026-1861.
- Fixed nss security issue CVE-2026-2781.
- Fixed gst-plugins-base1.0 security issue CVE-2026-2921.
- Fixed inetutils security issue CVE-2026-32772.
- Fixed openssh security issue CVE-2026-3497.
- Fixed opensc security issues CVE-2025-66215, CVE-2025-66038, CVE-2025-66037, CVE-2025-49010 and CVE-2025-13763.
- Fixed libinput security issues CVE-2026-35094 and CVE-2026-35093.
- Fixed gst-plugins-ugly1.0 security issues CVE-2026-2922 and CVE-2026-2920.
- Fixed libvncserver security issues CVE-2026-32854 and CVE-2026-32853.
- Fixed gst-plugins-bad1.0 security issues CVE-2026-3086, CVE-2026-3084, CVE-2026-3082, CVE-2026-3081 and CVE-2026-2923.
- Fixed gst-plugins-good1.0 security issues CVE-2026-3085 and CVE-2026-3083.
- Backported kernel changes from 6.18.18 to fix CrackArmor security issues.
- Fixed xorg-server security issues CVE-2026-34003, CVE-2026-34002, CVE-2026-34001, CVE-2026-34000 and CVE-2026-33999.

## Resolved Issues
- Fixed inability to log in after closing and reopening the laptop lid.
- **OSC Installer**
	- Fixed PXE installation failures causing unexpected shutdowns or incomplete installs.
- **IGEL Desktop**
	- Fixed open applications appearing in the application menu instead of the taskbar when no quick start applications were configured

## Known Issues
- Display Settings setup page:
	 - There is no monitor info button available yet.
- In very rare cases all apps are lost after an update. Should this be the case, an error message is shown "Opening system App Journal failed." - if the device is manged, the apps will be reinstalled after a reboot.
- Increased writeable cache partition size (by default). First boot with 12.4.x and newer may take more time (once) when updating from a 12.2.x or older base system app.
- Automatic proxy configuration: PAC file URL does not support https scheme.
- When TPM PCR+PIN device encryption is enabled, an additional PIN entry is required the first time a new base system release is booted.
- The "Always on Top" feature in the context menu does not work with full-screen-windows.
- When using Keycloak as SSO provider, cookies are not forwarded to the user session after a successful login. This may cause users to be prompted to authenticate again within a browser session
- Shadowing may flicker on older Intel devices without modesetting due to limitations of the legacy graphics driver.
- **OSC Installer**
	- On Lenovo T14 Gen 6 Intel devices, the OSC may display a black screen with no desktop during a standard boot. A failsafe boot is required to access the OSC installer system.
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
	- Browser windows cannot be moved using touch input, while other applications are unaffected. This has been observed with Firefox, Microsoft Edge, and Chromium.
		    - Workaround: Enable server-side window decoration.
	- Browser windows require two touch interactions to be moved when using client-side window decorations. The first touch does not initiate window movement, leading to inconsistent touchscreen behavior. This has been observed with Firefox, Microsoft Edge, and Chromium; other applications are unaffected.
	    - Workaround: Enable server-side window decoration in the browser application.
- **Application Launcher**
	- The Zoom session currently appears without an icon in the Application Launcher.
	- Applications launched via the Application Launcher may close when the launcher is closed.
- **Setup Assistant**
	- Timezone auto-detection is currently not functional (due to discontinued location service). The timezone must be set manually (as interims / alternative solution).
- **Audio**
	- Headset mic via jack is not working on LG 27CN650 and LG 34CN650.
	- Audio devices may not be available in audio tray app. Workaround: Enable Pulseaudio backend by registry key:
		|  Parameter  |  Registry   |  Range      |  Value      |
		| ------ | ------ | ------ | ------ |
		|  `Audiobackend`  |  `multimedia.audiobackend`  |  [pipewire][pulseaudio]  |  *pipewire*  |
	- The Audio Tray App may incorrectly display a plugged-in Audio-Jack-Headset as Built-in Audio / HDMI / DiplayPort instead of the correct headset name. Audio and Microphone functionality would still work correctly.
	- On several hardware configurations, the internal audio is no longer available for selection when an audio jack is connected.
	- After suspend/resume, the audio tray icon may sporadically disappear and audio playback is not possible.
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
	- Dell Wyse 3040 devices with 2 GB RAM may experience poor operating performance.
	- HP mt645 G8 devices with HP USB-C Dock G6 do not wake from suspend and cannot be powered off via UMS.
	- Wake-on-LAN is not working on Lenovo ThinkPad L15 Gen 4 AMD and Lenovo ThinkPad L16 Gen1 AMD devices from suspended or powered-off states.
	- On LG 34CR650 AIO devices, changing an external monitor´s orientation to "Inverted" can cause the internal display to turn black until reboot.
	- When a device is connected to an HP E27K G5 monitor via USB-C, it may wake from suspend automatically after approximately 20 seconds.
	- Sporadic system freezes may occur on newer AMD chipsets (AMD Ryzen AI) with the amdgpu graphics driver.
- **Accessibility**
	- The screen reader (accessibility feature) currently does not work with the following apps:
		- IGEL Setup
		- IGEL First Boot Wizard
		- IGEL Start Menu
		- IGEL System Tray apps (volume, network,  notifications, ...)
		- VPN and SSO login dialogs
- **Dual Boot BC/DR (IGEL OS)**
	- The IGEL Dual Boot menu sometimes does not accurately reflect the presence of a UD-Pocket:
	  - If the "fast boot" BIOS option is turned on for HP devices, the state won't be updated between reboots. Turning off "fast boot" provides accurate detection.
	  - The boot loader doesn't currently detect UD Pockets on Lenovo devices. Using the Lenovo boot menu (F12) allows booting from UD Pockets directly but the "fast boot" BIOS option also interfere with the detection of USB boot devices.
- **IGEL Desktop**
	- On-screen keyboard sporadically crashes when typing.
	- If two monitors are configured in a vertical layout (one above the other), and those monitors are configured with "auto-detect" resolution, saving leads to a wrong layout order.
	- There are some UI elements that are not yet translated in all available user interface languages.
	- In very rare cases, the Start menu or panel may not be visible after boot. A reboot will restore visibility in such cases.
	- In multi-monitor setups, the task switcher is only displayed on one monitor instead of all connected displays.
	- After a fresh installation, the scrolling method shown in the Tray App may not match the actual behavior. This is resolved after a reboot.
	- When launching an application via Omnissa Horizon, the taskbar may briefly disappear before reappearing.
	- After changing the primary display and reassigning the taskbar monitor, icons move correctly but the taskbar remains on the original monitor.
	- With "Taskbar auto hide" set to "Always" the taskbar may invert its behavior (show/hide) after a delay, becoming visible when the cursor is away and hidden when hovering over it.
	- When using a taskbar spanning two monitors, the taskbar does not remain visible on the second monitor while a fullscreen session is active on the first. This prevents access to tray applications without leaving the fullscreen session.
- **Licensing**
	- Manual deployment of add-on licenses for IGEL Agent for Imprivata licenses (via UMS) is only possible after finished installation of IGEL Agent for Imprivata app on device.
	- Endpoints that have a Starter License but no Workspace Edition license will not receive device settings or app management from UMS if add-on licenses are installed.
	Workaround: Either remove the add-on licenses or assign a valid Workspace Edition (or Workspace Edition Demo) license.
- **Mobile Broadband**
	- F11 flight mode function key does not switch off mobile broadband on HP Elite mt645 G7. (Deactivate mobile broadband in Network / Mobile Broadband settings)
