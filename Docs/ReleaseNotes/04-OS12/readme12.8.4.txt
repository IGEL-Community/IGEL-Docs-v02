IGEL OS Creator  
===============

Firmware version 12.8.4  
Release date 2026-09-29  
Last update of this document 2026-09-29  


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
| Kernel                                    | 6.18.6 #mainline-lxos12-g1788426253C     |
| Xorg X11 Server                           | 21.1.24-1igel1786006832          |
| Lightdm Graphical Login Manager           | 1.26.0-8igel1772701866           |
| ISC DHCP Client                           | 4.4.3-P1-2                       |
| ModemManager                              | 1.24.2-2igel1763114076           |
| WebKit2Gtk                                | 2.50.4-1~deb12u1igel1767851277   |
| Python3                                   | 3.11.2                           |
| Virtualbox Guest Utils                    | 7.2.16-dfsg-1igel1789371158      |
| Virtualbox X11 Guest Utils                | 7.2.16-dfsg-1igel1789371158      |
| Open VM Tools                             | 12.2.0-1+deb12u4                 |
| Open VM Desktop Tools                     | 12.2.0-1+deb12u4                 |


Release Notes of installable IGEL OS 12 base system
================================================================================

# Changes since: 12.8.3 LTS

## New Features
- Added a registry option to perform full DisplayPort MST re-initialization after resume. This can resolve LG monitors remaining black in a DisplayPort daisy-chain configuration after a suspend/resume cycle. Set the registry key below to true to enable the workaround.
- Added registry key to enable DP MST re-initialization at resume quirk over IGEL registry setting.
	| Parameter | Registry | Range | Value |
	| ------ | ------ | ------ | ------ |
	| `Perform full DP MST re-initialization at resume.` | `x.drivers.intel.dp_mst_teardown_quirk` | [Auto][True][False] | *Auto* |
- Added registry options for configuring the userspace out-of-memory (OOM) killer.
	| Parameter | Registry | Type | Value |
	| ------ | ------ | ------ | ------ |
	| `Processes to exclude from OOM handling (dangerous)` | `system.memory.earlyoom.ignore_processes` | string | empty *Default* |
	| `Available memory threshold for SIGTERM (%)` | `system.memory.earlyoom.mem_term_percent` | integer | 10 *Default* |
	| `Available memory threshold for SIGKILL (%)` | `system.memory.earlyoom.mem_kill_percent` | integer | 5 *Default* |
	| `Free swap threshold for SIGTERM (%)` | `system.memory.earlyoom.swap_term_percent` | integer | 10 *Default* |
	| `Free swap threshold for SIGKILL (%)` | `system.memory.earlyoom.swap_kill_percent` | integer | 5 *Default* |
	| `Process names that earlyoom avoids terminating` | `system.memory.earlyoom.avoid_processes` | string | empty *Default* |
	| `Additional processes to terminate first` | `system.memory.earlyoom.prefer_processes` | string | empty *Default* |
- **Smartcard**
	- Added option "No action" to Smartcard removal action parameter. When selected, no action is performed when the smart card is removed.
		| Setup | Parameter | Registry | Value |
		| ------ | ------ | ------ | ------ |
		| Security>Logon>Active Directory/Kerberos | Smartcard removal action | auth.login.sc_removal_action | log out(default)/lock device/no action |
- **Hardware**
	- Added support for detecting ClearCube CD7042/44 devices.
	- Switched to the "Legacy" Intel audio DSP driver on ClearCube CD7042/44 devices.
- **Remote Management**
	- Restricted execution of the rmagent-pull-appauthtoken command to privileged users: The command is now refused when invoked by a non-privileged user.

## Security Fixes
- Backported kernel security fix for CVE-2026-53362.
- Fixed nss security issue CVE-2026-16389.
- Fixed bind9 security issues CVE-2026-13321, CVE-2026-13204, CVE-2026-12617, CVE-2026-11721, CVE-2026-11622, CVE-2026-11605, CVE-2026-11331, CVE-2026-10822 and CVE-2026-10723.
- Fixed aom security issues CVE-2026-56211, CVE-2026-56210, CVE-2026-56209 and CVE-2026-56208.
- Fixed libass security issue CVE-2026-61627.
- Fixed expat security issues CVE-2026-76957, CVE-2026-72522, CVE-2026-56412, CVE-2026-56411, CVE-2026-56410, CVE-2026-56409, CVE-2026-56408, CVE-2026-56407, CVE-2026-56406, CVE-2026-56405, CVE-2026-56404, CVE-2026-56403, CVE-2026-56131 and CVE-2026-50219.
- Fixed poppler security issues CVE-2025-52886, CVE-2025-50420, CVE-2025-43903 and CVE-2024-6239.
- Fixed librabbitmq security issues CVE-2026-61547 and CVE-2026-59986.
- Fixed libssh2 security issues CVE-2026-7598, CVE-2026-66034, CVE-2026-66032, CVE-2026-58051, CVE-2026-58050 and CVE-2025-15661.
- Fixed bluez security issues CVE-2026-80186, CVE-2026-80185 and CVE-2026-75032.
- Fixed libarchive security issues CVE-2026-16517 and CVE-2026-15028.
- Fixed libgd2 security issue CVE-2026-9672.
- Fixed libwebsockets security issue CVE-2026-78161.
- Fixed openssh security issues CVE-2026-73283, CVE-2026-73282 and CVE-2026-73281.
- Changed the OpenSSH packages to the standard variant without GSS-API authentication and key exchange support. GSS-API support has been removed from the standard upstream packages to reduce the pre-authentication attack surface.
- Fixed openvpn security issue CVE-2026-84732.
- Fixed xorg-server security issues CVE-2026-56000 and CVE-2026-55999.
- Fixed gst-plugins-base1.0 security issue CVE-2026-18297.

## Resolved Issues
- CUPS printing app: Fixed the usage of printer queue names containing hyphens.
- No longer run the fwupd.service by default. This change saves approx. 30MiB of RAM.
- Fixed incorrect display of download progress notifications for custom partitions.
- Fixed missing notifications when a process had to be stopped due to low memory.
- Updated GRUB to SBAT Level 5 to meet current Secure Boot requirements.
- **Setup Assistant**
	- Fixed the network interface name displayed in the `Setup Assistant  System Information` dialog to always match the interface configured in the Setup Assistant, which is the first network interface.
	- During first boot, the Setup Assistant can now handle multiple Ethernet devices.
- **VirtualBox**
	- Fixed a mouse position offset which occured after adding or removing a 2nd display when using IGEL OS as a virtual machine on a SINA Workstation.
	- Fixed visual distortions which occurred when adding a 2nd display when using IGEL OS as a virtual machine on a SINA Workstation.
	- Added a registry option to use modesetting for the VMGFX DRM driver, which is enabled by default when IGEL OS is running as a virtual machine on a SINA Workstation.
		| Parameter | Registry | Range | Value |
		| ------ | ------ | ------ | ------ |
		| `Use generic modesetting driver for VMWare virtual graphics.` | `x.drivers.vmware.use_modesetting` | [Auto][True][False] | *Auto* |
- **Remote Management**
	- Fixed recognizing of the public CA while device registering in the Setup Assistant, in cases where CA changes.
	- Fixed a rare case where the remote manager stopped responding during multiple file download failures. For slower downloads, consider increasing the `system.remotemanager.rmagent_timeout` registry setting.
	- Fixed a rare case where a device lost its UMS registration together with all profile settings, although it had not been removed from the UMS.
		- A device now gives up its registration only after every configured UMS and ICG server has been asked, at least one of them has answered that the device is unknown, and that answer has been confirmed over a configurable period (24 hours by default).
		- Servers which are not reachable, and servers which refuse the device without stating that it is unknown, no longer influence that decision.
		- The new registry setting `system.remotemanager.release_delay` defines that period in seconds (default 86400, limited to 30 days).
		- If a device does give up its registration, it now documents the reason in a log file `/wfs/igel-rmagent/self-release-<timestamp>.log` for support analysis.
		- The device can now notify the user when a remote management problem is detected. The message asks the user to contact the IT helpdesk and names the unit ID of the device, so that the helpdesk can identify it. It appears when the device gives up its registration on its own, or when all configured servers have answered that the device is unknown. It is shown on the lock screen as well and stays until the user closes it. The user is informed only once per problem, not on every retry.
		- That message is switched off by default and is enabled by the new registry setting `system.remotemanager.notify_user_on_rm_problem`.
	- Fixed UMS autoregistration by triggering it for each network interface.
	- Fixed a rare crash of the remote management agent (igel-rmagent) that could occur shortly after booting the device, while it was connecting to the UMS. The agent was restarted automatically, so no user action was required. Until the restart had completed, the device could briefly appear as offline in the UMS, and the transfer of device information and the registration of installed apps could be delayed.
- **Accessibility**
	- Removed password protection for accessibility features, including Screen Magnifier, Screen Reader, and On-Screen Keyboard.
	- Removed `Use screen magnifier` and `Use screen reader` parameters from Setup.
- **IGEL Desktop**
	- Fixed missing calendar week numbers in the calendar.
	- Fixed incorrect auto-focus behavior for new windows appearing on the desktop like the Zoom notification window.
	- Fixed broken Win+L hotkey to lock screen.
	- Added a configuration parameter to select the first day of the week shown in the calendar.
		| Parameter | Registry | Type | Range | Value |
		| ------ | ------ | ------ | ------ | ------ |
		| First day of the week | userinterface.calendar.first_day_of_week | string | [monday][sunday] | monday (default) |
		- The parameter can be changed in Time and Date tray application.
	- Fixed the AD password change dialog freezing when using the window close button.
	- Fixed missing taskbar after registering device in UMS.
	- Fixed bug where original monitor positions were not respected when updating display layout.
	- Fixed memory leak in tray applications.
- **TC Setup**
	- Fixed bug where space could not be entered into password field of TC-Setup login dialog.

## Known Issues
- The Display Settings setup page does not yet provide a Monitor Info button.
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
- **Setup Assistant**
	- Timezone auto-detection is currently not functional (due to discontinued location service). The timezone must be set manually (as interims / alternative solution).
- **Audio**
	- Headset mic via jack is not working on LG 27CN650 and LG 34CN650.
	- Audio devices may not be available in audio tray app. Workaround: Enable Pulseaudio backend by registry key:
		| Parameter | Registry | Range | Value |
		| ------ | ------ | ------ | ------ |
		| `Audiobackend` | `multimedia.audiobackend` | [pipewire][pulseaudio] | *pipewire* |
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
	- When using an HP G5 Dock, disconnecting and reconnecting the dock may cause display configurations (such as display order, resolution, and orientation) to be lost. After reconnection, displays may revert to default settings, requiring manual reconfiguration. For some devices, this issue can be mitigated by setting the registry key `x.xserver0.quirks.dp_mst_hotplug` to Never.
	- Dell Wyse 3040 devices with 2 GB RAM may experience poor operating performance.
	- HP mt645 G8 devices with HP USB-C Dock G6 do not wake from suspend and cannot be powered off via UMS.
	- Wake-on-LAN is not working on Lenovo ThinkPad L15 Gen 4 AMD and Lenovo ThinkPad L16 Gen1 AMD devices from suspended or powered-off states.
	- On LG 34CR650 AIO devices, changing an external monitors orientation to Inverted can cause the internal display to turn black until reboot.
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
	- With Taskbar auto hide set to Always the taskbar may invert its behavior (show/hide) after a delay, becoming visible when the cursor is away and hidden when hovering over it.
	- When using a taskbar spanning two monitors, the taskbar does not remain visible on the second monitor while a fullscreen session is active on the first. This prevents access to tray applications without leaving the fullscreen session.
- **Licensing**
	- Manual deployment of add-on licenses for IGEL Agent for Imprivata licenses (via UMS) is only possible after finished installation of IGEL Agent for Imprivata app on device.
	- Endpoints that have a Starter License but no Workspace Edition license will not receive device settings or app management from UMS if add-on licenses are installed.
	Workaround: Either remove the add-on licenses or assign a valid Workspace Edition (or Workspace Edition Demo) license.
- **Mobile Broadband**
	- F11 flight mode function key does not switch off mobile broadband on HP Elite mt645 G7. (Deactivate mobile broadband in Network / Mobile Broadband settings)
