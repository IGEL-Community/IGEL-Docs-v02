IGEL OS Creator  
===============

Firmware version 12.10.1  
Release date 2026-10-26  
Last update of this document 2026-10-26  


Supported Devices  
-------------------------------------------------------------------------------

[> Supported IGEL OS 12 devices](https://kb.igel.com/os12-supported-hardware)


Component Versions
-------------------------------------------------------------------------------

| Components                                |                                  |
|-------------------------------------------|----------------------------------|
| MESA OpenGL Stack                         | 25.0.7-2igel1787155887           |
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
| Kernel                                    | 6.18.35 #mainline-lxos12-g1792135217C      |
| Xorg X11 Server                           | 21.1.24-1igel1789626238          |
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

# Changes since: 12.10.0

## New Features
- Added support for mapping Windows printer driver names for Citrix and RDP/AVD when adding printers via the Printer Tray app. The following existing parameters are used:
	- `app.cups_printing.print.cups.printer%.map_avd`
	- `app.cups_printing.print.cups.printer%.avd_printer_driver`
	- `app.cups_printing.print.cups.printer%.map_ica`
	- `app.cups_printing.print.cups.printer%.windows_driver.printerdriver`
- Added TPM-based device encryption support for HP EliteBook 6 G2a 14-inch and 16-inch Notebooks. Secure Boot must be enabled. (requires 12.10.0 PR1 and above; downgrades below 12.10.0 PR1 are not supported)
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
- **UD Pocket**
	- Added support for UD Pocket Licensing (UDL) for devices with serial numbers starting from K086730001, including license expiration warnings.
- **Network**
	- Added the following parameter for network bond configuration:
		| Parameter | Registry | Range | Value | Type |
		| ------ | ------ | ------ | ------ | ------ |
		| `Autoconnect retries` | `network.interfaces.bonding.bond%.autoconnect_retries` | [active][backup][all] | -1 *Default* | integer |
		| `Fail-over MAC` | `network.interfaces.bonding.bond%.fail_over_mac` | [none] | *none* |  |
		| `Primary reselect` | `network.interfaces.bonding.bond%.primary_reselect` | [active][follow] | *always* |  |
		| `ARP validate` | `network.interfaces.bonding.bond%.arp_validate` | [always] | *none* |  |
		| `Deliver traffic on inactive slaves` | `network.interfaces.bonding.bond%.all_slaves_active` | [better][failure] | enabled / *disabled* (default) | bool |
		| `Bond options (fallback)` | `network.interfaces.bonding.bond%.bond_options` | [none] | empty *Default* | string |
	- Added kernel support for legacy iptables.
- **Setup Assistant**
	- Added NTP time server configuration during onboarding of a device.
- **Driver**
	- Updated displaylink userspace library libevdi.so to version 1.15
- **Evidian**
	- Added support for Evidian EAM Client app retrieving additional Kerberos ticket.
	- Added support for login with HID keyboard wedge readers and Evidian EAM Client application.
	- Added support for Evidian EAM Client username and password login.
- **Hardware**
	- Added hardware support for LENOVO ThinkCentre neo 55q Gen 6
	- Added hardware support for HP EliteBook 6 G2a 14 inch (AMD)
	- Added hardware support for HP EliteBook 6 G2a 16 inch (AMD)
	- Added hardware support for LENOVO ThinkEdge SE30n Gen2 Intel
	- Added hardware support for HP EliteBook 6 G2a 16 inch Notebook Thin Client
	- Added hardware support for LENOVO ThinkEdge SE10n Gen2
	- Added hardware support for HP EliteDesk 7 G1a.
	- Added hardware support for HP EliteBook 6 G2a 14 inch Notebook Thin Client
	- Added hardware support for LENOVO ThinkEdge SE60n Gen2
	- Added a registry option to perform full DisplayPort MST re-initialization after resume. This can resolve LG monitors remaining black in a DisplayPort daisy-chain configuration after a suspend/resume cycle. Set the registry key below to true to enable the workaround.
		| Parameter | Registry | Range | Value |
		| ------ | ------ | ------ | ------ |
		| `Perform full DP MST re-initialization at resume.` | `x.drivers.intel.dp_mst_teardown_quirk` | [Auto][True][False] | *Auto* |
	- Added hardware support for LENOVO ThinkEdge SE50a Gen1.
	- Added a parameter to configure the Intel DSP driver for the ClearCube CD7042.
		| Parameter | Registry | Range | Value |
		| ------ | ------ | ------ | ------ |
		| `Force the audio DSP driver. Use "Legacy HD-Audio" when the auto-detected driver fails to create a sound card.` | `system.sound_driver.snd_intel_dspcfg.dsp_driver` | [Default][Legacy HD-Audio][Intel SST][Intel SOF][Intel AVS] | *Default* |
	- Added support for detecting ClearCube CD7042/44 devices.
	- Changed the Intel audio DSP driver to "Legacy" on ClearCube CD7042/44 devices.
- **Remote Management**
	- Added remote management support for IMH-Scale, VM export and status commands
- **Dual Boot BC/DR (IGEL OS)**
	- Added automatic detection and boot of an IGEL UD Pocket connected via USB, without requiring manual configuration or user interaction. When a UD Pocket is connected, it boots automatically as part of the normal startup process. Otherwise, startup behavior remains unchanged.
- **IGEL Desktop**
	- Added the parameter `userinterface.system_tray.memory_mode` to control the memory usage of tray applications.
		| Parameter | Registry | Type | Value | Tooltip |
		| ------ | ------ | ------ | ------ | ------ |
		| `Memory Mode` | `userinterface.system_tray.memory_mode` | string | performance *Default* / save memory | In the 'Save Memory' mode the system tray will consume less memory, but opening a system tray window will take slightly longer |
- **Mobile Broadband**
	- Added Quectel EM160R-GL Gen2, Quectel EM061K-GL and Quectel RM520N-GL WWAN support for Lenovo T14 Gen 5 series.
	- Added Quectel EM061K-GL and Quectel RM520N-GL WWAN support for Lenovo T14s Gen 5 Intel series.

## Security Fixes
- Fixed nss security issues CVE-2026-16389, CVE-2026-6772, CVE-2026-6767, CVE-2026-6766 and CVE-2026-12318.
- Fixed libcaca security issue CVE-2026-42046.
- Fixed curl security issues CVE-2026-7168, CVE-2026-5773, CVE-2026-3784, CVE-2026-3783, CVE-2025-14819, CVE-2025-14524 and CVE-2025-10148.
- Fixed giflib security issues CVE-2026-26740 and CVE-2026-23868.
- Fixed graphite2 security issue CVE-2026-50593.
- Fixed jq security issues CVE-2026-54679, CVE-2026-49839, CVE-2026-47770, CVE-2026-44777, CVE-2026-43896, CVE-2026-43895, CVE-2026-43894, CVE-2026-41257, CVE-2026-41256, CVE-2026-40164, CVE-2026-39979, CVE-2026-39956, CVE-2026-33948, CVE-2026-33947 and CVE-2026-32316.
- Fixed xz-utils security issue CVE-2026-34743.
- Fixed poppler security issues CVE-2025-52886, CVE-2025-50420, CVE-2025-43903 and CVE-2024-6239.
- Fixed protobuf security issues CVE-2026-6409, CVE-2026-0994, CVE-2025-4565 and CVE-2024-7254.
- Fixed python3.11 security issues CVE-2026-6100, CVE-2026-4519, CVE-2026-4224, CVE-2026-3644, CVE-2026-2297, CVE-2026-0672, CVE-2025-13462 and CVE-2023-52425.
- Fixed librabbitmq security issues CVE-2026-61547, CVE-2026-59986, CVE-2026-44236 and CVE-2026-44235.
- Fixed libxfont security issues CVE-2026-56003, CVE-2026-56002 and CVE-2026-56001.
- Fixed libxml2 security issues CVE-2026-1757, CVE-2026-0992, CVE-2026-0990, CVE-2026-0989, CVE-2025-8732 and CVE-2025-49794.
- Fixed rsync security issue CVE-2026-45232.
- Fixed python-urllib3 security issue CVE-2026-44431.
- Fixed python-xmltodict security issue CVE-2025-9375.
- Fixed sshfs-fuse security issues CVE-2026-48711 and CVE-2026-47187.
- Fixed spice-vdagent security issues CVE-2026-57966 and CVE-2026-57965.
- Fixed libarchive security issues CVE-2026-5745, CVE-2026-16517, CVE-2026-15028 and CVE-2026-14164.
- Fixed krb5 security issue CVE-2026-11850.
- Fixed libvncserver security issue CVE-2026-50538.
- Fixed openssh security issues CVE-2026-73283, CVE-2026-73282, CVE-2026-73281, CVE-2026-60002, CVE-2026-60001, CVE-2026-60000, CVE-2026-59999, CVE-2026-59998, CVE-2026-59997, CVE-2026-59996 and CVE-2026-59995.
- Fixed openvpn security issues CVE-2026-84732, CVE-2026-13698, CVE-2026-13122, CVE-2026-12996, CVE-2026-12932, CVE-2026-12117 and CVE-2026-11771.
- Fixed xorg-server security issues CVE-2026-56000 and CVE-2026-55999.
- Fixed aom security issues CVE-2026-56211, CVE-2026-56210, CVE-2026-56209, CVE-2026-56208, CVE-2024-5171 and CVE-2023-39616.
- Fixed bind9 security issues CVE-2026-13321, CVE-2026-13204, CVE-2026-12617, CVE-2026-11721, CVE-2026-11622, CVE-2026-11605, CVE-2026-11331, CVE-2026-10822 and CVE-2026-10723.
- Fixed gst-libav1.0 security issue CVE-2026-52717.
- Fixed gst-plugins-bad1.0 security issues CVE-2026-53701, CVE-2026-52719, CVE-2026-52718, CVE-2026-52722, CVE-2026-52720, CVE-2026-19387, CVE-2026-12892 and CVE-2026-12891.
- Updated ca-certificates to version 20260816.
- Fixed libgd2 security issue CVE-2026-9672.
- Fixed bluez security issues CVE-2026-80186, CVE-2026-80185 and CVE-2026-75032.
- Fixed libwebsockets security issue CVE-2026-78161.
- Fixed libass security issue CVE-2026-61627.
- Fixed expat security issues CVE-2026-76957, CVE-2026-72522, CVE-2026-56412, CVE-2026-56411, CVE-2026-56410, CVE-2026-56409, CVE-2026-56408, CVE-2026-56407, CVE-2026-56406, CVE-2026-56405, CVE-2026-56404, CVE-2026-56403, CVE-2026-56131 and CVE-2026-50219.
- Fixed libssh2 security issues CVE-2026-7598, CVE-2026-66034, CVE-2026-66032, CVE-2026-58051, CVE-2026-58050 and CVE-2025-15661.
- Changed the OpenSSH packages to the standard variant without GSS-API authentication and key exchange support. GSS-API support has been removed from the standard upstream packages to reduce the pre-authentication attack surface.
- Fixed gst-plugins-base1.0 security issue CVE-2026-18297.
- Fixed jbig2dec security issue CVE-2026-38076.
- Updated tzdata to version 2026c.
- Fixed openssl security issues CVE-2026-75803, CVE-2026-63076, CVE-2026-63074, CVE-2026-63072, CVE-2026-54874 and CVE-2026-42767.
- Backported kernel security fix for CVE-2026-53362.
- Updated GRUB to SBAT Level 6 to meet current Secure Boot requirements.
- Removed the compromised intermediate CA certificate emSign_ECC_Root_CA_-_G3.crt for security reasons.

## Resolved Issues
- Secure Kiosk App: Fixed popup windows breaking navigation history on websites which use POST requests.
- Secure Kiosk App: Fixed printing of multi-page PDFs by always enabling the print dialog.
- Fixed Cisco Jabber VDI audio output intermittently failing or stop working after the first call.
- CUPS printing app: Fixed the usage of printer queue names containing hyphens.
- Fixed the Device Encryption unlock dialog appearing only on the internal display. The dialog is now correctly shown on all connected displays, including external monitors.
- Fixed USB Access Control deny rules not correctly blocking USB storage devices or interface devices such as smart card readers.
- Fixed an issue where Custom Application scripts that start applications in the background could terminate prematurely.
- Fixed unnecessary memory usage by disabling fwupd.service by default, saving approximately 30 MiB of RAM.
- Fixed an issue where the Lid close actions were not executed when the laptop lid was closed.
- Fixed incorrect display of download progress notifications for custom partitions.
- Fixed missing notifications when a process had to be stopped due to low memory.
- Fixed detection of multi-GPU devices for display configuration quirks
- Fixed an issue where ssh.socket did not come up again after resume.
- **VMware Horizon**
	- Fixed Horizon windows not being placed on the correct monitor according to the startMonitor configuration.
- **App Management**
	- Fixed an issue where apps assigned via UMS could fail to download during initial startup if the connection to the UMS was not yet fully established.
- **Network**
	- Fixed proxy PAC file evaluation results not being applied correctly.
	- Fixed a possible race condition affecting proxy support setup during system startup.
	- Fixed a potential crash when searching for hidden Wi-Fi networks by SSID.
	- Fixed PPP compatibility with NetworkManager by reverting to version 2.4.9 with the latest security updates.
	- Updated libproxy to version 0.5.9, thus adding support for downloading PAC files via HTTPS
	- Fixed an issue where the LAN connection did not always come back up after resume.
- **WiFi**
	- Fixed Realtek WiFi driver rekey process causing short disconnects.
- **Open VPN**
	- Fixed VPN autostart issues when dealing with multiple network interfaces.
- **HID**
	- Fixed issue where the touchscreen was disabled after the Setup Assistant: Microsoft Surface devices can continue to be operated without requiring an external mouse.
	- Fixed mouse cursor disappearing in sessions when a connected touchscreen is powered off or disconnected.
- **Setup Assistant**
	- Fixed the network interface name displayed in the `Setup Assistant  System Information` dialog to always match the interface configured in the Setup Assistant, which is the first network interface.
	- Fixed handling of multiple Ethernet devices in the Setup Assistant during first boot.
- **Driver**
	- Fixed driver selection for dual-GPU systems by adding a registry key to switch between the amdgpu and modesetting drivers, with modesetting remaining the default.
		| Parameter | Registry | Type | Value |
		| ------ | ------ | ------ | ------ |
		| `Use generic modesetting driver for AMDGPU in Dual GPU cases.` | `x.drivers.amdgpu.use_modesetting_for_dual_gpu` | bool | *enabled* (default) / disabled |
- **VirtualBox**
	- Fixed a mouse position offset which occurred after adding or removing a 2nd display when using IGEL OS as a virtual machine on a SINA Workstation.
	- Fixed visual distortions which occurred when adding a 2nd display when using IGEL OS as a virtual machine on a SINA Workstation.
	- Fixed driver selection for the VMGFX DRM driver by adding a registry option to use modesetting, enabled by default on SINA Workstation virtual machines
		| Parameter | Registry | Range | Value |
		| ------ | ------ | ------ | ------ |
		| `Use generic modesetting driver for VMWare virtual graphics.` | `x.drivers.vmware.use_modesetting` | [Auto][True][False] | *Auto* |
- **Audio**
	- Fixed incorrect test sound playback for mono audio output in audio tray app, where "Front Left" was played instead of "Front Center".
	- Fixed incorrect default audio output selection for DisplayPort and HDMI monitors on Amulet Hotkey DX1715 devices.
	- Fixed internal microphone not being detected on HP 255 G10 notebooks.
	- Fixed incomplete or unintended test sound playback when switching between audio output devices in the audio tray app.
	- Fixed audio debug messages appearing during normal operation.
- **Hardware**
	- Fixed display resolution limitations on certain monitors by adding an option to ignore the stereo mode flag in the monitor EDID.
		| Parameter | Registry | Range | Value |
		| ------ | ------ | ------ | ------ |
		| `Ignore stereo mode flag in EDID` | `x.drivers.kms.ignore_stereo_mode` | [Default][Enabled][Disabled] | *Default* |
	- Fixed issue where the system and taskbar remained unresponsive for up to 90 seconds after the first resume following a reboot.
	- Improved the robustness of the license check in case of USB enumeration errors of external LAN devices.
	- HP T740 / T755 six display setup: Fixed a memory leak which happened during display reconfiguration or display hotplug.
	- Fixed an issue where Wake-on-LAN did not work from suspend on Lenovo Neo 55q Gen 6 (Krackan Point).
	- Fixed issue with Surface Pro 10 touch stops working after some time.
- **Remote Management**
	- Improved stability when multiple commands are sent close to each other which modify device state.
	- Fixed an issue that could cause app installations and updates to fail after a network change, such as connecting to a VPN.
	- Fixed incorrect UTC Unix epoch time calculation for BC&DR on Windows/IGEL OS dual-boot devices.
	- Fixed transferring of the system information to the UMS.
	- Fixed recognizing of the public CA during device registration in the Setup Assistant, in cases where CA changes.
	- Fixed sporadic failure of automatic reconnecting to the UMS.
	- Fixed a rare case where the remote manager stopped responding during multiple file download failures. For slower downloads, consider increasing the `system.remotemanager.rmagent_timeout` registry setting.
	- Reduced memory consumption of the pullfile command
	- Fixed a rare case where a device lost its UMS registration together with all profile settings, although it had not been removed from the UMS.
		- A device now gives up its registration only after every configured UMS and ICG server has been asked, at least one of them has answered that the device is unknown, and that answer has been confirmed over a configurable period (24 hours by default).
		- Servers which are not reachable, and servers which refuse the device without stating that it is unknown, no longer influence that decision.
		- The new registry setting `system.remotemanager.release_delay` defines that period in seconds (default 86400, limited to 30 days).
		- If a device does give up its registration, it now documents the reason in a log file `/wfs/igel-rmagent/self-release-<timestamp>.log` for support analysis.
		- The device can now notify the user when a remote management problem is detected. The message asks the user to contact the IT helpdesk and names the unit ID of the device, so that the helpdesk can identify it. It appears when the device gives up its registration on its own, or when all configured servers have answered that the device is unknown. It is shown on the lock screen as well and stays until the user closes it. The user is informed only once per problem, not on every retry.
		- That message is switched off by default and is enabled by the new registry setting `system.remotemanager.notify_user_on_rm_problem`.
	- Improved Remote Management Agent graceful exit when the connection to UMS times out.
	- Fixed UMS autoregistration by triggering it for each network interface.
	- Fixed a rare crash of the Remote Management Agent that could occur shortly after booting the device, while it was connecting to the UMS. The agent was restarted automatically, so no user action was required. Until the restart had completed, the device could briefly appear as offline in the UMS, and the transfer of device information and the registration of installed apps could be delayed.
	- Fixed renewal of the root CA certificate used by the UMS or ICG server when the new certificate has the same distinguished name (DN) as the previous certificate.
	- Fixed requesting discovery data during the registration process. The discovery data is essential if the UMS is accessed over a reverse proxy or an application gateway.
- **Accessibility**
	- Fixed icons' scale in the system-tray for Microsoft Surface Pro 10 by setting Monitor DPI default to 150.
	- Removed password protection for accessibility features, including Screen Magnifier, Screen Reader, and On-Screen Keyboard.
	- Removed `Use screen magnifier` and `Use screen reader` parameters from Setup.
- **IGEL Desktop**
	- Fixed missing zoom icon in Application Launcher.
	- Added a refresh button to the Display Tray application to recover displays that could sporadically appear black in multi-monitor setups.
	- Fixed wrong taskbar position when primary monitor is not the first monitor.
	- Fixed mixed colors in tray panel for certain theme and color combinations.
	- Fixed missing activation toggle after deactivating mobile broadband.
	- Fixed missing calendar week numbers in the calendar.
	- Fixed wrong rotation of external displays on lid close.
	- Fixed incorrect auto-focus behavior for new windows appearing on the desktop such as the Zoom notification window.
	- Fixed broken Win+L hotkey to lock screen.
	- Fixed inhibiting screen saver while meetings are ongoing.
	- Added a configuration parameter to select the first day of the week shown in the calendar.
		| Parameter | Registry | Type | Range | Value |
		| ------ | ------ | ------ | ------ | ------ |
		| First day of the week | userinterface.calendar.first_day_of_week | string | [monday][sunday] | monday (default) |
		- The parameter can be changed in Time and Date tray application.
	- Fixed broken display of tray icons.
	- Fixed bug not showing all tray icons from the same application.
	- Fixed broken display configurations when hot-plugging monitors.
	- Fixed the launch of some published Citrix applications.
	- Fixed wrong listing of applications in start menu when using guest user.
	- Fixed black screens with only the mouse cursor visible after rebooting a system with a six-monitor 4K configuration using internal and external GPUs.
	- Fixed missing taskbar after registering device in UMS.
	- Fixed wrong display ID in display tray app.
	- Fixed bug where original monitor positions were not respected when updating display layout.
	- Improved memory usage by reusing monitor identifier windows on display changes.
	- Fixed memory leak in tray applications.
	- Fixed Desktop and Start menu folders with a backslash () in their names not opening.
	- Fixed wrong monitor configuration when exceeding the frame buffer.
	- Fixed broken focus in Wifi credentials dialog.
	- Fixed black screen shown on login screen.
	- Fixed monitor flickering after login.
	- Fixed wrong display layout after assigning a display profile.
	- Fixed an issue where an incorrect display resolution was applied when a different resolution was configured.
	- Fixed the AD password change dialog freezing when using the window close button.
- **Licensing**
	- Fixed UMS manageability problem in case an endpoint has a starter license and an Add-on license, but no Workspace Edition or IGEL Subscription license.

## Known Issues
- In very rare cases all apps are lost after an update. Should this be the case, an error message is shown "Opening system App Journal failed." - if the device is managed, the apps will be reinstalled after a reboot.
- Increased writeable cache partition size (by default). First boot with 12.4.x and newer may take more time (once) when updating from a 12.2.x or older base system app.
- When TPM PCR+PIN device encryption is enabled, an additional PIN entry is required the first time a new base system release is booted.
- The "Always on Top" feature in the context menu does not work with full-screen-windows.
- When using Keycloak as SSO provider, cookies are not forwarded to the user session after a successful login. This may cause users to be prompted to authenticate again within a browser session
- Shadowing may flicker on older Intel devices without modesetting due to limitations of the legacy graphics driver.
- On devices with an assigned Persona Profile, the initial download of applications associated through the Persona Profile may fail with the error "File size is zero" or "App not found". The download succeeds after a desktop reauthentication or device reboot.
- **OSC Installer**
	- On Lenovo T14 Gen 6 Intel devices, the OSC may display a black screen with no desktop during a standard boot. A failsafe boot is required to access the OSC installer system.
	- The update duration of the base_system might increase, especially on older hardware up to 2 minutes
	- OSC installation is not supported on devices with 2 GB RAM.
- **App Management**
	- Downgrades to versions prior to 12.7.0 are possible - despite the implemented downgrade limit - via the Local App Portal or using igelpkgctl through local terminal. In UMS-managed environments, disabling the Local App Portal is recommended to ensure version control. If the older shim bootloader signature (in 12.6.1 PR1 or earlier) is revoked and Secure Boot is enabled, the device may become unbootable. Verify boot compatibility before downgrading.
- **Chromium**
	- Downgrading base system to earlier versions may result in reset of the Chromium profile partition.
- **Network**
	- In some cases, network is not working in combination of Lenovo K14 Gen1 (AMD) and Lenovo Universal Dock. There is a kernel bugreport open but no proper fix so far.
	- The network tray app does not display information about bonded network interfaces.
- **WiFi**
	- WiFi chipset BE200 does not work reliable in WiFi 7 networks.
- **Smartcard**
	- Smart card logon in IGEL for Windows sessions fails with error "No certificate detected"
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
	- The Audio Tray App may incorrectly display a plugged-in Audio-Jack-Headset as Built-in Audio / HDMI / DisplayPort instead of the correct headset name. Audio and Microphone functionality would still work correctly.
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
	- Automatic screen rotation is not supported on CAITRON CT13S10 (Microsoft Surface Pro 10) devices.
	- Using six or more displays on HP T740 / T755: Repeated hot-plug or display reconfiguration events may cause the system to run out of memory, resulting in system instability or requiring a reboot.
	- With certain monitors, switching from DP to HDMI on the Lenovo Neo 55q Gen 6 (Krackan Point) sometimes causes the system to reboot.
	- Multi-touch functionality not available for Blue Line Touch Monitor OP215.
	- The system can freeze when rotating a monitor in a multi-monitor configuration on HP EliteDesk 7 G1a devices.
- **Remote Management**
	- Copying a saved certificate profile in IGEL Setup invalidates the original profile's challenge password.
	- Workaround: Re-enter the challenge password on the original profile.
	- (For UMS versions older than 12.13.100) Certificate Enrollment may fail when the subject field contains an email address e.g. "E=user@example.com".
	- Workaround: Use the email address field in the Subject Alternative Name (SAN) instead.
- **VNC**
	- VNC shadowing sessions become noticeably less responsive while the client device is in monitor standby (DPMS) mode. Normal responsiveness returns when the monitor wakes.
- **Accessibility**
	- The screen reader (accessibility feature) currently does not work with the following apps:
		- IGEL Setup
		- IGEL First Boot Wizard
		- IGEL Start Menu
		- IGEL System Tray apps (volume, network,  notifications, ...)
		- VPN and SSO login dialogs
	- Screen Reader is not supported in TC Setup.
	- The automatic Braille display detection system sometimes picks up non-Braille-display devices, rendering them unusable. A workaround is to disable the Braille support: `User Interface > Accessibility > Screen Reader > Braille > Enable Braille support > Disable`.
- **BIOS**
	- On the Lenovo ThinkEdge SE50a Gen1, the ThinkLMI interface is not supported. This means getting/setting BIOS settings does not work. BIOS updates are supported.
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
