IGEL OS Creator  
===============

Firmware version 12.8.0  
Release date 2026-04-08  
Last update of this document 2026-04-08  


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
| Kernel                                    | 6.18.6 #mainline-lxos12-g1773308600    |
| Xorg X11 Server                           | 21.1.21-1igel1764136932          |
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

# Changes since: 12.7.0

## New Features
- Added SMB printer backend support for CUPS.
- Added: In the Config Dialog / IGEL Setup, slider parameters now show display names instead of numeric values for special cases.
- Added support for Swedish and Portuguese user interface.
- Updated German, French, Spanish, Italian and Dutch translations.
- Added support for French, Spanish, Portuguese, Italian, Dutch and Swedish translations in Setup Assistant.
- Added: Enabled BTF (BPF Type Format) in the kernel to provide additional type information for security software.
- Added: Implementation of EU Directive ErP Lot 6((EU) 2023/826), including default power-management settings and a warning about increased energy consumption.
	|  IGEL Setup  |  Parameter  |  Registry   |  Range      |  Value      |
	| ------ | ------ | ------ | ------ | ------ |
	|  System > Power Options > System            |  `System suspend on inactivity (battery mode)`  |  `system.power_management.system_standby.dc`  |  [After 1 min][After 2 mins][After 3 mins][After 5 mins][After 10 mins][After 15 mins][After 20 mins][After 25 mins][After 30 mins][After 45 mins][After 1 hour][After 2 hours][After 3 hours][After 4 hours][After 5 hours][After 6 hours][After 7 hours][After 8 hours][After 9 hours][After 10 hours][After 11 hours][After 12 hours][After 13 hours][After 14 hours][After 15 hours][After 16 hours][After 17 hours][After 18 hours][After 19 hours][After 20 hours][After 21 hours][After 22 hours][After 23 hours][After 24 hours][Never][Default]  |  *Default*  |
	|  System > Power Options > System            |  `System suspend/shutdown on inactivity`  |  `system.power_management.system_standby.ac`  |  [After 1 min][After 2 mins][After 3 mins][After 5 mins][After 10 mins][After 15 mins][After 20 mins][After 25 mins][After 30 mins][After 45 mins][After 1 hour][After 2 hours][After 3 hours][After 4 hours][After 5 hours][After 6 hours][After 7 hours][After 8 hours][After 9 hours][After 10 hours][After 11 hours][After 12 hours][After 13 hours][After 14 hours][After 15 hours][After 16 hours][After 17 hours][After 18 hours][After 19 hours][After 20 hours][After 21 hours][After 22 hours][After 23 hours][After 24 hours][Never][Default]  |  *Default*  |
	 - For new installations and factory preloads, “Default” sets suspend/shutdown to 20 minutes of inactivity.
	 - Added a warning about increased energy consumption if system.power_management.system_standby.ac is not between 1 minute and 20 minutes.
- Updated Kernel to LTS version 6.18.6.
- Fixed HP BIOS Tools app compatibility with kernel lockdown. This fix applies to the following HP Thin Client models:
  - HP t540 Thin Client
  - HP t640 Thin Client
  - HP Pro t550 Thin Client
  - HP Elite t655 Thin Client
  - HP t740 Thin Client
  - HP Elite t755 Thin Client
- Disabled all SysRq key combos by default.
- Added new Registry keys for enabling each SysRq key combo.
	|  Parameter  |  Registry   |  Type       |  Value      |
	| ------ | ------ | ------ | ------ |
	|  `Allow nicing of all RT tasks.`  |  `system.sysctl.sysrq.rt_task_nicing`  |  bool  |  enabled / *disabled* (default)  |
	|  `Enable all.`  |  `system.sysctl.sysrq.enable_all`  |  bool  |  enabled / *disabled* (default)  |
	|  `Enable control of console logging level.`  |  `system.sysctl.sysrq.log_level`  |  bool  |  enabled / *disabled* (default)  |
	|  `Enable control of keyboard.`  |  `system.sysctl.sysrq.keyboard_control`  |  bool  |  enabled / *disabled* (default)  |
	|  `Enable debugging dumps of processes etc.`  |  `system.sysctl.sysrq.debug_dump`  |  bool  |  enabled / *disabled* (default)  |
	|  `Enable sync command.`  |  `system.sysctl.sysrq.sync`  |  bool  |  enabled / *disabled* (default)  |
	|  `Enable remount read-only.`  |  `system.sysctl.sysrq.remount_ro`  |  bool  |  enabled / *disabled* (default)  |
	|  `Enable signalling of processes.`  |  `system.sysctl.sysrq.process_signaling`  |  bool  |  enabled / *disabled* (default)  |
	|  `Allow reboot/poweroff.`  |  `system.sysctl.sysrq.reboot_poweroff`  |  bool  |  enabled / *disabled* (default)  |
- Added: In Setup Assistant, users can now enter an optional structure tag before onboarding with their email address.
- Added support for Hebrew keyboard layout. This is configurable on User Interface > Language setup page.
- Added base system support for the Evidian EAM Client App.
- Added TPM-based device encryption support for HP t740 and t755. (requires 12.7.6 and above; downgrades below 12.7.6 are not supported)
- **App Management**
	- Added: Automatic discovery for Distributed Peer Updates -  IGEL OS devices in the same subnet now automatically collaborate to reduce downloads from the UMS or the App Portal.
		- When a device needs to install a specific app/version, it first attempts to retrieve it from a peer device.
		- If the app/version is not yet available from one of the peers, it will be downloaded by one of the devices while the other devices wait for the operation to complete. The other devices will then coordinate and install via distributed peer update.
		- If only a single device requests an app/version, behavior remains unchanged: the device downloads directly from UMS or the App Portal.
	- To enable distributed peer updates:
		- Turn on System > Update > Distributed Peer Update Server
		- Turn on System > Update > IGEL Discovery
- **Network**
	- Added registry keys for verifying server certificate during 802.1x authentication. The following parameters are listed for wireless interfaces `network.interfaces.wirelesslan.device0.alt_ssid%.wpa.*`. While only wireless parameters are explicitly listed, the same functionality also applies to wired interfaces using `network.interfaces.ethernet.device%.ieee8021x.*`.
		- List of strings separated by ";" to be matched against altSubjectName of the certificate presented by the authentication server, for example DNS:server.example.com
			|  Parameter  |  Registry  |  Type  |  Value  |
			| ------ | ------ | ------ | ------ |
			|  `Subject alternative matches`  |  `network.interfaces.wirelesslan.device0.alt_ssid%.wpa.altsubject_matches`  |  string  |  empty *Default*  |
		- List of FQDNs separated by ";" to be matched against the certificate presented by the authentication server.
			|  Parameter  |  Registry  |  Type  |  Value  |
			| ------ | ------ | ------ | ------ |
			|  `Domain match`  |  `network.interfaces.wirelesslan.device0.alt_ssid%.wpa.domain_match`  |  string  |  empty *Default*  |
		- List of FQDN suffixes separated by ";" to be matched against dNSName elements of the certificate presented by the authentication server.
			|  Parameter  |  Registry  |  Type  |  Value  |
			| ------ | ------ | ------ | ------ |
			|  `Domain suffix match`  |  `network.interfaces.wirelesslan.device0.alt_ssid%.wpa.domain_suffix_match`  |  string  |  empty *Default*  |
		- Substring to be matched against the subject of the certificate presented by the authentication server.
			|  Parameter  |  Registry  |  Type  |  Value  |
			| ------ | ------ | ------ | ------ |
			|  `Subject match`  |  `network.interfaces.wirelesslan.device0.alt_ssid%.wpa.subject_match`  |  string  |  empty *Default*  |
		- List of strings separated by ";" to be matched against altSubjectName of the certificate presented by the authentication server.
			|  Parameter  |  Registry  |  Type  |  Value  |
			| ------ | ------ | ------ | ------ |
			|  `Phase 2 alternative subject matches`  |  `network.interfaces.wirelesslan.device0.alt_ssid%.wpa.phase2_altsubject_matches`  |  string  |  empty *Default*  |
		- List of FQDNs separated by ";" to be matched against the certificate presented by the authentication server during the inner "phase 2" authentication.
			|  Parameter  |  Registry  |  Type  |  Value  |
			| ------ | ------ | ------ | ------ |
			|  `Phase 2 Domain match`  |  `network.interfaces.wirelesslan.device0.alt_ssid%.wpa.phase2_domain_match`  |  string  |  empty *Default*  |
		- List of FQDN suffixes separated by ";" to be matched against dNSName elements of the certificate presented by the authentication server during the inner "phase 2" authentication.
			|  Parameter  |  Registry  |  Type  |  Value  |
			| ------ | ------ | ------ | ------ |
			|  `Phase 2 Domain suffix match`  |  `network.interfaces.wirelesslan.device0.alt_ssid%.wpa.phase2_domain_suffix_match`  |  string  |  empty *Default*  |
		- Substring to be matched against the subject of the certificate presented by the authentication server during the inner "phase 2" authentication.
			|  Parameter  |  Registry  |  Type  |  Value  |
			| ------ | ------ | ------ | ------ |
			|  `Phase 2 Subject match`  |  `network.interfaces.wirelesslan.device0.alt_ssid%.wpa.phase2_subject_match`  |  string  |  empty *Default*  |
	- SCEP: Added support for Kerberos authentication in SCEP NDES challenge password retrieval - by adjusting the following registry key. By default, NTLM is used. To enable Kerberos authentication, the following conditions must be met: Security->Active Directory/Kerberos must be enabled and potentially one of the Domain slots must be configured.
		|  Parameter  |  Registry   |  Range      |  Value      |
		| ------ | ------ | ------ | ------ |
		|  `Authentication`  |  `network.scepclient.cert%.ndes.challenge_password_retrieval.auth`  |  [NTLM][Kerberos]  |  *NTLM*  |
	- SCEP:
		- Added UPN (Microsoft User Principal Name) to the range of values accepted by network.scepclient.cert%.subjectaltname_type. Previously, only 'DNS name as UPN (auto)' was available.
		- Added support for up to 4 additional subject alt names in the CSR. This is accomplished via the following added registry keys where N refers to a slot number in the range {1, 2, 3 ,4}. The slot is ignored if  network.scepclient.cert%.subjectaltnametype_otherN is none. Otherwise, the meaning is the same as for the traditional keys without _otherN in the name.
			|  Parameter  |  Registry   |  Range      |  Value      |  Type       |
			| ------ | ------ | ------ | ------ | ------ |
			|  CommonName/SubjectAltName Suffix (+N)  |  network.scepclient.cert%.subjectaltname_otherN_suffix  |  [none][dot + DNS domain (auto)]  |  **  |  string  |
			|  Type of CommonName/SubjectAltName (+N)  |  network.scepclient.cert%.subjectaltname_otherN_type  |  [None][IP address][DNS name][IP address (auto)][DNS name (auto)][Email address][DNS name as UPN (auto)][UPN]  |  None  |  |
			|  CommonName/SubjectAltName (+N)  |  network.scepclient.cert%.subjectaltname_otherN  |  |  empty Default  |  string  |
	- Added support for permanently storing 802.1X authentication usernames and passwords in the IGEL keyring when credentials are left empty in Setup.
		|  Parameter  |  Registry   |  Range      |  Value      |
		| ------ | ------ | ------ | ------ |
		|  `Allow Saving Credentials`  |  `network.interfaces.ethernet.device%.ieee8021x.allow_saving_credentials`  |  [never][permanent]  |  *never*  |
		|  `Allow Saving Credentials`  |  `network.interfaces.wirelesslan.device0.alt_ssid%.wpa.allow_saving_credentials`  |  [never][permanent]  |  *never*  |
	- Added a configuration option for disabling the igel-dconf-monitor.
		|  Parameter  |  Registry   |  Type       |  Value      |
		| ------ | ------ | ------ | ------ |
		|  `Disable dconf monitor (admin and debug use only)`  |  `network.proxy.settings.sys_proxy_dconf_disable`  |  bool  |  enabled / *disabled* (default)  |
- **WiFi**
	- Changed: WPA2 Enterprise and WPA3 Enterprise are now grouped under a single configuration option: WPA2/WPA3 Enterprise
	- Added support for WPA3 Enterprise B192 to allow connections to WPA3 Enterprise with 192-bit mode (00-0F-AC:12 cipher suite, GCMP-256 pairwise cipher and required PMF)
		|  IGEL Setup  |  Parameter  |  Registry   |  Range      |  Value      |
		| ------ | ------ | ------ | ------ | ------ |
		|  Network > Wireless > Wi-Fi networks  |  `Network authentication`  |  `network.interfaces.wirelesslan.device0.alt_ssid%.wpa.type`  |  [WPA Personal][WPA Enterprise][WPA2 Personal][WPA2/WPA3 Enterprise][WPA3 Personal][WPA3 Enterprise B192]  |  *WPA2 Personal*  |
- **HID**
	- Added new `Multitouch Gestures` setup page in IGEL Setup.
	    - This new page can be found in User Interface > Input > Touchscreen.
	- Added new parameters for handling different touchscreen gestures.
		|  IGEL Setup  |  Parameter  |  Registry   |  Type       |  Value      |
		| ------ | ------ | ------ | ------ | ------ |
		|  User Interface > Input > Touchscreen  |  `3 fingers swipe down to show desktop`  |  `userinterface.touchscreen.multitouchgestures.threefingershowdesktop`  |  bool  |  enabled / *disabled* (default)  |
		|  User Interface > Input > Touchscreen  |  `Enable multitouch gestures`  |  `userinterface.touchscreen.multitouchgestures.enabled`  |  bool  |  enabled / *disabled* (default)  |
		|  User Interface > Input > Touchscreen  |  `2 fingers right click`  |  `userinterface.touchscreen.multitouchgestures.twofingersrightclick`  |  bool  |  enabled / *disabled* (default)  |
		|  User Interface > Input > Touchscreen  |  `2 fingers scroll`  |  `userinterface.touchscreen.multitouchgestures.twofingerscroll`  |  bool  |  enabled / *disabled* (default)  |
	    - `2 fingers scroll` : Enables scrolling in all directions (left, right, up and down).
	    - `3 fingers swipe down to show desktop` : If the desktop is already being shown, restore all the windows.
	- Updated Elo Multi-Touch driver to version 4.5.0.11.
- **Driver**
	- Added asix_thirdparty driver to get some fibre USB ethernet adapter to work - this driver can be activated via the following registry key:
		|  Parameter  |  Registry   |  Range      |  Value      |
		| ------ | ------ | ------ | ------ |
		|  `Use thirdparty asix kernel module.`  |  `network.drivers.asix.prefer_thirdparty`  |  [Auto][Yes][No]  |  *Auto*  |
	- Added the ability to choose between alternative Wi-Fi drivers for Realtek 8852BU:
		|  Parameter  |  Registry   |  Range      |  Value      |
		| ------ | ------ | ------ | ------ |
		|  `Use 8852bu driver instead of rtw_8852bu for WLAN.`  |  `network.drivers.realtek.use_8852bu`  |  [Auto][Yes][No]  |  *Auto*  |
	- Added Linux bonding driver module
- **Multimedia**
	- Added FFMPEG-based multimedia codecs, replacing the previous ones with no change in functionality.
- **Hardware**
	- Added support for LG gram Book 15UT50T Mobile Thin Client.
	- Added support for HP Thunderbolt 4 Ultra 180/280W G6 Dock.
	- Added support for HP Thunderbolt 4 100W G6 Dock.
	- Added hardware support for Lenovo M625q.
	- Added hardware support for Dell Optiplex 3000 with CPU “Intel® Pentium® Silver Processor N6005”.
	- Added support for Lenovo 13w 2-in-1 Gen 3.
	  - Added support for F1-F11 function keys.
	    - F1: mute audio.
	    - F2/F3: increase/decrease audio.
	    - F4: mute microphone.
	    - F5/F6: decrease/increase brightness.
	    - F7: display configuration; open IGEL display configuration.
	    - F8: airplane mode.
	    - F9: open settings; open IGEL setup.
	    - F10: lock screen; screen is locked if local user password is set.
	    - F11: switch windows; cycle between open windows if 'Switch focus to next window' hotkey is enabled (by default). Otherwise, don't do anything.
	- Added support for Lenovo 500w 2-in-1 Gen 5.
	  - Added support for F1-F11 function keys.
	    - F1: mute audio.
	    - F2/F3: increase/decrease audio.
	    - F4: mute microphone.
	    - F5/F6: decrease/increase brightness.
	    - F7: display configuration; open IGEL display configuration.
	    - F8: airplane mode.
	    - F9: open settings; open IGEL setup.
	    - F10: lock screen; screen is locked if local user password is set.
	    - F11: switch windows; cycle between open windows if 'Switch focus to next window' hotkey is enabled (by default). Otherwise, don't do anything.
	- Added hardware support for Lenovo 13w Yoga Gen3.
	- Added hardware support for Lenovo ThinkStation P3 Ultra SFF Gen2.
	- Added hardware support for ThinClient HP ProDesk 5 G1i
	- Added hardware support for LG Gram 14Z(D)90RU
	- Added special function key support for LG Gram 14Z(D)90RU:
	    - Fn+F2: Brightness down
	    - Fn+F3: Brightness up
	    - Fn+F5: Touchpadd on/off
	    - Fn+F6: Airplane mode on/off
	    - Fn+F7: Display configuration
	    - Fn+F8: Keyboard backlight
	    - Fn+F9: Reader mode
	    - Fn+F10: Volume off
	    - Fn+F11: Volume down
	    - Fn+F12: Volume up
	- Added support for newer Intel GPUs with the XE driver.
	Added registry key for XE DRM Intel driver
		|  Parameter  |  Registry   |  Type       |  Value      |  Range      |
		| ------ | ------ | ------ | ------ | ------ |
		|  `Prefer XE DRM kernel driver over i915 one.`  |  `x.drivers.intel.prefer_xe`  |  bool  |  *Auto*  |  [Auto][True][False]  |
		|  `Disable the loading of the xe DRM driver.`  |  `x.drivers.intel.disable_xe`  |  bool  |  enabled / *disabled* (default)  |  |
	- Added hardware support for Lenovo V100q
	- Added hardware support for Lenovo L13 2-in-1 Gen 6 (Intel).
	- Added special function key support for Lenovo L13 2-in-1 Gen 6 (Intel):
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
	- Added hardware support for Lenovo ThinkPad L13 Gen 6 (Intel).
	- Added special function key support for Lenovo ThinkPad L13 Gen 6 (Intel):
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
	- Added hardware support for Lenovo L14 Gen 6 (AMD).
	- Added special function key support for Lenovo L14 Gen 6 (AMD):
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
	- Added support for  Lenovo ThinkPad L16 Gen 2 (Intel).
	- Added hardware support for Lenovo ThinkStation P3 Tiny Gen 2.
	- Added hardware support for Lenovo L13 Gen 6 (AMD).
	- Added special function key support for Lenovo L13 Gen 6 (AMD):
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
	- Added hardware support for Lenovo ThinkPad L14 Gen 6 (Intel).
	- Added special function key support for Lenovo ThinkPad L14 Gen 6 (Intel):
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
	- Added special function key support for Lenovo L16 Gen2 (Intel).
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
	- Added hardware support for Lenovo ThinkCentre Neo 50q Gen 5.
	- Added special function key support for Lenovo L16 Gen 2 (AMD).
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
	- Added hardware support for Lenovo ThinkPad T14 Gen 6 (AMD).
	  - Added special function key support for Lenovo T14 Gen6 (AMD).
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
	- Added support for special function keys on LG gram 14ZT90R, 15ZT90R, and 17ZT90R.
	    - Fn+F1: Setup
	    - Fn+F2: Brightness down
	    - Fn+F3: Brightness up
	    - Fn+F4: Screenlock
	    - Fn+F5: Toggle touchpad on/off
	    - Fn+F6: Airplane mode
	    - Fn+F7: Display configuration
	    - Fn+F8: Keyboard backlight
	    - Fn+F9: Reader mode
	    - Fn+F10: Volume mute
	    - Fn+F11: Volume down
	    - Fn+F12: Volume up
	- Added hardware support for Esterline Medigenic keyboard.
	- Added support for some special keys on Lenovo K14 Gen 1.
	    - F9: Setup
	    - PrtSc: Screenshot
	- Added version 0.10 of the adsecgen3 kernel module.
	- Added hardware support for LG 24CR660 and LG 24CR661.
	- Added support for LG FHD Business Monitor 24BA850-B
	- Added Quectel EM160R-GL WWAN and Quectel RM520N-GL WWAN support for Lenovo T14 Gen 6 (AMD).
	- Added hardware support for Lenovo V105q.
- **Remote Management**
	- Added backup and restore VM command support for the IGEL Managed Hypervisor (IMH) app.
	- Added support for the `UMS-as-CA-Proxy` feature enabling TLS certificate enrollment via UMS from an external CA instance. Certificates are configured in the IGEL Setup at `Security > Certificates`.
		|  IGEL Setup  |  Parameter  |  Registry  |  Type  |  Value  |
		| ------ | ------ | ------ | ------ | ------ |
		|  Security > Certificates > Certificate     |  `Show notifications to the user`  |  `system.security.certs.show_user_notifications`  |  bool  |  true  |
		|  Security > Certificates > Certificate     |  `Friendly Name`        |  `system.security.certs.cert%.friendly_name`              |  string                            |  `Device certificate`  |
		|  Security > Certificates > Certificate     |  `Autocomplete Common Name`  |  `system.security.certs.cert%.subject.auto_cn`  |  string  |  [hostname (default)][unitid][off]  |
		|  Security > Certificates > Certificate     |  `Common Name`  |  `system.security.certs.cert%.subject.cn`  |  string  |   |
		|  Security > Certificates > Certificate     |  `Organizational Unit`  |  `system.security.certs.cert%.subject.ou`  |  string  |   |
		|  Security > Certificates > Certificate     |  `Organization`  |  `system.security.certs.cert%.subject.org`  |  string  |   |
		|  Security > Certificates > Certificate     |  `Locality`  |  `system.security.certs.cert%.subject.locality`  |  string  |   |
		|  Security > Certificates > Certificate     |  `State`  |  `system.security.certs.cert%.subject.state`  |  string  |   |
		|  Security > Certificates > Certificate     |  `Country`  |  `system.security.certs.cert%.subject.country`  |  string  |   |
		|  Security > Certificates > Certificate     |  `Email Address`  |  `system.security.certs.cert%.subject.email`  |  string  |   |
		|  Security > Certificates > Certificate     |  `Autocomplete Hostname`  |  `system.security.certs.cert%.subjaltname.auto_hostname`  |  bool  |  true  |
		|  Security > Certificates > Certificate     |  `Hostname`  |  `system.security.certs.cert%.subjaltname.hostname`  |  string  |   |
		|  Security > Certificates > Certificate     |  `Autocomplete IP Address`  |  `system.security.certs.cert%.subjaltname.auto_ip`  |  bool  |  false  |
		|  Security > Certificates > Certificate     |  `IP Address`  |  `system.security.certs.cert%.subjaltname.ip`  |  string  |   |
		|  Security > Certificates > Certificate     |  `Email`  |  `system.security.certs.cert%.subjaltname.email`  |  string  |   |
		|  Security > Certificates > Certificate     |  `URI`  |  `system.security.certs.cert%.subjaltname.uri`  |  string  |   |
		|  Security > Certificates > Certificate     |  `Key Type`  |  `system.security.certs.cert%.key.type`  |  string  |  [rsa_2048][rsa_3072][rsa_4096 (default)][rsa_8192][ecdsa_ed25519][ec_brainpoolP256r1][ec_brainpoolP384r1][ec_brainpoolP512r1][ec_prime256v1][ec_secp256k1][ec_secp384r1][ec_secp521r1]  |
		|  Security > Certificates > Certificate     |  `Key Password`  |  `system.security.certs.cert%.key.crypt_password`  |  string  |   |
		|  Security > Certificates > Certificate     |  `Enrollment Protocol`  |  `system.security.certs.cert%.enrollment.proto`  |  string  |  [igelums]  |
		|  Security > Certificates > Certificate     |  `Automatic Renewal`  |  `system.security.certs.cert%.enrollment.auto_renewal`  |  bool  |  true  |
		|  Security > Certificates > Certificate     |  `Units of renewal period`  |  `system.security.certs.cert%.enrollment.renewal_period_units`  |  string  |  [percent (default)][days]  |
		|  Security > Certificates > Certificate     |  `Renewal Period in Percent`  |  `system.security.certs.cert%.enrollment.renewal_period`  |  integer  |  20  |
		|  Security > Certificates > Certificate     |  `Renewal Period in Days`  |  `system.security.certs.cert%.enrollment.renewal_period_days`  |  integer  |  30  |
	- Added new DHCP options for igelrmserver-port, igelrmserver-auth and igelrmserver-ca-hash.
	- Added a parameter for dumping of settings data into the debugging protocol dump.
		|  Parameter       |  Registry        |  Value           |
		| ------ | ------ | ------ |
		|  `include vlist in protocol dump`  |  `debug.remotemanager.dump_vlist`                  |  enabled / **disabled** (default)    |
	- Added a cache for assigned configuration objects (such as files, settings, and applications) pushed from the UMS to the device. Cached objects are installed at the end of the boot process; if the device is already running, they are installed immediately. Objects are retained in the cache until they are successfully applied or installed on the device. This enables automatic retries of the apply or installation process when the device’s network connectivity changes.
	- Added a downgrade lock of the base_system to a version older than 12.7.2 if the device lacks a valid Workspace Edition license.
	- Added automatic retry of app installation for UMS-assigned apps when network connectivity changes.
	- Changed: Certificates in DER format are now also removed when they are no longer assigned via UMS.
	- Fixed: Excluding of parameters while applying remote settings.
	- Added: The DNS entry `igelrmserver` is now used only during registration or as a fallback if no UMS addresses are configured or if explicitly enabled via `system.remotemanager.igelrmserver.as_fallback`.
	- Added additional remote management status information to the device information bundle for support.
- **Accessibility**
	- Added a setup parameter to adjust the mouse pointer size:
		|  IGEL Setup  |  Parameter  |  Registry   |  Type       |  Value      |
		| ------ | ------ | ------ | ------ | ------ |
		|  User Interface > Accessibility > Mouse  |  `Mouse pointer size`  |  `windowmanager.a11y.mouse.pointersize`  |  integer  |  24 *Default*  |
	- Added color filters for visually impaired users to adjust colors across the entire desktop.
		|  IGEL Setup  |  Parameter  |  Registry   |  Type       |  Value      |  Range      |
		| ------ | ------ | ------ | ------ | ------ | ------ |
		|  User Interface > Accessibility > Color Filter  |  `Color filter strength`  |  `windowmanager.a11y.filterstrength`  |  integer  |  100 *Default*  |  [Protanopia][Protanopia High Contrast][Deuteranopia][Deuteranopia High Contrast][Tritanopia][Monochrome][Monochrome inverted][Invert Colors]  |
		|  User Interface > Accessibility > Color Filter  |  `Use color filter`  |  `windowmanager.a11y.usecolorfilter`  |  bool  |  enabled / *disabled* (default)  |  |
		|  User Interface > Accessibility > Color Filter  |  `Color filter mode`  |  `windowmanager.a11y.filtermode`  |  |  *Protanopia*  |  [Protanopia][Protanopia High Contrast][Deuteranopia][Deuteranopia High Contrast][Tritanopia][Monochrome][Monochrome inverted][Invert Colors]  |
	- Added high-contrast themes to the theme configuration parameter:
		|  IGEL Setup  |  Parameter  |  Registry   |  Type       |  Value      |  Note       |
		| ------ | ------ | ------ | ------ | ------ | ------ |
		|  User Interface > Accessibility > Themes  |  `User Interface Theme`  |  `userinterface.ui_theme.gtk_theme`  |  string  |  *Color* (Default) / Dark / Light / Custom / HighContrast / HighContrastInverted  |  New values: "HighContrast" and "HighContrastInverted"  |
	  > The parameter "Base color of the UI theme" is changed automatically when the theme is changed in Setup. That parameter can be changed by the Setup user afterwards to any other color.
	  > The automatic changes are: "Light"/"Dark" -> "#999999", "Color"/"Custom" -> "#004F68", "HighContrast" -> "#000000", "HighContrastInverted" -> "#FFFFFF"
	- Added `Repeat Keys` accessibility option for the keyboard:
	  - Repeats input while the key is being held down.
		|  IGEL Setup  |  Parameter  |  Registry   |  Type       |  Value      |
		| ------ | ------ | ------ | ------ | ------ |
		|  User Interface > Accessibility > Keyboard Sensitivity  |  `Repeat keys`  |  `windowmanager.a11y.keyboard.repeatkeys`  |  bool  |  *enabled* (default) / disabled  |
	- Added `Sticky Keys` accessibility option for the keyboard:
	  - Modifier keys can be pressed in succession instead of having to be held down at the same time.
		|  IGEL Setup  |  Parameter  |  Registry   |  Type       |  Value      |
		| ------ | ------ | ------ | ------ | ------ |
		|  User Interface > Accessibility > Keyboard Sensitivity   |  `Sticky keys`  |  `windowmanager.a11y.keyboard.stickykeys`  |  bool  |  enabled / *disabled* (default)  |
	- Added `Slow Keys` accessibility option for the keyboard:
	  - Keys have to be held down for some time before input is registered.
	  - The delay can be set in milliseconds with Slow keys input delay.
		|  IGEL Setup  |  Parameter  |  Registry   |  Type       |  Value      |
		| ------ | ------ | ------ | ------ | ------ |
		|  User Interface > Accessibility > Keyboard Sensitivity   |  `Slow keys input delay`  |  `windowmanager.a11y.keyboard.slowkeysinputdelay`  |  integer  |  300 *Default*  |
		|  User Interface > Accessibility > Keyboard Sensitivity   |  `Slow keys`  |  `windowmanager.a11y.keyboard.slowkeys`  |  bool  |  enabled / *disabled* (default)  |
	- Added `Bounce Keys` accessibility option for the keyboard:
	  - Filters out duplicate presses of the same key.
		|  IGEL Setup  |  Parameter  |  Registry   |  Type       |  Value      |
		| ------ | ------ | ------ | ------ | ------ |
		|  User Interface > Accessibility > Keyboard Sensitivity   |  `Bounce keys`  |  `windowmanager.a11y.keyboard.bouncekeys`  |  bool  |  enabled / *disabled* (default)  |
	- Added “Use numpad keys to move the mouse cursor” accessibility option:
		|  IGEL Setup  |  Parameter  |  Registry   |  Type       |  Value      |
		| ------ | ------ | ------ | ------ | ------ |
		|  User Interface > Accessibility > Keyboard Mouse  |  `Use numpad to move mouse`  |  `windowmanager.a11y.keyboard.usekeyboardmouse`  |  bool  |  enabled / *disabled* (default)  |
	- Added an accessibility tray app for configuring accessibility settings. Parameter to enable or disable the tray icon:
		|  IGEL Setup  |  Parameter  |  Registry   |  Type       |  Value      |
		| ------ | ------ | ------ | ------ | ------ |
		|  User Interface > Screenlock / Screensaver > Taskbar  |  `Show accessibility tray icon on lockscreen`  |  `userinterface.system_tray.a11y.lockscreen`  |  bool  |  *enabled* (default) / disabled  |
		|  User Interface > Desktop > Taskbar Items  |  `Show accessibility tray icon on desktop`  |  `userinterface.system_tray.a11y.desktop`  |  bool  |  *enabled* (default) / disabled  |
	- Added the Screen Magnifier accessibility feature.
- **IGEL Desktop**
	- Replaced the xfwm4 window manager with Mutter.
	- Removed: The following parameters were removed as they became obsolete with the introduction of the new window manager:
	    - windowmanager.defaulttheme.canchangeaccels
	    - windowmanager.defaulttheme.desktop_menu
	    - windowmanager.defaulttheme.desktopiconstyle
	    - windowmanager.defaulttheme.keytheme
	    - windowmanager.defaulttheme.toolbarstyle
	    - windowmanager.defaulttheme.menus.control%
	    - windowmanager.defaulttheme.menus.icon%
	    - windowmanager.defaulttheme.menus.taskbar%
	    - windowmanager.menus.control.*
	    - windowmanager.menus.icon.*
	    - windowmanager.menus.taskbar.*
	    - windowmanager.tweaks.avoid_focus_loss
	    - windowmanager.tweaks.dont_focus_transient_ica_windows
	    - windowmanager.tweaks.dont_reparent_ica_seamless_windows
	    - windowmanager.tweaks.dont_set_legacy_fullscreen_property
	    - windowmanager.tweaks.expose_wfica_seamless_with_compositor
	    - windowmanager.tweaks.follow_original_position
	    - windowmanager.tweaks.mode
	    - windowmanager.tweaks.move_ica_auth
	    - windowmanager.tweaks.prevent_tooltips_in_taskbar
	    - windowmanager.tweaks.restore_maximized_from_fullscreen
	    - windowmanager.tweaks.set_focus_properties_before_xsetinputfocus
	    - windowmanager.tweaks.skip_fullscreen_wm_normal_hints
	    - windowmanager.tweaks.skip_nameless_ica_windows
	    - windowmanager.tweaks.suppress_wfica_window_in_seamless_session
	    - windowmanager.tweaks.unframe_reparented_windows
	    - windowmanager.tweaks.verbose
	    - windowmanager.tweaks.wfica_ignore_focus_hints
	    - windowmanager.tweaks.wfica_repaint_trigger
	    - windowmanager.vanilla
	    - windowmanager.wm%.variables.battery_indicator.display_power
	    - windowmanager.wm%.variables.focushint
	    - windowmanager.wm%.variables.igelicaallowminimize
	    - windowmanager.wm%.variables.ica_repaint_rate
	    - windowmanager.wm%.variables.opaquemove
	    - windowmanager.wm%.variables.opaqueresize
	    - windowmanager.wm%.variables.preventfocusstealing
	    - windowmanager.wm%.variables.snapborder
	    - windowmanager.wm%.variables.snapwidth
	    - windowmanager.wm%.variables.snapwindows
	    - windowmanager.wm%.variables.startmenu.menu_color
	    - windowmanager.wm%.variables.startmenu.menu_opacity
	    - windowmanager.wm%.variables.systray_icon_size
	    - windowmanager.wm%.variables.taskbaropacity.enter
	    - windowmanager.wm%.variables.taskbaropacity.leave
	    - windowmanager.wm%.variables.titlealign
	    - windowmanager.wm%.variables.tooltipsize
	    - windowmanager.wm0.enabled
	- The following parameters are currently deactivated because the related features are not yet functional. They will be re-enabled in a future version of IGEL OS:
	    - windowmanager.defaulttheme.desktopbrightness
	    - windowmanager.wm%.variables.battery_indicator.display_multi_battery
	    - windowmanager.wm%.variables.focusonmap
	    - windowmanager.wm%.variables.pagingsizex
	    - windowmanager.wm%.variables.pagingsizey
	    - windowmanager.wm%.variables.placement_ratio
	    - windowmanager.wm%.variables.usepager
	    - windowmanager.wm%.variables.wrapresistance
	    - windowmanager.wm%.variables.wrapwindows
	    - windowmanager.wm%.variables.wrapworkspaces
	- Re-added compositing support (enabled by default).
	- Added registry parameter to enable alphanumerical sorting of desktop icons.
		|  Parameter  |  Registry   |  Range      |  Value      |
		| ------ | ------ | ------ | ------ |
		|  `Sort Desktop icons`  |  `windowmanager.defaulttheme.icon_sort`  |  [Default][Alphanumeric]  |  *Default*  |
	- Removed the following parameter as it did not meet accessibility requirements. A new expander has been introduced to collapse or expand tray items.
		|  IGEL Setup  |  Parameter   |  Registry    |  Type        |  Value       |  Note        |
		| ------ | ------ | ------ | ------ | ------ | ------ |
		|  User Interface > Desktop > Taskbar        |  `Number of rows/columns in taskbar`        |  `windowmanager.wm0.variables.taskbarrows`              |  integer                            |  [*-1*][1][2][3][4][5][6]  |  Parameter no longer available.  |
	- Removed the `Reverse Gradient` parameter as it is no longer needed. Inversion can be achieved by swapping colors.
		|  Parameter    |  Registry     |  Type         |  Value        |  Note         |
		| ------ | ------ | ------ | ------ | ------ |
		|  `Reverse Gradient`                   |  `windowmanager.wm0.variables.taskbargradient.inverted`  |  bool                                         |  *false*/true                               |  Parameter no longer available.                   |
	- Removed the “Drag and Drop” option as it is currently not implemented:
		|  Parameter    |  Registry     |  Note         |
		| ------ | ------ | ------ |
		|  `Sorting order in window button bar`                   |  `windowmanager.wm0.variables.tasklist_sort_order`  |  Range adjusted - removed "Drag and Drop".                   |
	- Removed the following parameter as it did not meet accessibility requirements. When space is insufficient in the taskbar button bar, a pop-up menu displays the remaining items.
		|  Parameter   |  Registry    |  Type        |  Value       |  Note        |
		| ------ | ------ | ------ | ------ | ------ |
		|  `Maximum number of rows/columns in window button bar`  |  `windowmanager.wm0.variables.tasklist_max_rows`              |  integer                            |  [*-1*][1][2][3]  |  Parameter no longer available.  |
	- Removed the following parameter as it is no longer needed. System tray icons now scale automatically with the taskbar size.
		|  Parameter   |  Registry    |  Type        |  Value       |  Note        |
		| ------ | ------ | ------ | ------ | ------ |
		|  `Size of icons in system tray`        |  `windowmanager.wm0.variables.systray_icon_size`              |  editable                            |  [-1][*25*][40][60]  |  Parameter no longer available.  |
	- Added the ability to display applications in the Start menu in either grid or list view.
		|  IGEL Setup  |  Parameter    |  Registry     |  Type         |  Value        |
		| ------ | ------ | ------ | ------ | ------ |
		|  User Interface > Desktop > Start Menu       |  `Layout`                   |  `windowmanager.wm0.variables.startmenu.view_type`  |  integer                                         |  [*1*][2]                               |
	    > Allows changing the default view when opening the Start menu.
	- Added more information in Keyboard-Layout tray application:
	  - Activated global shortcuts
	  - Activated shortcut for specific keyboard layouts
	  - Enabled dead-keys
	- Added tray icon support for OpenConnect VPN App.
	- Added the ability to configure the taskbar clock format via the Time & Date tray application.
	  - Possible formats:  24-hour, 12-hour, or 12-hour without AM/PM suffix.
	- Added the ability to toggle the display of seconds in the taskbar clock via the Time & Date tray application.
	- Added support for display profiles. Different configurations of a monitor are stored / retrieved when used in different environments.
	- Removed the following parameter as setting keyboard shortcuts via CSS is obsolete and not supported by the new window manager.
		|  Parameter    |  Registry     |  Note         |
		| ------ | ------ | ------ |
		|  `Key Theme`                   |  `windowmanager.defaulttheme.keytheme`  |  Parameter no longer available.                   |
	- Removed the already deactivated parameter as it was unused and obsolete.
		|  Parameter    |  Registry     |  Note         |
		| ------ | ------ | ------ |
		|  `Hotkey Config`                   |                                      |  Parameter no longer available.                   |
	- Removed the following parameter as it is obsolete and no longer used by GTK applications.
		|  Parameter    |  Registry     |  Note         |
		| ------ | ------ | ------ |
		|  `Toolbar Style`                   |  `windowmanager.defaulttheme.toolbarstyle`  |  Parameter no longer available.                   |
	- Changed the parameter value and the behavior for the placement of new windows.
		|  Parameter  |  Registry   |  Type       |  Range      |
		| ------ | ------ | ------ | ------ |
		|  `Preferred placement`                                              |  `windowmanager.wm%.variables.placement_mode`  |  string                                                                           |  [center (default)][default]   |
	    > The range value “mouse” was changed to “default” to reflect the new behavior.
	    > By default, new windows open in the center of the screen.
	    > With the new “default” value, the underlying window manager’s placement logic is used. The previous behavior of opening windows at the mouse cursor is no longer supported.
	- Deactivated the parameter for placement ratio, as it is no longer supported.
		|  Parameter  |  Registry   |  Type       |  Range      |
		| ------ | ------ | ------ | ------ |
		|  `Maximum window size for which the preferred placement should apply.`                                              |  `windowmanager.wm%.variables.placement_ratio`  |  string                                                                           |  [0%][10%][20% (default)][30%][40%][50%][60%][70%][80%][90%][100%]   |
	- Removed snapping parameters and replaced them with new behavior: windows can now be snapped to other windows or screen edges by holding the Shift key while dragging.
		|  Parameter  |  Registry   |
		| ------ | ------ |
		|  `Window - Screen Edge Snap Area`                               |  `windowmanager.wm%.variables.snapwidth`  |
		|  `Snap windows to other windows`                                              |  `windowmanager.wm%.variables.snaptowindows`  |
		|  `Snap windows to screen border`                                              |  `windowmanager.wm%.variables.snaptoborder`  |
	- Added double-click actions on the title bar with the following options: shade, maximize-horizontally, maximize-vertically, lower, and menu.
		|  Parameter  |  Registry   |  Type       |  Range      |
		| ------ | ------ | ------ | ------ |
		|  `Double-click action`                                              |  `windowmanager.wm%.variables.dblclickaction`  |  string                                                                           |  [maximize (default)][hide][none][shade][maximize-horizontally][maximize-vertically][lower][menu]   |
	- Removed the parameter for title alignment, as this is no longer supported: window titles are now always centered.
		|  Parameter    |  Registry     |  Type         |  Note         |
		| ------ | ------ | ------ | ------ |
		|  `Title Alignment`                   |  `windowmanager.wm%.variables.titlealign`  |  string                                         |  Parameter no longer available.                   |
	- Removed parameters for opaque resizing and moving, as these are no longer supported.
		|  Parameter    |  Registry     |  Type         |  Note         |
		| ------ | ------ | ------ | ------ |
		|  `OpaqueMove`                   |  `windowmanager.wm%.variables.opaquemove`  |  boolean                                         |  Parameter no longer available.                   |
		|  `OpaqueResize`                   |  `windowmanager.wm%.variables.opaqueresize`  |  boolean                                         |  Parameter no longer available.                   |
	- Changed desktop-related environment variables to fixed values:
	    - XDG_CURRENT_DESKTOP:  "GNOME"
	    - XDG_SESSION_DESKTOP: "gnome"
	    - DESKTOP_SESSION: "gnome"
	- Added ability to lock down the file chooser to its initial startup folder. When the registry key userinterface.gtk.filechooser.lock_to_startup_folder is enabled, users can no longer browse the filesystem using the path bar or side panel buttons in the file chooser.
		|  Parameter       |  Registry        |  Value           |
		| ------ | ------ | ------ |
		|  `Access only to initial folder`  |  `userinterface.gtk.filechooser.lock_to_startup_folder`  |  enabled / **disabled** (default)   |
	- Fixed Wi-Fi tray app behavior to improve usability during network scans by preventing the network list from constantly changing order.
- **Mobile Broadband**
	- Added WWAN FCC unlocking support with the Quectel EM061K-GL WWAN module on the following devices: Lenovo ThinkPad T14 Gen 5 Intel/AMD, Lenovo ThinkPad L13 2-in-1 Gen 6, Lenovo ThinkPad L13 Gen 6, Lenovo ThinkPad L16 Gen 2 Intel/AMD and Lenovo ThinkPad L14 Gen 6 Intel/AMD.
	- Added WWAN FCC unlocking support for the Quectel EM160R-GL WWAN module on the following devices: Lenovo ThinkPad L14 Gen 6 Intel/AMD.
	- Added SAR configuration support for the Quectel EM061K-GL WWAN module on the following devices: Lenovo ThinkPad L13 Gen 6 Intel/AMD.
- **SSO**
	- Added: The SSO autologin attempts are now set by the auth.login.autologin.attempts parameter.
	- Added support for configurable SSO redirect URIs. While the default remains `http://localhost/callback`, using `http://127.0.0.1/callback` is now recommended. Ensure the configured value matches the redirect URI in your Identity Provider (IdP).
		|  IGEL Setup  |  Parameter  |  Registry   |  Type       |  Value      |
		| ------ | ------ | ------ | ------ | ------ |
		|  Security > Logon > Single Sign-On  |  `Redirect URI`  |  `auth.cloudidp.redirect_uri`  |  string  |  http://localhost/callback *Default*  |

## Security Fixes
- Fixed atop security issue CVE-2025-31160.
- Fixed webkit2gtk security issues CVE-2025-66287, CVE-2025-43541, CVE-2025-43536, CVE-2025-43535, CVE-2025-43531, CVE-2025-43529, CVE-2025-43501, CVE-2025-43480, CVE-2025-43458, CVE-2025-43443, CVE-2025-43440, CVE-2025-43434, CVE-2025-43432, CVE-2025-43431, CVE-2025-43430, CVE-2025-43429, CVE-2025-43427, CVE-2025-43425, CVE-2025-43421, CVE-2025-43419, CVE-2025-43392, CVE-2025-43343, CVE-2025-14174, CVE-2025-13947, CVE-2025-13502, CVE-2023-43000, CVE-2025-31257, CVE-2025-31215, CVE-2025-31206, CVE-2025-31205, CVE-2025-31204, CVE-2025-24223, CVE-2023-42970, CVE-2023-42875, CVE-2024-44192, CVE-2024-54467, CVE-2025-24201, CVE-2024-54551, CVE-2025-24208, CVE-2025-24209, CVE-2025-24213, CVE-2025-24216, CVE-2025-24264 and CVE-2025-30427.
- Fixed openssh security issue CVE-2025-32728.
- Fixed openvpn security issue CVE-2025-2704.
- Fixed ghostscript security issues CVE-2025-27836, CVE-2025-27835, CVE-2025-27834, CVE-2025-27833, CVE-2025-27832, CVE-2025-27831 and CVE-2025-27830.
- Fixed xz-utils security issue CVE-2025-31115.
- Fixed perl security issue CVE-2024-56406.
- Fixed qt6-base security issues CVE-2023-51714, CVE-2023-37369 and CVE-2023-34410.
- Fixed libxslt security issues CVE-2025-24855 and CVE-2024-55549.
- Fixed qt6-base security issue CVE-2025-3512.
- Fixed libsoup2.4 security issue CVE-2025-32911.
- Fixed libsoup3 security issue CVE-2025-32911.
- Updated nvidia-graphic-drivers to version 535.247.01.
- Fixed xorg-server security issues CVE-2025-49176, CVE-2025-49180, CVE-2025-49179, CVE-2025-49178, CVE-2025-49177, CVE-2025-49176, CVE-2025-49175 andCVE-2022-49737.
- Fixed glibc security issue CVE-2025-4802.
- Fixed shadow security issues CVE-2023-4641 and CVE-2023-29383.
- Fixed open-vm-tools security issues CVE-2025-41244 and CVE-2025-22247.
- Fixed network-manager security issue CVE-2024-6501.
- Fixed virtualbox security issues CVE-2025-30725, CVE-2025-30719, CVE-2025-30712, CVE-2025-21571, CVE-2025-21533, CVE-2024-21273, CVE-2024-21263, CVE-2024-21259, CVE-2024-21253 and CVE-2024-21248.
- Fixed gcc-12 security issue CVE-2023-4039.
- Fixed abseil security issue CVE-2025-0838.
- Fixed libcap2 security issue CVE-2025-1390.
- Fixed poppler security issues CVE-2025-32365, CVE-2025-32364, CVE-2024-56378 and CVE-2023-34872.
- Fixed python3.11 security issues CVE-2025-1795 and CVE-2025-0938.
- Fixed openssl security issue CVE-2024-13176.
- Fixed net-tools security issue CVE-2025-46836.
- Fixed systemd security issue CVE-2025-4598.
- Fixed libavif security issues CVE-2025-48175 and CVE-2025-48174.
- Fixed wpewebkit security issues CVE-2025-66287, CVE-2025-43541, CVE-2025-43536, CVE-2025-43535, CVE-2025-43531, CVE-2025-43529, CVE-2025-43501, CVE-2025-43480, CVE-2025-43458, CVE-2025-43443, CVE-2025-43440, CVE-2025-43434, CVE-2025-43432, CVE-2025-43431, CVE-2025-43430, CVE-2025-43429, CVE-2025-43427, CVE-2025-43425, CVE-2025-43421, CVE-2025-43419, CVE-2025-43392, CVE-2025-14174, CVE-2025-13947, CVE-2025-13502, CVE-2023-43000, CVE-2025-31257, CVE-2025-31215, CVE-2025-31206, CVE-2025-31205, CVE-2025-31204, CVE-2025-24223, CVE-2023-42970 and CVE-2023-42875.
- Fixed libblockdev security issue CVE-2025-6019.
- Fixed gdk-pixbuf security issues CVE-2025-7345 and CVE-2025-6199.
- Fixed gst-plugins-bad1.0 security issue CVE-2025-6663.
- Fixed qtbase-opensource-src security issue CVE-2025-5455.
- Fixed icu security issue CVE-2025-5222.
- Fixed jpeg-xl security issues CVE-2024-11498, CVE-2024-11403, CVE-2023-35790 and CVE-2023-0645.
- Fixed libxml2 security issues CVE-2025-9714, CVE-2025-7425, CVE-2025-32415, CVE-2025-32414, CVE-2025-27113, CVE-2025-24928, CVE-2024-56171, CVE-2024-34459, CVE-2024-25062, CVE-2023-45322, CVE-2023-39615 and CVE-2022-49043.
- Fixed pam security issue CVE-2025-6020.
- Fixed libarchive security issue CVE-2025-60753.
- Fixed qtdeclarative-opensource-src security issue CVE-2025-12385.
- Fixed openvpn security issues CVE-2025-13086 and CVE-2025-12106.
- Fixed cups-filters security issues CVE-2025-64524, CVE-2025-64503 and CVE-2025-57812.
- Fixed samba security issues CVE-2018-14628, CVE-2025-10230 and CVE-2025-9640.
- Fixed libpng1.6 security issues CVE-2025-66293, CVE-2025-65018, CVE-2025-64720, CVE-2025-64506 and CVE-2025-64505.
- Fixed net-snmp security issue CVE-2025-68615.
- Fixed libsodium security issue CVE-2025-69277.
- Fixed libssh security issues CVE-2025-8277, CVE-2025-8114, CVE-2025-5987, CVE-2025-5372, CVE-2025-5351, CVE-2025-5318, CVE-2025-4878 and CVE-2025-4877.
- Fixed gnupg2 security issue CVE-2025-68973.
- Fixed rsync security issue CVE-2025-10158.
- Fixed qemu security issue CVE-2025-11234.
- Fixed ISN 2025-24: Command Execution in IGEL OS.
- Fixed glibc security issue CVE-2025-4802.
- Fixed udisks2 security issue CVE-2025-8067.
- Fixed ffmpeg security issues CVE-2025-22919, CVE-2025-0518, CVE-2024-35368, CVE-2024-35367, CVE-2024-31582, CVE-2023-6605, CVE-2023-6604, CVE-2023-6602, CVE-2023-50008, CVE-2023-50007 and CVE-2023-49502.
- Fixed libxml2 security issues CVE-2025-7425, CVE-2025-6170, CVE-2025-6021, CVE-2025-49796 and CVE-2025-49794.
- Fixed libxslt security issues CVE-2025-7424 and CVE-2023-40403.
- Fixed wpa security issue CVE-2022-37660.
- Fixed glibc security issue CVE-2025-8058.
- Fixed libsoup3 security issues CVE-2025-8058, CVE-2024-52531, CVE-2024-52532, CVE-2025-32051, CVE-2025-32052, CVE-2025-32053, CVE-2025-32050, CVE-2025-2784, CVE-2025-2784, CVE-2024-52531, CVE-2024-52532, CVE-2024-52531, CVE-2024-52530, CVE-2025-32909, CVE-2025-32910, CVE-2025-32911, CVE-2025-32913, CVE-2025-46420, CVE-2025-32910, CVE-2025-32912, CVE-2025-32906 and CVE-2025-46421.
- Fixed setuptools security issue CVE-2025-47273.
- Fixed libarchive security issues CVE-2025-5917, CVE-2025-5916, CVE-2025-5915 and CVE-2025-5914.
- Fixed cjson security issues CVE-2025-57052, CVE-2023-53154 and CVE-2023-26819.
- Fixed curl security issue CVE-2023-27534.
- Fixed expat security issues CVE-2024-8176, CVE-2024-50602 and CVE-2023-52425.
- Fixed iperf3 security issues CVE-2025-54350 and CVE-2025-54349.
- Fixed jq security issue CVE-2025-48060.
- Fixed openjpeg2 security issue CVE-2025-50952.
- Fixed perl security issues CVE-2025-40909 and CVE-2023-31484.
- Fixed libsndfile security issues CVE-2024-50612 and CVE-2022-33065.
- Fixed sqlite3 security issue CVE-2025-6965.
- Fixed python-zipp security issue CVE-2024-5569.
- Fixed cups security issues CVE-2025-58364 and CVE-2025-58060.
- Fixed webkit2gtk security issues CVE-2025-6558, CVE-2025-43368, CVE-2025-43356, CVE-2025-43342, CVE-2025-43272, CVE-2025-43265, CVE-2025-43240, CVE-2025-43228, CVE-2025-43227, CVE-2025-43216, CVE-2025-43212, CVE-2025-43211, CVE-2025-31278, CVE-2025-31273, CVE-2025-31257, CVE-2025-31215, CVE-2025-31206, CVE-2025-31205, CVE-2025-31204, CVE-2025-24223, CVE-2025-24189, CVE-2023-42970 and CVE-2023-42875.
- Fixed openssl security issues CVE-2025-9232 and CVE-2025-9230.
- Fixed lock screen behavior that exposed the desktop during display/resolution changes and system events (shutdown, reboot, suspend, logoff) when initiated from the lock screen.
- Fixed boot code to prevent unauthenticated root access via boot parameters.
- Fixed libarchive security issues CVE-2025-5917, CVE-2025-5916, CVE-2025-5915, CVE-2025-5914, CVE-2025-1632, CVE-2024-26256 and CVE-2024-20696.
- Updated Kernel to LTS version 6.18.6.
- Fixed webkit2gtk security issue CVE-2025-43343.
- Fixed wpewebkit security issues CVE-2025-6558, CVE-2025-43265, CVE-2025-43240, CVE-2025-43228, CVE-2025-43227, CVE-2025-43216, CVE-2025-43212, CVE-2025-43211, CVE-2025-31278, CVE-2025-31273 and CVE-2025-24189.
- Fixed openssl security issues CVE-2026-22796, CVE-2026-22795, CVE-2025-69421, CVE-2025-69420, CVE-2025-69419, CVE-2025-69418, CVE-2025-68160 and CVE-2025-15467.
- Fixed libvpx security issues CVE-2026-2447 and CVE-2026-1861.
- Fixed inetutils security issue CVE-2026-24061.
- Fixed security issues in reset to defaults handling: removed terminal key/reset-to-defaults key handling that allowed resetting an endpoint to factory defaults without requiring the administrator password, and removed the outdated load_usbconfig hook.
- Fixed inetutils security issues CVE-2026-32746, CVE-2026-28372, CVE-2026-24061 and CVE-2023-40303.
- **Network**
	- Fixed ppp security issue CVE-2024-58250.
- **WiFi**
	- Fixed a critical issue in the regulatory domain configuration, preventing potential privilege escalation and incorrect log entries.

## Resolved Issues
- Fixed ghostscript font substitution of Microsoft web fonts like Arial.
- Fixed: When the system is configured as a Wake-on-LAN proxy, shutdown, reboot, or suspend operations are now properly inhibited. A warning notification is displayed to inform users that the system must remain running permanently.
- Fixed an issue where the cursor remains visible even with 'Hide Cursor' enabled.
- Old EFI entries referencing windows will be ignored in case the \EFI\Windows folder does no longer exist on the referenced partition.
- Fixed an intermittent issue that occasionally disabled remote logging.
- Fixed a race condition in the notification system that caused high CPU usage.
- Improved mouse acceleration configuration
	|  Parameter  |  Registry   |  Type       |  Value      |
	| ------ | ------ | ------ | ------ |
	|  `Enable mouse acceleration (only for new accel variant)`  |  `userinterface.mouse.enable_acceleration`  |  bool  |  *enabled* (default) / disabled  |
	|  `Use new mouse accel variant`  |  `userinterface.mouse.use_new_accel_variant`  |  bool  |  enabled / *disabled* (default)  |
- Fixed /wfs instabilities:
  - Fixed folder could be incorrectly replaced by a file.
  - Fixed /wfs/rfkill folder was not created properly.
- Fixed an issue where users were unnecessarily prompted to enter a device encryption password.
- Adapt logrotate.d to ownership of the files in /var/log/
- Fixed: The time stamps in the log files in /var/log/igel/ are now in UTC as specified.
- Fixed: Touchpad re-enabled itself despite being deactivated in the settings.
- Fixed an issue where the PATH environment variable for applications was not correctly set when an administrator password was configured.
- Fixed application launcher in restart mode. It no longer starts additional instances when configuration changes occur.
- Fixed an issue where the parameter system.power_management.system_standby.dc had no effect.
  - Added the corresponding setting to IGEL Setup under System > Power Options > Battery.
  - Added a warning about increased energy consumption if the value is set outside the range of 1 to 20 minutes.
- Fixed creation of /etc/machine-id, which is needed for systemd timers using FixedRandomDelay. This fix resolves an issue where custom cronJob/systemd timers triggered with identical delays accross multiple IGEL OS endpoints. Timers now behave as expected with randomized delays per device.
- Fixed focus behavior on the user field when AD login is configured. If the password is entered first while the user field is empty, pressing Enter now correctly shifts focus to the user field instead of starting the authentication process.
- Fixed out of range issue for NEC EA223WM monitors.
- Fixed Japanese text rendering to prefer the Noto CJK font family.
- Fixed hardware clock handling: in dual-boot IGEL/Windows setups, the RTC is automatically interpreted as local time and updated when the Chrony service stops. In non-dual-boot setups, it is interpreted as UTC.
- Re-enabled log rotation
- Fixed broken theme icons.
- Fixed issue where "Lid close action" = "Turn off display" causes external screen to turn off only when internal screen is disabled before lid is closed
- The shortcut key combinations CTRL + ALT + Numpad (+) and CTRL + ALT + Numpad (−) are now correctly recognized within Remote Desktop sessions.
- Fixed: Issue where not all resolutions worked with HP G series devices and some HDMI monitors. (Set following registry key x.drivers.intel.use_sriov_version and reboot for the fix to take effect).
  - Added registry key to switch to newer intel GPU driver.
	|  Parameter  |  Registry   |  Type       |  Value      |
	| ------ | ------ | ------ | ------ |
	|  `Switch to out of tree i915 sriov driver.`  |  `x.drivers.intel.use_sriov_version`  |  bool  |  enabled / *disabled* (default)  |
- Fixed: Damaged filesystem after power loss.
- Fixed a 90-second timeout on LG Thin Clients and All-in-Ones that occurred when shutting down the system using the power button.
- Prevent misconfiguration of Active Directory/Kerberos domains in lower case letters. Setup now validates domain entries below Security>Active Directory/Kerberos to be in upper case and having valid characters and format.
- Added input validation in Setup under Security>Active Directory/Kerberos>Domain List, parameter Domain Controller.
- Fixed a delay when logging in with AD/Kerberos, Single Sign-On, or UMS as Identity Broker.
- Fixed handling for displays with non-unique identifiers (serial number)
- Fixed setting the logged on user at AD/Kerberos login.
- Fixed XKB level type for ca(multix) to match expected layout behavior.
- Fixed VM startup via the IGEL Managed Hypervisor (IMH) app.
- Fixed an issue where some laptops failed to properly suspend when the lid was closed, leaving the system in an unusable state.
- Fixed a system tray crash that could occur on laptops after waking from suspend.
- Fixed an issue where dialog windows could appear blank in virtualized environments by disabling DRI3 rendering.
- **App Management**
	- Fixed the reported state of the app installation.
- **Network**
	- Fixed long fallback times for 802.1X on Ethernet by making the NetworkManager setting `connection.auth-retries` configurable, allowing faster transition to unauthenticated connections when authentication is not required.
		|  Parameter  |  Registry   |  Type       |  Value      |
		| ------ | ------ | ------ | ------ |
		|  `Authentication retries`  |  `network.interfaces.ethernet.device%.ieee8021x.auth_retries`  |  integer  |  3 *Default*  |
	    - For reducing long fallback times it is recommended to set the new parameter to 1.
	    - For the same purpose existing parameters may also be tuned: `network.interfaces.ethernet.device%.ieee8021x.auth_attempts` should be set to 1 and `network.interfaces.ethernet.device%.wait_for_link_config` (Default 1 second) may have to be increased. In order to make the single authentication attempt fail more quickly `network.interfaces.ethernet.device%.ieee8021x.auth_timeout` can be reduced (Default 30 seconds).
	- Proxy support: Disabled DNS WPAD usage, if there is a PAC URL configured or received via DHCP. Additionally, the PAC cache is no longer purged when credentials are present.
	- Fixed WiFi setting bssid_whitelist and 802.1X authentication settings phase[12]_direct
	- Fixed MAC address passthrough parameter network.interfaces.ethernet.device%.mac_source: Before taking the MAC address from another network interface and disabling it, a check is now performed if the interface is enabled in the IGEL Setup which is to receive the MAC address. If the interface is not enabled, the mapping will fail with a syslog entry: "failed: DEV is not enabled".
		    - Additionally, interface table numbering was fixed, making it possible now to take MAC address from interface 1 (previously failing with "ODEV not present" message)
	- Removed all Wake On LAN option except for "Wake on magic packet" from IGEL Setup page `Network > LAN Interfaces > Interface % > Wake on LAN`. The removed settings can still be configured via the registry:
	    - `network.interfaces.ethernet.device%.wol.wake_arp`
	    - `network.interfaces.ethernet.device%.wol.wake_bcast`
	    - `network.interfaces.ethernet.device%.wol.wake_mcast`
	    - `network.interfaces.ethernet.device%.wol.wake_phy`
	    - `network.interfaces.ethernet.device%.wol.wake_ucast`
	- Fixed an issue where proxy authentication errors were displayed too early or before any credentials were entered on the login screen.
	- Fixed Ethernet connection establishment reliability, particularly after briefly unplugging the network cable.
	- Fixed issue with registry settings for rtw89-driver not being applied.
- **WiFi**
	- Fixed WiFi support for some devices by adding missing INTEL/iwlwifi driver firmware files.
- **Smartcard**
	- Fixed memory leak in smartcard resource manager pcsc-lite.
	- Fixed handling of smartcard reader state changes in smartcard resource manager pcsc-lite.
	- Fixed smartcard reader detection in some cases.
	- Fixed smartcard redirection in IGEL Azure Virtual Desktop, IGEL Windows 365, IGEL Remote Desktop and IGEL Remote Desktop Web Access applications.
	- Fixed OpenSC detection of certain PIV smart cards.
- **HID**
	- Fixed keyboard input with Japanese layout.
	- Fixed the issue that touchscreen devices were always enabled. If the touchscreen does not work after update, it can be re-enabled in Setup under User Interface > Input > Touchscreen.
- **CUPS Printing**
	- Fixed usage of gutenprint printer drivers by removing them from the base system. These drivers are already included in the CUPS Printing app and cannot be provided in both locations.
- **Shadowing/VNC**
	- Fixed mouse cursor handling with Shadowing/VNC. Added new `Cursor Options` parameter:
		|  Parameter  |  Registry   |  Range      |  Value      |
		| ------ | ------ | ------ | ------ |
		|  `Cursor Options`  |  `network.vncserver.cursor_mode`  |  [Fixed-arrow (Default)][Dynamic][Dynamic+Fixed-arrow]  |  *Fixed-arrow (Default)*  |
	    - `Fixed-arrow`: The viewer always sees a fixed arrow, regardless of the client’s cursor.
	    - `Dynamic`: The cursor shape changes dynamically; the viewer sees client's cursor shapes.
	    - `Dynamic + Fixed-arrow`: The viewer sees both, the fixed arrow and the client's cursor.
- **Audio**
	- Fixed audio support for LG 24CQ651N: The internal mic boosting has been disabled in order to fix the over-sensitivity problem. However, in the UI tool it will still show up as ~30% volume.
	- Fixed headphone support on LG CL600 devices when a DisplayPort monitor with speakers is connected.
	- Fixed: Audio speaker behavior on Lenovo M75q Gen 5 (AMD) when a jack was inserted. Both devices can now be selected and are working correctly.
	- Fixed TRRS headset on LG 24CN650
	- Fixed double microphone entries in audio tray for Dell Optiplex 3000 hardware.
	- Fixed: Volume set by UMS was only applied after a reboot; it now correctly takes effect whenever a new device is connected.
	- Fixed the incorrect creation of an internal audio card when the system bell was set to off.
	- Fixed issue with speaker not working on LG Gram 14ZD90RU Ext-0050 when audio jack was plugged in. Now both audio options can be selected and are working.
	- Fixed microphone over-sensitivity on LG 24CQ651N by disabling the internal mic input.
- **Hardware**
	- Fixed issues related to MST (Multi-Stream Transport) docking stations.
	- Updated fwupd to version 2.0.7-1
	- Fixed: Rare issue where assigning a predictable network interface name to an Ethernet interface failed due to excessive name length. As a result, the interface was not automatically configured.
	- The DisplayPort Multistream (DP MST) hotplug quirk can now be disabled by the registry setting `x.xserver%.quirks.dp_mst_hotplug`
	  - Changed the default value of the registry setting, "default" is the same as "always" unless the quirk is not supported by the hardware.
		|  Parameter  |  Registry   |  Range      |  Value      |
		| ------ | ------ | ------ | ------ |
		|  `Quirk to improve DP MST hotplug behaviour.`  |  `x.xserver%.quirks.dp_mst_hotplug`  |  [default][always][never]  |  *default*  |
	- Added optional workarounds to the DisplayPort Multistream (DP MST) hotplug quirk.
	  - These workarounds fix issues with black screens after hotplugging a display from a docking station.
	  - They can be enabled by the registry setting "x.xserver%.quirks.screen_stay_black"
	- Fixed missing WiFi firmware for HP EliteBook 6 G1i 16 and Dell Pro 16 Plus notebooks.
	- Added registry key to encapsulate the fix for "keyboard input loss in screen lock after monitor changes, such as when adding or removing a docking station".
		|  Registry    |  Range       |
		| ------ | ------ |
		|  `x.xserver0.quirks.hotplug_lockscreen`  |  [ *default* ][always][never]                        |
	- Fixed boot issues on Dell Wyse 5000 series devices (including Wyse 5070 and Wyse 5470 AIO) after a bootcode update. EFI boot variables are now recreated automatically.
	- Fixed device type for Lenovo V100q in "About" page.
	- Keyboard does not freeze anymore when using Dell HR024 headsets
	- Lowered power consumption of Lenovo M70q Gen6 by changing the default ethernet driver to the RealTek r8168 ethernet driver.
	- Fixed display issues by disabling Panel Self Refresh on affected AMD Krackan Point devices using the amdgpu driver (including Lenovo T14 Gen 6 AMD). Added new setup parameter `x.drivers.amdgpu.psr` to allow forcing Panel Self Refresh on or off. By default, the kernel setting is used (enabled for DCN 3.5+ devices).
		|  Parameter  |  Registry   |  Range      |  Value      |
		| ------ | ------ | ------ | ------ |
		|  `AMDGPU panel self refresh`  |  `x.drivers.amdgpu.psr`  |  [Default][Enable][Disable]  |  *Default*  |
	- Fixed issues with laptop_mode power saving quirk.
	- Fixed the default disabled configuration of touch input on ELO touchscreen devices. If required, it can be enabled in Setup under User Interface > Input > Touchscreen.
	- Updated firmware for the amdgpu driver for potential stability improvements on Lenovo T14 Gen 6 AMD devices.
	- Fixed changed EDID behavior by disabling EDID fetching from ACPI _DDC for eDP displays by default when using the amdgpu driver. Added new registry key `x.drivers.amdgpu.acpi_edid` to control this behavior:
		|  Parameter   |  Registry   |  Range      |  Value       |
		| ------ | ------ | ------ | ------ |
		|  `Attempt to fetch EDID for eDP displays from the ACPI _DDC...`  |  `x.drivers.amdgpu.acpi_edid`  |  [Default][Enable][Disable]  |  *Default*  |
	- Fixed that external screens connected to a Dell D6000 docking station did not show an image when used with a Dell Pro 14 Plus.
	- Fixed that Pepperl+Fuchs BTC22 and BTC24 devices were shown as not supported.
- **Remote Management**
	- Fixed license term handling so that the last day is now correctly included.
	- Fixed unreliability while applying remote settings.
	- Fixed start delay of the remote management during boot in devices with uninitialized unit id.
	- Fixed ensuring of user permissions for wallpaper files.
	- Fixed aborting of a local command in case of disconnect from the UMS.
	- Fixed transferring of PKCS12 files as a "Common Certificate" or "SSL Certificate" file type.
	- Fixed UMS connection handling to be more robust when igelrmserver DNS entry is pointing to an incorrect UMS server.
	- Fixed an issue where the start button filename for CI customization could not contain spaces.
	- Fixed sync of locally made changes while registering in the UMS.
	- Fixed a sporadic unexpected stop of the remote management service during VM installation via the IGEL Managed Hypervisor App.
	- Fixed CIC profiles using custom data partition.
	- Fixed exceeded string limit of the error string in the apps status disturbing the UMS communication.
	- Fixed visibility of user notifications — messages and dialogs related to remote management now appear on the lock screen.
	- Fixed a possible failure of the remote management while interacting with the IGEL apps management.
	- Fixed: Hardware address (MAC) detection. Network interfaces without a hardware device are now excluded when determining the active MAC address.
	- Fixed removal of apps installed by UMS. The uninstall action is now invoked when no apps are assigned to the device anymore.
	- Fixed automatic triggering of reconfiguration actions. Reconfiguration is now triggered even if the “apply settings” dialog closes due to a timeout.
	- Fixed access OpenSSL trust store for user applications.
	- Fixed file transfer of files beginning with //.
	- Fixed: Reconnection to UMS in case of network interruptions.
	- Fixed: Send the IP from the VPN connection if it is used for UMS connection.
	- Fixed installation of CA certificates classified as 'Browser Certificate', now a such certificate is installed only in the certificate database for Firefox and Chromium.
	- Fixed: Assigned files will no longer be deleted after the update.
	- Fixed creating of missing directories while installing files, now the directories created on demand are owned by the root.
	- Fixed reconnecting mechanism when disconnect happens during initial data exchange between device and the UMS.
	- Fixed evaluation of DHCP options for auto-registering of the IGEL OS in the UMS if DHCP option 43 is used for encapsulation IGEL specific options.
- **IGEL Desktop**
	- Fixed an issue where the IGEL Application Launcher and About window had a 5-second delay when the Avahi daemon (a CUPS prerequisite) was installed. The windows now load instantly.
	- Fixed wrong reset of mirror mode to custom mode in display tray app.
	- Fixed screens stay black after hotplug of USB-C dockingstations.
	- Fixed display mirror group handling in the IGEL system tray.
	- Fixed: Keyboard input loss in screen lock after monitor changes, such as when adding or removing a docking station.
- **Licensing**
	- Fixed license for hardware based audio and video codecs to remain after expiration of the subscription.
- **Mobile Broadband**
	- Fixed WWAN FCC unlocking support on Lenovo ThinkPad T14 Gen 5 (Type 21MD) laptops using the Quectel EM061K-GL WWAN module.
	- Fixed WWAN FCC unlocking support for the Quectel EM061K-GL WWAN module for the additional devices: Lenovo ThinkPad T14 Gen 5 (Intel/AMD( and Lenovo ThinkPad L13 Gen 5 (Intel).
- **Virtualization**
	- Fixed IGEL OS running as a virtual machine on a SINA Workstation S:
		- Added detection method to identify SINA WS host from IGEL OS.
		- Removed the VBoxClient clipboard and drag&drop services.
		- Added VBoxClient vmsvga support.
	- Revised VirtualBox service detection
	- Fixed: Bootsplash issue with SINA workstation

## Known Issues
- In very rare cases all apps are lost after an update. Should this be the case, an error message is shown "Opening system App Journal failed." - if the device is manged, the apps will be reinstalled after a reboot.
- Increased writeable cache partition size (by default). First boot with 12.4.x and newer may take more time (once) when updating from a 12.2.x or older base system app.
- Automatic proxy configuration: PAC file URL does not support https scheme.
- When TPM PCR+PIN device encryption is enabled, an additional PIN entry is required the first time a new base system release is booted.
- Shadowing may flicker on older Intel devices without modesetting due to limitations of the legacy graphics driver.
- **OSC Installer**
	- On Lenovo T14 Gen 6 Intel devices, the OSC may display a black screen with no desktop during a standard boot. A failsafe boot is required to access the OSC installer system.
- **App Management**
	- Downgrades to versions prior to 12.7.0 are possible - despite the implemented downgrade limit - via the Local App Portal or using igelpkgctl through local terminal. In UMS-managed environments, disabling the Local App Portal is recommended to ensure version control. If the older shim bootloader signature (in 12.6.1 PR1 or earlier) is revoked and Secure Boot is enabled, the device may become unbootable. Verify boot compatibility before downgrading.
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
	- Browser windows cannot be moved using touch input, while other applications are unaffected. This has been observed with Firefox, Microsoft Edge, and Chromium.
		    - Workaround: Enable server-side window decoration.
- **Application Launcher**
	- The Zoom session currently appears without an icon in the Application Launcher.
	- Applications launched via the Application Launcher may close when the launcher is closed.
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
	- When using an HP G5 Dock, disconnecting and reconnecting the dock may cause display configurations (such as display order, resolution, and orientation) to be lost. After reconnection, displays may revert to default settings, requiring manual reconfiguration. For some devices, this issue can be mitigated by setting the registry key `x.xserver0.quirks.dp_mst_hotplug` to “Never.”
	- Dell Wyse 3040 devices with 2 GB RAM may experience poor operating performance.
	- HP mt645 G8 devices with HP USB-C Dock G6 do not wake from suspend and cannot be powered off via UMS.
	- Wake-on-LAN is not working on Lenovo ThinkPad L15 Gen 4 AMD and Lenovo ThinkPad L16 Gen1 AMD devices from suspended or powered-off states.
	- On LG 34CR650 AIO devices, changing an external monitor’s orientation to “Inverted” can cause the internal display to turn black until reboot.
	- When a device is connected to an HP E27K G5 monitor via USB-C, it may wake from suspend automatically after approximately 20 seconds.
	- Sporadic system freezes may occur on newer AMD chipsets (AMD Ryzen AI) with the amdgpu graphics driver.
- **Accessibility**
	- The screen reader (accessibility feature) currently does not work with the following apps:
		- IGEL Setup
		- IGEL First Boot Wizard
		- IGEL Start Menu
		- IGEL System Tray apps (volume, network,  notifications, ...)
		- VPN and SSO login dialogs
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
	- With “Taskbar auto hide” set to “Always” the taskbar may invert its behavior (show/hide) after a delay, becoming visible when the cursor is away and hidden when hovering over it.
	- When using a taskbar spanning two monitors, the taskbar does not remain visible on the second monitor while a fullscreen session is active on the first. This prevents access to tray applications without leaving the fullscreen session.
- **Licensing**
	- Manual deployment of add-on licenses for IGEL Agent for Imprivata licenses (via UMS) is only possible after finished installation of IGEL Agent for Imprivata app on device.
	- Endpoints that have a Starter License but no Workspace Edition license will not receive device settings or app management from UMS if add-on licenses are installed.
	Workaround: Either remove the add-on licenses or assign a valid Workspace Edition (or Workspace Edition Demo) license.
- **Mobile Broadband**
	- F11 flight mode function key does not switch off mobile broadband on HP Elite mt645 G7. (Deactivate mobile broadband in Network / Mobile Broadband settings)
