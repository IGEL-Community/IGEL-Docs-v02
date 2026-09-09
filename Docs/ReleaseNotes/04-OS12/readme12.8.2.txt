IGEL OS Creator  
===============

Firmware version 12.8.2  
Release date 2026-06-11  
Last update of this document 2026-06-11  


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
| Kernel                                    | 6.18.6 #mainline-lxos12-g1778149837    |
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

# Changes since: 12.8.1

## New Features
- Added TPM-based device encryption support for HP Elite mt645 G8 Mobile Thin Client. Secure Boot must be enabled. (requires 12.8.2 and above; downgrades below 12.8.2 are not supported)
- **Smartcard**
	- Added vendor maintained driver for Circle and some Imprivata branded smartcard and RFID readers. The new driver should fix some problems, e.g. start up of the reader after boot.
	  Supported readers are: CIR115 ICC, Idaxis SecurePIV, CCR7115 ICC, CIR115 CT, CIR125 ICC, CCR7125 ICC, CIR135 ICC, CCR7135 ICC, CIR215 PICC, CIR215 CL, CIR215 CL, CIR215 CL, CIR315 Dual & 1S, CIR315, CIR315 CL, CIR315 DI, CIR315 IMP, CIR315-SE CL, Idaxis SecureTouch, CCR7315, USBNFC4, CIR415 CL & 1S, CIR415 CL, CIR515 ICC, CIR615 CL & 1S, CIR615 CL, CIR715 Dual
- **IGEL Desktop**
	- Added internal API for raising windows above IAFI lock-screen.

## Security Fixes
- Fixed Kernel security issue CVE-2026-31431 also known as copy fail.
- Fixed xdg-dbus-proxy security issue CVE-2026-34080.
- Fixed gdk-pixbuf security issue CVE-2026-5201.
- Fixed lcms2 security issue CVE-2026-41254.
- Fixed nghttp2 security issue CVE-2026-27135.
- Fixed ntfs-3g security issue CVE-2026-40706.
- Fixed libpng1.6 security issue CVE-2026-34757.
- Fixed tiff security issue CVE-2026-4775.
- Fixed dnsmasq security issues CVE-2026-5172, CVE-2026-4893, CVE-2026-4892, CVE-2026-4891, CVE-2026-4890 and CVE-2026-2291.
- Fixed libarchive security issues CVE-2026-5121, CVE-2026-4426, CVE-2026-4424 and CVE-2026-4111.
- Fixed krb5 security issues CVE-2026-40356 and CVE-2026-40355.
- Fixed openssh security issues CVE-2026-35414, CVE-2026-35388, CVE-2026-35387, CVE-2026-35386 and CVE-2026-35385.
- Fixed openvpn security issues CVE-2026-40215 and CVE-2026-35058.

## Resolved Issues
- Fixed possible coredumps during logoff
- Fixed incorrect error message displayed when a user entered an incorrect password during AD login.
- Removed the unsupported display resolution 800x600 from the list of available display resolutions.
- Fixed incorrect decimal separator for Polish(Programmers) keyboard layout from dot to comma.
- Fixed system freezes caused by firmware hangs on affected AMD devices using the amdgpu driver (including Lenovo T14 Gen 6 AMD) by backporting three upstream kernel commits.
  - Added a potential workaround for the freezes by disabling CWSR (see below) on affected AMD Krackan Point devices using the amdgpu driver (including Lenovo T14 Gen 6 AMD).
  - Added new setup parameter `x.drivers.amdgpu.cwsr_enable` to allow forcing the Compute Wave Store and Resume (CWSR) feature/optimization on or off. By default, the kernel setting is used (enabled if supported).
  - Added new setup parameter `x.drivers.amdgpu.gpu_recovery` to allow toggling a `amdgpu_gpu_recover` file in debugfs - which can be **read** to force a GPU reset - on or off. By default, the kernel setting is used (disabled).
	|  IGEL Setup  |  Parameter  |  Registry   |  Range      |  Value      |
	| ------ | ------ | ------ | ------ | ------ |
	|  System > Registry       |  `Enable support for GPU recovery, which is performed by reading the debugfs file amdgpu_gpu_recover. Resetting the GPU using this mechanism is risky and may result in data loss  especially if compute applications are running at the time of the reset.`  |  `x.drivers.amdgpu.gpu_recovery`  |  [Default][Enable][Disable]  |  *Default*  |
- Fixed slow default mouse speed.
- Fixed an issue that prevented tray applications from being accessible on the login screen.
- Improved Device Encryption activation for TPM PCR auto-unlock.
- Fixed parameter parsing issues that could lead to settings being lost.
- **OSC Installer**
	- Fixed migration of legacy settings in OS12 Creator when "Migrate Old Settings" was disabled.
- **App Management**
	- Fixed an issue that could cause devices to enter an update loop when upgrading from IGEL OS 12.7.1 to 12.7.2 with UMS configured as a proxy and App Portal configured as a fallback source.
	- Fixed an issue that could cause devices to install the latest Base OS on reboot after a new Base App was assigned, even when "Update.Action after app assignment from UMS" was set to "Nothing" (`update.autoactivate_future_config=nothing`), requiring an additional step to download and activate new apps.
	- Fixed an issue where devices migrated from IGEL OS 11 could become stuck in an update loop on IGEL OS 12 (12.8.0 and earlier), preventing updates from completing as expected.
- **HID**
	- Fixed issue that USB-ports show up as "usbusbX-portX" and don't get configured properly in "fix_touchscreen_matrix show" for certain ports.
- **CUPS Printing**
	- Fixed invisible "stop print job" button in printer tray app.
- **Audio**
	- Updated KB article about default audio device configuration:  https://kb.igel.com/en/igel-os-base-system/current/audio-in-igel-os-12
	  - With this new parameter the last default audio device is restored after reboot:
		|  Parameter  |  Registry   |  Type       |  Value      |
		| ------ | ------ | ------ | ------ |
		|  `Force default audio device after reboot`  |  `multimedia.force_default_after_reboot`  |  bool  |  enabled / *disabled* (default)  |
- **Hardware**
	- Fixed Microphone Mute special key on supported HP devices.
	- Fixed and improved touchscreen mapping format for multi-touchscreen setups:
	 Touchscreens can now be mapped to displays by their XInput device name in addition to the existing USB port path based configuration.
	    - This can improve stability when USB port paths change, for example when using docking stations.
	    - The existing USB path based format remains supported and has priority over name-based entries.
	    - Name-based mapping requires each touchscreen to have an unique XInput device name.
- **Remote Management**
	- Fixed possible stale connection to the local VNC or Telnet service while tunneling to the UMS through a remote management connection.
	- Fixed and optimized applying of assigned certificate files.
- **IGEL Desktop**
	- Fixed crash of cancelled password dialog for sessions.
	- Fixed wrong color of auto-hidden taskbar (not respecting current theme).
	- Added two new instances to `sessions.wmcommands` for tiling a local window to the left / right.
		|  IGEL Setup  |  Parameter  |  Registry  |
		| ------ | ------ | ------ |
		|  User Interface > Hotkeys    |  `Tile Window to the right of the screen`        |  `sessions.wmcommands18`              |
		|  User Interface > Hotkeys    |  `Tile Window to the left of the screen`        |  `sessions.wmcommands17`              |
	- Fixed inconsistent behavior between different tray apps when clicking on tray app icons.
	- Fixed bug where non-allowed windows raised above IAFI lock screen.
	- Fixed taskbar to use available space after collapsing and expanding tray panel.
	- Fixed Accessibility and Time-Date tray to not cover title and navigation link with scrollable content.
	- Fixed display configuration hot-plug issues by clearing display cache when monitors are added or removed.
	- Fixed screen flickering caused by premature restart of system components while display changes are still running
	- Fixed missing contrast of highlighted text in input fields for IGEL Dark theme
	- Fixed wrong IAFI lock-screen in multi-monitor setups.
	- Fixed wrong alignment of dual-monitor setups after configuring displays in TC-Setup.
- **SSO**
	- Refined error message logged during sso login

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
