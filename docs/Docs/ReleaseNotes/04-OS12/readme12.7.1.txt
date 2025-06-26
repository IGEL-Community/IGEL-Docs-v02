IGEL OS Creator  
===============

Firmware version 12.7.1  
Release date 2025-06-25  
Last update of this document 2025-06-25  


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
| Kernel                                    | 6.12.20 #mainline-lxos12-g1746535138     |
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

# Changes since: 12.7.0

## New Features
- Added accessiblity features.
  - Mouse control via numpad: Usage of numeric keypad to move the mouse. Press "5" on the numpad for left-clicks and "Shift+5" for right-clicks.
  - Disable repeating keys: When enabled, holding down a key will register only a single event.
  - Sticky keys: Allows modifier keys (e.g., Shift, Ctrl) and regular keys to be pressed one after another and still be recognized as a combined input.
  - Slow keys: Adds a delay before a keypress is registered. The key must be held down for a set duration to be recognized..
  - Bounce keys: Helps ignore unintentional repeated keypresses by filtering out rapid duplicates.
	|  Parameter  |  Registry   |  Type       |  Value      |
	| ------ | ------ | ------ | ------ |
	|  `Mouse pointer size`  |  `windowmanager.a11y.mouse.pointersize`  |  integer  |  24 *Default*  |
	|  `Use numpad to move mouse`  |  `windowmanager.a11y.keyboard.usekeyboardmouse`  |  bool  |  enabled / *disabled* (default)  |
	|  `Repeat keys`  |  `windowmanager.a11y.keyboard.repeatkeys`  |  bool  |  *enabled* (default) / disabled  |
	|  `Sticky keys`  |  `windowmanager.a11y.keyboard.stickykeys`  |  bool  |  enabled / *disabled* (default)  |
	|  `Slow keys`  |  `windowmanager.a11y.keyboard.slowkeys`  |  bool  |  enabled / *disabled* (default)  |
	|  `Slow keys input delay`  |  `windowmanager.a11y.keyboard.slowkeysinputdelay`  |  integer  |  300 *Default*  |
	|  `Bounce keys`  |  `windowmanager.a11y.keyboard.bouncekeys`  |  bool  |  enabled / *disabled* (default)  |
- Fixed HP BIOS Tools app compatibility with kernel lockdown. This fix applies to the following HP Thin Client models:
  - HP t540 Thin Client
  - HP t640 Thin Client
  - HP Pro t550 Thin Client
  - HP Elite t655 Thin Client
  - HP t740 Thin Client
  - HP Elite t755 Thin Client
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
- **WiFi**
	- Changed: WPA2 Enterprise and WPA3 Enterprise are now grouped under a single configuration option: WPA2/WPA3 Enterprise
	- Added support for WPA3 Enterprise B192 to allow connections to WPA3 Enterprise with 192-bit mode (00-0F-AC:12 cipher suite, GCMP-256 pairwise cipher and required PMF)
		|  Parameter  |  Registry   |  Range      |  Value      |
		| ------ | ------ | ------ | ------ |
		|  `Network authentication`  |  `network.interfaces.wirelesslan.device0.alt_ssid%.wpa.type`  |  [WPA Personal][WPA Enterprise][WPA2 Personal][WPA2/WPA3 Enterprise][WPA3 Personal][WPA3 Enterprise B192]  |  *WPA2 Personal*  |
- **Driver**
	- Added asix_thirdparty driver to get some fibre USB ethernet adapter to work - this driver can be activated via the following registry key:
		|  Parameter  |  Registry   |  Range      |  Value      |
		| ------ | ------ | ------ | ------ |
		|  `Use thirdparty asix kernel module.`  |  `network.drivers.asix.prefer_thirdparty`  |  [Auto][Yes][No]  |  *Auto*  |
- **Hardware**
	- Added hardware support for Lenovo M625q.
	- Added hardware support for Dell Optiplex 3000 with CPU “Intel® Pentium® Silver Processor N6005”.
- **Remote Management**
	- Added downgrade limit - The base_system app can no longer be downgraded to versions older than 12.7.0. This restriction applies to IGEL UD Pocket devices and endpoints with Secure Boot enabled. In such cases, downgrade attempts to versions prior to 12.7.0 will be refused to maintain system integrity and boot security.
- **IGEL Desktop**
	- Added registry parameter to enable alphanumerical sorting of desktop icons.
		|  Parameter  |  Registry   |  Range      |  Value      |
		| ------ | ------ | ------ | ------ |
		|  `Sort Desktop icons`  |  `windowmanager.defaulttheme.icon_sort`  |  [Default][Alphanumeric]  |  *Default*  |

## Security Fixes
- Fixed ISN 2025-24: Command Execution in IGEL OS.

## Resolved Issues
- Old EFI entries referencing windows will be ignored in case the \EFI\Windows folder does no longer exist on the referenced partition.
- Fixed: Touchpad re-enabled itself despite being deactivated in the settings.
- Fixed application launcher in restart mode. It no longer starts additional instances when configuration changes occur.
- Fixed creation of /etc/machine-id, which is needed for systemd timers using FixedRandomDelay. This fix resolves an issue where custom cronJob/systemd timers triggered with identical delays accross multiple IGEL OS endpoints. Timers now behave as expected with randomized delays per device.
- Switched to standard utility xkbset for managing keyboard accessibility features.
- **CUPS Printing**
	- Fixed usage of gutenprint printer drivers by removing them from the base system. These drivers are already included in the CUPS Printing app and cannot be provided in both locations.
- **Hardware**
	- Fixed issues related to MST (Multi-Stream Transport) docking stations.
	- Fixed: Rare issue where assigning a predictable network interface name to an Ethernet interface failed due to excessive name length. As a result, the interface was not automatically configured.
- **IGEL Desktop**
	- Fixed screens stay black after hotplug of USB-C dockingstations.

## Known Issues
- In very rare cases all apps are lost after an update. Should this be the case, an error message is shown "Opening system App Journal failed." - if the device is manged, the apps will be reinstalled after a reboot.
- Increased writeable cache partition size (by default). First boot with 12.4.x and newer may take more time (once) when updating from a 12.2.x or older base system app.
- Automatic proxy configuration: PAC file URL does not support https scheme.
- When TPM PCR+PIN device encryption is enabled, an additional PIN entry is required the first time a new base system release is booted.
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
- **IGEL Desktop**
	- On-screen keyboard sporadically crashes when typing.
	- If two monitors are configured in a vertical layout (one above the other), and those monitors are configured with "auto-detect" resolution, saving leads to a wrong layout order.
	- There are some UI elements that are not yet translated in all available user interface languages.
	- In very rare cases, the Start menu or panel may not be visible after boot. A reboot will restore visibility in such cases.
- **Licensing**
	- Manual deployment of add-on licenses for IGEL Agent for Imprivata licenses (via UMS) is only possible after finished installation of IGEL Agent for Imprivata app on device.
- **Mobile Broadband**
	- F11 flight mode function key does not switch off mobile broadband on HP Elite mt645 G7. (Deactivate mobile broadband in Network / Mobile Broadband settings)
