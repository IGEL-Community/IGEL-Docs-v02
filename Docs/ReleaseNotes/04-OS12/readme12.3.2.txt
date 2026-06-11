
IGEL OS Creator  
===============

Firmware version 12.3.2  
Release date 2024-03-20  
Last update of this document 2024-03-20  


Supported Devices  
-------------------------------------------------------------------------------

[> Supported IGEL OS 12 devices](https://kb.igel.com/os12-supported-hardware)


Component Versions
-------------------------------------------------------------------------------

| Components                                |                                  |
|-------------------------------------------|----------------------------------|
| OpenSSL                                   | 1.1.1f-1ubuntu2.21               |
| Bluetooth Stack (bluez)                   | 5.71-1igel1704700934             |
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
| Kernel                                    | 6.1.63 #mainline-lxos12-g1706791905    |
| Xorg X11 Server                           | 21.1.11-2igel1706795418          |
| Lightdm Graphical Login Manager           | 1.30.0-0ubuntu4~20.04.2igel1649274243      |
| XFCE4 Window Manager                      | 4.14.5-1~18.04igel1643191202     |
| ISC DHCP Client                           | 4.4.1-2.1ubuntu5.20.04.5         |
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

# Changes since: 12.3.1

## New Features
- Updated IGEL screensaver logo.
- Updated IGEL logo within IGEL Setup Assistant
- Updated IGEL boot animation.
- Added checkbox and corresponding text for accepting EULA on IGEL OS.
- **Network**
	- Added check if BIOS has Wake-on-LAN disabled. If disabled, it is not recommended to configure network interface to use WoL. This check is only supported / possible on Lenovo devices with official IGEL OS hardware support. Parameter:
		| Parameter | Registry | Type | Value |
		| ------ | ------ | ------ | ------ |
		| `Respect the BIOS WoL setting so if disabled reflect this for the linux network devices settings.` | `network.interfaces.respect_bios_wol_setting` | bool | *enabled* (default) / disabled |
	- SCEP: Improved handling of client certificate subject change (particularly if the hostname is part of the subject). Registry key:
		|  Parameter  |  Registry   |  Range      |  Value      |
		| ------ | ------ | ------ | ------ |
		|  `Hostname change handling`  |  `network.scepclient.cert%.hostname_change_handling`  |  [Ignore][Reset]  |  *Ignore*  |
	- A notification is shown, when SCEP server is reachable but certificate renewal fails. The notification includes any deviation of the desired subject from the old one.
- **Hardware**
	- Added support for Lenovo USB-C to Ethernet Adapter
	- Added WWAN support on HP mt440 device with BIOS v1.08.00 and Intel XMM7560 module Firmware v1.16.48.
- **Remote Management**
	- Added compatibility for remote management via Microsoft's Azure Application Gateway (requires UMS 12.04.100 or later).
	- Added compatibility for remote management via F5 Reverse Proxy / SSL Offloading (requires UMS 12.04.100 or later).
	- Added support for system-wide proxy configuration.
	- Added: RSA-4096 key is created as device key by default. The key type can be changed via IGEL setup:
		|  Registry    |  Value       |
		| ------ | ------ |
		|  `system.remotemanager.device_key_type`  |  *RSA-4096* (default) / EC-P521R1  |
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
		|  Security>Logon>Guest |  Present session to  |  `sessions.<instance>.login_method` <br> `app.<app-name>.sessions.<instance>.login_method`  |  "User" (default) / "Guest" / "All"  |
	- This is the default for any session including app sessions. Latter ones inherit to `app.<app-name>.sessions.<app_%_or_instance#>.login_method`. Standard sessions inherit to `sessions.<name_%_or_instance#>.login_method`.
	- Choose applications to be available in a guest session by setting the above parameters to 'Guest' or 'All'. On command-line usage of nodelist sessions to get a currently defined list of sessions.

## Security Fixes
- Added registry key to prevent terrapin attack (mitigation is not active as default) on the SSH client:
	| Parameter | Registry | Type | Value |
	| ------ | ------ | ------ | ------ |
	| Disable weak MACs and Chipers to prevent terrapin attack. | network.ssh_client.enable_terrapin_mitigation | bool | enabled / _disabled_ (default) |
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
- Removed custom command selection from application start dialog of file manager to prevent the execution of arbitrary commands by user.
- Fixed a privilege escalation in setup_cmd utility.
- Added registry key to prevent terrapin attack (mitigation is not active as default) on the SSH server:
	| Parameter | Registry | Type | Value |
	| ------ | ------ | ------ | ------ |
	| Disable weak MACs and Chipers to prevent terrapin attack. | network.ssh_server.enable_terrapin_mitigation | bool | enabled / _disabled_ (default) |
- **X server**
	- Fixed xorg-server security issues CVE-2024-21886, CVE-2024-21885, CVE-2024-0409, CVE-2024-0408, CVE-2024-0229 and CVE-2023-6816.

## Resolved Issues
- Fixed browser certificates could not be loaded.
- **WiFi**
	- Added options for rtw89core and rtw89pci kernel modules (used e.g by the rtw_8852be driver) configurable.
		|  Parameter  |  Registry   |  Type       |  Value      |
		| ------ | ------ | ------ | ------ |
		|  disable_ps_mode  |  network.drivers.rtw89core.options.disable_ps_mode  |  bool  |  _enabled_ (default) / disabled  |
		|  disable_clkreq  |  network.drivers.rtw89pci.options.disable_clkreq  |  bool  |  _enabled_ (default) / disabled  |
		|  disable_aspm_l1  |  network.drivers.rtw89pci.options.disable_aspm_l1  |  bool  |  _enabled_ (default) / disabled  |
		|  disable_aspm_l1ss  |  network.drivers.rtw89pci.options.disable_aspm_l1ss  |  bool  |  _enabled_ (default) / disabled  |
- **VirtualBox**
	- Fixed mouse offset if using multi-monitor setup as a VirtualBox guest.
- **Remote Management**
	- Fixed onboarding via ICG server using a public CA as root of the trust chain.
	- Added missing rmagent-devattrs-reset command.
	- Fixed enumeration of a range of a device attribute of type range (list).
	- Fixed setup parameters userinterface.shutdown_dialog.allow_cancel, userinterface.shutdown_dialog.disable_dialog, userinterface.rmagent.cancel_usermessage and userinterface.rmagent.enable_usermessage.
- **SSO**
	- Added registry key to define a semicolon separated list of allowed hostnames
	for URL-redirections during the SSO login view:
		|  Parameter  |  Registry   |  Type       |  Value      |
		| ------ | ------ | ------ | ------ |
		|  `List of allowed hosts for redirection`  |  `auth.cloudidp.host_allowlist`  |  string  |  empty *Default*  |

## Known Issues
- Shutdown via Post Session Command not yet supported.
- Increased writeable cache partition size (by default). First boot with 12.3.x may take more time (once).
- Display Configurator: Rotation of displays connected to the Lenovo ThinkPad USB-C Hybrid Dock can fail.
- In very rare cases all apps are lost after an update. Should this be the case, an error message is shown "Opening system App Journal failed." - if the device is manged, the apps will be reinstalled after a reboot.
- The downgrade to base system 12.00.900 or 12.00.910 is not supported.
- Display Configurator may show hotplugged monitors as disabled.
- Issues may occur if monitors are connected via docking station.
	- In general: Monitor hotplug not stable yet and can trigger misconfiguration.
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
	- Wake up from suspend via UMS does not work on HP mt645 devices. Workaround: Disable system suspend and use shutdown instead.
	- If using 6 x 4K@60Hz monitors on a t755/t740 with the additional graphic card, one or two of the monitors may stay black after coming back from DPMS off state.
	- This is caused by using the additional graphic card as primary, which only has 512MB VRAM (the VRAM is not sufficient in this configuration)
	- The solution:
	-* Open BIOS and increase the VRAM size of the iGPU to 2048MiB (maybe 1024MiB may also work)
	-* Activation of IGEL registry key *x.drivers.swap_card0_with_card1,* so the iGPU will become the Primary GPU. Connector names will be changed with that!!
	- Built-in fingerprint sensor is not supported on HP mt440 and mt645.
	- Wake on LAN is not functional on Dell OptiPlex 3000 and Lenovo K14 Gen1
- **IGEL Desktop**
	- Globally configured WiFi static IP is not used if establishing WiFi connection via WiFi system tray
	- Some touchpads are recognized as touchpad and mouse. This results in showing possible user settings for both variants.
	- If two monitors are configured in a vertical layout (one above the other), and those monitors are configured with "auto-detect" resolution, saving leads to a wrong layout order.
	- Closing shutdown dialog requires a double ESC key press.
	- XFWM4 composite manager can break screen lock and enables sporadically access to open applications. It is recommended to not enable registry key windowmanager.wm0.variables.usecompositing. The composite manager is disabled by default.
	- On-screen keyboard sporadically crashes when typing.
- **Licensing**
	- Manual deployment of add-on licenses for IGEL Agent for Imprivata licenses (via UMS) is only possible after finished installation of IGEL Agent for Imprivata app on device.
