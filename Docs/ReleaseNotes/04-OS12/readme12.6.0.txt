IGEL OS Creator  
===============

Firmware version 12.6.0  
Release date 2025-02-10  
Last update of this document 2025-02-10  


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
| Xorg X11 Server                           | 21.1.14-1igel1730266598          |
| Lightdm Graphical Login Manager           | 1.26.0-8igel1716879255           |
| XFCE4 Window Manager                      | 4.14.5-1~18.04igel1643191202     |
| ISC DHCP Client                           | 4.4.3-P1-2                       |
| ModemManager                              | 1.22.0-3+b2igel1731393568        |
| WebKit2Gtk                                | 2.46.4-1~deb12u1igel1733301627   |
| Python3                                   | 3.11.2                           |
| Virtualbox Guest Utils                    | 7.0.20-dfsg-1+b1igel1730700800   |
| Virtualbox X11 Guest Utils                | 7.0.20-dfsg-1+b1igel1730700800   |
| Open VM Tools                             | 12.2.0-1+deb12u2                 |
| Open VM Desktop Tools                     | 12.2.0-1+deb12u2                 |


Release Notes of installable IGEL OS 12 base system
================================================================================

# Changes since: 12.5.0

## New Features
- Added secure mini browser as default handler for URLs without installation of a full browser. This enables Zoom (local app) SSO login.
- Added fwupd in IGEL OS as base for upcoming BIOS-related apps.
- Added custom data partition (e.g. for storing images for screensaver slide show)
	|  Parameter  |  Registry   |  Range      |  Value      |
	| ------ | ------ | ------ | ------ |
	|  `Custom Data Partition Size`  |  `custom_data_partition.size`  |  [(empty)][small][medium][large][(fixed size)]  |  **  |
	 - Leave empty if this partition is not desired. Apart from small, medium and large an integer may be specified, potentially with K, M or G appended to refer to the respective multiplier. Changes are effective after reboot. The mount point is /custom-data/
- Added option to perform an AD/Kerberos auto logon with predefined credentials.
	| IGEL Setup | Parameter | Registry | Value |
	| ------ | ------ | ------ | ------ |
	| `Security / Logon / Active Directory/Kerberos` | `Delay between autologin attempts` | `auth.login.autologin.delay` | `5` |
	| `Security / Logon / Active Directory/Kerberos` | `Automatically perform login` | `auth.login.autologin.enable` | **disabled** (default)  / enabled |
	| `Security / Logon / Active Directory/Kerberos` | `Username for autologin` | `auth.login.autologin.username` | `` |
- Changed update parameter to enhance control over management of assigned apps.. Registry keys were kept to be backward compatible.
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
- Removed VNC Viewer accessory from base system. Tiger VNC Viewer is now offered as an app - as an replacement and to offer a more flexible solution for these session types.
- Updated kernel to version 6.6.60.
- Updated End User License Agreement (EULA) to the February 2025 version.
- **OSC Installer**
	- Changed: Shutdown will be triggered after successful OS installation in unattended mode. Only the PXE installer is still using a reboot action as default.
	- PXE installation is now compatible with Secure Boot.
- **App Management**
	- Changed: Dependency apps are automatically removed if corresponding dependent app(s) are removed.
	- Added support for apps created via IGEL App Creator Portal. These apps are signed by corresponding app signing certificate, issued by IGEL via App Creator Portal. In order to install an app downloaded from IGEL App Creator Portal, the following steps are necessary:
		- Import of received app signing certificate (.crt) as file in UMS using the type "App Signing Certificate"
		- Import app in UMS (as usual)
		- Assigning received certificate and app to the endpoint(s)
	- Added: Possibility to download apps from custom webserver. If any custom webserver is configured, the system will first try to download from the custom webserver. Fallback are the configured app repositories. Requires UMS 12.07.100 or later.
		|  Parameter  |  Registry   |  Type       |  Value      |
		| ------ | ------ | ------ | ------ |
		|  `Password for HTTP Auth`  |  `update.external_binary_source%.password`  |  string  |    |
		|  `Priority, sources with higher priority will be tried first`  |  `update.external_binary_source%.priority`  |  int  |  100 |
		|  `The base URL of the source, apps must be located in a specific subfolder structure`  |  `update.external_binary_source%.url`  |  string  |    |
		|  `Root CA certificate to validate the SSL connection`  |  `update.external_binary_source%.certificate`  |  string  |    |
		|  `Username for HTTP Auth`  |  `update.external_binary_source%.username`  |  string  |    |
- **Network**
	- Added ready-made challenge password retrieval for Microsoft NDES
	  - Set the following to NDES for enabling the feature:
		|  Parameter  |  Registry   |  Range      |  Type       |  Value      |
		| ------ | ------ | ------ | ------ | ------ |
		|  `Password`  |  `network.scepclient.cert%.ndes.challenge_password_retrieval.crypt_password`  |     |  string  |  empty *Default*  |
		|  `Ready-made Challenge Password Command`  |  `network.scepclient.cert%.use_ready_made_challenge_password_command`  |  [none][NDES]  |  string  |  *none*   |
		|  `User name`  |  `network.scepclient.cert%.ndes.challenge_password_retrieval.user`  |     |  string  |  empty *Default*  |
	  - If the following is not 'none', https will be used. The default "getca" means the CA certificate received in the SCEP GetCA operation. The full path to a different CA certificate may also be specified.
		|  Parameter  |  Registry   |  Range      |  Type       |  Value      |
		| ------ | ------ | ------ | ------ | ------ |
		|  `Debug level`  |  `network.scepclient.cert%.ndes.challenge_password_retrieval.debuglevel`  |     |  integer  |  0 *Default*  |
		|  `CA certificate`  |  `network.scepclient.cert%.ndes.challenge_password_retrieval.cacert`  |   [none (not using https)][from getca operation]   |  string  |   *from getca operation*   |
	  - Added configuration for PKCS#7 encryption and signature algorithms (see sscep options -E and -S)
		|  Parameter  |  Registry   |  Range      |  Type       |  Value      |
		| ------ | ------ | ------ | ------ | ------ |
		|  `PKCS#7 signature algorithm`  |  `network.scepclient.cert%.signalg`  |  [automatic][md5][sha1][sha224][sha256][sha384][sha512]  |  string  |  __ (automatic)  |
		|  `PKCS#7 encryption algorithm`  |  `network.scepclient.cert%.encalg`  |  [automatic][des][3des][blowfish][aes128][aes192][aes256]  |  string  |  __ (automatic)  |
	  - Content-Type: application/x-pki-message is sent according to RFC 8894 if the following new option is enabled:
		|  Parameter  |  Registry   |  Range      |  Type       |  Value      |
		| ------ | ------ | ------ | ------ | ------ |
		|  `Send Content-Type`  |  `network.scepclient.cert%.sscep.send_content_type`  |     |  bool  |  enabled / _disabled_ (default)  |
	  - SCEP: When the CA fingerprint or the CA identifier is changed the client certificate and the client key are not discarded anymore. Just new CA and RA certificates will be downloaded.
	- Added registry key for ignoring hostname received via DHCP
		|  Parameter  |  Registry   |  Type       |  Value      |
		| ------ | ------ | ------ | ------ |
		|  Ignore hostname received via DHCP  |  network.dns.hostname_ignore_dhcp  |  bool  |  enabled / _disabled_ (default)  |
	- Added MAC address passthrough among Ethernet devices. With the following registry key a LAN device can be specified from which the MAC address shall be adopted. The donor device and any conflicting receiver device will be removed (by unbinding the driver) as long as the receiving device is present.
		| Parameter | Registry | Range | Value |
		| ------ | ------ | ------ | ------ |
		| `MAC address source` | `network.interfaces.ethernet.device%.mac_source` | [none][LAN][LAN2][LAN3][LAN4] | *none* |
	  - Example: If LAN2 and LAN3 are configurations for docking stations that shall adopt the MAC address from LAN, the following two parameters must be set to "LAN":
	    - network.interfaces.ethernet.device1.mac_source
	    - network.interfaces.ethernet.device2.mac_source
	  - Warning: Misconfiguration may result in loss of connectivity
- **WiFi**
	- Added support for WiFi module of ATrust mt183W.
- **Driver**
	- Updated Nvidia driver to version 535 (Debian Bookworm version)
- **Multimedia**
	- Added registry key to switch from fluendo to vaapi gstreamer plugin for h264 hardware acceleration.
		|  Parameter  |  Registry   |  Type       |  Value      |
		| ------ | ------ | ------ | ------ |
		|  `Switch from Fluendo to VAAPI h264 hardware accelerated decoder.`  |  `multimedia.gstreamer.use_vaapi_for_h264`  |  bool  |  enabled / *disabled* (default)  |
	- Added VP9 and AV1 video hardware acceleration.
	- Updated Fluendo multimedia codecs to the following version:
	  - gst-fluendo-asfdemux to version 1.0.2
	  - gst-fluendo-h264dec to version 1.0.10
	  - gst-fluendo-hwvadec to version 1.0.10
	  - gst-fluendo-mp3dec to version 1.0.5
	  - gst-fluendo-mpeg4vdec to version 1.0.2
	  - gst-fluendo-wmadec to version 1.0.2
	  - gst-fluendo-wmvdec to version 1.0.2
- **Hardware**
	- Added hardware support for Lenovo ThinkPad L16 Gen1 Intel
	- Added function key support for Lenovo ThinkPad L13 Gen5 Intel, L14 Gen5 AMD/Intel, L16 Gen1 AMD/Intel:
		 - Fn+F1: Loudspeaker Off
		 - Fn+F2: Reduce audio volume
		 - Fn+F3: Increase audio volume
		 - Fn+F4: Mute microphone
		 - Fn+F5: Reduce display brightness
		 - Fn+F6: Increase display brightness
		 - Fn+F7: Display configuration
		 - Fn+F8: Thermal profile mode (L13 Gen5 Intel: Flight mode)
		 - Fn+Ctrl+F9: Screenshot (L13 Gen5 Intel: not mapped to any function)
		 - Fn+Ctrl+F10: Snipping Tool (L13 Gen5 Intel: not mapped to any function)
		 - Fn+Ctrl+F11: Maximise focused window (L13 Gen5 Intel: not mapped to any function)
	- Added hardware support for Lenovo ThinkCentre M75q Gen5.
	- Added hardware support for Lenovo ThinkCentre M70q Gen5.
	- Added configuration-driven hardware detection system.
	- Added hardware support for Lenovo ThinkPad L13 Gen5 Intel
	- Added support for Poly headsets (verified with HP mt645 G8 and t655)
		- Poly Voyager 4320 Microsoft Teams Certified
		- Poly Voyager Focus 2 Microsoft Teams Certified
		- Poly Blackwire 5220 Stereo USB-C Headset
		- Poly Blackwire 3320 Stereo Microsoft Teams Certified
		- Poly Blackwire 3220 Stereo USB-C Headset
		- Poly DA85-M USB to QD Adapter (allows the EP520 (and other Poly quick disconnect headsets) to connect to a USB port on the computer.)
		- Poly EP 520 Bin Headset +QD, incl. Poly DA85-M USB to QD Adapter (allows the EP520 (and other Poly quick disconnect headsets) to connect to a USB port on the computer.)
		- Poly EncorePro 310 Monaural USB-A Headset
		- Poly Savi 8220-M Stereo D2 Headset
		- Poly Savi 8420 Stereo -M D2 Headset
		- Poly Savi 8220 -M D2 USB-A Headset
		- Poly Voyager Free 60+ UC M Carbon Black
	- Note: Call Control via HID buttons is currently not supported.
	- Added hardware support for Lenovo ThinkPad L16 Gen1 AMD.
	- Added hardware support for HP Elite t660 thin client.
	- Replaced the self-developed “Webcam Information” tool with qcam, a standard utility included in most Linux distributions.
	- Updated grub boot code to version 2.12 which fixes a issue with out of memory if using 4K monitor.
	- Changed hardware names of supported LG devices (to only use underscores instead of spaces).
- **Remote Management**
	- Added support for application priorities when performing "Specific device commands" from the WUMS.
	- Added support for Wake on LAN proxy.
	- Added support for UMS files of type 'App Signing Certificate'.
	- Added support for dynamic file types.
	- Added setup parameter to set connection timeout
		|  Parameter   |  Registry    |  Type        |  Value       |
		| ------ | ------ | ------ | ------ |
		|  `IGEL Remote Management Connect Timeout`        |  `system.remotemanager.connect_timeout`              |  integer                            |  timeout in sec / *45* (default)  |
	- Added new fallback strategy for connecting to UMS - now utilizing the list of UMS and ICG server addresses from last successful connection.
- **IGEL Desktop**
	- Added a new generic form dialog framework. A detailed documentation (how to use) will be provided via IGEL Knowledge Base.
		 - OpenVPN authentication dialog uses now the newly designed dialog framework.
	- Added: Prevent user from dimming display brightness completely.
	- Added new parameters to configure which notifications should be shown to the user
		|  Parameter  |  Registry   |  Type       |  Value      |
		| ------ | ------ | ------ | ------ |
		|  `Action for suppressed notifications with user actions`  |  `notification.action_on_suppressed_notifications_with_user_action`  |  range  |  [*default*][cancel]  |
		|  `Show notifications greater or equal to a specific severity`  |  `notification.show_notification_severity`  |  range  |  [*all*][info][warning][error][none]  |
		|  `Show suppressed notifications in notification panel`  |  `notification.show_suppressed_notifications_in_panel`  |  bool  |  *true*/false |
		|  `Suppress notification with user actions`  |  `notification.suppress_notifications_with_user_action`  |  bool  |  *true*/false |
	- Changed: Utilizing the newly introduced generic form dialog framework for the user password prompt during session startup.
	- Added new hotkey to enable logoff with a keybinding:
		|  Parameter  |  Registry   |  Type       |  Value  |
		| ------ | ------ | ------ | ------ |
		|  `key for hotkey`  |  `sessions.wmcommands16.hotkeymodifier`  |  `range`  |  `Ctrl` (default)  |
		|  `enable hotkey`  |  `sessions.wmcommands16.usehotkey`  |  `bool`  |  true/*false* (default)  |
		|  `key for hotkey`  |  `sessions.wmcommands16.hotkey`  |  `string`  |  "l" (default)  |
- **Licensing**
	- Added catalog entry for add-on license "IGEL Advanced Device Redirection"
	- Added License Enforcement: After a 28-day grace period following the expiration of a subscription license, the apps will become non-functional. Users will receive notifications displaying the remaining days in grace period.
- **Mobile Broadband**
	- Added support for WWAN connection with Quectel EM160R-GL.
- **Virtualization**
	- Added hardware support for SINA workstation.
	- Added clipboard support to allow copy and paste from VMware Hypervisor (vSphere) to IGEL OS 12 guest.

## Security Fixes
- Fixed xorg-server security issue CVE-2024-9632.
- Fixed libheif security issues CVE-2024-41311, CVE-2023-49462 and CVE-2023-29659.
- Fixed python-reportlab security issue CVE-2023-33733.
- Fixed webkit2gtk security issues  CVE-2024-44185, CVE-2024-44244, CVE-2024-44296, CVE-2024-4558, CVE-2024-40794, CVE-2024-40789, CVE-2024-40785, CVE-2024-40782, CVE-2024-40780, CVE-2024-40779 and CVE-2024-40776.
- Fixed nss security issues CVE-2024-6609, CVE-2024-6602 and CVE-2024-0743.
- Fixed libarchive security issue CVE-2024-20696.
- Fixed curl security issue CVE-2024-8096.
- Fixed nghttp2 security issue CVE-2024-28182.
- Fixed ntfs-3g security issue CVE-2023-52890.
- Fixed python3.11 security issue CVE-2024-6232.
- Fixed sqlite3 security issue CVE-2023-7104.
- Fixed openssl security issues CVE-2024-9143 and CVE-2024-5535.
- Fixed python-cryptography security issues CVE-2024-26130 and CVE-2023-49083.
- Fixed ghostscript security issues CVE-2024-46956, CVE-2024-46955, CVE-2024-46953, CVE-2024-46952 and CVE-2024-46951.
- Fixed mpg123 security issue CVE-2024-10573.
- Fixed webkit2gtk security issues CVE-2024-44308 and CVE-2024-44309

## Resolved Issues
- Fixed documentation folder on Lenovo devices preinstalled with IGEL OS.
- Fixed LVFS command line tool fwupdmgr which resulted in the wrong Efi System Partion being selected for BIOS updates.
- Fixed credential passthrough from AD/Kerberos login to applications. In some cases a double login was necessary to perform.
- Fixed keyboard layouts
- Added new parameter to prohibit browsing the whole filesystem in the gtk-filechooser.
	|  Parameter  |  Registry   |  Type       |  Value      |
	| ------ | ------ | ------ | ------ |
	|  `Prohibit browsing the whole filesystem`  |  `userinterface.gtk.filechooser.prohibit_filesystem_browsing`  |  bool  |  *enabled* (default) / disabled  |
- Fixed instability which occurred if endpoint was not rebooted for > 10 days. Endpoint was not possible to shutdown or reboot, app updates were not performed -  hard reboot was necessary to perform.
- Fixed display of drop down boxes in login screen.
- Fixed: Energy Star logo (shown in the power management options for supported HP devices) is shown after resume from suspend.
- Fixed permission problem with USB storage device removal.
- Fixed sporadic AD passthrough authentication failure, e.g. with RD Web Access login.
- Fixed Grub error message during boot about "/boot/grub/fonts/" not found.
- Fixed displaying of custom boot splash on AMD platforms.
- Removed the help menu from Network Tools, as there are no help databases anyway
- **OSC Installer**
	- Fixed settings injection via IGEL OS Creator.
- **App Management**
	- Fixed credential handling for downloading packages via Distributed App Repository.
- **Network**
	- Fixed iptables usage by adding back symlinks.
	- SCEP: Added a registry key for the case where the SCEP environment does not support certificate renewal in the SCEP sense, i.e. where starting over with the challenge password in the CSR is required.
		|  Parameter  |  Registry   |  Range      |  Value      |
		| ------ | ------ | ------ | ------ |
		|  `Renewal method`  |  `network.scepclient.cert%.renewal_method`  |  [Renewal][Start-over][Fallback to start-over]  |  *Renewal*  |
	- Fixed issue with e1000e network card not working with powersave settings.
	- Added new registry key to add drivers to blacklist for powersave settings
		|  Parameter  |  Registry   |  Type       |  Value      |
		| ------ | ------ | ------ | ------ |
		|  `List of drivers seperated by space which have issues with powersave settings.`  |  `system.powersave.powertop_drivers_blacklist`  |  string  |  empty *Default*  |
	- Fixed not using 2.5 Gbit/s or 5 Gbit/s network speed although possible.
	- Fixed wrong error messages "Proxy authentication failed." in case proxy does not require authentication.
	- Added parameters to control network proxy error messages. The total amount of messages and the message timeout can be configured:
		| Parameter | Registry | Value |
		| ------ | ------ | ------ |
		| `Timeout for proxy error messages` | `network.proxy.settings.sys_proxy_message_timeout` | `10 (default)` |
		| `Amount of proxy error messages to show` | `network.proxy.settings.sys_proxy_message_count` | `1 (default)` |
	- Fixed automatic network proxy with PAC file: if the PAC script indicates DIRECT for a requested URI, the connection is established directly and not via proxy as before. Furthermore, if no PAC file is specified or can be loaded, all connections are being established directly.
	- Fixed instabilities when using automatic network proxy.
	- Fixed ignoring network proxy URL if no port number is specified.
- **WiFi**
	- Added registry key to allow Network Manager to try a WPA2 configuration when SAE is desired but driver or hardware lack capablities:
		|  Parameter  |  Registry   |  Type       |  Value      |
		| ------ | ------ | ------ | ------ |
		|  `SAE dependent on hardware/driver`  |  `network.interfaces.wirelesslan.device0.wpa.sae_capability_dependent`  |  bool  |  enabled / *disabled* (default)  |
		 - This  can be useful in situations where the access point offers WPA3 Personal and WPA2 Personal at the same time.
	- Fixed not possible Wi-Fi connection after entering an incorrect password once.
- **Smartcard**
	- Fixed smartcard resource manager (pcsc-lite) to enable seamless smartcard usage in IGEL AVD, IGEL Remote Desktop, and IGEL Windows 365 sessions.
- **HID**
	- Fixed auto-suspend of USB HID (non us-locale systems)
	- Fixed: The mouse pointer no longer jumps to the center of the primary screen when switching the primary mouse button through the Input Tray app.
	- Fixed hotkey functionality for enabling/disabling the touchpad.
- **Driver**
	- Fixed potential read/write errors for devices utilizing the O2 Micro, Inc. FORESEE E2M2 NVMe SSD bridge. Affected systems include the HP t660 and HP t655.
- **OS Update**
	- Fixed a possible failure while creating of custom CI, logging or debugging partitions.
- **Storage Devices**
	- Fixed start of Disk Utility Accessory after suspend and resume of a device.
	- Fixed external USB drives with partitions using NTFS filesystem (Storage Hotplug).
- **Audio**
	- Added registry keys to prevent automatic switch of bluetooth profile:
		 - For pulseaudio:
			|  Parameter  |  Registry  |  Type  |  Value  |
			| ------ | ------ | ------ | ------ |
			|  `Set pulseaudio auto switching headset to A2DP`  |  `multimedia.pulseaudio.daemon.module-bluetooth-autoswitch-to-a2dp`  |  bool  |  *enabled* (default) / disabled  |
		 - For pipewire:
			|  Parameter  |  Registry   |  Type       |  Value      |
			| ------ | ------ | ------ | ------ |
			|  `Autoselection to headset profile`  |  `multimedia.pipewire.wireplumber.autoswitch-to-headset-profile`  |  bool  |  *enabled* (default) / disabled  |
	- Fixed internal microphone on Lenovo ThinkPad L14 and L15 Gen4 (AMD).
	- Added registry key to enable / disable analog only profile in pipewire:
		|  Parameter  |  Registry   |  Type       |  Value      |
		| ------ | ------ | ------ | ------ |
		|  `Enable analog only profile`  |  `multimedia.pipewire.wireplumber.enable-analog-only-profile`  |  bool  |  *enabled* (default) / disabled  |
	- Added registry parameter for switching rear side line-out to a line-in in HP t660 (requires a reboot to become active):
		|  Parameter  |  Registry   |  Type       |  Value      |
		| ------ | ------ | ------ | ------ |
		|  `Switch back jack to line-in`  |  `system.sound_driver.snd_hda_intel.hp_t660_back_microphone`  |  bool  |  enabled / *disabled* (default)  |
	- |  Parameter  |  Registry   |  Type       |  Value      |
		| ------ | ------ | ------ | ------ |
		|  `Ignore dB`  |  `multimedia.pulseaudio.daemon.ignore-db`  |  bool  |  enabled / *disabled* (default)  |
	- Any decibel information given by the ALSA drivers will be ignored (useful if that information is wrong).
	- Fixed internal microphone not working on Lenovo E16 Gen 2 AMD
	- Improved default output device selection
- **Hardware**
	- Fixed Wake on LAN for Dell OptiPlex 3000.
	- Changed network driver on Lenovo Thinkpad L16 AMD Gen1 to r8168 by default.
	- The legacy device IGEL UD7 Model H850C is now shown correctly as "UC1-LX" (not fully supported / unsupported device) instead of "UD7-LX10" in the "About" info page of OS12.
	- Changed network driver on Lenovo ThinkCentre M75q Gen5 to r8168 by default.
	- The "About" page and the OSC installer show the correct device type and product id for the LG 24CN65x series.
	- The "About" page and the OSC installer show the correct device type and product id for the LG 34CN65x series.
- **Remote Management**
	- Fixed installation process of custom CI defined by UMS FWC objects.
	- Fixed rmagent not waiting for correct unit_id
	- Fixed fingerprint check during onboarding if root certificate of a public CA is imported into the UMS.
	- Fixed connecting process on devices having two or more active NICs.
	- Fixed file installation - now it is ensured that all assigned files are installed before applying settings and installing apps. This also fixes the deployment of app signing certificate and app that depends on the certificate at the same time.
- **IGEL Desktop**
	- Fixed application full screen behavior when another monitor is primary than the first.
	- Changed: Login mask for local login is shown on primary screen (instead of the first screen).
	- Fixed: Desktop starts correctly when IGEL disclaimer is configured.
	- Changed timeout for spinning mouse cursor upon wake up from suspend from 60 to 15 seconds.
	- Fixed AD / Kerberos login name handling. By default the name is not expanded with the domain any more (e.g. user -> user@EXAMPLE.COM). To restore the old behavior, set the following parameter:
		| Parameter | Registry | Value |
		| ------ | ------ | ------ |
		| `Expand user name` | `auth.login.expand_username` | enabled / **disabled** (default) |
	- Fixed additional desktop restart when device encryption with PIN is used.
	- Fixed shadowing dialog disappearing after 2 seconds if language was other than English.
	- Fixed visibility of Kerberos login extension input fields.
	- Fixed issue with screens stays black after hotplug of USB-C dockingstations.
- **Licensing**
	- Fixed issue with license is not detected on some devices.
	- Fixed licensing issue where endpoints appeared unlicensed after suspend.
- **SSO**
	- Fixed Cloud ID Provider login to support more generic OpenID Connect providers, especially Cyberark.
- **Virtualization**
	- Fixed IGEL OS running as a virtual machine on a SINA Workstation S:
		- Added detection method to identify SINA WS host from IGEL OS.
		- Removed the VBoxClient clipboard and drag&drop services.
		- Added VBoxClient vmsvga support.

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
	- If automatic network proxy with PAC file is used, the PAC file will be downloaded multiple times.
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
	- Playback of H.264 videos with GPU decoding over a long duration may result in increased memory consumption. As a workaround the gstreamer-vaapi plugin can be enabled with this parameter:
		|  Parameter  |  Registry   |  Type       |  Value      |
		| ------ | ------ | ------ | ------ |
		|  `Switch from Fluendo to VAAPI h264 hardware accelerated decoder.`  |  `multimedia.gstreamer.use_vaapi_for_h264`  |  bool  |  enabled / *disabled* (default)  |
- **Hardware**
	- Wake on LAN is not functional on Lenovo K14 Gen1
	- Built-in fingerprint sensor is not supported on HP mt440 G3 and mt645 G7/G8.
	- If using 6 x 4K@60Hz monitors on HP t755/t740 with the additional graphic card, one or two of the monitors may stay black after coming back from DPMS off state.
	  This is caused by using the additional graphic card as primary, which only has 512MB VRAM (the VRAM is not sufficient in this configuration). Possible solution: Increasing the VRAM size of the iGPU to 2048MiB in BIOS (maybe 1024MiB may also work) and activate IGEL registry key `x.drivers.swap_card0_with_card1` so the iGPU will become the Primary GPU. Connector names will be changed with that!
	- Wake up from suspend via UMS does not work on HP mt645 G7 devices. Workaround: Disable system suspend and use shutdown instead.
	- Rotation of displays connected to the Lenovo ThinkPad USB-C Hybrid Dock may fail.
	- Display configuration of displays connected to HP G5 Docking Station may fail on HP t655. Furthermore displays connected to HP G5 Docking Station may not work anymore after system suspend and resume independent from the used hardware.
	- The "Star" special key on recent Lenovo laptop models has not yet been implemented. It's supposed to show the URL bar on a running web browser or launch the default browser if none is running.
	- On Lenovo ThinkPad L13 Intel Gen5, the functions keys Ctrl+Fn+F9, Ctrl+Fn+F10 and Ctrl+Fn+F11 are not mapped.
- **IGEL Desktop**
	- On-screen keyboard sporadically crashes when typing.
	- If two monitors are configured in a vertical layout (one above the other), and those monitors are configured with "auto-detect" resolution, saving leads to a wrong layout order.
	- Disabled compositing (transparency effects) in window manager to circumvent issues with screen lock. Registry key `windowmanager.wm0.variables.usecompositing` is not configurable anymore.
- **Licensing**
	- Manual deployment of add-on licenses for IGEL Agent for Imprivata licenses (via UMS) is only possible after finished installation of IGEL Agent for Imprivata app on device.
- **Mobile Broadband**
	- F11 flight mode function key does not switch off mobile broadband on HP Elite mt645 G7. (Deactivate mobile broadband in Network / Mobile Broadband settings)
- **Virtualization**
	- Changing the display configuration (monitor order and layout) should be done from the SINA OS menu bar. Change on IGEL OS results in faulty resolution settings and a mouse offset.
	- After a fresh OSC installation or factory reset, the IGEL "Welcome" screen has a mouse offset when using a dual monitor setup. Workaround: Select any available display configuration from the SINA OS menu bar to trigger an event which sets the correct resolution and therefore solves the issue.
	- If a second display was configured as the primary SINA OS display and is subsequently unplugged, IGEL OS might use the wrong resolution for the primary display. Using the SINA OS key combination Ctrl+Alt+o to show the taskbar is going to trigger a resize event, which automatically sets the correct resolution again. This affects SINA Workstation only.
	- SINA OS supports only 2 displays. If a docking station with 2 external displays is used, make sure to close the Laptop lid prior to starting IGEL OS. Do not open the Laptop lid when 2 external displays are connected.
