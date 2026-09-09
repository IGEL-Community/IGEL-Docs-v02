IGEL OS Creator  
===============

Firmware version 12.6.1  
Release date 2025-03-24  
Last update of this document 2025-03-24  


Supported Devices  
-------------------------------------------------------------------------------

[> Supported IGEL OS 12 devices](https://kb.igel.com/os12-supported-hardware)


Component Versions
-------------------------------------------------------------------------------

| Components                                |                                  |
|-------------------------------------------|----------------------------------|
| MESA OpenGL Stack                         | 24.2.6-1igel1730968485           |
| VDPAU Library Version                     | 1.5-2                            |
| Graphics Driver INTEL                     | 2.99.917+git20210115-1igel1654609037     |
| Graphics Driver ATI/RADEON                | 22.0.0-1igel1704966675           |
| Graphics Driver ATI/AMDGPU                | 23.0.0-1igel1705669076           |
| Graphics Driver Nouveau (Nvidia Legacy)   | 1.0.17-3igel1713877061           |
| Graphics Driver VMware                    | 13.3.0-3igel1713934792           |
| Graphics Driver QXL (Spice)               | 0.1.6-1igel1687782644            |
| Graphics Driver FBDEV                     | 0.5.0-2igel1654609009            |
| Graphics Driver VESA                      | 2.6.0-1igel1704966930            |
| Input Driver Evdev                        | 2.10.6-2+b3igel1713876266        |
| Input Driver Elographics                  | 1.4.3-1igel1678083379            |
| Input Driver Synaptics                    | 1.9.2-1+b1igel1683803726         |
| Input Driver VMMouse                      | 13.1.0-1ubuntu2igel1628499891    |
| Input Driver Wacom                        | 1.2.2-3igel1726741272            |
| Kernel                                    | 6.6.60 #mainline-lxos12-g1737730527    |
| Xorg X11 Server                           | 21.1.16-1igel1740721542          |
| Lightdm Graphical Login Manager           | 1.26.0-8igel1716879255           |
| XFCE4 Window Manager                      | 4.14.5-1~18.04igel1643191202     |
| ISC DHCP Client                           | 4.4.3-P1-2                       |
| ModemManager                              | 1.22.0-3+b2igel1731393568        |
| WebKit2Gtk                                | 2.46.6-1~deb12u1igel1739424040   |
| Python3                                   | 3.11.2                           |
| Virtualbox Guest Utils                    | 7.0.20-dfsg-1+b1igel1730700800   |
| Virtualbox X11 Guest Utils                | 7.0.20-dfsg-1+b1igel1730700800   |
| Open VM Tools                             | 12.2.0-1+deb12u2                 |
| Open VM Desktop Tools                     | 12.2.0-1+deb12u2                 |


Release Notes of installable IGEL OS 12 base system
================================================================================

# Changes since: 12.6.0

## New Features
- Removed Evince PDF / document viewer from IGEL OS base system - which is now available as a standalone app.
- Added UMS as Identity Broker for authentication. AD authentication is redirected via UMS protocol to authenticate users against Active Directory. Requires UMS 12.07.100 or later.
	| IGEL Setup | Parameter | Registry | Value |
	| ------ | ------ | ------ | ------ |
	| Security>Logon>UMS as Identity Broker | `Login with UMS as Identity Broker` | auth.login.igelums | **disabled**/enabled |
	| Security>Logon>UMS as Identity Broker | `Skip UMS as Identity Broker login if UMS server is unavailable` | auth.ums.skipifunavailable | **disabled**/enabled |
- Added basic support of Japanese keyboard input methods (mozc). Enable using following parameters:
	| IGEL Setup | Parameter | Registry | Value |
	| ------ | ------ | ------ | ------ |
	| User Interface>Input>Keyboard>Input Methods | `Keyboard input methods (experimental)` | userinterface.keyboard.ibus.enable | **disabled**/enabled |
	| User Interface>Input>Keyboard>Input Methods>Methods | `Japanese - Mozc` | userinterface.keyboard.ibus.general.preload-engine-mozc-jp | **disabled**/enabled |
- Added "No Tofu CJK" fonts supporting e.g. Japanese.
- **Network**
	- Added possibility for assigning an Ethernet device as a slave to a bridge device
		|  Parameter  |  Registry   |  Range      |  Value      |
		| ------ | ------ | ------ | ------ |
		|  `Bridge`  |  `network.interfaces.ethernet.device%.bridge`  |  [] [own]  |    |
	  - Currently, only the "own" mode is supported. This creates a bridge with the associated Ethernet device (instance of network.interfaces.ethernet.device%) as its sole slave. Additional slave devices can be added separately.
- **Multimedia**
	- Updated Fluendo multimedia codecs to the following version:
	  - gst-fluendo-aacdec to version 1.0.8
	  - gst-fluendo-h264dec to version 1.0.11
	  - gst-fluendo-hwvadec to version 2.0.6
- **Hardware**
	- Added hardware support for Pepperl+Fuchs BTC24
	- Added hardware support for Pepperl+Fuchs BTC22
- **Remote Management**
	- Added support for IGEL Asset Inventory Tracking (AIT). Requires UMS 12.08.100 or later.
		| IGEL Setup | Parameter | Registry | Type | Value |
		| ------ | ------ | ------ | ------ | ------ |
		| System > Remote Management > Options | `Enable IGEL Asset Inventory Tracking (AIT)` | `system.remotemanager.ait.enable`  | bool | *enabled* (default) / disabled |
		| System > Remote Management > Options | `AIT events delay (secs)` | `system.remotemanager.ait.delay` | integer | 6 |
	- Added parameter to configure connection priority of the igelrmserver when connecting to the UMS.
		|  IGEL Setup  |  Parameter   |  Registry    |  Type        |  Value       |
		| ------ | ------ | ------ | ------ | ------ |
		|  System > Remote Management > Options  |  `Use "igelrmserver" as fallback`  |  `system.remotemanager.igelrmserver.as_fallback`  |  bool  |  enabled / *disabled* (default)  |
	- Added option to control whether to wait for (applying) remote settings before starting sessions.
		| IGEL Setup | Parameter | Registry | Type | Value |
		| ------ | ------ | ------ | ------ | ------ |
		| System > Remote Management > Options | `Delay session start at boot time in order to apply new UMS settings` | `userinterface.sessions.wait-for-ums-config` | bool | enabled / *disabled* (default) |
		| System > Remote Management > Options | `Timeout` | `userinterface.sessions.wait-for-ums-config-timeout` | integer | 10 |
	- Adjusted display names of officially supported endpoints:
		- DELL WYSE 5070 THIN CLIENT
		- DELL OPTIPLEX 3000 THIN CLIENT
		- ELO I2
		- HP Elite mt645 G7 Mobile Thin Client
		- HP Elite t655 Thin Client
		- HP Elite mt645 G8 Mobile Thin Client
		- HP Pro mt440 G3 Mobile Thin Client
		- HP t640 Thin Client
		- HP t540 Thin Client
		- HP Pro t550 Thin Client
		- HP Elite t755 Thin Client
		- HP Elite t660 Thin Client
		- IGEL H860C
		- IGEL M350C
		- Lenovo ThinkPad L14 Gen4 (AMD)
		- Lenovo ThinkPad L14 Gen4 (Intel)
		- Lenovo ThinkPad L15 Gen4 (AMD)
		- Lenovo ThinkPad L15 Gen4 (Intel)
		- Lenovo ThinkPad L14 Gen3 (Intel)
		- Lenovo ThinkPad L14 Gen3 (AMD)
		- Lenovo K14 Gen1 (Intel)
		- Lenovo K14 Gen1 (AMD)
		- Lenovo ThinkCentre M75q Gen2
		- Lenovo ThinkCentre M70q Gen3
		- Lenovo ThinkEdge SE10
		- Lenovo ThinkCentre Neo50q Gen4
		- Lenovo ThinkStation P3 Tiny
		- Lenovo ThinkPad L13 Gen4 (Intel)
		- Lenovo ThinkPad L13 Gen4 (AMD)
		- Lenovo ThinkPad L13 Gen5 (Intel)
		- Lenovo ThinkPad L14 Gen5 (Intel)
		- Lenovo ThinkPad L14 Gen5 (AMD)
		- Lenovo ThinkPad L16 Gen1 (AMD)
		- Lenovo ThinkPad L16 Gen1 (Intel)
		- Lenovo ThinkCentre M75q Gen5
		- Lenovo ThinkCentre M70q Gen5
		- LG 34CN65x series
		- LG 24CN65x series
		- LG CQ60x series
		- LG 24CQ65x series
		- LG CL600
		- LG 34CN65x series
		- LG 24CR67x series
		- LG 27CQ65x series
		- LG 34CR65x series
		- LG gram 14ZT90R
		- LG gram 15ZT90R
		- LG gram 17ZT90R
		- SINA Workstation S
		- Pepperl+Fuchs BTC22
		- Pepperl+Fuchs BTC24
- **Licensing**
	- Added support for add-on license "IGEL MANAGED HYPERVISOR"

## Security Fixes
- Set nologin for system users tcpdump and unscd.
- Fixed webkit2gtk security issues CVE-2025-24162, CVE-2025-24158, CVE-2025-24150, CVE-2025-24143, CVE-2024-54658, CVE-2024-54543, CVE-2024-54534, CVE-2024-54508, CVE-2024-54505, CVE-2024-54502, CVE-2024-54479, CVE-2024-44309, CVE-2024-44308 and CVE-2024-27856.
- Fixed pam-pkcs11 security issues CVE-2025-24531 and CVE-2025-24032.
- Fixed libsoup2.4 security issues CVE-2024-52532, CVE-2024-52531 and CVE-2024-52530.
- Fixed bind9 security issues CVE-2024-12705 and CVE-2024-11187.
- Fixed avahi security issues CVE-2023-38473, CVE-2023-38472, CVE-2023-38471, CVE-2023-38470 and CVE-2023-38469.
- Fixed glib2.0 security issue CVE-2024-52533.
- Fixed gnutls28 security issues CVE-2024-12243 and CVE-2024-12133.
- Fixed texlive-bin security issue CVE-2024-25262.
- Fixed openjpeg2 security issues CVE-2024-56827, CVE-2024-56826, CVE-2023-39327 and CVE-2021-3575.
- Fixed python3.11 security issues CVE-2024-9287, CVE-2024-7592, CVE-2024-6923, CVE-2024-11168 and CVE-2023-27043.
- Fixed libtasn1-6 security issue CVE-2024-12133.
- Fixed tiff security issues CVE-2024-7006, CVE-2023-52356, CVE-2023-3618, CVE-2023-2908, CVE-2023-26966, CVE-2023-26965 and CVE-2023-25433.
- Fixed libwebp security issue CVE-2023-4863.
- Fixed dnsmasq security issues CVE-2023-50868, CVE-2023-50387 and CVE-2023-28450.
- Fixed rsync security issues CVE-2024-12747, CVE-2024-12088, CVE-2024-12087, CVE-2024-12086, CVE-2024-12085 and CVE-2024-12084.
- Fixed qemu security issue CVE-2024-7409.
- Fixed python-urllib3 security issues CVE-2024-37891, CVE-2023-45803 and CVE-2023-43804.
- Fixed openssl security issues CVE-2024-9143 and CVE-2024-13176.
- Fixed openssh security issues CVE-2025-26466 and CVE-2025-26465.
- Fixed xorg-server security issues CVE-2025-26601, CVE-2025-26600, CVE-2025-26599, CVE-2025-26598, CVE-2025-26597, CVE-2025-26596, CVE-2025-26595 and CVE-2025-26594.
- Fixed opensc security issues CVE-2024-8443, CVE-2024-45620, CVE-2024-45619, CVE-2024-45618, CVE-2024-45617, CVE-2024-45616 and CVE-2024-45615.

## Resolved Issues
- Fixed some unencrypted legacy parameters which were used as fallback for passwords. The following parameters were removed:
custom_partition.source%.password
network.interfaces.wirelesslan.device0.wpa.passphrase
network.interfaces.wirelesslan.device0.alt_ssid%.wpa.passphrase
- Fixed sporadic file loss or corruption in writable partition /wfs.
- Fixed usage of base keyboard layouts instead of English for keyboard input methods.
- Fixed hotkey functionality for switching to next keyboard input method.
- Fixed Safely Remove Hardware tool
- Fixed modification time of files in writable partition /wfs after reboot.
- Fixed issues caused by large applications affecting system stability.
- **App Management**
	- Fixed app installation with ipkg file on command line were removed after the next UMS connection.
- **Network**
	- Fixed boot failure into desktop when no network connection is established.
- **WiFi**
	- Fixed captive portal pages that required opening a new browser window were not handled correctly.
- **Smartcard**
	- Fixed smartcard resource manager pcsc-lite, ensuring proper smartcard functionality with applications inside AVD, Remote Desktop, and Windows 365 sessions, particularly after reconnection.
- **Setup Assistant**
	- Fixed wrongly calculated positioning of UI-elements on high-resolution monitors
- **Audio**
	- Fixed showing non-existent internal microphone on Lenovo M75q.
	- Added a new parameter to disable node suspend in pipewire after 5 seconds:
		|  Parameter  |  Registry   |  Type       |  Value      |
		| ------ | ------ | ------ | ------ |
		|  `Disable node suspend`  |  `multimedia.pipewire.wireplumber.disable-node-suspend`  |  bool  |  enabled / *disabled* (default)  |
	- Fixed problems applying pipewire / pulseaudio changes when admin password is set.
- **Multimedia**
	- Fixed window distortions when playing videos on INTEL Meteor Lake chipsets in Parole Media Player.
	- Fixed memory leak when playing videos.
- **Hardware**
	- Fixed USB on Lenovo v155-15 laptop.
	- Fixed volume slider for:
		  - Poly Savi 8200
		  - Poly Savi 8400
- **Remote Management**
	- Fixed file installation - now the files are removed if the post-install action has failed.
	- Fixed retrieving name of the device hardware.

## Known Issues
- The downgrade to base system 12.00.900 or 12.00.910 is not supported.
- In very rare cases all apps are lost after an update. Should this be the case, an error message is shown "Opening system App Journal failed." - if the device is manged, the apps will be reinstalled after a reboot.
- Increased writeable cache partition size (by default). First boot with 12.4.x and newer may take more time (once) when updating from a 12.2.x or older base system app.
- Automatic proxy configuration: PAC file URL does not support https scheme.
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
- **IGEL Desktop**
	- On-screen keyboard sporadically crashes when typing.
	- If two monitors are configured in a vertical layout (one above the other), and those monitors are configured with "auto-detect" resolution, saving leads to a wrong layout order.
- **Licensing**
	- Manual deployment of add-on licenses for IGEL Agent for Imprivata licenses (via UMS) is only possible after finished installation of IGEL Agent for Imprivata app on device.
- **Mobile Broadband**
	- F11 flight mode function key does not switch off mobile broadband on HP Elite mt645 G7. (Deactivate mobile broadband in Network / Mobile Broadband settings)
