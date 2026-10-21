IGEL OS Creator  
===============

Firmware version 12.7.0  
Release date 2025-06-04  
Last update of this document 2025-06-04  


Supported Devices  
-------------------------------------------------------------------------------

[> Supported IGEL OS 12 devices](https://kb.igel.com/os12-supported-hardware)


Component Versions
-------------------------------------------------------------------------------

| Components                                |                                  |
|-------------------------------------------|----------------------------------|
| MESA OpenGL Stack                         | 25.0.3-1igel1744090649           |
| VDPAU Library Version                     | 1.5-2                            |
| Graphics Driver INTEL                     | 2.99.917+git20210115-1igel1654609037     |
| Graphics Driver ATI/RADEON                | 22.0.0-1igel1704966675           |
| Graphics Driver ATI/AMDGPU                | 23.0.0-1igel1705669076           |
| Graphics Driver Nouveau (Nvidia Legacy)   | 1.0.18-1igel1739362211           |
| Graphics Driver VMware                    | 13.3.0-3igel1713934792           |
| Graphics Driver QXL (Spice)               | 0.1.6-1igel1687782644            |
| Graphics Driver FBDEV                     | 0.5.0-2igel1654609009            |
| Graphics Driver VESA                      | 2.6.0-2igel1739365508            |
| Input Driver Evdev                        | 2.11.0-1igel1738822597           |
| Input Driver Elographics                  | 1.4.3-1igel1678083379            |
| Input Driver Synaptics                    | 1.9.2-1+b1igel1683803726         |
| Input Driver VMMouse                      | 13.1.0-1ubuntu2igel1628499891    |
| Input Driver Wacom                        | 1.2.3-1igel1738566034            |
| Kernel                                    | 6.12.20 #mainline-lxos12-g1708502668     |
| Xorg X11 Server                           | 21.1.16-1igel1740721542          |
| Lightdm Graphical Login Manager           | 1.26.0-8igel1716879255           |
| XFCE4 Window Manager                      | 4.14.5-1~18.04igel1643191202     |
| ISC DHCP Client                           | 4.4.3-P1-2                       |
| ModemManager                              | 1.22.0-3+b2igel1731393568        |
| WebKit2Gtk                                | 2.46.6-1~deb12u1igel1739436979   |
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
- Updated boot chain with
	- New SHIM 15.8, signed by Microsoft
	- New GRUB 2.12
- Added: The new secure boot chain also includes Kernel lockdown patches, meaning that all modules must now be signed.
- Changed update parameter to enhance control over management of assigned apps.. Registry keys were kept to to maintain backward compatibility.
	|  Parameter  |  Registry   |  Type       |  Value      |
	| ------ | ------ | ------ | ------ |
	|  `Show download progress notification`  |  `update.show_download_progress`  |  bool  |  *true*/false |
	|  `Action on app assignment`  |  `update.autoactivate_future_config`  |  range  |  [*Download and activate*][Download][Nothing]  |
	|  `Action on app activation`  |  `update.reboot_without_user_interaction`  |  range  |  [*Ask*][Reboot][Nothing]  |
- Changed and improved local jobs feature, formerly known as cron job (RTCwake is experimental)
	|  Parameter  |  Registry  |  Type  |  Value  |
	| ------ | ------ | ------ | ------ |
	|  `If the hw supports it, if this is mark the system will boot up to trigger the action` |  `system.cron.cronjob%.wake_system_on_boot` |  bool  |  *true*/false  |
	|  `Job name use for reference` |  `system.cron.cronjob%.name` |  <string>  |  <>  |
	|  `Set the user that will run the systemd timer`  |  `system.cron.cronjob%.user` |  range <string>  |  [*root*][user]  |
	|  `Set the type of the systemd service that will run the job` |  `system.cron.cronjob%.type` |  range <string>  |  [*custom*][update]  |
	|  `Set the command that will be executed at the service timer, if update is defined, the default task of pospone update will be use` |  `system.cron.cronjob%.command` |  string  |  <>  |
	|  `Set when the systemd timer needs to be execute in calendar time form. For more information https://manpages.debian.org/buster/systemd/systemd.time.7.en.html` |  `system.cron.cronjob%.calendar_time` |  string  |  <>  |
	|  `Set the a random time offset if desire. If not defined it is not use` |  `system.cron.cronjob%.offset` |  string  |  <>  |
- Added UMS as Identity Broker for authentication. AD authentication is redirected via UMS protocol to authenticate users against Active Directory. Requires UMS 12.07.100 or later.
	| IGEL Setup | Parameter | Registry | Value |
	| ------ | ------ | ------ | ------ |
	| Security>Logon>UMS as Identity Broker | `Login with UMS as Identity Broker` | auth.login.igelums | **disabled**/enabled |
	| Security>Logon>UMS as Identity Broker | `Skip UMS as Identity Broker login if UMS server is unavailable` | auth.ums.skipifunavailable | **disabled**/enabled |
- Added support for Swedish and Portuguese user interface.
- Updated German, French, Spanish, Italian and Dutch translations.
- Added support for French, Spanish, Portuguese, Italian, Dutch and Swedish translations in Setup Assistant.
- Updated kernel to version 6.12 LTS (6.12.20).
	- The new secure boot chain also includes Kernel lockdown patches, meaning that all modules must now be signed.
	- In the future, the optional kernel modules will be integrated into the base kernel, replacing the optional-kernel-modules app.
- Removed OMX support from system (used for video encoding/decoding), as it is not longer supported with newer Mesa versions.
- Added basic support of Japanese keyboard input methods (mozc). Enable using following parameters:
	| IGEL Setup | Parameter | Registry | Value |
	| ------ | ------ | ------ | ------ |
	| User Interface>Input>Keyboard>Input Methods | `Keyboard input methods (experimental)` | userinterface.keyboard.ibus.enable | **disabled**/enabled |
	| User Interface>Input>Keyboard>Input Methods>Methods | `Japanese - Mozc` | userinterface.keyboard.ibus.general.preload-engine-mozc-jp | **disabled**/enabled |
- Updated End User License Agreement (EULA) to the February 2025 version.
- Added "No Tofu CJK" fonts supporting e.g. Japanese.
- **Network**
	- Added possibility for assigning an Ethernet device as a slave to a bridge device
		|  Parameter  |  Registry   |  Range      |  Value      |
		| ------ | ------ | ------ | ------ |
		|  `Bridge`  |  `network.interfaces.ethernet.device%.bridge`  |  [] [own]  |    |
	  - Currently, only the "own" mode is supported. This creates a bridge with the associated Ethernet device (instance of network.interfaces.ethernet.device%) as its sole slave. Additional slave devices can be added separately.
- **WiFi**
	- Added support for WiFi module of ATrust mt183W.
	- Added newer Realtek WiFi drivers, along with corresponding configuration.
	- Added Realtek WiFi drivers for 8852bu and 8852cu devices.
	- Added new registry keys to configure used driver:
		|  Parameter  |  Registry   |  Range      |  Value      |
		| ------ | ------ | ------ | ------ |
		|  `Use 8821cu driver instead of rtw_8821cu for WLAN.`  |  `network.drivers.realtek.use_8821cu`  |  [Auto][Yes][No]  |  *Auto*  |
		|  `Use 8812au driver instead of rtw_8812au for WLAN.`  |  `network.drivers.realtek.use_8812au`  |  [Auto][Yes][No]  |  *Auto*  |
		|  `Use 8814au driver instead of rtw_8814au for WLAN.`  |  `network.drivers.realtek.use_8814au`  |  [Auto][Yes][No]  |  *Auto*  |
		|  `Use 8821au driver instead of rtw_8821au for WLAN.`  |  `network.drivers.realtek.use_8821au`  |  [Auto][Yes][No]  |  *Auto*  |
		|  `Use 8821ce driver instead of rtw_8821ce for WLAN.`  |  `network.drivers.realtek.use_8821ce`  |  [Auto][Yes][No]  |  *Auto*  |
	- Added registry key for controlling kernel parameters arp_evict_nocarrier and ndisc_evict_nocarrier for WiFi with WPA Supplicant. The default "1" leaves the traditional behaviour unchanged, i.e. the respective tables are evicted particularly during roaming. "0" results in quicker resumption of sending packets after roaming, but it also leads to some packet loss.
		|  Parameter  |  Registry   |  Range      |  Value      |
		| ------ | ------ | ------ | ------ |
		|  `ARP/NDP evict on no-carrier`  |  `network.interfaces.wirelesslan.device0.arp_ndisc_evict_nocarrier`  |  [0][1]  |  *1*  |
	- Added registry keys for restricting frequencies used by WPA Supplicant (see the WPA Supplicant documentation regarding the network-specific settings freq_list and scan_freq). In IGEL OS, the settings affect all configured WiFi´s - these may be useful to improve roaming behavior.
		| Parameter | Registry | Type | Value |
		| ------ | ------ | ------ | ------ |
		| `List of frequencies to scan` | `network.interfaces.wirelesslan.device0.scan_freq` | string | empty *Default* |
		| `List of allowed frequencies` | `network.interfaces.wirelesslan.device0.freq_list` | string | empty *Default* |
	- The default of the following registry keys has been changed from "Default" to "Automatic". It is still the case that "Automatic" means no restriction on the ciphers used and "Default" means CCMP for WPA2 and TKIP for (old industry-standard) WPA. With this change connecting to old access points is more likely to succeed.
	- If the previous "Default" shall be enforced, it must be done in the setup individually for the affected WiFi configurations. This applies not only to newly created configurations but also to those created earlier.
	- The OS12 setup assistant has always explicitly configured "Automatic".
		|  Parameter  |  Registry   |  Range      |  Value      |
		| ------ | ------ | ------ | ------ |
		|  `Data encryption (broadcast/multicast)`  |  `network.interfaces.wirelesslan.device0.alt_ssid%.wpa.group_cipher`  |  [Default][TKIP][AES (CCMP)][AES (CCMP) + TKIP][Automatic]  |  *Automatic*  |
		|  `Data encryption`  |  `network.interfaces.wirelesslan.device0.alt_ssid%.wpa.pairwise_cipher`  |  [Default][TKIP][AES (CCMP)][AES (CCMP) + TKIP][Automatic]  |  *Automatic*  |
- **Audio**
	- Updated audio daemon pipewire to version 1.2.7, wireplumber to version 0.5.7
- **Multimedia**
	- Updated Fluendo multimedia codecs to the following version:
	  - gst-fluendo-aacdec to version 1.0.8
	  - gst-fluendo-h264dec to version 1.0.11
	  - gst-fluendo-hwvadec to version 2.0.6
- **Hardware**
	- Added hardware support for Pepperl+Fuchs BTC24
	- Added hardware support for Pepperl+Fuchs BTC22
	- Added hardware support for the Pepperl & Fuchs dual-mode Bluetooth and WiFi module LM812.
	- Added a new hotkey for Lenovo laptops: Ctrl + Fn + ★ (F12) now launches the default web browser, or, if one is already open, moves the cursor to the address bar for instant URL entry.
	- Added hardware support for Lenovo M70q Gen 6.
	- Added support for new IGEL Business Continuity USB Boot devices - Type A (BC2-LX) and Type C (BC3-LX).
	  - Due to incompatibility a downgrade to IGEL OS base system versions before 12.6.1 PR 1 is not possible.
- **Remote Management**
	- Added support for IGEL Asset Inventory Tracking (AIT). Requires UMS 12.08.100 or later.
		| IGEL Setup | Parameter | Registry | Type | Value |
		| ------ | ------ | ------ | ------ | ------ |
		| System > Remote Management > Options | `Enable IGEL Asset Inventory Tracking (AIT)` | `system.remotemanager.ait.enable`  | bool | *enabled* (default) / disabled |
		| System > Remote Management > Options | `AIT events delay (secs)` | `system.remotemanager.ait.delay` | integer | 6 |
	- Added support for backup and restore VM command.
	- Added reporting of host's RAM and CPUs used in a virtual machine which is managed by IMH.
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
	- Added the complete data store of the remote management agent to the device logs bundle requested by the UMS.
- **IGEL Desktop**
	- Added a new generic form dialog framework. A detailed documentation (how to use) will be provided via IGEL Knowledge Base.
		 - OpenVPN authentication dialog uses now the newly designed dialog framework.
	- Added new hotkey to enable logoff with a keybinding:
		|  Parameter  |  Registry   |  Type       |  Value  |
		| ------ | ------ | ------ | ------ |
		|  `key for hotkey`  |  `sessions.wmcommands16.hotkeymodifier`  |  `range`  |  `Ctrl` (default)  |
		|  `enable hotkey`  |  `sessions.wmcommands16.usehotkey`  |  `bool`  |  true/*false* (default)  |
		|  `key for hotkey`  |  `sessions.wmcommands16.hotkey`  |  `string`  |  "l" (default)  |
- **Licensing**
	- Added support for add-on license "IGEL MANAGED HYPERVISOR"

## Security Fixes
- Fixed some unencrypted legacy parameters which were used as fallback for passwords. The following parameters were removed:
	  - custom_partition.source%.password
	  - network.interfaces.wirelesslan.device0.wpa.passphrase
	  - network.interfaces.wirelesslan.device0.alt_ssid%.wpa.passphrase
- Fixed gtk+3.0 security issue CVE-2024-6655.
- Fixed ffmpeg security issues CVE-2024-7272 and CVE-2024-7055.
- Fixed opensc security issues CVE-2024-8443, CVE-2024-45620, CVE-2024-45619, CVE-2024-45618, CVE-2024-45617, CVE-2024-45616 and CVE-2024-45615.
- Fixed webkit2gtk security issues CVE-2024-54534, CVE-2024-54508, CVE-2024-54505, CVE-2024-54502, CVE-2024-54479, CVE-2024-44309 and CVE-2024-44308.
- Fixed libsoup2.4 security issues CVE-2024-52532, CVE-2024-52531 and CVE-2024-52530.
- Fixed setuptools security issue CVE-2024-6345.
- Fixed avahi security issues CVE-2023-38473, CVE-2023-38472, CVE-2023-38471, CVE-2023-38470 and CVE-2023-38469.
- Fixed glib2.0 security issue CVE-2024-52533.
- Fixed texlive-bin security issue CVE-2024-25262.
- Fixed python3.11 security issues CVE-2024-9287, CVE-2024-7592, CVE-2024-6923, CVE-2024-11168 and CVE-2023-27043.
- Fixed tiff security issues CVE-2024-7006, CVE-2023-52356, CVE-2023-3618, CVE-2023-2908, CVE-2023-26966, CVE-2023-26965 and CVE-2023-25433.
- Fixed dnsmasq security issues CVE-2023-50868, CVE-2023-50387 and CVE-2023-28450.
- Fixed qemu security issue CVE-2024-7409.
- Fixed python-urllib3 security issues CVE-2024-37891, CVE-2023-45803 and CVE-2023-43804.
- Fixed rsync security issues CVE-2024-12747, CVE-2024-12088, CVE-2024-12087, CVE-2024-12086, CVE-2024-12085 and CVE-2024-12084.
- Fixed openjpeg2 security issues CVE-2024-56827, CVE-2024-56826, CVE-2023-39327 and CVE-2021-3575.
- Fixed bind9 security issues CVE-2024-12705 and CVE-2024-11187.
- Fixed pam-pkcs11 security issues CVE-2025-24531 and CVE-2025-24032.
- Fixed libtasn1-6 security issue CVE-2024-12133.
- Fixed gnutls28 security issues CVE-2024-12243 and CVE-2024-12133.
- Fixed openssh security issues CVE-2025-26466 and CVE-2025-26465.
- Fixed openssl security issues CVE-2024-9143 and CVE-2024-13176.
- Fixed xorg-server security issues CVE-2025-26601, CVE-2025-26600, CVE-2025-26599, CVE-2025-26598, CVE-2025-26597, CVE-2025-26596, CVE-2025-26595 and CVE-2025-26594.
- Fixed vim security issues CVE-2024-47814, CVE-2024-43802, CVE-2024-22667, CVE-2023-5344, CVE-2023-4781, CVE-2023-4752, CVE-2023-4738 and CVE-2023-2610.
- Fixed glibc security issue CVE-2025-0395.
- Fixed curl security issues CVE-2025-0167, CVE-2024-9681 and CVE-2024-11053.
- Fixed wget security issue CVE-2024-38428.
- Fixed freetype security issue CVE-2025-27363.
- Fixed webkit2gtk security issues CVE-2024-44308 and CVE-2024-44309
- Fixed webkit2gtk security issues CVE-2025-24162, CVE-2025-24158, CVE-2025-24150, CVE-2025-24143, CVE-2024-54658, CVE-2024-54543, CVE-2024-54534, CVE-2024-54508, CVE-2024-54505, CVE-2024-54502, CVE-2024-54479, CVE-2024-44309, CVE-2024-44308 and CVE-2024-27856.
- Fixed glibc security issue CVE-2025-4802.
- **WiFi**
	- Fixed a critical issue in the regulatory domain configuration, preventing potential privilege escalation and incorrect log entries.

## Resolved Issues
- Fixed: Entering a wrong device encryption password does not lead to an internal error anymore.
- Fixed sporadic file loss or corruption in writable partition /wfs.
- Fixed displaying of custom boot splash on AMD platforms.
- Removed the help menu from Network Tools, as there are no help databases anyway
- Removed broken symlink /var/log/README
- Fixed Safely Remove Hardware tool
- Fixed modification time of files in writable partition /wfs after reboot.
- Fixed issues caused by large applications affecting system stability.
- Fixed an intermittent issue that occasionally disabled remote logging.
- Fixed a race condition in the notification system that caused high CPU usage.
- Fixed errors in failsafe boot.
- Fixed /wfs instabilities:
  - Fixed folder could be incorrectly replaced by a file.
  - Fixed /wfs/rfkill folder was not created properly.
- Fixed tcpdump debug option.
- Adapt logrotate.d to ownership of the files in /var/log/
- **App Management**
	- Fixed app installation with ipkg file on command line were removed after the next UMS connection.
	- Fixed EULA being prompted during multistage updates.
- **Network**
	- Fixed boot failure into desktop when no network connection is established.
- **WiFi**
	- Fixed captive portal pages that required opening a new browser window were not handled correctly.
	- Fixed not possible Wi-Fi connection after entering an incorrect password once.
- **Smartcard**
	- Fixed smartcard resource manager (pcsc-lite) to enable seamless smartcard usage in IGEL AVD, IGEL Remote Desktop, and IGEL Windows 365 sessions.
	- Fixed smartcard resource manager pcsc-lite, ensuring proper smartcard functionality with applications inside AVD, Remote Desktop, and Windows 365 sessions, particularly after reconnection.
	- Added evaluation of environment variable PCSCLITE_STATUS_CHANGE_MAX_TIMEOUT in milliseconds which limits blocking of SCardGetStatusChange in smart card resource manager pcsc-lite. This helps to speed up some particular applications, e.g. Belgian eID Viewer reading cards inside AVD, CPC, RDP and RD Web Access sessions.
- **HID**
	- Fixed sporadic keyboard input problems in local login mask.
	- Fixed usage of base keyboard layouts instead of English for keyboard input methods.
	- Fixed hotkey functionality for switching to next keyboard input method.
	- Fixed keyboard input with Japanese layout.
- **Setup Assistant**
	- Fixed wrongly calculated positioning of UI-elements on high-resolution monitors
- **Audio**
	- Added paramter to ignore any decibel information provided by the ALSA drivers in case the information is incorrect:
		|  Parameter  |  Registry   |  Type       |  Value      |
		| ------ | ------ | ------ | ------ |
		|  `Ignore dB`  |  `multimedia.pulseaudio.daemon.ignore-db`  |  bool  |  enabled / *disabled* (default)  |
	- Improved default output device selection
	- Fixed showing non-existent internal microphone on Lenovo M75q.
	- Added a new parameter to disable node suspend in pipewire after 5 seconds:
		|  Parameter  |  Registry   |  Type       |  Value      |
		| ------ | ------ | ------ | ------ |
		|  `Disable node suspend`  |  `multimedia.pipewire.wireplumber.disable-node-suspend`  |  bool  |  enabled / *disabled* (default)  |
	- Fixed problems applying pipewire / pulseaudio changes when admin password is set.
	- Fixed TRRS headset on LG 24CN650
- **Multimedia**
	- Fixed window distortions when playing videos on INTEL Meteor Lake chipsets in Parole Media Player.
	- Fixed memory leak when playing videos.
- **Hardware**
	- Fixed USB on Lenovo v155-15 laptop.
	- Fixed volume slider for:
		  - Poly Savi 8200
		  - Poly Savi 8400
	- The "About" page and the OSC installer show the correct device type and product id for the LG 24CN65x series.
	- The "About" page and the OSC installer show the correct device type and product id for the LG 34CN65x series.
	- Updated fwupd to version 2.0.7-1
- **Remote Management**
	- Fixed file installation - now the files are removed if the post-install action has failed.
	- Fixed retrieving name of the device hardware.
	- Fixed merging of received remote settings - now user related runtime instances of configuration templates are still remaining after merging of remote settings.
	- Fixed enumeration of BT devices which have been paired during the runtime of the IGEL OS.
	- Fixed start delay of the remote management during boot in devices with uninitialized unit id.
	- Fixed ensuring of user permissions for wallpaper files.
- **IGEL Desktop**
	- Fixed login screen and screen lock to show exactly one login mask after connecting additional monitors
	- Fixed visibility of Kerberos login extension input fields.
	- Fixed configuration of custom wallpaper on additional monitors if they must follow configuration for the first monitor.
	- Fixed position of login mask on login screen and screen lock after resume from suspend.
	- Fixed an issue where the taskbar overlapped with parts of the login screen on certain multi-monitor and multi-resolution setups.
- **Licensing**
	- Fixed licensing issue where endpoints appeared unlicensed after suspend.
- **Mobile Broadband**
	- Made disabling of LTE devices more reliable before suspending the system.

## Known Issues
- The downgrade to base system 12.00.900 or 12.00.910 is not supported.
- In very rare cases all apps are lost after an update. Should this be the case, an error message is shown "Opening system App Journal failed." - if the device is manged, the apps will be reinstalled after a reboot.
- Increased writeable cache partition size (by default). First boot with 12.4.x and newer may take more time (once) when updating from a 12.2.x or older base system app.
- Automatic proxy configuration: PAC file URL does not support https scheme.
- When TPM PCR+PIN device encryption is enabled, an additional PIN entry is required the first time a new base system release is booted.
- **App Management**
	- The "Download only" mode after app assignment via UMS, which requires a separate activation step, is not functional in this release. A fix is planned for the next base system (rolling) release.
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
	- Audio devices may not be available in audio tray app. Workaround: Enable Pulseaudio backend by registry key:
		|  Parameter  |  Registry   |  Range      |  Value      |
		| ------ | ------ | ------ | ------ |
		|  `Audiobackend`  |  `multimedia.audiobackend`  |  [pipewire][pulseaudio]  |  *pipewire*  |
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
- **App Bios Hp**
	- Due to new Secure Boot requirements (kernel lock-down enabled), the HP-BIOS-Tools app currently does not support the following HP Thin Clients:
		- HP t540 Thin Client
		- HP t640 Thin Client
		- HP Pro t550 Thin Client
		- HP Elite t655 Thin Client
		- HP t740 Thin Client
		- HP Elite t755 Thin Client
- **IGEL Desktop**
	- On-screen keyboard sporadically crashes when typing.
	- If two monitors are configured in a vertical layout (one above the other), and those monitors are configured with "auto-detect" resolution, saving leads to a wrong layout order.
	- There are some UI elements that are not yet translated in all available user interface languages.
	- In very rare cases, the Start menu or panel may not be visible after boot. A reboot will restore visibility in such cases.
- **Licensing**
	- Manual deployment of add-on licenses for IGEL Agent for Imprivata licenses (via UMS) is only possible after finished installation of IGEL Agent for Imprivata app on device.
- **Mobile Broadband**
	- F11 flight mode function key does not switch off mobile broadband on HP Elite mt645 G7. (Deactivate mobile broadband in Network / Mobile Broadband settings)
