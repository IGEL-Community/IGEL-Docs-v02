# IGEL News: Builds OS 12

**NOTE:**

-----

## 2023-03-21 - [12.3.2](readme12.3.2.txt)

```
The new BUILD 12.3.2 for IGEL Workspace is ready.

These are the release notes published with that release:

# Changes since: 12.3.1

## New Features

- Updated IGEL screensaver logo.
- Updated IGEL logo within IGEL Setup Assistant
- Updated IGEL boot animation.
- Added checkbox and corresponding text for accepting EULA on IGEL OS.
- **Network**
	- Added check if BIOS has Wake-on-LAN disabled. If disabled, it is not recommended to configure network interface to use WoL. This check is only supported / possible on Lenovo devices with official IGEL OS hardware support. Parameter:

```
| Parameter | Registry | Type | Value |
| ------ | ------ | ------ | ------ |
| `Respect the BIOS WoL setting so if disabled reflect this for the linux network devices settings.` | `network.interfaces.respect_bios_wol_setting` | bool | *enabled* (default) / disabled |
```

- SCEP: Improved handling of client certificate subject change (particularly if the hostname is part of the subject). Registry key:

```
|  Parameter  |  Registry   |  Range      |  Value      |
| ------ | ------ | ------ | ------ |
|  `Hostname change handling`  |  `network.scepclient.cert%.hostname_change_handling`  |  [Ignore][Reset]  |  *Ignore*  |
```

	- A notification is shown, when SCEP server is reachable but certificate renewal fails. The notification includes any deviation of the desired subject from the old one.

- **Hardware**

	- Added support for Lenovo USB-C to Ethernet Adapter
	- Added WWAN support on HP mt440 device with BIOS v1.08.00 and Intel XMM7560 module Firmware v1.16.48.

- **Remote Management**

	- Added compatibility for remote management via Microsoft's Azure Application Gateway (requires UMS 12.04.100 or later).
	- Added compatibility for remote management via F5 Reverse Proxy / SSL Offloading (requires UMS 12.04.100 or later).
	- Added support for system-wide proxy configuration.
	- Added: RSA-4096 key is created as device key by default. The key type can be changed via IGEL setup:

```
|  Registry    |  Value       |
| ------ | ------ |
|  `system.remotemanager.device_key_type`  |  *RSA-4096* (default) / EC-P521R1  |
```

- **SSO**

	- Added support for automatical Single Sign-on (SSO) login with given user credentials. All our Identity Providers except the generic OpenID Connect provider are supported.

```
|  Setup      |  Parameter  |  Registry   |  Type       |  Value      |
| ------ | ------ | ------ | ------ | ------ |
|  Security > Logon > Single Sign-on  |  `Password for autologin`  |  `auth.cloudidp.password`  |  string  |  empty *Default*  |
|  Security > Logon > Single Sign-on  |  `Automatically perform login`  |  `auth.cloudidp.autologin`  |  bool  |  enabled / *disabled* (default)  |
|  Security > Logon > Single Sign-on  |  `Username for autologin`  |  `auth.cloudidp.username`  |  string  |  empty *Default*  |
```

	- Added password-less guest-user login with limited access to applications. Each application session can be made available in normal user login, guest login, or both with Registry parameters sessions.<instance>.login_method or app.<app-name>.sessions.<instance>.login_method - requires Chromium Browser 120.0.6099.216 Build 5.0 or later.

```
|  Setup  |  Parameter  |  Registry  |  Value  |
| ------ | ------ | ------ | ------ |
|  Security>Logon>Guest |  Present session to  |  `sessions.<instance>.login_method` <br> `app.<app-name>.sessions.<instance>.login_method`  |  "User" (default) / "Guest" / "All"  |
```

	- This is the default for any session including app sessions. Latter ones inherit to `app.<app-name>.sessions.<app_%_or_instance#>.login_method`. Standard sessions inherit to `sessions.<name_%_or_instance#>.login_method`.
	- Choose applications to be available in a guest session by setting the above parameters to 'Guest' or 'All'. On command-line usage of nodelist sessions to get a currently defined list of sessions.

## Security Fixes

- Added registry key to prevent terrapin attack (mitigation is not active as default) on the SSH client:

```
| Parameter | Registry | Type | Value |
| ------ | ------ | ------ | ------ |
| Disable weak MACs and Chipers to prevent terrapin attack. | network.ssh_client.enable_terrapin_mitigation | bool | enabled / _disabled_ (default) |
```

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

```
| Parameter | Registry | Type | Value |
| ------ | ------ | ------ | ------ |
| Disable weak MACs and Chipers to prevent terrapin attack. | network.ssh_server.enable_terrapin_mitigation | bool | enabled / _disabled_ (default) |
```

- **X server**

	- Fixed xorg-server security issues CVE-2024-21886, CVE-2024-21885, CVE-2024-0409, CVE-2024-0408, CVE-2024-0229 and CVE-2023-6816.

## Resolved Issues

- Fixed browser certificates could not be loaded.

- **WiFi**

	- Added options for rtw89core and rtw89pci kernel modules (used e.g by the rtw_8852be driver) configurable.

```
|  Parameter  |  Registry   |  Type       |  Value      |
| ------ | ------ | ------ | ------ |
|  disable_ps_mode  |  network.drivers.rtw89core.options.disable_ps_mode  |  bool  |  _enabled_ (default) / disabled  |
|  disable_clkreq  |  network.drivers.rtw89pci.options.disable_clkreq  |  bool  |  _enabled_ (default) / disabled  |
|  disable_aspm_l1  |  network.drivers.rtw89pci.options.disable_aspm_l1  |  bool  |  _enabled_ (default) / disabled  |
|  disable_aspm_l1ss  |  network.drivers.rtw89pci.options.disable_aspm_l1ss  |  bool  |  _enabled_ (default) / disabled  |
```

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

```
|  Parameter  |  Registry   |  Type       |  Value      |
| ------ | ------ | ------ | ------ |
|  `List of allowed hosts for redirection`  |  `auth.cloudidp.host_allowlist`  |  string  |  empty *Default*  |
```

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
```

-----

## 2023-02-06 - [12.3.1](readme12.3.1.txt)

```
The new BUILD 12.3.1 for IGEL Workspace is ready.

These are the release notes published with that release:

# Changes since: 12.3.0

## New Features

- Added (enhanced) settings for kernel cmdline options
- New registry keys:
```

| Parameter | Registry | Type | Value | Range |
| ------ | ------ | ------ | ------ | ------ |
| Set reboot kernel parameters. | system.kernel.bootparams.reboot |  | _Default_ | [Default][Bios][Triple][Kbd][Acpi][Efi][Pci] |
| Disable use of initial boot framebuffer. | system.kernel.bootparams.vga_off | bool | enabled / _disabled_ (default) |  |
| Set maximum allowed processor cstate. | system.kernel.bootparams.max_proc_cstate |  | _No limit_ | [No limit][1][2][3][4][5][6][7][8][9] |
| Enable debug output for i8042 driver. | system.kernel.bootparams.i8042.debug | bool | enabled / _disabled_ (default) |  |
| Do not use muxing for i8042 driver. | system.kernel.bootparams.i8042.nomux | bool | enabled / _disabled_ (default) |  |
| Disable use of PnP configuration for i8042 driver. | system.kernel.bootparams.i8042.nopnp | bool | enabled / _disabled_ (default) |  |
| Disable use of AUX loopback command for i8042 driver. | system.kernel.bootparams.i8042.noloop | bool | enabled / _disabled_ (default) |  |
| Ignore timeout signaled by controller for i8042 driver. | system.kernel.bootparams.i8042.notimeout | bool | enabled / _disabled_ (default) |  |
| Reset controller during init for i8042 driver. | system.kernel.bootparams.i8042.reset | bool | enabled / _disabled_ (default) |  |
| Set ACPI kernel parameters. | system.kernel.bootparams.acpi |  | _No setting_ | [No setting][Force][On][Off][Noirq][Strict][Rsdt][Copy_dsdt] |

```

- Changed registry keys:
```

| Parameter | Registry | Range | Value |
| ------ | ------ | ------ | ------ |
| Various PCI subsystem options | system.kernel.bootparams.pci | [Default][Conf Mechanism 1][Conf Mechanism 2][Disable multiple PCI domains][Disable use of MMCONFIG][Disable MSI][Ignore ACPI PCI host bridge window][Ignore ACPI IRQ routing][Route IRQ for all PCI devices] | _Default_ |
| Set maximum allowed cstate on intel cpus. | system.kernel.bootparams.max_cstate | [No limit][0][1][2][3][4][5][6] | _No limit_ |

```

- **Network**

	- Added Quectel EM05-G support for Lenovo ThinkPad L13 AMD Gen4 and L13 Intel Gen4.
	- Added regional support with Quectel EM05-G for US SIM cards on supported Lenovo ThinkPad devices.

- **Hardware**

	- Added hardware support for Lenovo ThinkPad L13 AMD Gen4.
	- Added hardware support for Lenovo ThinkPad L13 Intel Gen4.

## Security Fixes

- For security reasons the accessory 'Network Tools' is enforced to run with Administrator (root) privileges only. Therefore, parameter 'Password protection on page Accessories>Network Tools was removed.
- Fixed libssh2 security issue CVE-2023-48795.
- Fixed openssh security issues CVE-2023-51385, CVE-2023-51384 and CVE-2023-48795.
- Fixed vim-tiny security issues CVE-2022-1725, CVE-2022-1771, CVE-2022-1897, CVE-2022-2000, CVE-2023-46246, CVE-2023-48231, CVE-2023-48233, CVE-2023-48234, CVE-2023-48235, CVE-2023-48236 and CVE-2023-48237
- Fixed glibc security issues CVE-2023-4813 and CVE-2023-4806.
- Fixed nghttp2 security issue CVE-2023-44487.
- Fixed perl security issue CVE-2023-47038.
- Fixed poppler security issues CVE-2022-38349, CVE-2022-37052, CVE-2022-37051, CVE-2022-37050 and CVE-2020-23804.
- Fixed python3.8 security issue CVE-2023-40217.
- Fixed python-cryptography security issue CVE-2023-23931.
- Fixed sqlite3 security issue CVE-2023-7104.
- Fixed tiff security issues CVE-2023-3576 and CVE-2022-40090.
- Fixed tar security issue CVE-2023-39804.
- Updated Bluez to version 5.71-1 to fix CVE-2023-45866.
- Fixed webkit2gtk issues CVE-2023-42916, CVE-2023-42917, CVE-2023-42883 and CVE-2023-42890.
- **X server**
	- Fixed xorg-server security issues CVE-2023-6478 and CVE-2023-6377.

## Resolved Issues

- Fixed: Certain bluetooth devices with Mediatek-based devices were not functional.

- **WiFi**

	- Added registry key to switch between 8852be and rtw_8852be WiFi driver. Switching to 8852be driver possibly fixes some WiFi issues. (Auto uses 8852be on HP mt645 G7).
```

| Parameter | Registry | Range | Value |
| ------ | ------ | ------ | ------ |
| Use 8852be driver instead of rtw_8852be for WLAN. | network.drivers.realtek.use_8852be | [Auto][Yes][No] | _Auto_ |

```

- **Audio**

	- Added parameter to disable timer scheduling in pulseaudio module-udev-detect.
```

| Parameter | Registry | Range | Value |
| ------ | ------ | ------ | ------ |
| Disable timer scheduling for module-udev | multimedia.pulseaudio.daemon.disable-module-udev-tsched | [auto][true][false] | *auto* |

```

## Known Issues

- Display Configurator may show hotplugged monitors as disabled.
- Issues may occur if monitors are connected via docking station.
	- In general: Monitor hotplug not stable yet and can trigger misconfiguration.
- The downgrade to base system 12.00.900 or 12.00.910 is not supported.
- In very rare cases all apps are lost after an update. Should this be the case, an error message is shown "Opening system App Journal failed." - if the device is manged, the apps will be reinstalled after a reboot.
- Display Configurator: Rotation of displays connected to the Lenovo ThinkPad USB-C Hybrid Dock can fail.
- Display configuration of displays connected to HP G5 Docking Station may fail on HP t655.
- Increased writeable cache partition size (by default). First boot with 12.3.x may take more time (once).

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
	- Globally configured WiFi static ip is not used when establishing a WiFi connection via WiFi system tray

- **Licensing**

	- Manual deployment of add-on licenses for IGEL Agent for Imprivata licenses (via UMS) is only possible after finished installation of IGEL Agent for Imprivata app on device.

```

-----

## 2023-12-19 - [12.3.0](readme12.3.0.txt)

```
The new BUILD 12.3.0 for IGEL Workspace is ready.

These are the release notes published with that release:

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
```

| Parameter | Registry | Type | Value |
| ------ | ------ | ------ | ------ |
| Natural Scroll | `userinterface.mouse.naturalscroll` | bool | enabled / *disabled* (default) |
| Show input settings tray icon on desktop | `userinterface.system_tray.input.desktop` | bool | *enabled* (default) / disabled |

```
- Added: In Setup Assistant, user can enter optional structure tag during connection to UMS via one-time-password.
- Added: If system gets automatically assigned to an UMS during firstboot, the Setup Assistant presents profile- and app-installation(s) and reboots automatically.
- Added SSO support for Identity Providers using OpenID Connect. Configuration at IGEL Setup > Security > Logon > Single Sign-On > Identity Providers - select Identity Provider "OpenID Connect":
```

| Parameter | Registry | Type | Value |
| ------ | ------ | ------ | ------ |
| `Client secret` | `auth.cloudidp.oidc.client_secret` | string | empty *Default* |
| `Issuer URL` | `auth.cloudidp.oidc.idpurl` | string | empty *Default* |
| `Client ID` | `auth.cloudidp.oidc.client_id` | string | empty *Default* |

```
- Added SSO support for VMware Workspace ONE Access as Identity Provider. Configuration at IGEL Setup > Security > Logon > Single Sign-On > Identity Providers - select Identity Provider "VMware Workspace ONE Access":
```

|  Parameter  |  Registry   |  Type       |  Value      |
| ------ | ------ | ------ | ------ |
|  `Client secret`  |  `auth.cloudidp.vmwaccess.client_secret`  |  string  |  empty *Default*  |
|  `Workspace ONE Access issuer URL`  |  `auth.cloudidp.vmwaccess.idpurl`  |  string  |  empty *Default*  |
|  `Client ID`  |  `auth.cloudidp.vmwaccess.client_id`  |  string  |  empty *Default*  |

```
- Added SSO support for Ping Identity / PingOne as Identity Provider. Configuration at IGEL Setup > Security > Logon > Single Sign-On > Identity Providers - select Identity Provider "Ping Identity | PingOne":
```

| Parameter | Registry | Type | Value |
| ------ | ------ | ------ | ------ |
| `Client secret` | `auth.cloudidp.pingone.client_secret` | string | empty *Default* |
| `PingOne issuer URL` | `auth.cloudidp.pingone.idpurl` | string | empty *Default* |
| `Client ID` | `auth.cloudidp.pingone.client_id` | string | empty *Default* |

```
- Added support for post session commands. To configure and use post session commands, corresponding OS12 App must support post session commands as well.
- Changed the initial default devicename and hostname of UD Pockets to UDP<UnitId>. Systems already in use will only be affected after reset to factory defaults.
- Improved add-on license handling: A message is shown if OS12 App requires add-on license which is not present / available via UMS.
- Updated kernel to version 6.1.63.

- **OSC Installer**

	- Added support for custom Unit ID rules. This offers possibility to choose appropriate MAC address of an internal network interface as Unit ID. Please visit the Knowledge Base for further details and how to use this feature.

- **App Management**

	- Added support for automatic update on boot and automatic update on calendar time. The following parameters were introduced for corresponding configuration.
```

| Parameter | Registry | Type | Value |
| ------ | ------ | ------ | ------ |
| `Check for and download updates for non pinned apps on given calendar time, use the crontab syntax to specify the calendar time` | `update.auto_update_calendar` | string | *empty* |
| `Check for and download updates for non pinned apps on boot` | `update.auto_update_on_boot` | bool | *enabled* (default) / disabled |

```
- **Network**

	- Added MACsec (IEEE 802.1AE) support in dynamic CAK mode.
	- Updated Lenovo FCC unlock tool for support of Quectel EM05 chipset - used on several Lenovo devices.

- **Open VPN**

	- Updated cipher configuration of Open VPN -  and added possibility to specify data-ciphers list. By default the default cipher list AES-256-GCM:AES-128-GCM:CHACHA20-POLY1305 is active. Otherwise, custom list can be specified in the Data ciphers parameter. Enter the ciphers separated with ':'. The existing parameter 'Cipher' is outdated and therefore removed.
```

| Setup | Parameter | Registry | Value |
| ------ | ------ | ------ | ------ |
| `Network > VPN > Open VPN > Connection > Options` | `Data ciphers` | `sessions.openvpn%.vpnopts.data_ciphers` | empty *{*}Default{*}* |
| `Network > VPN > Open VPN > Connection > Options` | `Use default data cipher list` | `sessions.openvpn%.vpnopts.use_default_cipher_list` | *on* / off |

```
- **HID**

	- Updated ELO touch driver to version 5.2 for single-touch - and version 4.3 for multi-touch.

- **X11 system**

	- Changed registry default to activate DRI3 as default.
```

|  Parameter  |  Registry   |  Type       |  Value      |
| ------ | ------ | ------ | ------ |
|  `Use DRI3`  |  `x.drivers.use_dri3`  |  bool  |  *enabled* (default) / disabled  |

```
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
```

| Parameter | Registry | Type | Value |
| ------ | ------ | ------ | ------ |
| `Azure AD Tenant Name/ID (deprecated)` | `auth.cloudidp.aad_tenant` | string | empty *Default* |
| `Identity Provider URL (deprecated)` | `auth.cloudidp.idpurl` | string | empty *Default* |
| `Client/Application ID (deprecated)` | `auth.cloudidp.client_id` | string | empty *Default* |
| `Client secret (deprecated)` | `auth.cloudidp.client_secret` | string | empty *Default* |

```
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
```

-----

## 2023-11-20 - [12.2.2](readme12.2.2.txt)

```
The new BUILD 12.02.2 for IGEL Workspace is ready.

These are the release notes published with that release:

# Changes since: 12.2.1

## New Features

- **OSC Installer**

	- Added support for custom Unit ID rules. This offers possibility to choose appropriate MAC address of an internal network interface as Unit ID. Please visit the Knowledge Base for further details and how to use this feature.

- **HID**

	- Updated ELO touch driver to version 5.2 for single-touch - and version 4.3 for multi-touch.
	- Added support for usage of more than one touchscreen (without calibration for now).
- **Hardware**

	- Validated 256GB 2230 PCIe NVMe module for HP t550 and t655.
	- Validated 256GB 2280 PCIe NVMe module for HP t550 and t655.
	- Validated 512GB 2280 PCIe NVMe module for HP t550 and t655.

## Security Fixes

- Fixed open-vm-tools security issues CVE-2023-34059 and CVE-2023-34058.
- Fixed vim security issues CVE-2023-5535, CVE-2023-5441, CVE-2023-5344, CVE-2023-4781, CVE-2023-4752, CVE-2023-4751, CVE-2023-4750, CVE-2023-4735, CVE-2023-4733, CVE-2022-4293, CVE-2022-4292, CVE-2022-3705, CVE-2022-3591, CVE-2022-3520, CVE-2022-3352, CVE-2022-3324, CVE-2022-3256 and CVE-2022-3234.
- Fixed procps security issue CVE-2023-4016.
- Fixed llvm-toolchain-15 security issues CVE-2023-29939, CVE-2023-29934, CVE-2023-29933 and CVE-2023-29932.
- Fixed aom security issues CVE-2021-30475, CVE-2021-30474, CVE-2021-30473, CVE-2020-36135, CVE-2020-36133, CVE-2020-36131 and CVE-2020-36130.
- Fixed mysql-8.0 security issues CVE-2023-22114, CVE-2023-22112, CVE-2023-22103, CVE-2023-22097, CVE-2023-22092, CVE-2023-22084, CVE-2023-22079,
- Fixed samba security issues CVE-2023-42669, CVE-2023-4154 and CVE-2023-4091.
- Fixed openssl security issues CVE-2023-3817 and CVE-2023-3446.
- Fixed tiff security issue CVE-2023-1916.
- Fixed opensc security issues CVE-2023-4535, CVE-2023-40661 and CVE-2023-40660.
- Fixed python-urllib3 security issues CVE-2023-45803 and CVE-2023-43804.
- **X server**
	- Fixed X.Org-server security issues CVE-2023-5574, CVE-2023-5380 and CVE-2023-5367.

## Resolved Issues

- Fixed IGEL OS version showed in System Information accessory.

- **Chromium**

	- Fixed Chromium not being able to import certificates with spaces in file name.

- **HID**

	- Fixed handling of ELO touch devices in multi-monitor configuration.

## Known Issues

- Display Configurator may show hotplugged monitors as disabled.
- Issues may occur if monitors are connected via docking station.
	- In general: Monitor hotplug not stable yet and can trigger misconfiguration.
- If assigned app is not available in App Portal, there is no error notification on IGEL OS desktop.
- The downgrade to base system 12.00.900 or 12.00.910 is not supported.
- In very rare cases all apps are lost after an update. Should this be the case, an error message is shown "Opening system App Journal failed." - if the device is manged, the apps will be reinstalled after a reboot.
- Display Configurator: Rotation of displays connected to the Lenovo ThinkPad USB-C Hybrid Dock can fail.
- Display configuration of displays connected to HP G5 Docking Station may fail on HP t655.
- If different power plans are configured for battery and ac mode, change is not triggered to configured plan once power supply get plugged or unplugged. So far, this issue is known for following device:
	- Lenovo K14 Gen1 (AMD)

- **Citrix**

	- In regards of CVE-2023-41993, CVE-2023-39928 & CVE-2023-41074: Older Webkit libraries are used in Citrix for compatibility reasons.
	- More details in a Knowledge Base via [https://kb.igel.com/securitysafety/en/isn-2023-25-webkit-vulnerabilities-101066782.html]

- **Network**

	- The enumeration of ethernet-interfaces does not match between Setup and the system-tray.
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

- **Licensing**

	- Manual deployment of add-on licenses for IGEL Agent for Imprivata licenses (via UMS) is only possible after finished installation of IGEL Agent for Imprivata app on device.

- **igel-system-tray**

	- Some touchpads are recognized as touchpad and mouse. This results in showing possible user settings for both variants.
```

-----

## 2023-10-31 - [12.2.1](readme12.2.1.txt)

```
The new BUILD 12.02.1 for IGEL Workspace is ready.

These are the release notes published with that release:

# Changes since: 12.2.0

## New Features

- **Hardware**

	- Validated support for LG USB-C Universal Docking.
	- Validated hardware support for Poly Blackwire 5220 and Poly EncorePro 320 USB Headsets.
	- Added hardware support for Lenovo ThinkPad L14 and L15 Gen4 AMD/Intel
	- Added hardware support for Lenovo ThinkStation P3 Tiny.
	- Added hardware support for LG 24CR670I AiO.

- **Modern Desktop**

	- It is now possible to configure the time zone in the calendar tray app. The new feature can be disabled by parameter system.time.timezone_in_tray.

## Security Fixes

- Fixed libwebp security issue CVE-2023-4863 (initial only Chromium related) and CVE-2023-5129.
- Fixed open-vm-tools security issues CVE-2023-20900 and CVE-2023-20867.
- Fixed vim security issues CVE-2022-3099, CVE-2022-3037, CVE-2022-3016, CVE-2022-2598, CVE-2022-2289, CVE-2022-2287, CVE-2022-2286, CVE-2022-2285, CVE-2022-2284, CVE-2022-2264, CVE-2022-2257, CVE-2022-2210 and CVE-2022-2208.
- Fixed gawk security issue CVE-2023-4156.
- Fixed bind9 security issue CVE-2023-3341.
- Fixed cjose security issue CVE-2023-37464.
- Fixed flac security issue CVE-2020-22219.
- Fixed ghostscript security issues CVE-2023-38559, CVE-2020-21890 and CVE-2020-21710.
- Fixed mysql-8.0 security issues CVE-2023-22058, CVE-2023-22057, CVE-2023-22056, CVE-2023-22054, CVE-2023-22053, CVE-2023-22048, CVE-2023-22046, CVE-2023-22038, CVE-2023-22033, CVE-2023-22008 and CVE-2023-22005.
- Fixed poppler security issues CVE-2022-27337, CVE-2020-36024 and CVE-2020-36023.
- Fixed librsvg security issue CVE-2023-38633.
- Fixed tiff security issues CVE-2023-38289, CVE-2023-38288, CVE-2023-3618, CVE-2023-3316, CVE-2023-2908, CVE-2023-26966, CVE-2023-26965, CVE-2023-25433 and CVE-2022-48281.
- Fixed cups security issues CVE-2023-4504 and CVE-2023-32360.
- Fixed curl security issue CVE-2023-38039.
- Fixed krb5 security issue CVE-2023-36054.
- Fixed qemu security issues CVE-2023-4135, CVE-2023-40360, CVE-2023-3354, CVE-2023-3255, CVE-2023-3180 and CVE-2023-2861.
- Fixed libvpx security issues CVE-2023-5217 and CVE-2023-44488.
- Fixed libx11 security issues CVE-2023-43787, CVE-2023-43786 and CVE-2023-43785.
- Fixed libxpm security issues CVE-2023-43789, CVE-2023-43788, CVE-2023-43787 and CVE-2023-43786.
- Fixed webkit2gtk security issues CVE-2023-41993, CVE-2023-41074, CVE-2023-40451, CVE-2023-39928, CVE-2023-39434 and CVE-2023-35074.
- Fixed curl security issues CVE-2023-38546 and CVE-2023-38545.
- Fixed ghostscript security issue CVE-2023-43115.

## Resolved Issues

- Fixed screen lagging issue with Dell Latitude 7430
- Added possibility to configure Intel PSR setting over IGEL registry
```

|  Parameter  |  Registry   |  Range      |  Value      |
| ------ | ------ | ------ | ------ |
|  `Change settings for intel PSR (panel self refresh).`  |  `x.drivers.intel.psr`  |  [Default][Disable][Enable][Use only up to PSR1][Use up to PSR2]  |  *Default*  |

```
- Added old Single Sign-On configuration parameters for backward compatibility.
```

| Parameter | Registry | Type | Value |
| ------ | ------ | ------ | ------ |
| `Azure AD Tenant Name/ID (deprecated)` | `auth.cloudidp.aad_tenant` | string | empty *Default* |
| `Identity Provider URL (deprecated)` | `auth.cloudidp.idpurl` | string | empty *Default* |
| `Client/Application ID (deprecated)` | `auth.cloudidp.client_id` | string | empty *Default* |
| `Client secret (deprecated)` | `auth.cloudidp.client_secret` | string | empty *Default* |

```
- Fixed immediate wakeup issue after shutdown on some HP mt645 G7.
- Fix handling of proxy configurations with a protocol like "http://". If no protocol is specified the system will add "http://" otherwise the specified protocol will be used.
- The Setup Assistant now shows the base system version in the new scheme/format.
- Fixed label and tooltip of parameter "Deny shadowing via external VNC tool" on page System>Remote Access>Shadow. Before this fix the meaning was the opposite, which was wrong.

- **App Management**

	- Show all app installation errors as notification locally on the IGEL OS, before only errors during downloading were shown locally

- **Hardware**

	- Fixed function key F8 for microphone on/off on HP mt645 G7.


- **Remote Management**

	- Fixed applying of received settings during boot, the applying could sporadically block in a dead-lock and the received settings will be not applied then.

- **IGEL Desktop**

	- Mobile broadband configuration dialogue in IGEL OS Setup-Assistant and Config-Dialog was updated.
	- Fixed missing suspend button text in suspend confirmation dialog when suspend timeout is triggered

- **igel-system-tray**

	- If the Wi-Fi automatic switch is enabled and Wi-Fi got disabled because of an active LAN connection, the user is no longer allowed to manually turn Wi-Fi on in the wifi-system-tray.

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

- **Citrix**

	- Regarding CVE-2023-41993, CVE-2023-39928 & CVE-2023-41074: For compatibility with Citrix, older Webkit libraries are used instead of the latest ones to continue working properly.
	- More information: [https://kb.igel.com/securitysafety/en/isn-2023-25-webkit-vulnerabilities-101066782.html]

- **Network**

	- The enumeration of ethernet-interfaces is not matching between the Setup and the system-tray.
	- In some cases the network is not working with the combination of the Lenovo K14 Gen1 (AMD) and the Lenovo Universal Dock. There is a kernel bugreport open which no proper fix up to now.

- **Audio**

	- LG 34CN650 Headset mic via jack is not working
	- LG 27CN650 Headset mic via jack is not working

- **Hardware**

	- Wake on LAN is not functional on Dell OptiPlex 3000 and Lenovo K14 Gen1
	- Built-in fingerprint sensor is not supported on HP mt440 and mt645.
	- If using 6 x 4K@60Hz monitors on a t755/t740 with the additional graphic card one or two of the monitors may stay black after coming back from DPMS off state.
	- This is caused by using the additional graphic card as primary one which only have 512MB VRAM (the VRAM is not enough in this configuration)
	- The solution here is:

	  -* Go to the BIOS and increase the VRAM size of the iGPU to 2048MiB (maybe 1024MiB may also work)
	  -* Activate the IGEL registry key *x.drivers.swap_card0_with_card1* so the iGPU will become the Primary GPU. Please be aware that the connector names will change then.

	- Wake up from suspend via UMS does not work on HP mt645 devices. Workaround: Disable system suspend and use shutdown instead.

- **IGEL Desktop**

	- On-screen keyboard sporadically crashes when typing.
	- XFWM4 composite manager can break screen lock and enables sporadically access to open applications. It is recommended to not enable registry key windowmanager.wm0.variables.usecompositing. The composite manager is disabled by default.
	- Closing shutdown dialog requires a double ESC key press.
	- When trying to configure two monitors in a vertical layout (one above the other), and those monitors are configured with "auto-detect" resolution, then saving leads to a wrong layout order.

- **Licensing**

	- Manual deployment of add-on licenses for IGEL Agent for Imprivata licenses (via UMS) is only possible after finished installation of IGEL Agent for Imprivata app on device.
```

-----

## 2023-09-12 - [12.2.0](readme12.2.0.txt)

```
The new BUILD 12.02.0 for IGEL Workspace is ready.

These are the release notes published with that release:

# Changes since: 12.01.140

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
```

-----

## 2023-07-20 - [12.01.140](readme12.01.140.1.txt)

```
The new BUILD 12.01.140 for IGEL Workspace is ready.

These are the release notes published with that release:

# Changes since: 12.01.120 BUILD 1

## New Features

- Added handling of add-on license for IGEL Agent for Imprivata

## Resolved Issues

- Fixed AD passthrough authentication for Citrix sessions.
- Fixed freeze during boot if more than 10 wireless interfaces were created.

- **Hardware**

	- Fixed system suspend on Lenovo K14 Gen1.

- **Remote Management**

	- Fixed: User interactions in UMS-triggered notifications are directly effective now (without timeout).

## Known Issues

- Display Configurator may show hotplugged monitors as disabled.
- Issues may occur if monitors are connected via docking station.
	- In general: Monitor hotplug not stable yet and can trigger misconfiguration.
- If assigned app is not available in App Portal, there is no error notification on IGEL OS desktop.
- The downgrade to base system 12.00.900 or 12.00.910 is not supported.
- Display Settings setup page:
	- There is no monitor info button available yet.
- In very rare cases all apps are lost after an update. Should this be the case, an error message is shown "Opening system App Journal failed." - if the device is manged, the apps will be reinstalled after a reboot.
- SSO with Okta user account does not work as expected if two or more Chromium sessions open the Okta web profile.
- Network related warnings / error messages are shown for authentication of local user (which is not a network-based authentication).
- Network disconnection during SSO requires a manual restart of SSO process via provided 'restart single sign-on' button - after (re-)established network connection.

- **OSC Installer**

	- Deployment of initial settings via OS Creator does not work reliable (yet).

- **Open VPN**

	- VMware Horizon Teams Optimization is not functional if connected via OpenVPN.

- **Imprivata**

	- After installation of IGEL Agent for Imprivata, an additional / second reboot is necessary to get the feature licensed and functional.

- **Audio**

	- Lenovo K14 Gen1 internal microphone is not working.
	- LG 34CN650 Headset mic via jack is not working
	- LG 27CN650 Headset mic via jack is not working

- **Hardware**

	- System suspend is not supported on
		- LG 24CN650
		- LG 27CN650
		- LG 34CN650
		- IGEL UD7-LX11 (H850C)
	- Wake on LAN is not functional on Dell OptiPlex 3000 and Lenovo K14 Gen1

- **IGEL Desktop**

	- On-screen keyboard sporadically crashes when typing.
	- On-screen keyboard is not supported in Setup Assistant yet.
	- XFWM4 composite manager can break screen lock and enables sporadically access to open applications. It is recommended to not enable registry key windowmanager.wm0.variables.usecompositing. The composite manager is disabled by default.

- **Licensing**

	- UD Pocket Starter License is not deployed at first boot.
	- Manual deployment of IGEL Agent for Imprivata licenses to devices in UMS is only possible after the installation of the IGEL Agent for Imprivata app on the device has finished.
```

-----

## 2023-06-12 - [12.01.120](readme12.01.120.1.txt)

```
The new BUILD 12.01.120 for IGEL Workspace is ready.

These are the release notes published with that release:

# Changes since: 12.01.110 BUILD 1

## New Features

## Security Fixes

- Fixed heimdal security issue CVE-2022-45142.
- Fixed samba security issues CVE-2023-0922, CVE-2023-0614, CVE-2022-45141, CVE-2022-44640, CVE-2022-42898, CVE-2022-38023, CVE-2022-37967, CVE-2022-37966, CVE-2022-3796 and CVE-2022-3437.
- Fixed net-snmp security issues CVE-2022-44793, CVE-2022-44792 and CVE-2022-4479.
- Fixed openssl security issues CVE-2023-0466, CVE-2023-0465, CVE-2023-0464, CVE-2023-0286, CVE-2023-0215, CVE-2022-4450 and CVE-2022-4304.
- Fixed tar security issue CVE-2022-48303.
- Fixed curl security issues CVE-2023-27538, CVE-2023-27537, CVE-2023-27536, CVE-2023-27535, CVE-2023-27534 and CVE-2023-27533.
- Fixed ghostscript security issue CVE-2023-28879.
- Fixed cups-filters security issue CVE-2023-24805.

## Resolved Issues

- Fixed notification for session autostart
- Fixed: SSO with Okta in Chromium functional over browser restarts.
- Fixed autostart notifications for apps.
- Fixed system suspend on HP MT645
- Fixed system suspend on Lenovo K14 Gen1
- **Network**
	- Fixed tray icon for Fibocom L860-GL-16 LTE Module
- **Remote Management**
	- Fixed configuration of additional WiFi networks (if configured via UMS).

## Known Issues

- Display Configurator may show hotplugged monitors as disabled.
- Issues may occur if monitors are connected via docking station.
	- In general: Monitor hotplug not stable yet and can trigger misconfiguration.
- System suspend is not supported on
	- LG 24CN650
	- LG 27CN650
	- LG 34CN650
	- IGEL UD7-LX11 (H850C)
- Wake on LAN is not functional on Dell OptiPlex 3000 and Lenovo K14 Gen1
- Lenovo K14 Gen1 internal microphone is not working.
- LG 34CN650 Headset mic via jack is not working
- LG 27CN650 Headset mic via jack is not working
- If assigned app is not available in App Portal, there is no error notification on IGEL OS desktop.
- On-screen keyboard sporadically crashes when typing.
- The downgrade to base system 12.00.900 or 12.00.910 is not supported.
- Display Settings setup page:
	- There is no monitor info button available yet.
- UD Pocket Starter License is not deployed at first boot.
- XFWM4 composite manager can break screen lock and enables sporadically access to open applications. It is recommended to not enable registry key windowmanager.wm0.variables.usecompositing. The composite manager is disabled by default.
- In very rare cases all apps are lost after an update. Should this be the case, an error message is shown "Opening system App Journal failed." - if the device is manged, the apps will be reinstalled after a reboot.
- SSO with Okta user account does not work as expected if two or more Chromium sessions open the Okta web profile.
- Network related warnings / error messages are shown for authentication of local user (which is not a network-based authentication).
- Network disconnection during SSO, needs a manual restart of SSO process using provided restart single sign-on button, after network connection.
- SSO configuration fields keep their value after changing of Identity Provider.

- **Open VPN**
	- VMware Horizon Teams Optimization is not functional if connected via OpenVPN.

- **Imprivata**
	- After installation of the IGEL Imprivata Agent there is an additional second reboot necessary to get the feature licensed and functional.

- **Igel Desktop**
	- On-screen keyboard is not supported in Setup Assistant yet.
```

-----

## 2023-04-17 - [12.01.110](readme12.01.110.1.txt)

```
The new BUILD 12.01.110 for IGEL Workspace is ready.

These are the release notes published with that release:

# Changes since: 12.01.100 BUILD 1

# New Features

- Updated EULA to version of April 2023

## Resolved Issues

- **Hardware**

	- Fixed hardware detection of LG CQ600I-6N device.

## New Features

- Added SSO login for Azure AD IdP using web context.

- Added setup parameter, required to set if Okta is selected as IdP.
```

| Parameter | Registry | Type | Value |
| ------ | ------ | ------ | ------ |
| `Client secret` | `auth.cloudidp.client_secret` | string | empty *Default* |

```
- Introduced new setup parameter, required to be set if Azure AD is selected as IdP.
```

| Parameter | Registry | Type | Value |
| ------ | ------ | ------ | ------ |
| `Azure AD Tenant Name/ID` | `auth.cloudidp.aad_tenant` | string | empty *Default* |

```
- Added IGEL Add-On License support.

- Changed touchpad parameter name from `Enable Touchpad` to `Enable Touchpad on Boot` which make it more obvious what is meant here.
```

|  Setup  |  Parameter  |  Tooltip  |  Registry   |  Type       |  Value      |
| ------ | ------ | ------ | ------ | ------ | ------ |
|  `User Interface > Input > Touchpad`  |  `Enable Touchpad on Boot`  |  `Can be overruled by Hotkey.`  |  `userinterface.touchpad.general.TouchpadEnable`  |  bool  |  *enabled* (default) / disabled  |

```
- Also changed function of TouchpadOff registry key to only be used to switch on and off the tapping.
```

|  Setup  |  Parameter  |  Registry   |  Range      |  Value      |
| ------ | ------ | ------ | ------ | ------ |
|  `User Interface > Input > Touchpad`  |  `Tapping Mode`  |  `userinterface.touchpad.general.TouchpadOff`  |  [With tapping][Without tapping]  |  *With tapping*  |

```
- Added new registry key to set left-hand on touchpad devices
```

|  Parameter  |  Registry  |  Type  |  Value  |
| ------ | ------ | ------ | ------ |
|  `Left hand`  |  `userinterface.touchpad.general.LeftHand`  |  bool  |  *disabled* (default)/enabled |

```
- Added WiFi Regulatory Domain configuration to Setup Assistant.

- Added setup parameter to enable/disable debugging mode of SSO related services and programs.
```

| Parameter | Registry | Type | Value |
| ------ | ------ | ------ | ------ |
| `Enable Debugging of Single Sign-On` | `debug.auth.cloudidp_debug` | bool | enabled / *disabled* (default) |

```
- Added registry key to enable natural scrolling
```

| Parameter | Registry | Type | Value |
| ------ | ------ | ------ | ------ |
| `Natural Scroll` | `userinterface.touchpad.general.naturalscroll` | bool | *disabled* (default)/enabled |

```
- Added parameter to adjust position of shadow indicator popup window.
```

| IGEL Setup | Parameter | Registry | Range |
| ------ | ------ | ------ | ------ |
| System > Remote Access > Shadow | `Position of the indicator` | `userinterface.vncserver.indicatorposition` | [Bottom left][ *Bottom right* ][Top left][Top right] |

```
- Added setup option to disable Single-Sign-On URL restrictions for debugging purposes.
```

| Parameter | Registry | Type | Value |
| ------ | ------ | ------ | ------ |
| `Disable Single Sign-On URL Restrictions` | `debug.auth.cloudidp_disable_url_restrictions` | bool | enabled / *disabled* (default) |

```
- Updated EULA to version of April 2023

- **App Management**

	- Added: Automatic up- / downgrade is not allowed for pinned apps (assigned via UMS). Base System version is always pinned - even if not assigned via UMS.

- **X11 system**

	- Fixed default mirror mode from Panning to Scale down
```

|  Parameter  |  Registry   |  Range      |  Value      |
| ------ | ------ | ------ | ------ |
|  `Choose the mode which should be used for mirroring monitors if resolution differs.`  |  `x.xserver%.mirror_mode`  |  [Panning][Biggest common resolution][Scaling][Scaling down]  |  *Scaling down*  |

```
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
```

-----