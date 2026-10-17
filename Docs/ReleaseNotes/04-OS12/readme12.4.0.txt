IGEL OS Creator  
===============

Firmware version 12.4.0  
Release date 2024-04-24  
Last update of this document 2024-04-24  


Supported Devices  
-------------------------------------------------------------------------------

[> Supported IGEL OS 12 devices](https://kb.igel.com/os12-supported-hardware)


Component Versions
-------------------------------------------------------------------------------

| Components                                |                                  |
|-------------------------------------------|----------------------------------|
| OpenSSL                                   | 1.1.1f-1ubuntu2.21               |
| Bluetooth Stack (bluez)                   | 5.71-1igel1704700934             |
| MESA OpenGL Stack                         | 23.3.4-1igel1706599657           |
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
| Kernel                                    | 6.6.16 #mainline-lxos12-g1713186456    |
| Xorg X11 Server                           | 21.1.11-2igel1706815238          |
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

# Changes since: 12.3.0

## New Features
- Updated IGEL screensaver logo.
- Updated IGEL boot animation.
- Changed: Xorg.conf does not have any "Monitor" sections anymore, relying on Xorg's automatic detection.
- Updated kernel to version 6.6.16.
- Updated mesa to version 23.3.4.
- Added (enhanced) settings for kernel cmdline options
  - New registry keys:
	| Parameter | Registry | Type | Value | Range |
	| ------ | ------ | ------ | ------ | ------ |
	| Set reboot kernel parameters. | system.kernel.bootparams.reboot |  | _Default_ | [Default][Bios][Triple][Kbd][Acpi][Efi][Pci] |
	| Disable use of initial boot framebuffer. | system.kernel.bootparams.vga_off | bool | enabled / _disabled_ (default) |  |
	| Set maximum allowed processor cstate. | system.kernel.bootparams.max_proc_cstate |  | _No limit_ | [No limit][1][2][3][4][5][6][7][8][9] |
	| Enable debug output for i8042 driver. | system.kernel.bootparams.i8042.debug | bool | enabled / _disabled_ (default) |  |
	| Do not use muxing for i8042 driver. | system.kernel.bootparams.i8042.nomux | bool | enabled / _disabled_ (default) |  |
	| Disable use of PnP configuration for i8042 driver. | system.kernel.bootparams.i8042.nopnp | bool | enabled / _disabled_ (default) |  |
	| Disable use of AUX loopback command for i8042 driver. | system.kernel.bootparams.i8042.noloop | bool | enabled / _disabled_ (default) |  |
	| Ignore timeout signaled by controller for i8042 driver. | system.kernel.bootparams.i8042.notimeout | bool | enabled / _disabled_ (default) |  |
	| Reset controller during init for i8042 driver. | system.kernel.bootparams.i8042.reset | bool | enabled / _disabled_ (default) |  |
	| Set ACPI kernel parameters. | system.kernel.bootparams.acpi |  | _No setting_ | [No setting][Force][On][Off][Noirq][Strict][Rsdt][Copy_dsdt] |
  - Changed registry keys:
	| Parameter | Registry | Range | Value |
	| ------ | ------ | ------ | ------ |
	| Various PCI subsystem options | system.kernel.bootparams.pci | [Default][Conf Mechanism 1][Conf Mechanism 2][Disable multiple PCI domains][Disable use of MMCONFIG][Disable MSI][Ignore ACPI PCI host bridge window][Ignore ACPI IRQ routing][Route IRQ for all PCI devices] | _Default_ |
	| Set maximum allowed cstate on intel cpus. | system.kernel.bootparams.max_cstate | [No limit][0][1][2][3][4][5][6] | _No limit_ |
- Updated IGEL logo within IGEL Setup Assistant
- Changed logo on default wallpaper.
- Added support for User Login History for login types AD/Kerberos, Single Sign-On (ID Provider) and Local User. If enabled, login and logoff events of corresponding types are logged in UMS.
	| Setup | Parameter | Registry | Value |
	| ------ | ------ | ------ | ------ |
	| System > Remote Management > Options | Log login and logoff events | system.remotemanager.log_authentication | *disabled* (default) / enabled |
- Added checkbox and corresponding text for accepting EULA on IGEL OS.
- Changed: Base system requires Citrix CWAL version 2311 or newer for Citrix Cloud login. Old libwebkit library is removed due to security reasons.
- Added / enhanced post session command support: Besides Logoff and Shutdown, customized commands can be configured.
- **OSC Installer**
	- Added possibility to create a minimal (self-extracting / expanding) factory image with the OSC installer.
- **Network**
	- SCEP: Improved handling of client certificate subject change (particularly if the hostname is part of the subject). Registry key:
		|  Parameter  |  Registry   |  Range      |  Value      |
		| ------ | ------ | ------ | ------ |
		|  `Hostname change handling`  |  `network.scepclient.cert%.hostname_change_handling`  |  [Ignore][Reset]  |  *Ignore*  |
	- A notification is shown, when SCEP server is reachable but certificate renewal fails. The notification includes any deviation of the desired subject from the old one.
	- Added check if BIOS has Wake-on-LAN disabled. If disabled, it is not recommended to configure network interface to use WoL. This check is only supported / possible on Lenovo devices with official IGEL OS hardware support. Parameter:
		| Parameter | Registry | Type | Value |
		| ------ | ------ | ------ | ------ |
		| `Respect the BIOS WoL setting so if disabled reflect this for the linux network devices settings.` | `network.interfaces.respect_bios_wol_setting` | bool | *enabled* (default) / disabled |
	- Added: The`Automatic switch of network connection` parameter (network.applet.wireless.enable_wifi_auto_switch) is renamed and handles Ethernet, WiFi and Mobile Broadband connections. Furthermore, the parameter was moved to a new section in Setup: `Network > Common Settings`, together with `Computer Name` (network.dns.hostname) and `Host List` (network.hosts%).
	- Added support for MACsec with preshared key. NetworkManager currently requires that the CAK consists of 32 hexadecimal digits and the CKN consists of 64 hexadecimal digits.
- **Audio**
	- Added input overamplification parameter to complement the existing overamplification parameter.
		|  Setup  |  Parameter  |  Registry   |  Type       |  Value      |
		| ------ | ------ | ------ | ------ | ------ |
		|  `Devices > Audio > Options`  |  `Enable input volume overamplification`  |  `userinterface.sound.input_overamplification`  |  bool  |  enabled / *disabled* (default)  |
	- Added new Audio tray app. The Sound Preferences dialog is not available anymore.
		|  Setup  |  Parameter  |  Registry   |  Type      |  Value      |
		| ------ | ------ | ------ | ------ | ------ |
		|  `User Interface > Desktop > Taskbar Items`  |  `Show audio tray icon on desktop`  |  `userinterface.system_tray.audio.desktop`  |  bool  |  *enabled (default)*/disabled  |
- **Hardware**
	- Added support for Lenovo USB-C to Ethernet Adapter
	- Added driver for Intel EC1000R gigabit network adapter.
	- Added hardware support for Lenovo ThinkPad L13 Intel Gen4.
	- Validated 256GB 2230 PCIe NVMe module for HP t550 and t655.
	- Added WWAN support on HP mt440 device with BIOS v1.08.00 and Intel XMM7560 module Firmware v1.16.48.
	- Added hardware support for Lenovo ThinkPad L13 AMD Gen4.
- **Remote Management**
	- Added support for system-wide proxy configuration.
	- Added compatibility for remote management via F5 Reverse Proxy / SSL Offloading (requires UMS 12.04.100 or later).
	- Added compatibility for remote management via Microsoft's Azure Application Gateway (requires UMS 12.04.100 or later).
	- Added: RSA-4096 key is created as device key by default. The key type can be changed via IGEL setup:
		|  Registry    |  Value       |
		| ------ | ------ |
		|  `system.remotemanager.device_key_type`  |  *RSA-4096* (default) / EC-P521R1  |
- **IGEL Desktop**
	- Replaced Display Switcher with new Display Tray App.
		|  Setup  |  Parameter  |  Registry   |  Type      |  Value      |
		| ------ | ------ | ------ | ------ | ------ |
		|  `User Interface > Desktop > Taskbar Items`  |  `Show display tray icon on desktop`  |  `userinterface.system_tray.display.desktop`  |  bool  |  *enabled (default)*/disabled  |
	- Added switch for changing display modes: Custom, External, Internal and Mirror.
	- Technically reworked monitor handling. Monitors are now identified by their EDID data.
	- Changed: Tray Apps are used in login and lock screen. Configurable on setup page `User Interface > Screenlock / Screensaver > Taskbar`:
		|  Parameter  |  Registry   |  Type      |  Value      |
		| ------ | ------ | ------ | ------ |
		|  `Show input settings tray icon on lockscreen`  |  `userinterface.system_tray.input.lockscreen`  |  bool  |  enabled/*disabled (default)*  |
		|  `Show battery tray icon on lockscreen`  |  `userinterface.system_tray.battery.lockscreen`  |  bool  |  *enabled (default)*/disabled  |
		|  `Show UMS connection status tray icon on lockscreen`  |  `userinterface.system_tray.ums_status.lockscreen`  |  bool  |  *enabled (default)*/disabled  |
		|  `Show ethernet connection status tray icon on lockscreen`  |  `userinterface.system_tray.lan.lockscreen`  |  bool  |  *enabled (default)*/disabled  |
		|  `Show wifi connection status tray icon on lockscreen`  |  `userinterface.system_tray.wifi.lockscreen`  |  bool  |  *enabled (default)*/disabled  |
		|  `Show mobile-broadband connection status tray icon on lockscreen`  |  `userinterface.system_tray.mobile_broadband.lockscreen`  |  bool  |  *enabled (default)*/disabled  |
		|  `Show audio tray icon on lockscreen`  |  `userinterface.system_tray.audio.lockscreen`  |  bool  |  enabled/*disabled (default)*  |
	- Changed default values for taskbar and icon position, new defaults are:
		|  Setup   |  Parameter   |  Registry    |  Type        |  Value       |
		| ------ | ------ | ------ | ------ | ------ |
		|  User Interface > Desktop > Taskbar  |  `Monitor`        |  `windowmanager.wm0.variables.taskbarxineramamonitor`              |  range                            |   *[Primary monitor] (default)* [1st monitor] [2nd monitor] [3rd monitor] [4th monitor] [5th monitor] [6th monitor] [7th monitor] [8th monitor] |
		|  User Interface > Desktop  |  `Monitor for Desktop Icons`        |  `windowmanager.wm0.variables.desktopxineramamonitor`              |  range                            |   [All monitors] *[Same as taskbar] (default)* [1st monitor] [2nd monitor] [3rd monitor] [4th monitor] [5th monitor] [6th monitor] [7th monitor] [8th monitor] |
- **Mobile Broadband**
	- Added Quectel EM05-G support for Lenovo ThinkPad L13 AMD Gen4 and L13 Intel Gen4.
	- Added regional support with Quectel EM05-G for US SIM cards on supported Lenovo ThinkPad devices.
	- Added option to establish Mobile Broadband connection automatically.
		|  Setup  | Parameter | Registry | Type | Value |
		| ------ | ------ | ------ | ------ | ------ |
		|  Network > Mobile Broadband  | `Enable automatically connect` | `network.interfaces.mobile_broadband.auto_connect` | bool | *enabled* (default) / disabled |
	- Added roaming parameter for WWAN connection.
		|  Setup  | Parameter | Registry | Type | Value |
		| ------ | ------ | ------ | ------ | ------ |
		|  Network > Mobile Broadband  | `Roaming` | `network.interfaces.mobile_broadband.roaming` | bool | *enabled* (default) / disabled |
	- Added configurable request for entering PIN of SIM-card within the Mobile Broadband tray app.
		|  Setup  | Parameter | Registry | Type | Value |
		| ------ | ------ | ------ | ------ | ------ |
		|  Network > Mobile Broadband  | `Allow changing the request for the PIN of the SIM-card after boot in the tray application` | `network.interfaces.mobile_broadband.changing_pin_request_allowed` | bool | *enabled* (default) / disabled |
	- Changed: Mobile Broadband (network.interfaces.mobile_broadband.enabled) is now enabled per default (configurable on setup page `Network > Mobile Broadband`).
	- The `Automatic switch of network connection` parameter (network.applet.wireless.enable_wifi_auto_switch) now handles the automatic blocking and unblocking not only for WiFi but also for Mobile Broadband connections. In Setup the parameter was moved to a new section `Network > Common Settings`, along with `Computer Name` (network.dns.hostname) and `Host List` (network.hosts%).
	- Added reworked Tray App for Mobile Broadband support.
		|  Setup  |  Parameter  |  Registry   |  Type      |  Value      |
		| ------ | ------ | ------ | ------ | ------ |
		|  `User Interface > Desktop > Taskbar Items`  |  `Show mobile-broadband connection status tray icon on desktop`  |  `userinterface.system_tray.mobile_broadband.desktop`  |  bool  |  *enabled (default)*/disabled  |
	- Added: Mobile internet Access Point Name with username and password can be defined on setup page `Network > Mobile Broadband`. This APN has higher priority than any auto-detected provider.
	- Added configurable permission to change PIN of SIM-card within Mobile Broadband Tray App.
		|  Setup  | Parameter | Registry | Type | Value |
		| ------ | ------ | ------ | ------ | ------ |
		|  Network > Mobile Broadband  | `Allow changing the PIN of the SIM-card in the tray application` | `network.interfaces.mobile_broadband.changing_pin_allowed` | bool | *enabled* (default) / disabled |
	- Added: Possibilty to unlock SIM card with PUK (if needed).
- **SSO**
	- Added support for automatical Single Sign-on (SSO) login with given user credentials. All our Identity Providers except the generic OpenID Connect provider are supported.
		|  Setup      |  Parameter  |  Registry   |  Type       |  Value      |
		| ------ | ------ | ------ | ------ | ------ |
		|  Security > Logon > Single Sign-on  |  `Password for autologin`  |  `auth.cloudidp.password`  |  string  |  empty *Default*  |
		|  Security > Logon > Single Sign-on  |  `Automatically perform login`  |  `auth.cloudidp.autologin`  |  bool  |  enabled / *disabled* (default)  |
		|  Security > Logon > Single Sign-on  |  `Username for autologin`  |  `auth.cloudidp.username`  |  string  |  empty *Default*  |
	- Added password-less guest-user login with limited access to applications. Each application session can be made available in normal user login, guest login, or both with Registry parameters sessions.<instance>.login_method or app.<app-name>.sessions.<instance>.login_method - requires Chromium Browser 120.0.6099.216 Build 5.0 or later.
		|  Setup  |  Parameter  |  Registry  |  Value  |
		| ------ | ------ | ------ | ------ |
		|  Security > Logon > Guest |  Present session to  |  `sessions.<instance>.login_method` <br> `app.<app-name>.sessions.<instance>.login_method`  |  "User" (default) / "Guest" / "All"  |
	- This is the default for any session including app sessions. Latter ones inherit to `app.<app-name>.sessions.<app_%_or_instance#>.login_method`. Standard sessions inherit to `sessions.<name_%_or_instance#>.login_method`.
	- Choose applications to be available in a guest session by setting the above parameters to 'Guest' or 'All'. On command-line usage of nodelist sessions to get a currently defined list of sessions.

## Security Fixes
- Fixed libssh2 security issue CVE-2023-48795.
- Fixed openssh security issues CVE-2023-51385, CVE-2023-51384 and CVE-2023-48795.
- Fixed libminizip1 security issue CVE-2023-45853
- Fixed vim-tiny security issues CVE-2022-1725, CVE-2022-1771, CVE-2022-1897, CVE-2022-2000, CVE-2023-46246, CVE-2023-48231, CVE-2023-48233, CVE-2023-48234, CVE-2023-48235, CVE-2023-48236 and CVE-2023-48237
- Fixed glibc security issues CVE-2023-4813 and CVE-2023-4806.
- Fixed nghttp2 security issue CVE-2023-44487.
- Fixed perl security issue CVE-2023-47038.
- Fixed poppler security issues CVE-2022-38349, CVE-2022-37052, CVE-2022-37051, CVE-2022-37050 and CVE-2020-23804.
- Fixed python3.8 security issue CVE-2023-40217.
- Fixed python-cryptography security issue CVE-2023-23931.
- Fixed sqlite3 security issue CVE-2023-7104.
- Fixed tiff security issues CVE-2023-3576 and CVE-2022-40090.
- Fixed tar security issue CVE-2023-39804.
- Updated gst-plugins-base1.0 packages:
  - gstreamer1.0-alsa from 1.22.6-1igel1701244602 to 1.22.9-1igel1707141227 version
  - gir1.2-gst-plugins-base-1.0 from 1.22.6-1igel1701244602 to 1.22.9-1igel1707141227 version
  - gstreamer1.0-gl from 1.22.6-1igel1701244602 to 1.22.9-1igel1707141227 version
  - gstreamer1.0-plugins-base from 1.22.6-1igel1701244602 to 1.22.9-1igel1707141227 version
  - gstreamer1.0-x from 1.22.6-1igel1701244602 to 1.22.9-1igel1707141227 version
  - libgstreamer-gl1.0-0 from 1.22.6-1igel1701244602 to 1.22.9-1igel1707141227 version
  - libgstreamer-plugins-base1.0-0 from 1.22.6-1igel1701244602 to 1.22.9-1igel1707141227 version
- Updated gstreamer1.0-libav from 1.22.7-1igel1701247613 to 1.22.9-1igel1707166316 version
- Updated gst-omx packages:
  - gstreamer1.0-omx-generic from 1.22.4-1igel1690182724 to 1.22.8-1igel1704883480 version
  - gstreamer1.0-omx-bellagio-config from 1.22.4-1igel1690182724 to 1.22.8-1igel1704883480 version
- Fixed gst-plugins-bad1.0 security issue CVE-2024-0444.
- Updated gst-plugins-good1.0 packages:
  - gstreamer1.0-plugins-good from 1.22.6-1+b1igel1701245188 to 1.22.9-1igel1707141628 version
  - gstreamer1.0-pulseaudio from 1.22.6-1+b1igel1701245188 to 1.22.9-1igel1707141628 version
- Updated gst-plugins-ugly1.0 packages:
  - gstreamer1.0-plugins-ugly-asf from 1.22.6-1igel1701246116 to 1.22.9-1igel1707142312 version
  - gstreamer1.0-plugins-ugly-x264 from 1.22.6-1igel1701246116 to 1.22.9-1igel1707142312 version
- Updated gstreamer1.0-vaapi from 1.22.6-1igel1701247435 to 1.22.9-1igel1707161592 version JIRA LX8-8432
- Updated gstreamer1.0 packages:
  - libgstreamer1.0-0 from 1.22.6-1igel1701244342 to 1.22.9-1+b1igel1707141080 version
  - gir1.2-gstreamer-1.0 from 1.22.6-1igel1701244342 to 1.22.9-1+b1igel1707141080 version
  - gstreamer1.0-tools from 1.22.6-1igel1701244342 to 1.22.9-1+b1igel1707141080 version
- Fixed gnutls28 security issue CVE-2024-0553:
  - libgnutls30 from 3.6.13-2ubuntu1.9 to 3.6.13-2ubuntu1.10 version (security update)
  - libgnutls-openssl27 from 3.6.13-2ubuntu1.9 to 3.6.13-2ubuntu1.10 version (security update)
- Fixed openldap security issues CVE-2023-2953:
  - libldap-2.4-2 from 2.4.49+dfsg-2ubuntu1.9 to 2.4.49+dfsg-2ubuntu1.10 version (security update)
  - ldap-utils from 2.4.49+dfsg-2ubuntu1.9 to 2.4.49+dfsg-2ubuntu1.10 version (security update)
  - libldap-common from 2.4.49+dfsg-2ubuntu1.9 to 2.4.49+dfsg-2ubuntu1.10 version (security update)
- Fixed xz-utils security issue CVE-2022-1271.
- Fixed mysql-8.0 security issues CVE-2024-20985, CVE-2024-20984, CVE-2024-20983, CVE-2024-20982, CVE-2024-20981, CVE-2024-20978, CVE-2024-20977, CVE-2024-20976, CVE-2024-20974, CVE-2024-20973, CVE-2024-20972, CVE-2024-20971, CVE-2024-20970, CVE-2024-20969, CVE-2024-20967, CVE-2024-20966, CVE-2024-20965, CVE-2024-20964, CVE-2024-20963, CVE-2024-20962, CVE-2024-20961 and CVE-2024-20960.
- Fixed openssl security issues CVE-2024-0727 and CVE-2023-5678.
- Fixed paramiko security issue CVE-2023-48795.
- Fixed pillow security issues CVE-2023-50447 and CVE-2023-44271.
- Fixed pam security issue CVE-2024-22365.
- Fixed webkit2gtk security issues CVE-2024-23222, CVE-2024-23213, CVE-2024-23206, CVE-2023-42833, CVE-2023-40414 and CVE-2014-1745.
- Fixed zlib security issues CVE-2023-45853, CVE-2022-37434 and CVE-2018-25032.
- Updated ca-certificates.
- Added registry key to prevent terrapin attack (mitigation is not active as default) on the SSH server:
	| Parameter | Registry | Type | Value |
	| ------ | ------ | ------ | ------ |
	| Disable weak MACs and Chipers to prevent terrapin attack. | network.ssh_server.enable_terrapin_mitigation | bool | enabled / _disabled_ (default) |
- Added registry key to prevent terrapin attack (mitigation is not active as default) on the SSH client:
	| Parameter | Registry | Type | Value |
	| ------ | ------ | ------ | ------ |
	| Disable weak MACs and Chipers to prevent terrapin attack. | network.ssh_client.enable_terrapin_mitigation | bool | enabled / _disabled_ (default) |
- Fixed a privilege escalation issue in the starter license. Acknowledgements to Zack Didcott for responsible disclosure.
- Fixed a privilege escalation in setup_cmd utility.
- For security reasons the accessory 'Network Tools' is enforced to run with Administrator (root) privileges only. Therefore, parameter 'Password protection on page Accessories>Network Tools was removed.
- Updated Bluez to version 5.71-1 to fix CVE-2023-45866.
- Removed custom command selection from application start dialog of file manager to prevent the execution of arbitrary commands by user.
- **X server**
	- Fixed xorg-server security issues CVE-2024-21886, CVE-2024-21885, CVE-2024-0409, CVE-2024-0408, CVE-2024-0229 and CVE-2023-6816.
	- Fixed xorg-server security issues CVE-2023-6478 and CVE-2023-6377.

## Resolved Issues
- Fixed browser certificates could not be loaded.
- More logs in the custom partition
- Also added trust-store certificates from UMS, to the valid chain for download
- Remove check of host name
- In cases where the APP Portal is unreachable the user will be informed when trying to open the local APP Portal app
- Fixed Post Session shutdown command not working.
- **Network**
	- Fixed respecting NTP server from DHCP
- **WiFi**
	- Added registry key to switch between 8852be and rtw_8852be WiFi driver. Switching to 8852be driver possibly fixes some WiFi issues. (Auto uses 8852be on HP mt645 G7).
		| Parameter | Registry | Range | Value |
		| ------ | ------ | ------ | ------ |
		| Use 8852be driver instead of rtw_8852be for WLAN. | network.drivers.realtek.use_8852be | [Auto][Yes][No] | _Auto_ |
	- Added options for configuration of rtw89core and rtw89pci kernel modules (used e.g by the rtw_8852be driver).
		|  Parameter  |  Registry   |  Type       |  Value      |
		| ------ | ------ | ------ | ------ |
		|  disable_ps_mode  |  network.drivers.rtw89core.options.disable_ps_mode  |  bool  |  _enabled_ (default) / disabled  |
		|  disable_clkreq  |  network.drivers.rtw89pci.options.disable_clkreq  |  bool  |  _enabled_ (default) / disabled  |
		|  disable_aspm_l1  |  network.drivers.rtw89pci.options.disable_aspm_l1  |  bool  |  _enabled_ (default) / disabled  |
		|  disable_aspm_l1ss  |  network.drivers.rtw89pci.options.disable_aspm_l1ss  |  bool  |  _enabled_ (default) / disabled  |
- **HID**
	- Fixed touchscreen calibration issues when multiple monitors are connected.
- **Custom Partition**
	- Fixed custom partition downloads with password when profile was created with UMS >= 12.02.100
		 - To fix already created / existing profiles (for earlier IGEL OS releases), it is necessary to set the `custom_partition.source%.crypt_password` parameter in registry.
- **Driver**
	- Fixed: Certain bluetooth devices with Mediatek-based devices were not functional.
- **VirtualBox**
	- Fixed mouse offset if using multi-monitor setup as a VirtualBox guest.
- **Audio**
	- Added parameter to disable timer scheduling in pulseaudio module-udev-detect.
		| Parameter | Registry | Range | Value |
		| ------ | ------ | ------ | ------ |
		| Disable timer scheduling for module-udev | multimedia.pulseaudio.daemon.disable-module-udev-tsched | [auto][true][false] | *auto* |
- **Remote Management**
	- Custom device attributes can now be showed and changed as user.
	- Added missing rmagent-devattrs-reset command.
	- Fixed UMS file upload that also renames the file at the destination location. Considering that change / fix, it is recommended to check if UMS file upload works as expected.
	- Fixed fingerprint check during ICG onboarding, this was impossible if the CA chain contains more than one public CA.
	- Fixed setup parameters userinterface.shutdown_dialog.allow_cancel, userinterface.shutdown_dialog.disable_dialog, userinterface.rmagent.cancel_usermessage and userinterface.rmagent.enable_usermessage.
	- Fixed enumeration of a range of a device attribute of type range (list).
- **IGEL Desktop**
	- The Igel-System-Tray icons are now correctly colored black or white according to the set theme.
- **SSO**
	- Added registry key to define a semicolon separated list of allowed hostnames
	for URL-redirections during the SSO login view:
		|  Parameter  |  Registry   |  Type       |  Value      |
		| ------ | ------ | ------ | ------ |
		|  `List of allowed hosts for redirection`  |  `auth.cloudidp.host_allowlist`  |  string  |  empty *Default*  |

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
	- Display configuration of displays connected to HP G5 Docking Station may fail on HP t655.
	- Rotation of displays connected to the Lenovo ThinkPad USB-C Hybrid Dock can fail.
	- Wake up from suspend via UMS does not work on HP mt645 devices. Workaround: Disable system suspend and use shutdown instead.
	- If using 6 x 4K@60Hz monitors on a t755/t740 with the additional graphic card, one or two of the monitors may stay black after coming back from DPMS off state.
	- This is caused by using the additional graphic card as primary, which only has 512MB VRAM (the VRAM is not sufficient in this configuration). Possible solution: Increasing the VRAM size of the iGPU to 2048MiB in BIOS (maybe 1024MiB may also work) and activate IGEL registry key `x.drivers.swap_card0_with_card1` so the iGPU will become the Primary GPU. Connector names will be changed with that!
	- Built-in fingerprint sensor is not supported on HP mt440 and mt645.
	- Wake on LAN is not functional on Dell OptiPlex 3000 and Lenovo K14 Gen1
- **IGEL Desktop**
	- Connecting a new audio device during running audio playback / stream may result in failure of audio tray.
	- External display mode not functional on ThinkPad L14 Gen3 AMD
	- Disabled compositing (transparency effects) in window manager to circumvent issues with screen lock. Registry key `windowmanager.wm0.variables.usecompositing` is not configurable anymore.
	- If two monitors are configured in a vertical layout (one above the other), and those monitors are configured with "auto-detect" resolution, saving leads to a wrong layout order.
	- On-screen keyboard sporadically crashes when typing.
- **Licensing**
	- Manual deployment of add-on licenses for IGEL Agent for Imprivata licenses (via UMS) is only possible after finished installation of IGEL Agent for Imprivata app on device.
