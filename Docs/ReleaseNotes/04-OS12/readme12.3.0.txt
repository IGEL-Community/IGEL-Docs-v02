
IGEL OS Creator  
===============

Firmware version 12.3.0  
Release date 2023-12-19  
Last update of this document 2023-12-19  


Supported Devices  
-------------------------------------------------------------------------------

[> Supported IGEL OS 12 devices](https://kb.igel.com/os12-supported-hardware)


Component Versions
-------------------------------------------------------------------------------

| Components                                |                                  |
|-------------------------------------------|----------------------------------|
| OpenSSL                                   | 1.1.1f-1ubuntu2.20               |
| Bluetooth Stack (bluez)                   | 5.66-1igel1669186181             |
| MESA OpenGL Stack                         | 22.3.6-1+deb12u1igel1683795808   |
| VDPAU Library Version                     | 1.5-2igel1677954724              |
| Graphics Driver INTEL                     | 2.99.917+git20210115-1igel1647250103     |
| Graphics Driver ATI/RADEON                | 19.1.0-3igel1657777718           |
| Graphics Driver ATI/AMDGPU                | 23.0.0-1igel1677481842           |
| Graphics Driver Nouveau (Nvidia Legacy)   | 1.0.17-2igel1644486678           |
| Graphics Driver Nvidia                    | 525.125.06-0ubuntu0.20.04.3      |
| Graphics Driver VMware                    | 13.3.0-3igel1628859075           |
| Graphics Driver QXL (Spice)               | 0.1.5-3+git20200331-2igel1647014792    |
| Graphics Driver FBDEV                     | 0.5.0-2igel1644486279            |
| Graphics Driver VESA                      | 2.5.0-1+b1igel1647004096         |
| Input Driver Evdev                        | 2.10.6-2+b1igel1647004239        |
| Input Driver Elographics                  | 1.4.3-1igel1678083379            |
| Input Driver Synaptics                    | 1.9.2-1+b1igel1683803726         |
| Input Driver VMMouse                      | 13.1.0-1ubuntu2igel1628499891    |
| Input Driver Wacom                        | 0.39.0-0ubuntu1igel1629136980    |
| Kernel                                    | 6.1.63 #mainline-lxos12-g1702634244    |
| Xorg X11 Server                           | 21.1.9-1igel1701772983           |
| Lightdm Graphical Login Manager           | 1.30.0-0ubuntu4~20.04.2igel1649274243      |
| XFCE4 Window Manager                      | 4.14.5-1~18.04igel1643191202     |
| ISC DHCP Client                           | 4.4.1-2.1ubuntu5.20.04.5         |
| WebKit2Gtk                                | 2.42.2-1igel1699737747           |
| Python3                                   | 3.8.10                           |
| Virtualbox Guest Utils                    | 7.0.8-dfsg-2igel1682408222       |
| Virtualbox X11 Guest Utils                | 7.0.8-dfsg-2igel1682408222       |
| Open VM Tools                             | 11.3.0-2ubuntu0~ubuntu20.04.7    |
| Open VM Desktop Tools                     | 11.3.0-2ubuntu0~ubuntu20.04.7    |
| Xen Guest Utilities                       | 7.10.0-0ubuntu2                  |
| Spice Vdagent                             | 0.22.1-3+b2igel1680584586        |
| Qemu Guest Agent                          | 8.0.4+dfsg-3+b1igel1692901316    |


# Changes since: 12.2.0

## New Features
- Added system-tray app for mouse and touchpad device configuration.
	- User is able to adjust main mouse and touchpad settings like:
	- Speed
	- Left handed mode
	- Scrolling direction and method
	- Tap to click and palm detection
- Changed default input driver to libinput.
- Added parameter to enable/disable tray-icon and to enable/disable natural scrolling for mice:
	| Parameter | Registry | Type | Value |
	| ------ | ------ | ------ | ------ |
	| Natural Scroll | `userinterface.mouse.naturalscroll` | bool | enabled / *disabled* (default) |
	| Show input settings tray icon on desktop | `userinterface.system_tray.input.desktop` | bool | *enabled* (default) / disabled |
- Added: In Setup Assistant, user can enter optional structure tag during connection to UMS via one-time-password.
- Added: If system gets automatically assigned to an UMS during firstboot, the Setup Assistant presents profile- and app-installation(s) and reboots automatically.
- Added SSO support for Identity Providers using OpenID Connect. Configuration at IGEL Setup > Security > Logon > Single Sign-On > Identity Providers - select Identity Provider "OpenID Connect":
	| Parameter | Registry | Type | Value |
	| ------ | ------ | ------ | ------ |
	| `Client secret` | `auth.cloudidp.oidc.client_secret` | string | empty *Default* |
	| `Issuer URL` | `auth.cloudidp.oidc.idpurl` | string | empty *Default* |
	| `Client ID` | `auth.cloudidp.oidc.client_id` | string | empty *Default* |
- Added SSO support for VMware Workspace ONE Access as Identity Provider. Configuration at IGEL Setup > Security > Logon > Single Sign-On > Identity Providers - select Identity Provider "VMware Workspace ONE Access":
	|  Parameter  |  Registry   |  Type       |  Value      |
	| ------ | ------ | ------ | ------ |
	|  `Client secret`  |  `auth.cloudidp.vmwaccess.client_secret`  |  string  |  empty *Default*  |
	|  `Workspace ONE Access issuer URL`  |  `auth.cloudidp.vmwaccess.idpurl`  |  string  |  empty *Default*  |
	|  `Client ID`  |  `auth.cloudidp.vmwaccess.client_id`  |  string  |  empty *Default*  |
- Added SSO support for Ping Identity / PingOne as Identity Provider. Configuration at IGEL Setup > Security > Logon > Single Sign-On > Identity Providers - select Identity Provider "Ping Identity | PingOne":
	| Parameter | Registry | Type | Value |
	| ------ | ------ | ------ | ------ |
	| `Client secret` | `auth.cloudidp.pingone.client_secret` | string | empty *Default* |
	| `PingOne issuer URL` | `auth.cloudidp.pingone.idpurl` | string | empty *Default* |
	| `Client ID` | `auth.cloudidp.pingone.client_id` | string | empty *Default* |
- Added support for post session commands. To configure and use post session commands, corresponding OS12 App must support post session commands as well.
- Changed the initial default devicename and hostname of UD Pockets to UDP<UnitId>. Systems already in use will only be affected after reset to factory defaults.
- Improved add-on license handling: A message is shown if OS12 App requires add-on license which is not present / available via UMS.
- Updated kernel to version 6.1.63.
- **OSC Installer**
	- Added support for custom Unit ID rules. This offers possibility to choose appropriate MAC address of an internal network interface as Unit ID. Please visit the Knowledge Base for further details and how to use this feature.
- **App Management**
	- Added support for automatic update on boot and automatic update on calendar time. The following parameters were introduced for corresponding configuration.
		| Parameter | Registry | Type | Value |
		| ------ | ------ | ------ | ------ |
		| `Check for and download updates for non pinned apps on given calendar time, use the crontab syntax to specify the calendar time` | `update.auto_update_calendar` | string | *empty* |
		| `Check for and download updates for non pinned apps on boot` | `update.auto_update_on_boot` | bool | *enabled* (default) / disabled |
- **Network**
	- Added MACsec (IEEE 802.1AE) support in dynamic CAK mode.
	- Updated Lenovo FCC unlock tool for support of Quectel EM05 chipset - used on several Lenovo devices.
- **Open VPN**
	- Updated cipher configuration of Open VPN -  and added possibility to specify data-ciphers list. By default the default cipher list AES-256-GCM:AES-128-GCM:CHACHA20-POLY1305 is active. Otherwise, custom list can be specified in the Data ciphers parameter. Enter the ciphers separated with ':'. The existing parameter 'Cipher' is outdated and therefore removed.
		| Setup | Parameter | Registry | Value |
		| ------ | ------ | ------ | ------ |
		| `Network > VPN > Open VPN > Connection > Options` | `Data ciphers` | `sessions.openvpn%.vpnopts.data_ciphers` | empty *{*}Default{*}* |
		| `Network > VPN > Open VPN > Connection > Options` | `Use default data cipher list` | `sessions.openvpn%.vpnopts.use_default_cipher_list` | *on* / off |
- **HID**
	- Updated ELO touch driver to version 5.2 for single-touch - and version 4.3 for multi-touch.
- **X11 system**
	- Changed registry default to activate DRI3 as default.
		|  Parameter  |  Registry   |  Type       |  Value      |
		| ------ | ------ | ------ | ------ |
		|  `Use DRI3`  |  `x.drivers.use_dri3`  |  bool  |  *enabled* (default) / disabled  |
- **Multimedia**
	- Added libcam-tools to base system.
- **Hardware**
	- Added hardware support for Lenovo ThinkPad L14 and L15 Gen4 AMD/Intel
	- Added hardware support for Lenovo ThinkStation P3 Tiny.
	- Added hardware support for LG 24CR670I AiO.
	- Added hardware support for LG AiO 34CR650.
	- Added hardware support for LG AiO 27CQ650.
	- Removed support for UD7-LX 10 and UD7-LX 11 (devices do not meet minimal hardware requirements for OS12).
- **Remote Management**
	- Added support for custom device attributes.
	- Added device specific command support for OS12 Apps and OS12 Base System.
	- Fixed sporadically failures while retrieving authentication token within of a 'scan-and-register' or automatic registering process.
	- Switched to the IGEL's implementation of the EST, used for onboarding of devices running IGEL OS12.
	- Switched to RSA 4096 key pair instead of EC-521 - this broadens the compatibility with various application firewalls or reverse proxy systems. The existing key pair is automatically changed from EC to RSA during boot after device is removed from the UMS.
	- Fixed handling of CA chains issued by a public PKI - now the CA certificates of the involved public PKI are automatically added to trusted CA bundle during onboarding process.
	- Fixed retrieving of bootstrapping 'zero-trust' CA certificates - this is involved in ICG-style, automatic and 'scan-and-register' onboarding flows. The retrieving of CA certificates could fail if server side must be accessed over reverse proxy.
- **IGEL Desktop**
	- Added: If OS12 runs on UD Pocket, the Setup Assistant shows the unit ID (usb-serial-number) in system information.
	- Added option to configure time zone within calendar tray app. Feature can be disabled by parameter system.time.timezone_in_tray.
	- Changed default value of palmdetection from false to true.
	- The LAN system tray displays if connection is secured via MACsec.

## Security Fixes
- Fixed libwebp security issue CVE-2023-4863 (initial only Chromium related) and CVE-2023-5129.
- Fixed open-vm-tools security issues CVE-2023-20900, CVE-2023-20867, CVE-2023-34059 and CVE-2023-34058.
- Fixed vim security issues CVE-2023-5535, CVE-2023-5441, CVE-2023-5344, CVE-2023-4781, CVE-2023-4752, CVE-2023-4751, CVE-2023-4750, CVE-2023-4735, CVE-2023-4733, CVE-2022-4293, CVE-2022-4292, CVE-2022-3705, CVE-2022-3591, CVE-2022-3520, CVE-2022-3352, CVE-2022-3324, CVE-2022-3256, CVE-2022-3234, CVE-2022-3099, CVE-2022-3037, CVE-2022-3016, CVE-2022-2598, CVE-2022-2289, CVE-2022-2287, CVE-2022-2286, CVE-2022-2285, CVE-2022-2284, CVE-2022-2264, CVE-2022-2257, CVE-2022-2210 and CVE-2022-2208.
- Fixed cups security issues CVE-2023-4504 and CVE-2023-32360.
- Fixed curl security issues CVE-2023-38039, CVE-2023-38546 and CVE-2023-38545.
- Fixed krb5 security issue CVE-2023-36054.
- Fixed gawk security issue CVE-2023-4156.
- Fixed bind9 security issue CVE-2023-3341.
- Fixed cjose security issue CVE-2023-37464.
- Fixed flac security issue CVE-2020-22219.
- Fixed ghostscript security issues CVE-2023-38559, CVE-2020-21890 and CVE-2020-21710.
- Fixed mysql-8.0 security issues CVE-2023-22058, CVE-2023-22057, CVE-2023-22056, CVE-2023-22054, CVE-2023-22053, CVE-2023-22048, CVE-2023-22046, CVE-2023-22038, CVE-2023-22033, CVE-2023-22008, CVE-2023-22005, CVE-2023-22114, CVE-2023-22112, CVE-2023-22103, CVE-2023-22097, CVE-2023-22092,CVE-2023-22084, CVE-2023-22079, CVE-2023-22078, CVE-2023-22070, CVE-2023-22068, CVE-2023-22066, CVE-2023-22064,CVE-2023-22059 and CVE-2023-22032.
- Fixed poppler security issues CVE-2022-27337, CVE-2020-36024 and CVE-2020-36023.
- Fixed librsvg security issue CVE-2023-38633.
- Fixed tiff security issues CVE-2023-38289, CVE-2023-38288, CVE-2023-3618, CVE-2023-3316, CVE-2023-2908, CVE-2023-26966, CVE-2023-26965, CVE-2023-25433 and CVE-2022-48281.
- Fixed qemu security issues CVE-2023-4135, CVE-2023-40360, CVE-2023-3354, CVE-2023-3255, CVE-2023-3180 and CVE-2023-2861.
- Fixed webkit2gtk security issues CVE-2023-41993, CVE-2023-41074, CVE-2023-40451, CVE-2023-39928, CVE-2023-39434 and CVE-2023-35074.
- Fixed llvm-toolchain-15 security issues CVE-2023-29939, CVE-2023-29934, CVE-2023-29933 and CVE-2023-29932.
- Fixed libx11 security issues CVE-2023-43787, CVE-2023-43786 and CVE-2023-43785.
- Fixed ghostscript security issue CVE-2023-43115.
- Fixed samba security issues CVE-2023-42669, CVE-2023-4154 and CVE-2023-4091.
- Fixed tiff security issue CVE-2023-1916.
- Fixed libxpm security issues CVE-2023-43789, CVE-2023-43788, CVE-2023-43787 and CVE-2023-43786.
- Fixed procps security issue CVE-2023-4016.
- Fixed qtbase-opensource-src security issues CVE-2023-38197, CVE-2023-37369, CVE-2023-34410, CVE-2023-33285, CVE-2023-32763, CVE-2023-32762, CVE-2023-24607 and CVE-2022-25255.
- Fixed qtsvg-opensource-src security issues CVE-2023-32573 and CVE-2021-45930.
- Fixed aom security issues CVE-2021-30475, CVE-2021-30474, CVE-2021-30473, CVE-2020-36135, CVE-2020-36133, CVE-2020-36131 and CVE-2020-36130.
- Fixed openssl security issues CVE-2023-3817 and CVE-2023-3446.
- Fixed xorg-server security issues CVE-2023-5574, CVE-2023-5380 and CVE-2023-5367.
- Fixed opensc security issues CVE-2023-4535, CVE-2023-40661 and CVE-2023-40660.
- Fixed python-urllib3 security issues CVE-2023-45803 and CVE-2023-43804.
- Fixed grub2 security issues CVE-2022-3775, CVE-2022-2601 and CVE-2021-3981.
- Fixed openvpn security issues CVE-2023-46850 and CVE-2023-46849.
- Fixed avahi security issues CVE-2023-38473, CVE-2023-38472, CVE-2023-38471, CVE-2023-38470 and CVE-2023-38469.
- Fixed gnutls28 security issue CVE-2023-5981.
- Fixed user permission configuration of editor mousepad.
- Fixed gstreamer and plugin (libav, omx, vaapi) security issues CVE-2023-44446, CVE-2023-44429, CVE-2023-40476, CVE-2023-40475, CVE-2023-40474, ZDI-CAN-21444, ZDI-CAN-21443, CVE-2023-37329, CVE-2023-37328, CVE-2023-37327
- Fixed libminizip1 security issue CVE-2023-45853

## Resolved Issues
- Fixed known limitation: On some devices the cpu governor did not switch to set value when power supply is plugged or unplugged.
- Added former Single Sign-On configuration parameters for backwards compatibility. These were used before 12.2.0.
	| Parameter | Registry | Type | Value |
	| ------ | ------ | ------ | ------ |
	| `Azure AD Tenant Name/ID (deprecated)` | `auth.cloudidp.aad_tenant` | string | empty *Default* |
	| `Identity Provider URL (deprecated)` | `auth.cloudidp.idpurl` | string | empty *Default* |
	| `Client/Application ID (deprecated)` | `auth.cloudidp.client_id` | string | empty *Default* |
	| `Client secret (deprecated)` | `auth.cloudidp.client_secret` | string | empty *Default* |
- Fixed immediate wakeup issue after shutdown on some HP mt645 G7.
- Fixed not starting Lenovo docking station TBT 3
- Fixed handling of proxy configurations with a protocol like "http://". If no protocol is specified, system adds "http://". Otherwise, specified protocol is used.
- The Setup Assistant shows base system version in correct scheme / format.
- Fixed label and tooltip of parameter "Deny shadowing via external VNC tool" on page System>Remote Access>Shadow. Before this fix the meaning was the opposite, which was wrong.
- Fixed IGEL OS version showed in System Information accessory.
- Fixed hiding 'About' button in start menu - if set via setup parameter.
- Fixed device getting stuck while reboot/shutdown/logoff if network is offline and local user login is active.
- **App Management**
	- Fixed: Show all app-related errors as notification locally on IGEL OS. Only errors while downloading were shown locally before - now also installation errors are included / shown.
- **Chromium**
	- Fixed Chromium not being able to import certificates with spaces in file name.
- **Network**
	- Added information about used encryption or security type to the ethernet and wifi network tray-apps.
	- Fixed: If WiFi automatic switch is enabled and WiFi got disabled due to an active LAN connection, the user cannot (re-)enable WiFi via system tray app.
- **HID**
	- Fixed handling of ELO touch devices in multi-monitor configuration.
	- Fixed Elo Singletouch (USB) configuration to work after reboot.
	- Fixed touchscreen configuration for devices using standard mouse interface.
- **CUPS Printing**
	- Fixed handling of cups services in base_system. Added conditions to start services only, if cups_printing app is installed.
- **Audio**
	- Fixed configuration of "PCM Volume" at IGEL Setup > Devices > Audio > Options to work for values 100% - 150% (registry key 'userinterfacte.sound.remote_values'). This over amplification must be enabled by parameter 'userinterface.sound.overamplification'.
	- Fixed headset support on LG 24CN650 with sound chip ALC256.
	- Fixed audio on HP t240: Removed internal speaker and microphone devices as not supported. Fixed hotplug of external headsets.
- **Hardware**
	- Fixed function key F8 for microphone on/off on HP mt645 G7.
- **Remote Management**
	- Fixed applying of received settings during boot. Applying could sporadically block and result in a deadlock, the received settings were not applied then.
- **IGEL Desktop**
	- Fixed: Mobile broadband configuration dialogue in IGEL OS Setup Assistant and Setup.
	- Fixed missing suspend button text in suspend confirmation dialog when suspend timeout is triggered
- **Licensing**
	- "Migrate Licenses" button in OSC is off and disabled during installation if no previous installed licenses are found
	- Fixed validity of Starter license after reinstalling OS via OS Creator with "Migrate Settings" activated.
	- Fixed custom Unit ID rules.
	- Fixed computation of the Unit ID. Now wired interfaces take precedence over wireless interfaces again.

## Known Issues
- Display Configurator may show hotplugged monitors as disabled.
- Issues may occur if monitors are connected via docking station.
	- In general: Monitor hotplug not stable yet and can trigger misconfiguration.
- The downgrade to base system 12.00.900 or 12.00.910 is not supported.
- In very rare cases all apps are lost after an update. Should this be the case, an error message is shown "Opening system App Journal failed." - if the device is manged, the apps will be reinstalled after a reboot.
- Display Configurator: Rotation of displays connected to the Lenovo ThinkPad USB-C Hybrid Dock can fail.
- Display configuration of displays connected to HP G5 Docking Station may fail on HP t655.
- PXE Image for 12.3.0 is not offered with that release.
- Increased writeable cache partition size (by default). First boot with 12.3.0 may take more time (once).
- **Citrix**
	- In regards of CVE-2023-41993, CVE-2023-39928 & CVE-2023-41074: Older Webkit libraries are used in Citrix for compatibility reasons. Further details via Knowledge Base [https://kb.igel.com/securitysafety/en/isn-2023-25-webkit-vulnerabilities-101066782.html]
- **Chromium**
	- Downgrading base system to earlier versions may result in reset of the Chromium profile partition.
- **Network**
	- In some cases, network is not working in combination of Lenovo K14 Gen1 (AMD) and Lenovo Universal Dock. There is a kernel bugreport open but no proper fix so far.
- **Audio**
	- LG 34CN650 Headset mic via jack is not working
	- LG 27CN650 Headset mic via jack is not working
- **Hardware**
	- Wake on LAN is not functional on Dell OptiPlex 3000 and Lenovo K14 Gen1
	- Built-in fingerprint sensor is not supported on HP mt440 and mt645.
	- If using 6 x 4K@60Hz monitors on a t755/t740 with the additional graphic card, one or two of the monitors may stay black after coming back from DPMS off state.
	- This is caused by using the additional graphic card as primary, which only has 512MB VRAM (the VRAM is not sufficient in this configuration)
	- The solution:
	-* Open BIOS and increase the VRAM size of the iGPU to 2048MiB (maybe 1024MiB may also work)
	-* Activation of IGEL registry key *x.drivers.swap_card0_with_card1,* so the iGPU will become the Primary GPU. Connector names will be changed with that!!
	- Wake up from suspend via UMS does not work on HP mt645 devices. Workaround: Disable system suspend and use shutdown instead.
- **IGEL Desktop**
	- On-screen keyboard sporadically crashes when typing.
	- XFWM4 composite manager can break screen lock and enables sporadically access to open applications. It is recommended to not enable registry key windowmanager.wm0.variables.usecompositing. The composite manager is disabled by default.
	- Closing shutdown dialog requires a double ESC key press.
	- If two monitors are configured in a vertical layout (one above the other), and those monitors are configured with "auto-detect" resolution, saving leads to a wrong layout order.
	- Some touchpads are recognized as touchpad and mouse. This results in showing possible user settings for both variants.
- **Licensing**
	- Manual deployment of add-on licenses for IGEL Agent for Imprivata licenses (via UMS) is only possible after finished installation of IGEL Agent for Imprivata app on device.

