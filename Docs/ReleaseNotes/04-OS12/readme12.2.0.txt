IGEL OS Creator  
===============

Firmware version 12.2.0  
Release date 2023-09-11  
Last update of this document 2023-09-12  


Supported Devices  
-------------------------------------------------------------------------------

[> Supported IGEL OS 12 devices](https://kb.igel.com/os12-supported-hardware)


Component Versions
-------------------------------------------------------------------------------

| Components                                |                                  |
|-------------------------------------------|----------------------------------|
| OpenSSL                                   | 1.1.1f-1ubuntu2.19               |
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
| Kernel                                    | 6.1.42 #mainline-lxos12-g1692171092    |
| Xorg X11 Server                           | 21.1.7-3igel1683808186           |
| Lightdm Graphical Login Manager           | 1.30.0-0ubuntu4~20.04.2igel1649274243      |
| XFCE4 Window Manager                      | 4.14.5-1~18.04igel1643191202     |
| ISC DHCP Client                           | 4.4.1-2.1ubuntu5.20.04.5         |
| WebKit2Gtk                                | 2.40.4-1igel1690098522           |
| Python3                                   | 3.8.10                           |
| Virtualbox Guest Utils                    | 7.0.8-dfsg-2igel1682408222       |
| Virtualbox X11 Guest Utils                | 7.0.8-dfsg-2igel1682408222       |
| Open VM Tools                             | 11.3.0-2ubuntu0~ubuntu20.04.4    |
| Open VM Desktop Tools                     | 11.3.0-2ubuntu0~ubuntu20.04.4    |
| Xen Guest Utilities                       | 7.10.0-0ubuntu2                  |
| Spice Vdagent                             | 0.22.1-3+b2igel1680584586        |
| Qemu Guest Agent                          | 8.0.2+dfsg-1igel1686579131       |

## New Features
- **Hardware**
	- Added hardware support for LG CQ601I-6N.
	- Added hardware support for HP t740.
	- Added hardware support for Lenovo K14 Gen 1 (Intel).
	- Added hardware support for Lenovo ThinkEdge SE10.
	- Added hardware support for Lenovo neo 50q (I3)
	- Added hardware support for HP Pro mt440 G3.
	- Added hardware support for HP mt645 G7.
	- Added hardware support for Lenovo neo 50q (Celeron).
	- Added hardware support for HP Elite t755.


Release Notes of installable IGEL OS 12 base system  
================================================================================

# Changes since: 12.01.100 BUILD 1

## New Features
- Added IGEL Add-On License support.
- Changed touchpad parameter from `Enable Touchpad` to `Enable Touchpad on Boot` (for clarification).
	| Setup | Parameter | Tooltip | Registry | Type | Value |
	| ------ | ------ | ------ | ------ | ------ | ------ |
	| `User Interface > Input > Touchpad` | `Enable Touchpad on Boot` | `Can be overruled by Hotkey.` | `userinterface.touchpad.general.TouchpadEnable` | bool | *enabled* (default) / disabled |
- Changed functionality of TouchpadOff registry key. This is only used to switch on and off the tapping now.
	| Setup | Parameter | Registry | Range | Value |
	| ------ | ------ | ------ | ------ | ------ |
	| `User Interface > Input > Touchpad` | `Tapping Mode` | `userinterface.touchpad.general.TouchpadOff` | [With tapping][Without tapping] | *With tapping* |
- Added new registry key to set left-hand on touchpad devices
	| Parameter | Registry | Type | Value |
	| ------ | ------ | ------ | ------ |
	| `Left hand` | `userinterface.touchpad.general.LeftHand` | bool | *disabled* (default)/enabled |
- Added WiFi Regulatory Domain configuration to Setup Assistant.
- Added setup parameter to enable/disable debugging mode of SSO related services and programs.
	| Parameter | Registry | Type | Value |
	| ------ | ------ | ------ | ------ |
	| `Enable Debugging of Single Sign-On` | `debug.auth.cloudidp_debug` | bool | enabled / *disabled* (default) |
- Added igelpkgd and updated to osc system
- Create zip (example: osc_<version>.dev_pxe.zip) with osc partitions needed for pxe.
- Added debugging of Gstreamer applications like Citrix Multimedia Redirection, Citrix Webcam Redirection, etc.. The corresponding debug logfiles are included in the tclogs.zip.
	| Parameter | Registry | Type | Value |
	| ------ | ------ | ------ | ------ |
	| `Enable gstreamer debug logging to /tmp/gst-debug.log` | `debug.gstreamer` | bool | enabled / *disabled* (default) |
- Added registry key to enable natural scrolling
	| Setup | Parameter | Registry ÿ | Type ÿ ÿ ÿ | Value ÿ ÿ |
	| ------ | ------ | ------ | ------ | ------ |
	| `User Interface > Input > Touchpad` | `Natural Scroll` | `userinterface.touchpad.general.naturalscroll` | bool | *disabled* (default)/enabled |
- Added parameter to adjust position of shadow indicator popup window.
	| IGEL Setup | Parameter | Registry | Range |
	| ------ | ------ | ------ | ------ |
	| System > Remote Access > Shadow | `Position of the indicator` | `userinterface.vncserver.indicatorposition` | [Bottom left][ *Bottom right* ][Top left][Top right] |
- Added setup option to disable Single-Sign-On URL restrictions for debugging purposes.
	| Parameter | Registry | Type | Value |
	| ------ | ------ | ------ | ------ |
	| `Disable Single Sign-On URL Restrictions` | `debug.auth.cloudidp_disable_url_restrictions` | bool | enabled / *disabled* (default) |
- Updated EULA to version of April 2023
- Updated kernel to version 6.1.42
- Added Canadian Multilingual Standard keyboard layout.
- Added further Single Sign-On configuration to split Okta- and Azure AD-related parameters.
	- Relevant parameters for Azure AD:
		| Setup | Parameter | Registry | Type | Value |
		| ------ | ------ | ------ | ------ | ------ |
		| `Security > Logon > Single Sign-On` | `Client secret` | `auth.cloudidp.azure_ad.client_secret` | string | empty *Default* |
		| `Security > Logon > Single Sign-On` | `Azure AD tenant name/ID` | `auth.cloudidp.azure_ad.aad_tenant` | string | empty *Default* |
		| `Security > Logon > Single Sign-On` | `Application (client) ID` | `auth.cloudidp.azure_ad.client_id` | string | empty *Default* |
	- Relevant parameters for Okta:
		| Setup | Parameter | Registry | Type | Value |
		| ------ | ------ | ------ | ------ | ------ |
		| `Security > Logon > Single Sign-On` | `Client secret` | `auth.cloudidp.okta.client_secret` | string | empty *Default* |
		| `Security > Logon > Single Sign-On` | `Okta URL` | `auth.cloudidp.okta.idpurl` | string | empty *Default* |
		| `Security > Logon > Single Sign-On` | `Client ID` | `auth.cloudidp.okta.client_id` | string | empty *Default* |
- Changed versioning scheme for OS12 Base System.
- Added handling of add-on license for IGEL Agent for Imprivata
- Added new registry key to enable legacy monitor connector scheme
	| Parameter | Registry | Type | Value |
	| ------ | ------ | ------ | ------ |
	| `Use old DP connector setup name handling.` | `x.drm_daemon.use_legacy_dp_handling` | bool | enabled / *disabled* (default) |
- Changed default of handle_brightness_keys to enabled.
	| Parameter | Registry | Type | Value |
	| ------ | ------ | ------ | ------ |
	| `Handle Brightness Keys` | `x.xserver%.handle_brightness_keys` | bool | *enabled* (default) / disabled |
- Changed default for new DP MST connector setup as this avoids issues if only one monitor could get configured. This may cause issues with already present display profiles. So, possibly necessary to revert but in most cases this improves the b‚havior and change of parameter is not needed.
	| Parameter | Registry | Type | Value |
	| ------ | ------ | ------ | ------ |
	| `Use new DP MST connector setup name handling.` | `x.drm_daemon.use_new_dp_mst_handling` | bool | *enabled* (default) / disabled |
- Added: Reboot will be triggered once Setup is closed in Emergency Boot.
- Added ddcutil, ddccontrol, gddccontol and ddcui to base system. These are helpful tools for reading / changing monitor settings.
- Added psensor to base system to read out sensor data like temperature, etc..
- **App Management**
	- Added: Automatic up- / downgrade is not allowed for pinned apps (assigned via UMS). Base System version is always pinned - even if not assigned via UMS.
- **Network**
	- Removed default WiFi page in setup
	- Changed setup label 'additional WiFi networks' to 'WiFi networks'
	- Migrated former set default WiFi networks to regular WiFi networks
	- Added: SAE-H2E is enabled in WPA supplicant
	- Fixed SCEP via proxy
	- Added separator definition to use if multiple values of distinguished name attributes are desired, e.g. multiple organizational units. The separator also affects organization, state, locality, and potentially more in the future.
		| Parameter | Registry | Type | Value |
		| ------ | ------ | ------ | ------ |
		| `Name separator` | `network.scepclient.cert%.multivalueseparator` | string | empty *Default* |
- **WiFi**
	- Added support forÿRTL8852CE WiFi chipset.
- **X11 system**
	- Fixed default mirror mode from Panning to Scale down
		|  Parameter  |  Registry   |  Range      |  Value      |
		| ------ | ------ | ------ | ------ |
		|  `Choose the mode which should be used for mirroring monitors if resolution differs.`  |  `x.xserver%.mirror_mode`  |  [Panning][Biggest common resolution][Scaling][Scaling down]  |  *Scaling down*  |
	- Added registry key to influence the graphic card order in IGEL setup.
		|  Parameter  |  Registry   |  Type       |  Value      |
		| ------ | ------ | ------ | ------ |
		|  `Preserve card order in setup even if the X11 order of the cards was changed.`  |  `x.drivers.preserve_order_if_swapped`  |  bool  |  enabled / *disabled* (default)  |
	- Added quirk for DisplayLink leads to long Xorg start on boot.
		|  Parameter  |  Registry   |  Type       |  Value      |
		| ------ | ------ | ------ | ------ |
		|  `Quirk to fix issues with Xorg start take ages with DisplayLink connected.`  |  `x.xserver0.quirks.displaylink_crash_workaround`  |  bool  |  enabled / *disabled* (default)  |
	- Added quirks to overcome Hotplug or DP MST issues.
		|  Parameter  |  Registry   |  Type       |  Value      |
		| ------ | ------ | ------ | ------ |
		|  `Quirk to fix issues with screen stays black by switch screen off and on again.`  |  `x.xserver%.quirks.screen_stay_black_on_off`  |  bool  |  enabled / *disabled* (default)  |
		|  `Quirk to improve DP MST hotplug behaviour.`  |  `x.xserver%.quirks.dp_mst_hotplug`  |  bool  |  enabled / *disabled* (default)  |
		|  `Quirk to fix issues with screen stays black after DPMS off or DP MST hotplug.`  |  `x.xserver%.quirks.screen_stay_black`  |  bool  |  enabled / *disabled* (default)  |
- **Audio**
	- Fixed sound control on Dell Wyse 5070 Extended thin client
- **Multimedia**
	- Updated Fluendo GStreamer 1.x multimedia codecs which optimizes performance of MS Teams in IGEL AVD.
		| Name | Version | Release Date |
		| ------ | ------ | ------ |
		| gst-fluendo-vadec - h264_mpeg4 | 1.0.2 | May 24, 2022 |
		| gst-fluendo-h264dec | 1.0.4 | Jan 24, 2023 |
- **Hardware**
	- Added support for Lenovo USB-C Universal Docking.
	- Added hardware support for LG CQ601I-6N.
	- Added support for HP factory deployment.
	- Added hardware support for HP t740.
	- Added hardware support for Lenovo K14 Gen 1 (Intel).
	- Added hardware support for Lenovo ThinkEdge SE10.
	- Added hardware support for Lenovo neo 50q (I3)
	- Added hardware support for HP Pro mt440 G3.
	- Added hardware support for HP mt645 G7.
	- Added hardware support for Lenovo neo 50q (Celeron).
	- Added hardware support for HP Elite t755.
- **Remote Management**
	- Added log message severity level. Messages with lower level are suppressed. Off is set as default.
		| Registry | Value |
		| ------ | ------ |
		| `system.remotemanager.log_message` | *off* / error / warn / info / debug |
	- Added IP and hostname to UMS tray app.
	- Added: Transfer serial number with initial UMS connection.
- **IGELmaker**
	- Added new / reworked shutdown dialog
	-* Consolidated settings and only show one shutdown dialog with all available and configured options: shutdown, reboot, suspend and logoff
	-* There are two setup pages for corresponding configuration. One handles access to shutdown dialog, the other one offers options / changes behavior of dialog.
	- Updated translations of labels / UI elements.
- **Igel Desktop**
	- Added new tray Apps: Ethernet / LAN and WiFi manager.
	- Added button to enable On-Screen Keyboard in Setup Assistant.
	- Added progress of App installation in Setup Assistant.
	- Removed WiFi encryption type WEP (as deprecated)
- **igel-system-tray**
	- Added: Detailed network information in WiFi network system tray

## Security Fixes
- Updated ca-certificates to version 20230311.
- Fixed nss security issue CVE-2023-0767.
- Fixed pam security issue CVE-2022-28321.
- Fixed vim security issues CVE-2023-2610, CVE-2023-2609, CVE-2023-1264, CVE-2023-1175, CVE-2023-1170, CVE-2023-0433, CVE-2023-0288, CVE-2023-0054, CVE-2023-0049, CVE-2022-47024, CVE-2022-2980, CVE-2022-2946, CVE-2022-2923, CVE-2022-2849, CVE-2022-2845, CVE-2022-2581, CVE-2022-2571, CVE-2022-2345, CVE-2022-2344, CVE-2022-2304, CVE-2022-2207, CVE-2022-2206, CVE-2022-2183, CVE-2022-2175, CVE-2022-2129, CVE-2022-2126, CVE-2022-2125, CVE-2022-2124, CVE-2022-1968, CVE-2022-1942, CVE-2022-1927, CVE-2022-1898, CVE-2022-1851, CVE-2022-1796, CVE-2022-1785, CVE-2022-1735, CVE-2022-1733, CVE-2022-1720, CVE-2022-1674, CVE-2022-1629, CVE-2022-0729, CVE-2022-0714, CVE-2022-0685, CVE-2022-0629, CVE-2022-0572, CVE-2022-0554, CVE-2022-0443, CVE-2022-0413, CVE-2022-0408, CVE-2022-0368, CVE-2022-0361, CVE-2022-0359, CVE-2022-0351, CVE-2022-0319, CVE-2022-0318, CVE-2022-0261, CVE-2022-0213, CVE-2021-4193, CVE-2021-4192 and CVE-2021-4166.
- Fixed libarchive security issues CVE-2022-36227 and CVE-2022-28066.
- Fixed heimdal security issue CVE-2022-45142.
- Fixed ffmpeg security issues CVE-2022-48434, CVE-2022-3964, CVE-2022-3341 and CVE-2022-3109.
- Fixed curl security issues CVE-2023-32001, CVE-2023-28322, CVE-2023-28321, CVE-2023-28320, CVE-2023-28319, CVE-2023-27538, CVE-2023-27537, CVE-2023-27536, CVE-2023-27535, CVE-2023-27534, CVE-2023-27533, CVE-2023-23916, CVE-2023-23915, CVE-2023-23914, CVE-2022-43552 and CVE-2022-43551.
- Fixed tpm2-tss security issue CVE-2023-22745.
- Fixed bind9 security issues  CVE-2023-2828 and CVE-2022-3094.
- Fixed freetype security issue CVE-2023-2004.
- Fixed gnutls28 security issue CVE-2023-0361.
- Fixed ghostscript security issue CVE-2023-28879.
- Fixed mysql-8.0 security issues CVE-2023-21982, CVE-2023-21980, CVE-2023-21977, CVE-2023-21976, CVE-2023-21972, CVE-2023-21966, CVE-2023-21962, CVE-2023-21955, CVE-2023-21953, CVE-2023-21947, CVE-2023-21946, CVE-2023-21945, CVE-2023-21940, CVE-2023-21935, CVE-2023-21933, CVE-2023-21929, CVE-2023-21920, CVE-2023-21919, CVE-2023-21911, CVE-2023-21887, CVE-2023-21883, CVE-2023-21882, CVE-2023-21881, CVE-2023-21880, CVE-2023-21879, CVE-2023-21878, CVE-2023-21877, CVE-2023-21876, CVE-2023-21875, CVE-2023-21873, CVE-2023-21871, CVE-2023-21870, CVE-2023-21869, CVE-2023-21868, CVE-2023-21867, CVE-2023-21863, CVE-2023-21836 and CVE-2022-32221.
- Fixed nautilus security issue CVE-2022-37290.
- Fixed samba security issues CVE-2023-34968, CVE-2023-34967, CVE-2023-34966, CVE-2022-2127, CVE-2023-0922, CVE-2023-0614, CVE-2022-45141, CVE-2022-44640, CVE-2022-42898, CVE-2022-38023, CVE-2022-37967, CVE-2022-37966, CVE-2022-3796 and CVE-2022-3437.
- Fixed net-snmp security issues CVE-2022-44793, CVE-2022-44792 and CVE-2022-4479.
- Fixed openssl security issues CVE-2023-2650, CVE-2022-4304, CVE-2023-0466, CVE-2023-0465, CVE-2023-0464, CVE-2023-0286, CVE-2023-0215, CVE-2022-4450 and CVE-2022-4304.
- Fixed tiff security issues CVE-2023-0804, CVE-2023-0803, CVE-2023-0802, CVE-2023-0801, CVE-2023-0800, CVE-2023-0799, CVE-2023-0798, CVE-2023-0797, CVE-2023-0796 and CVE-2023-0795.
- Fixed libxml2 security issues CVE-2023-29469 and CVE-2023-28484.
- Fixed dnsmasq security issue CVE-2023-28450.
- Fixed rsync security issue CVE-2022-29154.
- Fixed tar security issue CVE-2022-48303.
- Fixed bubblewrap security issue CVE-2021-41133.
- Fixed systemd security issues CVE-2022-4415 and CVE-2022-3821.
- Fixed webkit2gtk security issues CVE-2023-37450, CVE-2023-32393, CVE-2023-32439, CVE-2023-32435, CVE-2022-48503, CVE-2023-32373, CVE-2023-28204, CVE-2023-28205, CVE-2023-27954, CVE-2023-27932, CVE-2023-25358, CVE-2023-23529, CVE-2023-23518, CVE-2023-23517, CVE-2022-42826, CVE-2022-32885 and CVE-2022-0108.
- Fixed qemu security issues CVE-2023-1544, CVE-2023-0330 CVE-2022-4172, CVE-2022-3165 and CVE-2022-1050.
- Fixed xorg-server security issues CVE-2023-1393, CVE-2023-0494, CVE-2022-46344, CVE-2022-46343, CVE-2022-46342, CVE-2022-46341, CVE-2022-46340 and CVE-2022-46283.
- Fixed libuv1 security issue CVE-2021-22918.
- Fixed cups-filters security issue CVE-2023-24805.
- Fixed libwebp security issue CVE-2023-1999.
- Fixed ncurses security issues CVE-2023-29491, CVE-2022-29458 and CVE-2021-39537.
- Fixed avahi security issue CVE-2023-1981.
- Fixed nghttp2 security issue CVE-2020-11080.
- Fixed perl security issue CVE-2023-31484.
- Fixed python3.8 security issue CVE-2023-24329.
- Fixed cups security issues CVE-2023-34241 and CVE-2023-32324.
- Fixed opensc security issue CVE-2023-2977.
- Fixed sysstat security issue CVE-2023-33204.
- Fixed libx11 security issue CVE-2023-3138.
- Fixed openssh security issue CVE-2023-28531 and CVE-2023-38408.
- Fixed libcap2 security issues CVE-2023-2603 and CVE-2023-2602.
- Fixed glib2.0 security issues CVE-2023-32665, CVE-2023-32643, CVE-2023-32636, CVE-2023-32611, CVE-2023-29499, CVE-2023-25180 and CVE-2023-24593.
- Fixed python-reportlab security issue CVE-2023-33733.
- Updated Intel microcode to version 20230808.
- Updated AMD microcode to version 20230809.

## Resolved Issues
- Disabled suspend support for LG 24CN650, 27CN650 and 34CN650.
- Fixed K14 Suspend support.
- Fixed notification for session autostart
- Fixed: SSO with Okta in Chromium functional over browser restarts.
- Removed OpenVPN deprecated option --comp-lzo. If still required, `--comp-lzo yes` could be added to following parameter
	| Registry | Value |
	| ------ | ------ |
	| `sessions.openvpn%.vpnopts.extend_opts` | extend parameter as string |
- Fixed autostart notifications for apps.
- Fixed: Taskbar clock adjusts properly if the taskbar is too narrow, especially in vertical mode.
- Fixed AD passthrough authentication for Citrix sessions.
- Fixed framebuffer for pxe boot on non virtualized devices.
- Fixed freeze during boot if more than 10 wireless interfaces were created.
- Changed Intel driver default setting to use DRI3 which avoids screen flickering on older Intel GPUs (newer Intel devices will use modesetting driver)
	| Parameter | Registry | Type | Value |
	| ------ | ------ | ------ | ------ |
	| `Force usage of DRI3` | `x.drivers.intel.force_dri3` | bool | *enabled* (default) / disabled |
- Removed "Password protection" from setup page "Accessories - Setup". This is handled / consolidated via setup page "Security".
- Changed suspend handling on HP mt440 G3 (s2idle)
- Added registry key for using mem sleep mode (depends on hardware)
	| Parameter | Registry | Range | Value |
	| ------ | ------ | ------ | ------ |
	| `Set suspend mem sleep mode.` | `system.suspend.sleep_mode` | [Default][Suspend to RAM][Suspend to idle] | *Default* |
- Fixed start problems of touchscreen calibration.
- Fixed issue with ELO AccuTouch not picking up selection.
- Fixed custom bootsplash and wallpaper download-url
- **AVD**
	- Fixed smartcard redirection in AVD client.
- **App Management**
	- Improved error handling when resolving app dependencies. Corresponding error messages are send to UMS.
	- Added app installation status 'limited functionality' which is used if IGEL OS Base System partition mount fails due to missing license.
	- Fixed typo in app status "unusable"
- **Network**
	- Added Lenovo FCC unlock tool for Quectel EM05
	- Fixed tray icon for Fibocom L860-GL-16 LTE Module
	- Fixed: Set thirdparty r8125 as default driver on Lenovo L14 Gen 3 (Intel-based)
	- Added new registry key to prefer thirdparty r8125 over r8169 network driver.
		| Parameter | Registry | Range | Value |
		| ------ | ------ | ------ | ------ |
		| `Use thirdparty r8125 kernel module.` | `network.drivers.r8169.prefer_r8125` | [Auto][Yes][No] | *Auto* |
- **Firmware Update**
	- Fixed handling of wrong passwords in the PIN query dialog when updating the base system with TPM PCR+PIN enabled in the Device Encryption.
- **X11 system**
	- Changed default setting for DisplayLink Quirk which solves long startup times
	- Registry key parameter (default enabled):
		| Parameter | Registry | Type | Value |
		| ------ | ------ | ------ | ------ |
		| `Quirk to fix issues with Xorg start take ages with DisplayLink connected.` | `x.xserver%.quirks.displaylink_crash_workaround` | bool | *enabled* (default) / disabled |
- **Audio**
	- Fixed LG AIO 24CN650 TRRS headset output.
	- Fixed LG 34CN650 AiO DP/HDMI audio output.
- **Hardware**
	- Fixed hardware detection of LG CQ600I-6N device.
- **Remote Management**
	- Fixed connection to a UMS connector if the server uses a TLS certificate containing only its FQDN hostname.
	- Fixed configuration of additional WiFi networks (if configured via UMS).
	- Fixed: User interactions in UMS-triggered notifications are directly effective now (without timeout).
	- Parameters containing '<', '>', '&', '[' or ']' characters now properly set from the UMS to the device.
- **Modern Desktop**
	- Fix random order of IGEL system-tray icons, by making it static
- **igel-notify-ui**
	- Fixed monitor placement of tray app dialogs if multiple monitors are used.
- **igel-system-tray**
	- Improved CPU power plan regulation in battery tray app.

## Known Issues
- Display Configurator may show hotplugged monitors as disabled.
- Issues may occur if monitors are connected via docking station.
	- In general: Monitor hotplug not stable yet and can trigger misconfiguration.
- If assigned app is not available in App Portal, there is no error notification on IGEL OS desktop.
- The downgrade to base system 12.00.900 or 12.00.910 is not supported.
- In very rare cases all apps are lost after an update. Should this be the case, an error message is shown "Opening system App Journal failed." - if the device is manged, the apps will be reinstalled after a reboot.
- Display Configurator: Rotation of displays connected to the Lenovo ThinkPad USB-C Hybrid Dock can fail.
- Display configuration of displays connected to HP G5 Docking Station may fail on HP t655.
- If different power plans are configured for battery and ac mode, they will not automatically change to the configured power plan when the power supply get plugged in or unplugged. So far this issue is known for the following devices:
	- Lenovo K14 Gen1 (AMD)
- **Network**
	- The enumeration of ethernet-interfaces is not matching between the Setup and the system-tray.
	- In some cases the network is not working with the combination of the Lenovo K14 Gen1 (AMD) and the Lenovo Universal Dock. There is a kernel bugreport open which no proper fix up to now.
- **Audio**
	- LG 34CN650 Headset mic via jack is not working
	- LG 27CN650 Headset mic via jack is not working
- **Hardware**
	- Wake on LAN is not functional on Dell OptiPlex 3000 and Lenovo K14 Gen1
	- Built-in fingerprint sensor is not supported on HP mt440 and mt645.
	- If using 6 x 4K@60Hz monitors on a T755/t740 with the additional graphic card one or two of the monitors may stay black after coming back from DPMS off state.
	- This is caused by using the additional graphic card as primary one which only have 512MB VRAM (the VRAM is not enough in this configuration)
	- The solution here is:
	-* Go to the BIOS and increase the VRAM size of the iGPU to 2048MiB (maybe 1024MiB may also work)
	-* Activate the IGEL registry key *x.drivers.swap_card0_with_card1* so the iGPU will become the Primary GPU. Please be aware that the connector names will change then.
	- Wake up from suspend via UMS does not work on HP mt645 devices. Workaround: Disable system suspend and use shutdown instead.
- **Igel Desktop**
	- On-screen keyboard sporadically crashes when typing.
	- XFWM4 composite manager can break screen lock and enables sporadically access to open applications. It is recommended to not enable registry key windowmanager.wm0.variables.usecompositing. The composite manager is disabled by default.
	- Closing shutdown dialog requires a double ESC key press.
- **Licensing**
	- Manual deployment of add-on licenses for IGEL Agent for Imprivata licenses (via UMS) is only possible after finiahed installation of IGEL Agent for Imprivata app on device.

