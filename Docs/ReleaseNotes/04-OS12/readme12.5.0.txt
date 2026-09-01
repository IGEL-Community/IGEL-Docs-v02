IGEL OS Creator  
===============

Firmware version 12.5.0  
Release date 2024-09-20  
Last update of this document 2024-09-20  


Supported Devices  
-------------------------------------------------------------------------------

[> Supported IGEL OS 12 devices](https://kb.igel.com/os12-supported-hardware)


Component Versions
-------------------------------------------------------------------------------

| Components                                |                                  |
|-------------------------------------------|----------------------------------|
| MESA OpenGL Stack                         | 24.1.5-1igel1722536318           |
| VDPAU Library Version                     | 1.5-2                            |
| Graphics Driver INTEL                     | 2.99.917+git20210115-1igel1654609037     |
| Graphics Driver ATI/RADEON                | 22.0.0-1igel1704966675           |
| Graphics Driver ATI/AMDGPU                | 23.0.0-1igel1705669076           |
| Graphics Driver Nouveau (Nvidia Legacy)   | 1.0.17-3igel1713877061           |
| Graphics Driver Nvidia                    | 525.147.05-0ubuntu0.20.04.1      |
| Graphics Driver VMware                    | 13.3.0-3igel1713934792           |
| Graphics Driver QXL (Spice)               | 0.1.6-1igel1687782644            |
| Graphics Driver FBDEV                     | 0.5.0-2igel1654609009            |
| Graphics Driver VESA                      | 2.6.0-1igel1704966930            |
| Input Driver Evdev                        | 2.10.6-2+b3igel1713876266        |
| Input Driver Elographics                  | 1.4.3-1igel1678083379            |
| Input Driver Synaptics                    | 1.9.2-1+b1igel1683803726         |
| Input Driver VMMouse                      | 13.1.0-1ubuntu2igel1628499891    |
| Input Driver Wacom                        | 1.2.2-1igel1718951939            |
| Kernel                                    | 6.6.38 #mainline-lxos12-g1722949641    |
| Xorg X11 Server                           | 21.1.12-1igel1720008240          |
| Lightdm Graphical Login Manager           | 1.26.0-8igel1716879255           |
| XFCE4 Window Manager                      | 4.14.5-1~18.04igel1643191202     |
| ISC DHCP Client                           | 4.4.3-P1-2                       |
| ModemManager                              | 1.22.0-3+b1igel1713521667        |
| WebKit2Gtk                                | 2.44.2-1~deb12u1igel1716530911   |
| Python3                                   | 3.11.2                           |
| Virtualbox Guest Utils                    | 7.0.18-dfsg-2igel1718956134      |
| Virtualbox X11 Guest Utils                | 7.0.18-dfsg-2igel1718956134      |
| Open VM Tools                             | 12.2.0-1+deb12u2                 |
| Open VM Desktop Tools                     | 12.2.0-1+deb12u2                 |


Release Notes of installable IGEL OS 12 base system
================================================================================

# Changes since: 12.4.0

## New Features
- Updated base system to Debian 12 (bookworm) base.
- Added: Strace and tcpdump debug tools are part of IGEL OS base system. tcpdump is configurable in registry with instances of debug.tcpdump%.
- Fixed fail safe boot functionality.
- Changed default of power saving settings for screen getting dimmed to 20% after 120 seconds inactivity.
	|  Setup  |  Parameter  |  Registry  |  Type  |  Value  |
	| ------ | ------ | ------ | ------ | ------ |
	|  `System > Power Options > Display > Brightness Reduction`  |  `On inactivity reduce to`  |  `x.xserver%.brightness_level_ac`  |  integer  |  20 *Default*  |
	|  `System > Power Options > Display > Brightness Reduction`  |  `Reduce after`  |  `x.xserver%.brightness_on_ac`  |  integer  |  120 *Default*  |
	|  `System > Power Options > Display > Brightness Reduction`  |  `Reduce after`  |  `x.xserver%.brightness_on_battery`  |  integer  |  120 *Default*  |
- Added further registry keys for influencing power consumption (Auto means active on all Lenovo devices with battery):
	|  Parameter  |  Registry   |  Range      |  Value      |  Type       |
	| ------ | ------ | ------ | ------ | ------ |
	|  `Call idle actions on battery after this time of inactivity (greater 10 seconds, value 9 or lower is never)`  |  `system.powersave.idle_action_on_battery`  |  |  50 *Default*  |  integer  |
	|  `Use powertop auto tune to reduce power usage`  |  `system.powersave.powertop_auto_tune`  |  [Auto][Enable][Disable]  |  *Auto*  |  |
	|  `Use laptop mode to reduce power usage`  |  `system.powersave.laptop_mode`  |  [Auto][Enable][Disable]  |  *Auto*  |  |
	|  `Clock down AMDGPU if system is idle (idle action time reached).`  |  `system.powersave.clock_down_amdgpu_on_idle`  |  [Auto][Enable][Disable]  |  *Auto*  |  |
	|  `Clock down Intel GPU if system is idle (idle action time reached).`  |  `system.powersave.clock_down_i915_on_idle`  |  [Auto][Enable][Disable]  |  *Auto*  |  |
	|  `Set Ryzen CPU to power save mode if system is idle (idle action time reached).`  |  `system.powersave.use_ryzenadj_on_idle`  |  [Auto][Enable][Disable]  |  *Auto*  |  |
	|  `Set Intel CPU to power save mode if system is idle (idle action time reached).`  |  `system.powersave.use_energy_policy_on_idle`  |  [Auto][Enable][Disable]  |  *Auto*  |  |
	|  `Call idle actions on AC after this time of inactivity (greater 10 seconds, value 9 or lower is never)`  |  `system.powersave.idle_action_on_ac`  |  |  50 *Default*  |  integer  |
- Added system wide proxy support with manual and automatic proxy configuration (PAC and WPAD). Proxy configuration is available at IGEL Setup > Network > Proxy.
- Changed IGEL logo placement on default wallpaper.
- Added possiblibility to define post-session commands for generic processes in base_system.
	|  Parameter  |  Registry   |  Type       |  Value      |  Range      |
	| ------ | ------ | ------ | ------ | ------ |
	|  `Ignore command lines`  |  `userinterface.postsession.process%.ignoredargs`  |  string  |  empty *Default*  |  |
	|  `Activate generic base_system post-session command`  |  `userinterface.postsession.enabled`  |  bool  |  enabled / *disabled* (default)  |  |
	|  `The post-session command to be executed`  |  `userinterface.postsession.command`  |  |  **  |  [Logoff][Shutdown][Enter custom command here]  |
	|  `This session will have priority in executing the post-session command`  |  `userinterface.postsession.force`  |  bool  |  enabled / *disabled* (default)  |  |
	|  `Process name`  |  `userinterface.postsession.process%.name`  |  string  |  empty *Default*  |  |
	|  `Valid return codes`  |  `userinterface.postsession.process%.validrcs`  |  string  |  empty *Default*  |  |
- Improved multisession support for post-session commands: In case multiple sessions run in parallel with a set post-session command, command is only triggered when all sessions are finished successfully.
  If session has the 'force' post-session command parameter set, the command is triggered immediately once the session is finished.
- Updated kernel to 6.6.38 version.
- Added support for USB serial adapters in verbose boot mode (Linux kernel console) for debugging purposes. This is controlled by registry parameter `system.kernel.bootparams.serial_console_debug`
- Added option to set hardware clock. The default, Auto, will look for Windows partitions and, if present, assume that Windows is installed and the real time clock is set to local time.
	|  Setup  |  Parameter   |  Registry    |  Range  |
	| ------ | ------ | ------ | ------ |
	|  System > Time and Date  |  `HW clock timezone`   |  `system.time.hwclock_timezon`  |  [Auto (default)] [UTC] [localtime]  |
- Added Chinese input support with Intelligent Pinyin method (experimental).
  - Enable Input Methods with parameter
	| Parameter | Setup | Registry | Value |
	| ------ | ------ | ------ | ------ |
	| Keyboard Input Methods (experimental) | User Interface>Input>Keyboard>Input Methods | userinterface.keyboard.ibus.enable | false(default) / true |
  - Enable Pinyin method:
	| Parameter | Setup | Registry | Value |
	| ------ | ------ | ------ | ------ |
	| Chinese Intelligent Pinyin | User Interface>Input>Keyboard>Input Methods>Methods | userinterface.keyboard.ibus.general.preload-engine-libpinyin | false(default) / true |
  - Enable Bopomofo method:
	| Parameter | Setup | Registry | Value |
	| ------ | ------ | ------ | ------ |
	| Chinese Bopomofo | User Interface>Input>Keyboard>Input Methods>Methods | userinterface.keyboard.ibus.general.preload-engine-libbopomofo | false(default) / true |
  - Further properties:
	| Parameter | Setup | Registry | Value |
	| ------ | ------ | ------ | ------ |
	| Auto hide timeout | User Interface>Input>Keyboard>Input Methods | userinterface.keyboard.ibus.panel.auto-hide-timeout | 10000 (default) |
	| Next Input method | User Interface>Input>Keyboard>Input Methods | userinterface.keyboard.ibus.general.hotkeys.triggers | <Super>space (default) |
	| Candidates orientation | User Interface>Input>Keyboard>Input Methods | userinterface.keyboard.ibus.panel.lookup-table-orientation | vertical (default) / horizontal |
	| Show property panel | User Interface>Input>Keyboard>Input Methods | userinterface.keyboard.ibus.panel.show | do not show (default) / hide automatically / always |
  - Intelligent Pinyin properties:
	| Parameter | Setup | Registry | Value |
	| ------ | ------ | ------ | ------ |
	| Initial state Simplified Chinese | User Interface>Input>Keyboard>Input Methods>Intelligent Pinyin | userinterface.keyboard.ibus.libpinyin.pinyin.init-simplified-chinese | false / true(default) |
	| Initial state Chinese | User Interface>Input>Keyboard>Input Methods>Intelligent Pinyin | userinterface.keyboard.ibus.libpinyin.pinyin.init-chinese | false / true(default) |
	| Initial state full width | User Interface>Input>Keyboard>Input Methods>Intelligent Pinyin | userinterface.keyboard.ibus.libpinyin.pinyin.init-full | false(default) / true |
	| Initial state full punctuations | User Interface>Input>Keyboard>Input Methods>Intelligent Pinyin | userinterface.keyboard.ibus.libpinyin.pinyin.init-full-punct | false / true(default) |
- **OSC Installer**
	- Changed the size of the dummy partition from 1GB to 100MB or 10MB, depending on the storage capacity.
	- Changed: Reduced size of 1st partition on UD Pocket - effective with new installations (via OSC) or factory deployment of 12.4.1 or later.
	- Added new options for factory image creation:
	  - With the "Reset after first boot" option a deployed image can be tested and any change is resetted after boot.
	  -  With the "Automatically shutdown at first boot" option a deployed image does a self-check and automatically shuts down afterwards. A log file of this deployment self-check is written to the 1st partition.
- **App Management**
	- Added support for apps created via IGEL App Creator Portal. These apps are signed by corresponding app signing certificate, issued by IGEL via App Creator Portal. In order to install an app downloaded from IGEL App Creator Portal, the following steps are necessary:
		- Import of received app signing certificate (.crt) as file in UMS using the type "App Signing Certificate"
		- Import app in UMS (as usual)
		- Assigning received certificate and app to the endpoint(s)
	- Added: With the upcoming switch to bookworm as base for IGEL OS 12, a compatibility app was introduced for offering compatibility with all current released apps. If required, this app will automatically installed after the update to 12.5. A second reboot is needed after the update.
		 - With Base Sytem >= 12.4.2 the additional reboot is not needed as the compatibility app is directly installed with the Base System update.
- **Network**
	- Added Wake on LAN support via USB-C-to-LAN adapters
		- Activated by enabling any of the Wake on LAN settings of LAN Interfaces
		- Only Wake on LAN from Suspend is supported
- **WiFi**
	- Added option for DHCP refresh after roaming (within the same network).
		|  Parameter  |  Registry   |  Type       |  Value      |
		| ------ | ------ | ------ | ------ |
		|  `Refresh DHCP after roaming`  |  `network.interfaces.wirelesslan.device0.roam_refresh_dhcp`  |  bool  |  enabled / *disabled* (default)  |
- **HID**
	- Added: In case no other input devices (keyboard or mouse) are detected on the device and there are bluetooth input devices available to pair, they will be automatically paired after booting as long as the parameter devices.bluetooth.auto_pair_if_no_input is set to true (which is the default)
- **Setup Assistant**
	- Changed label of WiFi configuration dialog in Setup Assistant (Country or Region).
- **Driver**
	- Updated libccid to version 1.5.5 to support rf IDEAS USB reader.
- **Print-Center**
	- Added information about print-jobs to the print-center tray app to inform about queued or running jobs. Completed or canceled jobs are not shown in tray app.
	- Added option to cancel a print job
	- Added system notification in case of failed print jobs.
	- Added option to print test page on connected printer.
	- Added print-center tray app to search and connect local or network printers. The tray app requires the CUPS printing app and uses Avahi to discover available network printers. For best results use CUPS printing app >= 1.2.0 older versions do not support auto discovery.
		 - New parameter were added to enable/disable the tray app and to enable/disable Avahi for auto discovery
			|  Setup  |  Parameter  |  Registry  |  Type  |  Value  |
			| ------ | ------ | ------ | ------ | ------ |
			|  `Apps > Avahi Daemon`  |  `Enable the Avahi daemon`  |  `app.avahi_daemon.enable`  |  boolean  |  true *default* / false  |
			|  `User Interface > Desktop > Taskbar Items`  |  `Show print-center tray icon on desktop`  |  `userinterface.system_tray.printer.desktop`  |  boolean  |  true *default* / false  |
			|  `User Interface  > Screenlock / Screensaver > Taskbar`  |  `Show print-center tray icon on screenlock`  |  `userinterface.system_tray.printer.lockscreen`  |  boolean  |  true / false *default*  |
- **Audio**
	- Changed: On first boot (after installation) all devices are set to 50% volume.
	- Changed default audio backend to pipewire. Pulseaudio backend is still available and can be activated by registry key:
		|  Parameter  |  Registry   |  Range      |  Value      |
		| ------ | ------ | ------ | ------ |
		|  `Audiobackend`  |  `multimedia.audiobackend`  |  [pipewire][pulseaudio]  |  *pipewire*  |
	- Removed parameter as no longer required / feature is offered via tray app now.
		|  Parameter  |  Registry   |  Type       |  Value      |
		| ------ | ------ | ------ | ------ |
		|  `Volume Control per Application`  |  `userinterface.sound.app_volume_ctrl`  |  bool  |  *enabled* (default) / disabled  |
- **Multimedia**
	- Updated Fluendo multimedia codecs to the following version:
	- gst-fluendo-asfdemux to version 1.0.2
	- gst-fluendo-h264dec to version 1.0.10
	- gst-fluendo-hwvadec to version 1.0.10
	- gst-fluendo-mp3dec to version 1.0.5
	- gst-fluendo-mpeg4vdec to version 1.0.2
	- gst-fluendo-wmadec to version 1.0.2
	- gst-fluendo-wmvdec to version 1.0.2
	- Added VP9 and AV1 video hardware acceleration.
	- Added registry key to switch from fluendo to vaapi gstreamer plugin for h264 hardware acceleration.
		|  Parameter  |  Registry   |  Type       |  Value      |
		| ------ | ------ | ------ | ------ |
		|  `Switch from Fluendo to VAAPI h264 hardware accelerated decoder.`  |  `multimedia.gstreamer.use_vaapi_for_h264`  |  bool  |  enabled / *disabled* (default)  |
- **Hardware**
	- Improved power consumption on Lenovo ThinkPad L14 Intel Gen5.
	- Added hardware support for Lenovo ThinkPad L14 AMD Gen5.
	- Changed energy savings settings for HP Elite mt645 G8.
	- Added hardware support for Lenovo ThinkCentre M75q Gen5.
	- Added hardware support for Lenovo ThinkCentre M70q Gen5.
	- Added hardware support for Lenovo ThinkPad L14 Intel Gen5.
	- Added hardware support for LG gram 14ZT90R, 15ZT90R and 17ZT90R.
- **Remote Management**
	- Added option to set rank of UMS connectors. UMS version 12.04.120 or later is required.
		|  Parameter   |  Registry    |  Type        |  Value       |
		| ------ | ------ | ------ | ------ |
		|  `Ranking of connectors`   |  `system.remotemanager.connectorranking`           |  string                                |  *no preference*(default) / prefer UMS /   prefer ICG  |
		|  `connector type`   |  `system.remotemanager.connector%.type`           |  string                                |  ums/icg/*undefined*(default)      |
		 - The `connector type` parameter is set automatically by UMS.
		 - If `Ranking of connectors` is set to "prefer ICG", the rmagent tries to connect to an ICG and only connects to an UMS server, if no ICG is reachable or configured.
		 -  If `Ranking of connectors` is set to "prefer UMS", the rmagent tries to connect to an UMS and only connects to an ICG, if no UMS is reachable or configured.
		 -  If `Ranking of connectors` is set to "no preference", the rmagent connects randomly to any configured device-connector.
	- Added support for UMS files of type 'App Signing Certificate'.
	- Added support for application priorities when performing "Specific device commands" from the WUMS.
	- Improved merging of received settings - merging process ignores parameters which are no longer existent in system.
	- Added support for dynamic file types.
	- Added setup parameter for setting of the UMS structure tag. The UMS structure tag can now additionally be set by value of this parameter. For setting or getting of the currently used UMS structure tag the commands /sbin/rmagent-set-structure-tag -t <TAG> and /sbin/rmagent-get-structure-tag can be used.
		|  Parameter   |  Registry    |  Type        |  Value       |
		| ------ | ------ | ------ | ------ |
		|  `Structure tag`  |  `system.remotemanager.ums_structure_tag`  |  string  |    |
- **IGEL Desktop**
	- Added: Prevent user from dimming display brightness completely.
	- Added display of device type icons for discovered and paired bluetooth devices in bluetooth tray app.
	- Added: Bluetooth tray app supports input of a custom pairing pin code for older devices - if the pairing process does not work with default pin code.
	- Added Bluetooth tray app to system tray
	- Added: Secure pairing with passkey or pincode in Bluetooth tray app.
	- Added shutdown lid action for battery-powered and wired operation.
		|  Parameter  |  Registry   |  Range      |  Value      |
		| ------ | ------ | ------ | ------ |
		|  `Lid close action while not plugged in`  |  `system.actions.lid.battery`  |  [Turn off display][Suspend][Shutdown]  |  *Suspend*  |
		|  `Lid close action while plugged in`  |  `system.actions.lid.ac`  |  [Turn off display][Suspend][Shutdown]  |  *Suspend*  |
- **Licensing**
	- Added catalog entry for add-on license "IGEL Advanced Device Redirection"
- **Mobile Broadband**
	- Added support for Quectel CAT 61K-GL WW SKU - EM061K-GL on Lenovo ThinkPads L14 Intel/AMD Gen5 and L16 Intel/AMD Gen1
	- Updated Lenovo FCC Unlock Tool to version 2.3
- **SSO**
	- Changed / renamed Azure AD IDP to Microsoft Entra ID.
	- Added configuration of OpenID Connect scope value for authentication request:
		|  Parameter  |  Registry   |  Type       |  Value      |
		| ------ | ------ | ------ | ------ |
		|  `OpenID Connect scope`  |  `auth.cloudidp.scope`  |  string  |  openid profile email *Default*  |
	- Added a parameter to Entra ID SSO which allows to add additional scopes.
	- Changed / improved error messages for SSO login.
	- Added: Configurable list of allowed hosts for redirection:
		|  Parameter  |  Registry   |  Type       |  Value      |
		| ------ | ------ | ------ | ------ |
		|  `List of allowed hosts for redirection`  |  `auth.cloudidp.host_allowlist`  |  string  |  empty *Default*  |
- **Virtualization**
	- Added services related to VirtualBox Guest Additions.
	- Added support for virtualization environments:
		 - Oracle VM VirtualBox / VirtIO (kernel layer)
		 - VMware Workstation
		 - QEMU (limited support only)
		 - SPICE (virt-viewer) (limited support only)

## Security Fixes
- Fixed a privilege escalation issue in the starter license. Acknowledgements to Zack Didcott for responsible disclosure.
- Fixed libxml2 security issue CVE-2024-25062.
- Fixed python-cryptography security issue CVE-2023-50782.
- Fixed dnsmasq security issues CVE-2023-50868 and CVE-2023-50387.
- Fixed vim security issue CVE-2024-22667.
- Fixed nss security issues CVE-2023-6135, CVE-2023-5388 and CVE-2023-4421.
- Fixed shadow security issue CVE-2023-4641.
- Fixed nghttp2 security issue CVE-2024-28182.
- Fixed less security issue CVE-2024-32487.
- Fixed xorg-server security issues CVE-2024-31080, CVE-2024-31081 and CVE-2024-31083.
- Added registry key to enable support for byteswapped clients, disabled by default for security reasons:
	|  Parameter  |  Registry   |  Type       |  Value      |
	| ------ | ------ | ------ | ------ |
	|  `Enable support for byteswapped X clients.`  |  `x.xserver%.allowbyteswappedclients`  |  bool  |  enabled / *disabled* (default)  |
- Fixed wpa security issue CVE-2023-52160.
- Fixed gdk-pixbuf security issue CVE-2022-48622.
- Fixed python3.11 security issues CVE-2024-0450, CVE-2023-6597, CVE-2023-41105, CVE-2023-40217 and CVE-2023-24329.
- Fixed qtbase-opensource-src security issues CVE-2024-25580, CVE-2023-51714, CVE-2023-38197, CVE-2023-37369, CVE-2023-34410 and CVE-2023-24607.
- Fixed qemu security issues CVE-2024-3447, CVE-2024-3446, CVE-2024-26328, CVE-2024-26327, CVE-2024-24474, CVE-2023-6683, CVE-2023-5088, CVE-2023-3301, CVE-2023-3019, CVE-2024-3567, CVE-2023-6693, CVE-2023-42467, CVE-2021-3750 and CVE-2021-20255.
- Fixed pillow security issues CVE-2024-28219, CVE-2023-50447 and CVE-2023-44271.
- Fixed openssl security issues CVE-2024-0727, CVE-2023-6237, CVE-2023-6129 and CVE-2023-5678.
- Fixed curl security issues CVE-2024-2398, CVE-2024-2004, CVE-2024-0853, CVE-2023-46219 and CVE-2023-46218.
- Fixed libarchive security issue CVE-2024-26256.
- Fixed gnutls28 security issues CVE-2024-28835 and CVE-2024-28834.
- Fixed openvpn security issues CVE-2024-5594 and CVE-2024-28882.
- Fixed python-idna security issue CVE-2024-3651.
- Fixed krb5 security issues CVE-2024-37371 and CVE-2024-37370.
- Fixed libvpx security issue CVE-2024-5197.
- Fixed libndp security issue CVE-2024-5564.
- Fixed openssh security issue CVE-2024-6387.
- Fixed cups security issue CVE-2024-35235.
- Fixed expat security issues CVE-2024-28757, CVE-2023-52426 and CVE-2023-52425.
- Fixed glibc security issues CVE-2024-33602, CVE-2024-33601, CVE-2024-33600, CVE-2024-33599 and CVE-2024-2961.
- Fixed iperf3 security issue CVE-2024-26306.
- Fixed ntfs-3g security issue CVE-2023-52890.
- Fixed libuv1 security issue CVE-2024-24806.
- Fixed iwd security issue CVE-2024-28084.
- Fixed exfatprogs security issue CVE-2023-45897.
- Fixed opensc security issues CVE-2024-1454 and CVE-2023-5992.
- Fixed tpm2-tools security issues CVE-2024-29039 and CVE-2024-29038.
- Fixed bind9 security issues CVE-2023-6516, CVE-2023-5517, CVE-2023-50868, CVE-2023-50387 and CVE-2023-4408.
- Fixed giflib security issues CVE-2023-39742, CVE-2022-28506 and CVE-2021-40633.
- Fixed glib2.0 security issue CVE-2024-34397.
- Fixed ghostscript security issues CVE-2024-33871, CVE-2024-33870, CVE-2024-33869, CVE-2024-29510 and CVE-2023-52722.
- Fixed mysql-8.0 security issues CVE-2024-21102, CVE-2024-21096, CVE-2024-21087, CVE-2024-21069, CVE-2024-21062, CVE-2024-21060, CVE-2024-21054, CVE-2024-21047, CVE-2024-21013, CVE-2024-21009, CVE-2024-21008, CVE-2024-21000, CVE-2024-20998 and CVE-2024-20994.
- Fixed tiff security issues CVE-2023-3164, CVE-2023-6277, CVE-2023-6228 and CVE-2023-52356.
- Fixed vte2.91 security issue CVE-2024-37535.
- Fixed wget security issue CVE-2024-38428.

## Resolved Issues
- Removed x.drivers.modesetting.no_min_cursor_size registry key as function was removed.
- Fixed: Wrong assignment of socks proxy port
- Changed: Login mask for local login is shown on primary screen (instead of the first screen).
- Fixed: UMS connectors are shown only once in setup.
- Fixed screen lagging issue with Dell Latitude 7430
- Fixed Intel PSR configuration via IGEL registry
	|  Parameter  |  Registry   |  Range      |  Value      |
	| ------ | ------ | ------ | ------ |
	|  `Change settings for intel PSR (panel self refresh).`  |  `x.drivers.intel.psr`  |  [Default][Disable][Enable][Use only up to PSR1][Use up to PSR2]  |  *Default*  |
- Fixed: Proxy configuration issue in combination with AD/Kerberos
- Fixed application full screen behavior when another monitor is primary than the first.
- Fixed screen lock countdown-done command execution.
- Added access to advanced display configuration via desktop context menu
- **Citrix**
	- Screenshots are now enabled to be transferred from IgelOS to a Citrix session by copy'n'paste.
- **App Management**
	- Fixed: Showing error message on IGEL OS desktop if latest version can not be installed via auto update (dependency apps) due to not fulfilled requirements like Base System.
- **Network**
	- Fixed AD / Kerberos login name handling. By default the name is not expanded with the domain any more (e.g. user -> user@EXAMPLE.COM). To restore the old behavior, set the following parameter:
		| Parameter | Registry | Value |
		| ------ | ------ | ------ |
		| `Expand user name` | `auth.login.expand_username` | enabled / **disabled** (default) |
	- Fixed network configuration on Hyper-V virtualization.
	- SCEP: Added a registry key for the case where the SCEP environment does not support certificate renewal in the SCEP sense, i.e. where starting over with the challenge password in the CSR is required.
		|  Parameter  |  Registry   |  Range      |  Value      |
		| ------ | ------ | ------ | ------ |
		|  `Renewal method`  |  `network.scepclient.cert%.renewal_method`  |  [Renewal][Start-over][Fallback to start-over]  |  *Renewal*  |
	- Fixed issue with e1000e network card not working with powersave settings.
	- Added new registry key to add drivers to blacklist for powersave settings
		|  Parameter  |  Registry   |  Type       |  Value      |
		| ------ | ------ | ------ | ------ |
		|  `List of drivers seperated by space which have issues with powersave settings.`  |  `system.powersave.powertop_drivers_blacklist`  |  string  |  empty *Default*  |
- **Open VPN**
	- Removed unsupported message digest algorithms [RSA-MD5][RSA-SHA][RSA-SHA1][RSA-SHA1-2][RSA-RIPEMD160][RSA-MD4][RSA-SHA256][RSA-SHA384][RSA-SHA512][RSA-SHA224] in parameter sessions.openvpn%.vpnopts.auth. Use alternative parameter:
		 - RSA-MD5        =>   MD5
		 - RSA-SHA        =>   SHA
		 - RSA-SHA1       =>   SHA1
		 - RSA-SHA1-2     =>   SHA1-2
		 - RSA-RIPEMD160  =>   RIPEMD160
		 - RSA-MD4        =>   MD4
		 - RSA-SHA256     =>   SHA256
		 - RSA-SHA384     =>   SHA384
		 - RSA-SHA512     =>   SHA512
		 - RSA-SHA224     =>   SHA224
- **HID**
	- Fixed: Mouse no longer moved to middle of primary screen when switching the primary mouse button via input tray app.
- **Setup Assistant**
	- Fixed Setup Assistant manual time entry.
- **Custom Partition**
	- Fixed custom partition download by adding UMS trust-store certificates to the valid chain for download. Additionally the host name check was removed and more debug output is generated.
	- Improved custom partition handling on slow devices - to avoid timeout.
	- Fixed custom partition downloads with password when profile was created with UMS >= 12.02.100
		 - To fix already created / existing profiles (for earlier IGEL OS releases), it is necessary to set the `custom_partition.source%.crypt_password` parameter in registry.
- **Audio**
	- Fixed internal microphone on Lenovo ThinkPad L14 and L15 Gen4 (AMD).
	- Added registry keys to prevent automatic switch of bluetooth profile:
		 - For pulseaudio:
			|  Parameter  |  Registry  |  Type  |  Value  |
			| ------ | ------ | ------ | ------ |
			|  `Set pulseaudio auto switching headset to A2DP`  |  `multimedia.pulseaudio.daemon.module-bluetooth-autoswitch-to-a2dp`  |  bool  |  *enabled* (default) / disabled  |
		 - For pipewire:
			|  Parameter  |  Registry   |  Type       |  Value      |
			| ------ | ------ | ------ | ------ |
			|  `Autoselection to headset profile`  |  `multimedia.pipewire.wireplumber.autoswitch-to-headset-profile`  |  bool  |  *enabled* (default) / disabled  |
	- Fixed headphone output at LG CQ601 jack.
	- Added registry key to enable / disable analog only profile in pipewire:
		|  Parameter  |  Registry   |  Type       |  Value      |
		| ------ | ------ | ------ | ------ |
		|  `Enable analog only profile`  |  `multimedia.pipewire.wireplumber.enable-analog-only-profile`  |  bool  |  *enabled* (default) / disabled  |
- **Hardware**
	- Fixed wake up from suspend on HP Elite mt645 G8.
	- Fixed missing firmware file for intel 9462ngw WiFi chipset.
	- Fixed microphone mute function key on HP Elite mt645 G8.
	- Fixed microphone mute function key led on Lenovo ThinkPad L14 Gen5 Intel.
- **Remote Management**
	- Added automatic upgrade of valid UMS registration to Unified Protocol if the device was upgraded by the OSC remaining old settings.
	- Fixed fingerprint check during onboarding if root certificate of a public CA is imported into the UMS.
	- Fixed download of files beginning with a white space.
	- Fixed installing of TLS certificates assigned by the UMS into the web browser's CA certificates storage.
- **IGEL Desktop**
	- Network notifications are not shown anymore except for error messages.
	- Fixed: Set audio volume back to 100% after disabling overamplification.
- **Licensing**
	- Fixed issue with license is not detected on some devices.
- **Mobile Broadband**
	- Fixed: On devices supporting mobile broadband (physical) and eSim, an automatic switch to the physical SIM slot is performed if eSim has no profile assigned.
- **Virtualization**
	- Added clipboard support to allow copy and paste from VMware Hypervisor (vSphere) to IGEL OS 12 guest.

## Known Issues
- Automatic proxy configuration: PAC file URL does not support https scheme.
- Increased writeable cache partition size (by default). First boot with 12.4.x and newer may take more time (once) when updating from a 12.2.x or older base system app.
- In very rare cases all apps are lost after an update. Should this be the case, an error message is shown "Opening system App Journal failed." - if the device is manged, the apps will be reinstalled after a reboot.
- The downgrade to base system 12.00.900 or 12.00.910 is not supported.
- **OSC Installer**
	- Deployment via PXE is not supported with 12.5.0 base system.
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
	- Lenovo L14 Gen5 Intel video codec errors (graphic glitches during accelerated video playback)
	- Display configuration of displays connected to HP G5 Docking Station may fail on HP t655.
	- Rotation of displays connected to the Lenovo ThinkPad USB-C Hybrid Dock may fail.
	- Wake up from suspend via UMS does not work on HP mt645 G7 devices. Workaround: Disable system suspend and use shutdown instead.
	- If using 6 x 4K@60Hz monitors on HP t755/t740 with the additional graphic card, one or two of the monitors may stay black after coming back from DPMS off state.
	 - This is caused by using the additional graphic card as primary, which only has 512MB VRAM (the VRAM is not sufficient in this configuration). Possible solution: Increasing the VRAM size of the iGPU to 2048MiB in BIOS (maybe 1024MiB may also work) and activate IGEL registry key `x.drivers.swap_card0_with_card1` so the iGPU will become the Primary GPU. Connector names will be changed with that!
	- Built-in fingerprint sensor is not supported on HP mt440 G3 and mt645 G7/G8.
	- Wake on LAN is not functional on Dell OptiPlex 3000 and Lenovo K14 Gen1
- **Remote Management**
	- When deploying app signing certificate and app that depends on the certificate at the same time, the app installation may fail because the certificate might not have been deployed in time. As a workaround, deploying app signing certificates first, followed by installation of the corresponding app(s) short time after.
- **IGEL Desktop**
	- Connecting a new audio device during running audio playback / stream may result in failure of audio tray.
	- External display mode not functional on ThinkPad L14 Gen3 AMD
	- Disabled compositing (transparency effects) in window manager to circumvent issues with screen lock. Registry key `windowmanager.wm0.variables.usecompositing` is not configurable anymore.
	- If two monitors are configured in a vertical layout (one above the other), and those monitors are configured with "auto-detect" resolution, saving leads to a wrong layout order.
	- On-screen keyboard sporadically crashes when typing.
- **Licensing**
	- Manual deployment of add-on licenses for IGEL Agent for Imprivata licenses (via UMS) is only possible after finished installation of IGEL Agent for Imprivata app on device.
