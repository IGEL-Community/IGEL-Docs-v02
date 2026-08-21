IGEL OS Creator  
===============

Firmware version 12.10.0  
Release date 2026-07-31  
Last update of this document 2026-07-31  


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
| Kernel                                    | 6.18.35 #mainline-lxos12-g1781001272     |
| Xorg X11 Server                           | 21.1.23-1igel1780396689          |
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

# Changes since: 12.9.0

## New Features
- Added new configuration parameters for the Bluetooth device allow list based on Manufacturer ID or Service UUID.
	|  IGEL Setup  |  Parameter  |  Registry   |  Type       |  Value      |  Tooltip      |
	| ------ | ------ | ------ | ------ | ------ | ------ |
	|  Devices > Bluetooth > Access Control  |  Service UUIDs  |  devices.bluetooth.access_control.cod_filter%.service_uuids  |  string  |  empty (default)  |  Enter allowed Service UUIDs in 128-bit format. Each one on a single line.  |
	|  Devices > Bluetooth > Access Control  |  Manufacturer ID  |  devices.bluetooth.access_control.cod_filter%.manufacturer_key  |  string  |  empty (default)  |  Enter allowed Manufacturer ID Hex (e.g. 0x004c)  |
- Removed obsolete certificates in /wfs/client-certs folder.
- Removed legacy, unused OpenSSL 1.1 binaries from base system.
- **App Management**
	- Added a parameter to disable default repositories. The parameter disables all repositories with a priority of 110 or lower, built-in repositories, and repositories provided by UMS as an update proxy.
		|  IGEL Setup  |  Parameter  |  Registry   |  Type       |  Value      |
		| ------ | ------ | ------ | ------ | ------ |
		|  System > Update  |  `Disable default repositories`  |  `update.disable_default_repos`  |  bool  |  enabled / *disabled* (default)  |
- **Network**
	- Added and updated setup panels for configuring network bonding.
		|  IGEL Setup  |  Parameter  |  Registry   |  Type       |  Value      |  Range      |
		| ------ | ------ | ------ | ------ | ------ | ------ |
		|  Network > LAN Interfaces > Bonding groups > Group N  |  `LACP rate`  |  `network.interfaces.bonding.bond%.lacp_rate`  |  |  *slow*  | [fast (1s)]  |
		|  Network > LAN Interfaces > Ethernet > Interface N  |  `Bonding group`  |  `network.interfaces.ethernet.device%.bond_index`  |  integer  |  empty *Default*  |  |
		|  Network > LAN Interfaces > Ethernet > Interface N  |  `This is the primary device in the bond`  |  `network.interfaces.ethernet.device%.bond_primary`  |  bool  |  enabled / *disabled* (default)  |  |
		|  Network > LAN Interfaces > Bonding groups > Group N  |  `Bond mode`  |  `network.interfaces.bonding.bond%.mode`  |  |  *active-backup*  |  [active-backup] |
		|  Network > LAN Interfaces > Bonding groups > Group N  |  `Bond link monitoring`  |  `network.interfaces.bonding.bond%.link_monitoring`  |  |  *MII*  | [balance-rr][802.3ad][balance-xor][balance-tlb][balance-alb][broadcast]  |
		|  Network > LAN Interfaces > Bonding groups > Group N  |  `ARP targets`  |  `network.interfaces.bonding.bond%.arp_targets`  |  string  |  empty *Default*  |  [MII] |
		|  Network > LAN Interfaces > Bonding groups > Group N  |  `Monitoring frequency (ms)`  |  `network.interfaces.bonding.bond%.monitoring_frequency`  |  integer  |  100 *Default*  | [ARP]  |
		|  Network > LAN Interfaces > Bonding groups > Group N  |  `Link up delay (ms)`  |  `network.interfaces.bonding.bond%.link_up_delay`  |  integer  |  0 *Default*  |  |
		|  Network > LAN Interfaces > Bonding groups > Group N  |  `Link down delay (ms)`  |  `network.interfaces.bonding.bond%.link_down_delay`  |  integer  |  0 *Default*  |  |
		|  Network > LAN Interfaces > Bonding groups > Group N  |  `Transmit hash policy`  |  `network.interfaces.bonding.bond%.xmit_hash_policy`  |  |  *layer2*  |  [layer2] |
- **Smartcard**
	- Added the required components to access smartcards with GPG.
		| Parameter | Registry | Value |
		| ------ | ------ | ------ |
		| Debug Level | system.security.gpg.scdaemon.debug-level | none (default) |
		| UI program for PIN Entry | system.security.gpg.pinentry-program | /bin/pinentry-qt (default) / /bin/pinentry-curses |
		| Debug Level | system.security.gpg.debug-level | none (default) |
		| Use shared mode to access the card via PC/SC | system.security.gpg.scdaemon.pcsc-shared | true (default) / false |
	- Added a parameter to enable / disable support for the Kerberos smart card PKINIT PAChecksum2 extension. This parameter must be enabled for Windows Server 2025 and later.
		| Parameter | Registry | Value |
		| ------ | ------ | ------ |
		| Send PAChecksum2 in PKINIT | auth.krb5.realms.pkinit.pkinit_send_pachecksum2 | true(default)/false |
- **Driver**
	- Added the Linux Dispersive (VTC) kernel driver module.
- **Audio**
	- Added the ability to set the default audio device based on rules set in the setup.
	  - Each rule has a priority and the rule with the highest priority that matches an available audio device gets applied.
	  - Rules get applied if either, the rules change, or an audio device was added or removed.
	  - Existing ways to set the default audio device (force default after reboot and default port selector) are still supported, but the new rules, if set, take priority over the old ways.
	  - To get a list of all available devices on the current system `igel-default-sound-setter --list` can be called, which returns a list grouped by input and output devices.
	  - New parameters:
		|  IGEL Setup  |  Parameter  |  Registry   |  Type       |  Value      |  Range      |
		| ------ | ------ | ------ | ------ | ------ | ------ |
		|  Devices > Audio > Options  |  `Profile`  |  `userinterface.sound.default_input.rules%.device_profile`  |  string  |  empty *Default*  |  |
		|  Devices > Audio > Options  |  `Priority`  |  `userinterface.sound.default_output.rules%.priority`  |  integer  |  empty *Default*  |  |
		|  Devices > Audio > Options  |  `Type`  |  `userinterface.sound.default_output.rules%.type`  |  |  **  |  [Class][Device]  |
		|  Devices > Audio > Options  |  `Class`  |  `userinterface.sound.default_output.rules%.class`  |  |  **  |  [HDMI / DisplayPort][Speakers][Headphones]  |
		|  Devices > Audio > Options  |  `Card`  |  `userinterface.sound.default_output.rules%.device_card`  |  string  |  empty *Default*  |  |
		|  Devices > Audio > Options  |  `Port`  |  `userinterface.sound.default_output.rules%.device_port`  |  string  |  empty *Default*  |  |
		|  Devices > Audio > Options  |  `Profile`  |  `userinterface.sound.default_output.rules%.device_profile`  |  string  |  empty *Default*  |  |
		|  Devices > Audio > Options  |  `Priority`  |  `userinterface.sound.default_input.rules%.priority`  |  integer  |  empty *Default*  |  |
		|  Devices > Audio > Options  |  `Type`  |  `userinterface.sound.default_input.rules%.type`  |  |  **  |  [Class][Device]  |
		|  Devices > Audio > Options  |  `Class`  |  `userinterface.sound.default_input.rules%.class`  |  |  *auto*  |  [Microphone][Headset microphone]  |
		|  Devices > Audio > Options  |  `Card`  |  `userinterface.sound.default_input.rules%.device_card`  |  string  |  empty *Default*  |  |
		|  Devices > Audio > Options  |  `Port`  |  `userinterface.sound.default_input.rules%.device_port`  |  string  |  empty *Default*  |  |
- **Hardware**
	- Added hardware support for Lenovo ThinkPad T14 Gen 6 (Intel).
	- Added hardware support for Microsoft Surface Pro 10.
	- Added hardware support for Dell Pro Slim QCS1250.
	- Added hardware support for Caitron CT13S10.
	- Added hardware support for Dell Pro Micro Thin Client Q9M1260
	- Added hardware support for Lenovo L13 2-in-1 Gen 6 (AMD).
	  - Added special function key support for Lenovo L13 2-in-1 Gen 6 (AMD):
	  - F1: Volume mute
	  - F2: Volume down
	  - F3: Volume up
	  - F4: Microphone mute
	  - F5: Brightness down
	  - F6: Brightness up
	  - F7: Display configuration
	  - F8: Mode (power)
	  - F9: Screenshot (+CTRL)
	  - F10: Snipping tool (+CTRL)
	  - F12: Jump to browser URL (+CTRL)
	- Added support for Lenovo ThinkPad USB4 Dock 5000
	- Added support for Lenovo Thunderbolt 4 Smart Dock Gen 2 7500
- **Accessibility**
	- Added DPI settings to the Accessibility Tray App.
	  - Affected parameters: `x.xserver0.dpi` and `x.server0.auto_dpi`
- **Dual Boot BC/DR (IGEL OS)**
	- Updated the BC&DR boot menu design.
	- Improved BC&DR boot recovery.
	- Added BC&DR Emergency Mode support.
- **IGEL Desktop**
	- Added a D-Bus API for the Display Configuration.
	- Added a parameter to show only managed printers in the Printer Tray App.
		|  Parameter  |  Registry   |  Type       |  Value      |
		| ------ | ------ | ------ | ------ |
		|  `Show only managed printers`  |  `userinterface.system_tray.printer.show_only_managed_printers`  |  bool  |  enabled / *disabled* (default)  |
	- Added a parameter to configure taskbar elements, such as showing or hiding the Start menu button and the Quick Start panel.
		|  IGEL Setup  |  Parameter  |  Registry   |  Type       |  Value      |  Tooltip    |  Tooltip  |
		| ------ | ------ | ------ | ------ | ------ | ------ | ------ |
		|  User Interface > Desktop > Taskbar Items and User Interface > Appliance Mode  |  `Show quick start panel`  |  `windowmanager.wm%.variables.show_quick_start_panel`  |  bool  |  *enabled* (default) / disabled  |  Show start menu button in the corner of the taskbar  |  Whether to show quick start icons in the taskbar  |
		|  User Interface > Desktop > Taskbar Items and User Interface > Appliance Mode  |  `Show start menu button`  |  `windowmanager.wm%.variables.show_startmenu_button`  |  bool  |  *enabled* (default) / disabled  |  Show start menu button in the corner of the taskbar  |  |
	- Added IGEL OS support for Appliance Mode, configurable on setup page User Interface > Appliance Mode.
	- Added the parameter `system.powersave.backlight_percentage` to control the backlight of supported monitors using a percentage value from 0 till 100.
	  - The parameter can be changed by the user via a slider in the battery tray application. The visibility of this slider can be controlled with `userinterface.system_tray.battery.brightness_slider`.
	  - New parameters:
		|  Parameter  |  Registry   |  Type       |  Value      |  IGEL Setup  |
		| ------ | ------ | ------ | ------ | ------ |
		|  `Show brightness slider in battery tray app`  |  `userinterface.system_tray.battery.brightness_slider`  |  integer  |  true *Default* / false  |  System > Power Options > Display > Brightness Reduction  |
		|  `Set the brightness of all supported monitors to the specified percentage value`  |  `system.powersave.backlight_percentage`  |  integer  |  0 *Default*  |  System > Power Options > Display > Brightness Reduction  |
	- Added hotkeys definition for increasing and decreasing brightness on User Interface > Hotkeys. The brightness change step is 10% in both directions.
	  - The hotkeys are disabled by default.
	  - The default hot key for increase is <Ctrl|Alt + b>
	  - The default hot key for decrease is <Ctrl|Alt|Shift + b>
	- Added the Manrope font family
	- Added a `backlight-manager` tool to control the backlight of internal and external monitors. The tool supports the following actions:
	  - `get-supported-outputs`: List backlight-capable outputs. Prints "internal" when the internal panel supports brightness control.
	  - `get-brightness <output|internal>`: Print the current brightness for a named external output or the internal panel.
	  - `set-brightness <output|internal|all> [0-100]`: Set the brightness for a for a named external output or the internal panel or all supported monitors.
	- Added a password visibility toggle for password and PIN fields in the Active Directory/Kerberos and Local User logon and screen lock dialogs. The toggle can be configured using the following parameter:
		| Setup | Parameter | Registry | Value |
		| ------ | ------ | ------ | ------ |
		| Security > Logon > Local User | Show password visibility toggle button | sessions.xlock0.options.show_password_toggle | false(default)/true |
		| Security > Logon > Active Directory/Kerberos |  |  |  |
- **IMC**
	- Added support for IGEL Managed Container (IMC) app.

## Security Fixes
- Fixed xdg-dbus-proxy security issue CVE-2026-34080.
- Fixed libarchive security issues CVE-2026-5121, CVE-2026-4426 and CVE-2026-4424.
- Fixed openvpn security issues CVE-2026-40215 and CVE-2026-35058.
- Fixed lcms2 security issue CVE-2026-41254.
- Fixed libpng1.6 security issue CVE-2026-34757.
- Fixed webkit2gtk security issues CVE-2026-20676, CVE-2026-20652, CVE-2026-20644, CVE-2026-20636, CVE-2026-20635, CVE-2026-20608, CVE-2025-43511, CVE-2025-43457 and CVE-2025-43214.
- Fixed wpewebkit security issues CVE-2026-28871, CVE-2026-28861, CVE-2026-28859, CVE-2026-28857, CVE-2026-20691, CVE-2026-20676, CVE-2026-20665, CVE-2026-20664, CVE-2026-20652, CVE-2026-20644, CVE-2026-20643, CVE-2026-20636, CVE-2026-20635, CVE-2026-20608, CVE-2025-46299, CVE-2025-43511, CVE-2025-43457, CVE-2025-43441, CVE-2025-43438, CVE-2025-43433, CVE-2025-43214, CVE-2025-43213, CVE-2025-31277, CVE-2025-31223 and CVE-2023-43010.
- Fixed dnsmasq security issues CVE-2026-5172, CVE-2026-4893, CVE-2026-4892, CVE-2026-4891, CVE-2026-4890 and CVE-2026-2291.
- Fixed krb5 security issues CVE-2026-40356 and CVE-2026-40355.
- Fixed bind9 security issues CVE-2026-5950, CVE-2026-5946, CVE-2026-3592 and CVE-2026-3039.
- Fixed gvfs security issues CVE-2026-28296 and CVE-2026-28295.
- Fixed glibc security issues CVE-2026-4438, CVE-2026-4437, CVE-2026-4046, CVE-2026-0915, CVE-2026-0861 and CVE-2025-15281.
- Fixed libcap2 security issue CVE-2026-4878.
- Fixed libexif security issues CVE-2026-40386, CVE-2026-40385 and CVE-2026-32775.
- Fixed libgcrypt20 security issue CVE-2026-41989.
- Fixed haveged security issue CVE-2026-41054.
- Fixed nghttp2 security issue CVE-2026-27135.
- Fixed openjpeg2 security issue CVE-2026-6192.
- Fixed python3.11 security issues CVE-2026-1299, CVE-2026-0865, CVE-2026-0672, CVE-2025-8291, CVE-2025-8194, CVE-2025-6075, CVE-2025-6069, CVE-2025-4516, CVE-2025-15282, CVE-2025-13837, CVE-2025-13836, CVE-2025-12084 and CVE-2025-11468.
- Fixed taglib security issue CVE-2023-47466.
- Fixed rsync security issues CVE-2026-43620, CVE-2026-43619, CVE-2026-43618, CVE-2026-43617 and CVE-2026-29518.
- Fixed sed security issue CVE-2026-5958.
- Fixed samba security issues CVE-2026-2340, CVE-2026-3012, CVE-2026-3238, CVE-2026-4480 and CVE-2026-4408.
- Fixed libvncserver security issue CVE-2026-44988.
- Fixed openssl security issues CVE-2026-9076, CVE-2026-7383, CVE-2026-45447, CVE-2026-45446, CVE-2026-45445, CVE-2026-42770, CVE-2026-42766, CVE-2026-34182, CVE-2026-34180 and CVE-2026-28388.
- Updated ca-certificates to version 20260601.
- Fixed xorg-server security issues CVE-2026-50256, CVE-2026-50257, CVE-2026-50258, CVE-2026-50259, CVE-2026-50260, CVE-2026-50261, CVE-2026-50262 and CVE-2026-50263.
- Fixed ffmpeg security issue CVE-2026-40962.
- Fixed gst-plugins-good1.0 security issues CVE-2026-5056, CVE-2026-46470 and CVE-2026-46469.
- Fixed opensc security issue CVE-2026-10275.
- Fixed libwebsockets security issue CVE-2026-10650.
- Fixed poppler security issues CVE-2026-10118, CVE-2025-52885 and CVE-2025-43718.
- Updated Kernel to 6.18.35 LTS version to fix security issues.

## Resolved Issues
- Fixed wrong position of tray context menu for printerlogic.
- Fixed autostart notification of sessions in case session restart is active.
- Fixed issue with Czech keyboard layout.
- Fixed Thunar file manager to run in restricted mode by default in IGEL OS. All security restrictions are enforced automatically without requiring command-line flags.
  - Whats's restricted (by design):
    - The IGEL OS file system and user home directory are not accessible from the sidebar;
    - The location bar is read-only (no manual path entry);
    - File creation, renaming and linking are disabled;
    - Context menus (right-click) are disabled;
    - The "Open With" application chooser is disabled;
    - Network browsing is removed;
    - Terminal access is disabled.
  - The sidebar can be configured via setup register keys (used e.g. by MTP app):
	|  Parameter  |  Registry   |  Type       |  Value      |  Range      |
	| ------ | ------ | ------ | ------ | ------ |
	|  `Sidebar Visibility`  |  `userinterface.fileman.sidebar`  |  string  |  *Auto*  |  [Auto][Off][On]  |
	|  `Directory to add in the sidebar`  |  `userinterface.fileman.places%.path`  |  string  |  empty *Default*  |  |
	|  `Directory's icon path`  |  `userinterface.fileman.places%.icon`  |  string  |  empty *Default*  |  |
    - `Sidebar Visibility`: The default value makes the sidebar automatically show only when a removable device is connected. When no removable device is being detected while the sidebar is present, a placeholder "(No devices connected)" will be visible.
    - `Directory to add in the sidebar`: allows configuring a shortcut entry in the sidebar "PLACES" section; it is an absolute path to the directory.
    - `Directory's icon path`: (Optional) absolute path to a custom icon (.png, .svg, .ico, .jpg).
  - Command-Line Options changes:
    - -S (--strip_down) is now a no-op (stripped down/restricted mode is the default).
        -- Passing -S is accepted silently for backward compatibility.
    - -m, -s, -p, -l (force visibility of menubar, statusbar, sidepane, location bar) remain available and work as before.
    - -i (--limit_folder) and -N (--limit_folder_name) remain available and work as before.
- Fixed Hyper-V guest OS capabilities (Hyper-V is not officially supported).
- **AVD**
	- Fixed AVD not restarting automatically after resuming from suspend.
- **App Management**
	- Fixed IGEL App deployment when `Action after app assignment from UMS` was set to `Nothing` and devices were moved between directories in UMS with different IGEL App assignments.
- **Network**
	- Reverted the default network interface order for Dell Optiplex 3000 devices.
- **Citrix NSGClient**
	- Fixed wrong position for tray context menu of Citrix Secure access client.
- **HID**
	- Fixed issue with HP SmartCard keyboards which needed an extra key press to wake up at boot. Affected models:
	    - TPC-C001K
	    - SK-2027
- **Audio**
	- Fixed H.264 video decoding caused by a missing GStreamer videoparser plugin.
- **Hardware**
	- Fixed touchpad support for the Lenovo T14 Gen 6 with Intel Lunar Lake CPU.
	- Fixed flickering of full-HD webcam (Logitech HD Pro Webcam C920)
- **Remote Management**
	- Fixed log collection via UMS hanging for an extended period if X11 or a user systemd session was no longer available.
	- Fixed Custom Corporate Identity (CI) not being applied after upgrading from IGEL OS 11 to IGEL OS 12.
	- Fixed measuring of the UTC Unix Epoch time.
	- Fixed a possible crash while registering unknown apps in the UMS.
- **Accessibility**
	- Fixed "Set DPI" not taking effect.
- **Dual Boot BC/DR (IGEL OS)**
	- Fixed the dual boot loader not recognizing Windows boot entries containing hexadecimal digits.
	- Improved the reliability of EFI partition operations to help maintain filesystem integrity during installation and update.
	- Improved command processing between IGEL Dual Boot and RMAgent and UMS by automatically handling UTF-8 BOM characters in exchanged messages.
- **IGEL Desktop**
	- Fixed wrong position of tray context menu for FortiClient.
	- Fixed login window offset for specific taskbar configurations.
	- Fixed wrongly rendered tray icons.
	- Fixed automatic Bluetooth device pairing after a system restart or resume from suspend.
	- Removed unneeded scrollbar in battery tray app below brightness slider.
	- Fixed broken input in captive portal window for wireless networks.
	- Fixed password field formatting when Kerberos extended login is enabled
- **TC Setup**
	- Fixed wrong display of multiline elements in Setup.
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
- On devices with an assigned Persona Profile, the initial download of applications associated through the Persona Profile may fail with the error "File size is zero" or "App not found". The download succeeds after a desktop reauthentication or device reboot.
- On laptops with the lid closed, the Device Encryption unlock dialog is displayed on the closed internal display and is not shown on external monitors connected through a docking station.
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
	- Automatic screen rotation is not supported on CAITRON CT13S10 (Microsoft Surface Pro 10) devices.
	- Using six or more displays on HP T740 / T755: Repeated hot-plug or display reconfiguration events may cause the system to run out of memory, resulting in system instability or requiring a reboot.
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
