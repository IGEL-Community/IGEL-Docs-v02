IGEL OS Creator  
===============

Firmware version 12.01.110.1  
Release date 2023-04-17  
Last update of this document 2023-04-18  


Supported Devices  
-------------------------------------------------------------------------------

[> Supported IGEL OS 12 devices](https://kb.igel.com/os12-supported-hardware)


Component Versions
-------------------------------------------------------------------------------

| Components                                |                                  |
|-------------------------------------------|----------------------------------|
| OpenSSL                                   | 1.1.1f-1ubuntu2.17               |
| Bluetooth Stack (bluez)                   | 5.66-1igel1669186181             |
| MESA OpenGL Stack                         | 22.2.4-1igel1669012394           |
| VDPAU Library Version                     | 1.5-1igel1646992192              |
| Graphics Driver INTEL                     | 2.99.917+git20210115-1igel1647250103     |
| Graphics Driver ATI/RADEON                | 19.1.0-3igel1657777718           |
| Graphics Driver ATI/AMDGPU                | 22.0.0-3igel1661860347           |
| Graphics Driver Nouveau (Nvidia Legacy)   | 1.0.17-2igel1644486678           |
| Graphics Driver Nvidia                    | 525.60.11-0ubuntu0.20.04.2       |
| Graphics Driver VMware                    | 13.3.0-3igel1628859075           |
| Graphics Driver QXL (Spice)               | 0.1.5-3+git20200331-2igel1647014792    |
| Graphics Driver FBDEV                     | 0.5.0-2igel1644486279            |
| Graphics Driver VESA                      | 2.5.0-1+b1igel1647004096         |
| Input Driver Evdev                        | 2.10.6-2+b1igel1647004239        |
| Input Driver Elographics                  | 1.4.2-2igel1669060323            |
| Input Driver Synaptics                    | 1.9.2-1igel1668283256            |
| Input Driver VMMouse                      | 13.1.0-1ubuntu2igel1628499891    |
| Input Driver Wacom                        | 0.39.0-0ubuntu1igel1629136980    |
| Kernel                                    | 6.1.5 #mainline-lxos12-g1675699652   |
| Xorg X11 Server                           | 21.1.4-3igel1670232132           |
| Lightdm Graphical Login Manager           | 1.30.0-0ubuntu4~20.04.2igel1649274243      |
| XFCE4 Window Manager                      | 4.14.5-1~18.04igel1643191202     |
| ISC DHCP Client                           | 4.4.1-2.1ubuntu5.20.04.4         |
| WebKit2Gtk                                | 2.38.5-1igel1676531358           |
| Python3                                   | 3.8.10                           |
| Virtualbox Guest Utils                    | 7.0.4-dfsg-4igel1669967431       |
| Virtualbox X11 Guest Utils                | 7.0.4-dfsg-4igel1669967431       |
| Open VM Tools                             | 11.3.0-2ubuntu0~ubuntu20.04.3    |
| Open VM Desktop Tools                     | 11.3.0-2ubuntu0~ubuntu20.04.3    |
| Xen Guest Utilities                       | 7.10.0-0ubuntu2                  |
| Spice Vdagent                             | 0.22.1-3+b1igel1668766272        |
| Qemu Guest Agent                          | 7.1+dfsg-2+b3igel1669967706      |


## New Features

- Updated EULA to version of April 2023

## Resolved Issues

- **Hardware**
	- Fixed hardware detection of LG CQ600I-6N device.

Release Notes of installable IGEL OS 12 base system  
================================================================================

# Changes since: 12.01.100 BUILD 1

## New Features
- Added SSO login for Azure AD IdP using web context.
- Added setup parameter, required to set if Okta is selected as IdP.
	| Parameter | Registry | Type | Value |
	| ------ | ------ | ------ | ------ |
	| `Client secret` | `auth.cloudidp.client_secret` | string | empty *Default* |
- Introduced new setup parameter, required to be set if Azure AD is selected as IdP.
	| Parameter | Registry | Type | Value |
	| ------ | ------ | ------ | ------ |
	| `Azure AD Tenant Name/ID` | `auth.cloudidp.aad_tenant` | string | empty *Default* |
- Added IGEL Add-On License support.
- Changed touchpad parameter name from `Enable Touchpad` to `Enable Touchpad on Boot` which make it more obvious what is meant here.
	|  Setup  |  Parameter  |  Tooltip  |  Registry   |  Type       |  Value      |
	| ------ | ------ | ------ | ------ | ------ | ------ |
	|  `User Interface > Input > Touchpad`  |  `Enable Touchpad on Boot`  |  `Can be overruled by Hotkey.`  |  `userinterface.touchpad.general.TouchpadEnable`  |  bool  |  *enabled* (default) / disabled  |
- Also changed function of TouchpadOff registry key to only be used to switch on and off the tapping.
	|  Setup  |  Parameter  |  Registry   |  Range      |  Value      |
	| ------ | ------ | ------ | ------ | ------ |
	|  `User Interface > Input > Touchpad`  |  `Tapping Mode`  |  `userinterface.touchpad.general.TouchpadOff`  |  [With tapping][Without tapping]  |  *With tapping*  |
- Added new registry key to set left-hand on touchpad devices
	|  Parameter  |  Registry  |  Type  |  Value  |
	| ------ | ------ | ------ | ------ |
	|  `Left hand`  |  `userinterface.touchpad.general.LeftHand`  |  bool  |  *disabled* (default)/enabled |
- Added WiFi Regulatory Domain configuration to Setup Assistant.
- Added setup parameter to enable/disable debugging mode of SSO related services and programs.
	| Parameter | Registry | Type | Value |
	| ------ | ------ | ------ | ------ |
	| `Enable Debugging of Single Sign-On` | `debug.auth.cloudidp_debug` | bool | enabled / *disabled* (default) |
- Added registry key to enable natural scrolling
	| Parameter | Registry ÿ | Type ÿ ÿ ÿ | Value ÿ ÿ |
	| ------ | ------ | ------ | ------ |
	| `Natural Scroll` | `userinterface.touchpad.general.naturalscroll` | bool | *disabled* (default)/enabled |
- Added parameter to adjust position of shadow indicator popup window.
	| IGEL Setup | Parameter | Registry | Range |
	| ------ | ------ | ------ | ------ |
	| System > Remote Access > Shadow | `Position of the indicator` | `userinterface.vncserver.indicatorposition` | [Bottom left][ *Bottom right* ][Top left][Top right] |
- Added setup option to disable Single-Sign-On URL restrictions for debugging purposes.
	| Parameter | Registry | Type | Value |
	| ------ | ------ | ------ | ------ |
	| `Disable Single Sign-On URL Restrictions` | `debug.auth.cloudidp_disable_url_restrictions` | bool | enabled / *disabled* (default) |
- Updated EULA to version of April 2023
- **App Management**
	- Added: Automatic up- / downgrade is not allowed for pinned apps (assigned via UMS). Base System version is always pinned - even if not assigned via UMS.
- **X11 system**
	- Fixed default mirror mode from Panning to Scale down
		|  Parameter  |  Registry   |  Range      |  Value      |
		| ------ | ------ | ------ | ------ |
		|  `Choose the mode which should be used for mirroring monitors if resolution differs.`  |  `x.xserver%.mirror_mode`  |  [Panning][Biggest common resolution][Scaling][Scaling down]  |  *Scaling down*  |

## Security Fixes
- Fixed nss security issue CVE-2023-0767.
- Fixed pam security issue CVE-2022-28321.
- Fixed webkit2gtk security issues CVE-2023-23529, CVE-2023-23518, CVE-2023-23517 and CVE-2022-42826.
- Fixed openssl security issues CVE-2023-0286, CVE-2023-0215, CVE-2022-4450 and CVE-2022-4304.
- Fixed libarchive security issues CVE-2022-36227 and CVE-2022-28066.
- Fixed tiff security issues CVE-2023-0804, CVE-2023-0803, CVE-2023-0802, CVE-2023-0801, CVE-2023-0800, CVE-2023-0799, CVE-2023-0798, CVE-2023-0797, CVE-2023-0796 and CVE-2023-0795.
- Fixed rsync security issue CVE-2022-29154.
- Fixed tpm2-tss security issue CVE-2023-22745.
- Fixed curl security issues CVE-2023-23916, CVE-2023-23915, CVE-2023-23914, CVE-2022-43552 and CVE-2022-43551.
- Updated ca-certificates to version 20230311.

## Resolved Issues
- Fixed screensaver customization.
- Fixed multi monitor configuration failures in setup.
- Check hash and signature of osc partition in pxe initrd
- **App Management**
	- Improve error handling when resolving app dependencies, send errors to UMS
	- Add app installation status 'limited functionality' which is used for example when a basesys partition mount fails due to a missing license.
	- Fixed typo in app status "unusable"
- **Firmware Update**
	- Fixed handling of wrong passwords in the PIN query dialog when updating the base system with TPM PCR+PIN enabled in the Device Encryption.
- **Audio**
	- Fixed LG AIO 24CN650 TRRS headset output.
	- Fixed LG 34CN650 AiO DP/HDMI audio output.
- **Hardware**
	- Fixed hardware detection of LG CQ600I-6N device.
- **Remote Management**
	- Fixed connection to a UMS connector if the server uses a TLS certificate containing only its FQDN hostname.
- **Igel Desktop**
	- Fixed sporadic mobile broadband initialization failures in Setup Assistant.
- **igel-notify-ui**
	- Fixed monitor placement of tray app dialogs if multiple monitors are used.
- **igel-system-tray**
	- Improved CPU power plan regulation in battery status tray app.

## Known Issues
- Display Configurator may show hotplugged monitors as disabled.
- Issues may occur if monitors are connected via docking station.
	- In general: Monitor hotplug not stable yet and can trigger misconfiguration.
- System suspend is not supported on
	- Lenovo K14 Gen1
	- HP MT645
	- LG 24CN650
	- LG 27CN650
	- LG 34CN650
	- IGEL UD7-LX11 (H850C)
- Wake on LAN is not functional on Dell OptiPlex 3000 and Lenovo K14 Gen1
- Lenovo K14 Gen1 internal microphone is not working.
- LG 34CN650 Headset mic via jack is not working
- LG 27CN650 Headset mic via jack is not working
- If assigned app is not available in App Portal, there is no error notification on IGEL OS desktop.
- The On-screen keyboard sporadically crashes when typing.
- The downgrade to base system 12.00.900 or 12.00.910 is not supported.
- Display Settings setup page:
	- There is no monitor info button available yet.
- SSO with Okta does not work in Chromium after browser restart.
- UD Pocket Starter License is not deployed at first boot.
- Autostart notification not supported yet.
- XFWM4 composite manager can break screen lock and enables sporadically access to open applications. It is recommended to not enable registry key windowmanager.wm0.variables.usecompositing. The composite manager is disabled by default.
- In very rare cases all apps are lost after an update. Should this be the case, an error message is shown "Opening system App Journal failed." - if the device is manged, the apps will be reinstalled after a reboot.
- **Open VPN**
	- VMware Horizon Teams Optimization is not functional if connected via OpenVPN.
- **Imprivata**
	- After installation of the IGEL Imprivata Agent there is an additional second reboot necessary to get the feature licensed and functional.
- **Igel Desktop**
	- On-Screen keyboard is not supported in Setup Assistant yet.


# Changes since: 12.00.910 BUILD 1

## New Features
- Websocket compression in the remote management communication can be switched off for debugging with the registry key:

|  Parameter   |  Registry    |  Type        |  Value       |
| ------ | ------ | ------ | ------ |
|  `Enable websocket compression`   |  `debug.remotemanager.compression`              |  bool                            |  *enabled* (default) / disabled  |

- Added tray app showing UMS connection status.
- The timeout configured by the parameter `system.remotemanager.rmagent_timeout` limits now the execution time of the whole UMS request.
- Added new battery tray app for battery status and CPU power plan regulation.
- Adapt igel-app-integration-helper to new updated dbus interface.
- Adapt igel-apparmor-init to new updated dbus interface
- Adapt igel-rwpart to new updated dbus interface.
- Send error message and setupd error message path via pushappstatus method over dbus to igel-remote-manager.
- Added a python module for sending user notifications
- Enhance possibilities to set cstate kernel parameters.
	* Allow 0 for max_cstate now too which sets intel_idle.max_cstate kernel cmdline parameter

|  Parameter  |  Registry   |  Range      |  Value      |
| ------ | ------ | ------ | ------ |
|  `Set maximum allowed cstate on intel cpus.`  |  `system.kernel.bootparams.max_cstate`  |  [No limit][0][1][2][3][4][5][6]  |  *No limit*  |


|  Parameter  |  Registry   |  Range      |  Value      |
| ------ | ------ | ------ | ------ |
|  `Set maximum allowed processor cstate.`  |  `system.kernel.bootparams.max_proc_cstate`  |  [No limit][1][2][3][4][5][6][7][8][9]  |  *No limit*  |


|  Parameter  |  Registry   |  Range      |  Value      |
| ------ | ------ | ------ | ------ |
|  `Set reboot kernel parameters.`  |  `system.kernel.bootparams.reboot`  |  [Default][Bios][Triple][Kbd][Acpi][Efi][Pci]  |  *Default*  |

- All customization configuration options are now available under the System > System Customization sub page in TC Setup.
- Added Mobile Broadband Support in Setup Assistant
- Component updates:
	* Updated gstreamer1.0 to version 1.20.4.
	* Updated mesa to versin 22.2.4.
	* Updated VAAPI to version 2.16.0.
	* Updated openssh to version 9.1p1.
	* Updated openvpn to version 2.6.0.
	* Updated libmbim to version 1.28.0.
	* Updated libqmi to version 1.32.0.
	* Updated tzdata to version 2022f.
	* Updated wireless-regdb to version 2022.06.06.
	* Updated qt5 packages to version 5.15.6.
	* Updated modemmanager to version 1.20.0.
- Secure Shadowing is the default setting for IGEL OS 12. No plain VNC connection to an IGEL OS 12 endpoint is possible in the factory settings, but Secure Shadowing from UMS is possible.
- Added new registry key to activate tear-free for modesetting driver

|  Parameter  |  Registry   |  Type       |  Value      |
| ------ | ------ | ------ | ------ |
|  `Enable tear free option for modesetting driver`  |  `x.drivers.modesetting.use_tear_free`  |  bool  |  enabled / *disabled* (default)  |

- Added TPM PCR and TPM PCR+PIN support for following devices:
	* HP T640
	* IGEL UD 3 (M350C with Bios version V:3.D.13A-05232022 or higher)
	* IGEL UD 7 (H860C with Bios version 3.6.13A-05202022 or higher)
- Updated nvidia driver to version 525.
- Extended supported hardware list: See https://kb.igel.com/os12-supported-hardware
- Added new registry key which possibly fixes microphone issues on newer Intel devices.

| Parameter | Registry | Type | Value |
| ------ | ------ | ------ | ------ |
| `Use PDM1 topology files (can help with microphone issues).` | `system.sound_driver.use_pdm1_tplg` | bool | enabled / *disabled* (default) |

- Improved notification system.
- Updated IGEL EULA to version August 2022.
- Added nvidia VAAPI driver to firmware.
- Removed duplicate battery tray icon on mobile devices
- Adapt igelpkgd to new rmagent pushappstatus command structure.
- Updated kernel to version 6.1.5
- Clean app cache on app reinstallation.
- Updated GPL Source Code Offer text at Application Launcher license info page.
- Use new setupd ums translation paths in igelpkgd
- Reworked Display and Display - Power Options setup:
	* Renamed "Display" page to "Display Settings"
	* Added "Display Configurator" page on same level as "Display Settings"
	* Splitted Power Options into 2 pages: Power Managment and Brightness Reduction
	* Removed legacy settings from setup (X-key, color depth)
* Added option in factory mode for an automatical shutdown after self-check. Log file of this deployment self-check is written to dummy partition.
- Added: UMS Firmware Customizations can now also be deployed to OS12 devices.
- Added: The payload of the commands is now transferred compressed.

## Security Fixes
- Security updates:
	* Fixed dbus security issues CVE-2022-42012, CVE-2022-42011, CVE-2022-42010 and CVE-2020-35512.
	* Fixed nss security issues CVE-2022-34480, CVE-2022-22747 and CVE-2020-25648.
	* Fixed open-vm-tools security issue CVE-2022-31676.
	* Fixed vim security issues CVE-2022-1621, CVE-2022-1620, CVE-2022-1619, CVE-2022-1616, CVE-2022-1154 and CVE-2022-0943.
	* Fixed epiphany-browser security issues CVE-2022-29536, CVE-2021-45087, CVE-2021-45086 and CVE-2021-45085.
	* Fixed bluez security issue CVE-2022-0204.
	* Fixed e2fsprogs security issue CVE-2022-1304.
	* Fixed webkit2gtk security issues CVE-2022-42824, CVE-2022-42823, CVE-2022-42799, CVE-2022-32923 and CVE-2022-32888.
	* Fixed libinput security issue CVE-2020-1215.
	* Fixed cups security issues CVE-2022-26691, CVE-2020-10001 and CVE-2019-8842.
	* Fixed curl security issues CVE-2022-42916, CVE-2022-42915, CVE-2022-35260 and CVE-2022-32221.
	* Fixed expat security issues CVE-2022-43680 and CVE-2022-40674.
	* Fixed krb5 security issue CVE-2022-42898.
	* Fixed ntfs-3g security issues CVE-2022-40284, CVE-2022-30789, CVE-2022-30788, CVE-2022-30787, CVE-2022-30786, CVE-2022-30785, CVE-2022-30784, CVE-2022-30783 and CVE-2021-46790.
	* Fixed pixman security issue CVE-2022-44638.
	* Fixed libsndfile security issue CVE-2021-4156.
	* Fixed libtirpc security issue CVE-2021-46828.
	* Fixed libvncserver security issue CVE-2020-29260.
	* Fixed cifs-utils security issues CVE-2022-29869 and CVE-2022-27239.
	* Fixed qemu security issues CVE-2022-35414, CVE-2022-2962, CVE-2022-1050, CVE-2022-0216, CVE-2021-3611 and CVE-2020-14394.
	* Fixed xorg-server security issues CVE-2022-3551, CVE-2022-3550, CVE-2022-2320 and CVE-2022-2319.
	* Fixed gdk-pixbuf security issues CVE-2021-46829 and CVE-2021-44648.
	* Fixed bind9 security issues CVE-2022-38178, CVE-2022-38177 and CVE-2022-2795.
	* Fixed flac security issues CVE-2021-0561 and CVE-2020-0499.
	* Fixed gmp security issue CVE-2021-43618.
	* Fixed gnutls28 security issues CVE-2022-2509 and CVE-2021-4209.
	* Fixed ghostscript security issue CVE-2020-27792.
	* Fixed harfbuzz security issue CVE-2022-33068.
	* Fixed openldap security issue CVE-2022-29155.
	* Fixed ldb security issues CVE-2022-32746, CVE-2022-32745 and CVE-2021-3670.
	* Fixed xz-utils security issue CVE-2022-1271.
	* Fixed poppler security issue CVE-2022-38784.
	* Fixed mysql-8.0 security issues CVE-2022-39410, CVE-2022-39408, CVE-2022-39400, CVE-2022-21640, CVE-2022-21637, CVE-2022-21633, CVE-2022-21632, CVE-2022-21625, CVE-2022-21617, CVE-2022-21611, CVE-2022-21608, CVE-2022-21604, CVE-2022-21599, CVE-2022-21594, CVE-2022-21569, CVE-2022-21553, CVE-2022-21547, CVE-2022-21539, CVE-2022-21538, CVE-2022-21537, CVE-2022-21534, CVE-2022-21531, CVE-2022-21530, CVE-2022-21529, CVE-2022-21528, CVE-2022-21527, CVE-2022-21526, CVE-2022-21525, CVE-2022-21522, CVE-2022-21517, CVE-2022-21515, CVE-2022-21509, CVE-2022-21478, CVE-2022-21462, CVE-2022-21460, CVE-2022-21459, CVE-2022-21457, CVE-2022-21454, CVE-2022-21452, CVE-2022-21451, CVE-2022-21444, CVE-2022-21440, CVE-2022-21438, CVE-2022-21437, CVE-2022-21436, CVE-2022-21435, CVE-2022-21427, CVE-2022-21425, CVE-2022-21423, CVE-2022-21418, CVE-2022-21417, CVE-2022-21415, CVE-2022-21414, CVE-2022-21413 and CVE-2022-21412.
	* Fixed pcre2 security issues CVE-2022-1587 and CVE-2022-1586.
	* Fixed pcre3 security issues CVE-2020-14155 and CVE-2019-20838.
	* Fixed perl security issue CVE-2020-16156.
	* Fixed libsepol security issues CVE-2021-36087, CVE-2021-36086, CVE-2021-36085 and CVE-2021-36084.
	* Fixed net-snmp security issues CVE-2022-24810, CVE-2022-24809, CVE-2022-24808, CVE-2022-24807, CVE-2022-24806, CVE-2022-24805 and CVE-2022-248.
	* Fixed sqlite3 security issue CVE-2022-35737.
	* Fixed tiff security issues CVE-2022-3970, CVE-2022-3599, CVE-2022-3598, CVE-2022-3570, CVE-2022-34526, CVE-2022-2869, CVE-2022-2868, CVE-2022-2867, CVE-2022-22844, CVE-2022-2058, CVE-2022-2057, CVE-2022-2056, CVE-2022-1355, CVE-2022-1354, CVE-2022-0924, CVE-2022-0909, CVE-2022-0908, CVE-2022-0907, CVE-2022-0891, CVE-2022-0865, CVE-2022-0562, CVE-2022-0561 and CVE-2020-35522.
	* Fixed libxml2 security issues CVE-2022-40304, CVE-2022-40303, CVE-2022-2309, CVE-2022-40304, CVE-2022-40303, CVE-2022-2309, CVE-2022-29824 and CVE-2016-3709.
	* Fixed libxslt security issue CVE-2021-30560.
	* Fixed zlib security issue CVE-2022-37434.
	* Fixed dnsmasq security issue CVE-2022-0934.
	* Fixed isc-dhcp security issues CVE-2022-2929 and CVE-2022-2928.
	* Fixed tcpdump security issues CVE-2020-8037 and CVE-2018-16301.
	* Fixed pillow security issue CVE-2022-22817.
	* Fixed gzip security issue CVE-2022-1271.
	* Fixed libarchive security issues CVE-2022-36227 and CVE-2022-26280.
	* Fixed heimdal security issues CVE-2022-44640, CVE-2022-42898, CVE-2022-41916, CVE-2022-3437 and CVE-2021-44758.
	* Fixed qtbase-opensource-src security issue CVE-2021-38593.
	* Fixed qtsvg-opensource-src security issues CVE-2021-45930 and CVE-2021-3481.
	* Fixed jbigkit security issue CVE-2017-9937.
	* Fixed sysstat security issue CVE-2022-39377.
	* Fixed nfs-utils security issue CVE-2019-3689.
	* Updated ca-certificates to current version 20211016ubuntu0.20.04.1.
	* Fixed python3.8 security issues CVE-2022-45061 and CVE-2022-37454.
	* Fixed grub2 security issues CVE-2022-28736, CVE-2022-28735, CVE-2022-28734, CVE-2022-28733, CVE-2021-3697, CVE-2021-3696 and CVE-2021-3695.
* Fixed shell command injection in messages sent from UMS.
* Fixed vim security issues CVE-2022-0417 and CVE-2022-0392.
* Fixed pillow security issues CVE-2022-45198 and CVE-2022-24303.
* Fixed python-urllib3 security issue CVE-2021-33503.
* Fixed webkit2gtk security issues CVE-2022-46700, CVE-2022-46699, CVE-2022-46698, CVE-2022-46692, CVE-2022-46691, CVE-2022-42867, CVE-2022-42863, CVE-2022-42856 and CVE-2022-42852.
* Fixed libxpm security issues CVE-2022-4883, CVE-2022-46285 and CVE-2022-44617.
* Fixed kernel security issues CVE-2023-0266 and CVE-2023-0179.

## Resolved Issues
- Disabled suspend support for LG 24CN650, 27CN650 and 34CN650.
- Replace legacy gtk style reboot dialog with igel notification dialog.
- Forbid app installation without licence.
* rmagent creates now a bundle of all trusted CA certificates, the filename of the bundle is /wfs/igel-rmagent/trust-store/cacerts.pem by default.
- Fixed behaviour of Wi-Fi notifications.
- Reworked integration of the remote management with the device's networking.
* Fixed disabling of the remote management.
* Fixed automatic re-enrollment of the device certificate used for the device's authentication in the UMS.
* Fixed timeout in user dialogs prompting actions involved by UMS.
* Fixed status check of an IGEL licensed service concerning the IGEL's remote management.
* Ensure the configuration of the apps repositories before installing apps.
- Added support for HDMI4 to HDMI8 connectors as newer devices possibly have these connectors.
	* Changed registry keys to allow HDMI connectors up to HDMI8

| Parameter | Registry | Range | Value |
| ------ | ------ | ------ | ------ |
| `Monitor` | `x.xserver%.screen[1-7].connector` | [Automatic][VGA][VGA(II)][DVI-D][DVI-D(II)][DisplayPort][DisplayPort(II)][DisplayPort(III)][DisplayPort(IV)][DisplayPort(V)][DisplayPort(VI)][DisplayPort(VII)][DisplayPort(VIII)][HDMI][HDMI(II)][HDMI(III)][HDMI(IV)][HDMI(V)][HDMI(VI)][HDMI(VII)][HDMI(VIII)][Internal Panel(LVDS)][Internal Panel(LVDS II)][Internal Panel(eDP)][Internal Panel(eDP II)][DVI-D(III)][DVI-D(IV)][DVI-D(V)][DVI-D(VI)][DVI-D(VII)][DVI-D(VIII)] | *Automatic* |
| `Monitor` | `x.xserver%.connector` | [Automatic][VGA][VGA(II)][DVI-D][DVI-D(II)][DisplayPort][DisplayPort(II)][DisplayPort(III)][DisplayPort(IV)][DisplayPort(V)][DisplayPort(VI)][DisplayPort(VII)][DisplayPort(VIII)][HDMI][HDMI(II)][HDMI(III)][HDMI(IV)][HDMI(V)][HDMI(VI)][HDMI(VII)][HDMI(VIII)][Internal Panel(LVDS)][Internal Panel(LVDS II)][Internal Panel(eDP)][Internal Panel(eDP II)][DVI-D(III)][DVI-D(IV)][DVI-D(V)][DVI-D(VI)][DVI-D(VII)][DVI-D(VIII)] | *Automatic* |

- Fixed issue with some monitors stayed black after resume or after DPMS off.
- Disabled suspend support for HP mt645 as it cause issues on resume.
- Fixed step size of sliders on "User Interface > Display > Gamma correction" and "User Interface > Input > Touchpad" setup pages.
- Fixed taskbar monitor placement configuration on "User Interface > Desktop > Taskbar" setup page.
- Changed the default mem sleep mode to deep as some devices defaults to s2idle which cases issues.
	* Added new registry key to set the suspend mem sleep mode.

|  Parameter  |  Registry   |  Range      |  Value      |
| ------ | ------ | ------ | ------ |
|  `Set suspend mem sleep mode.`  |  `system.suspend.sleep_mode`  |  [Suspend to RAM][Suspend to idle]  |  *Suspend to RAM*  |

- Disabled Suspend support for Lenovo K14 Gen 1 as it will wake up right after suspend.
- Wipe aux cache before ldconfig gets triggered while app installation.
* Fixed issue with suspend/resume on Lenovo K14 Gen1 with Mediatek WiFi card.
* Fixed wrong icon in OSC installer.
