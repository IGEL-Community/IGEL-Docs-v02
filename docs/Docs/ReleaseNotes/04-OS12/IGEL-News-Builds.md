# IGEL News: Builds OS 12

**NOTE:**

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

	|  Parameter  |  Registry   |  Range      |  Value      |
	| ------ | ------ | ------ | ------ |
	|  `Change settings for intel PSR (panel self refresh).`  |  `x.drivers.intel.psr`  |  [Default][Disable][Enable][Use only up to PSR1][Use up to PSR2]  |  *Default*  |

- Added old Single Sign-On configuration parameters for backward compatibility.

	| Parameter | Registry | Type | Value |
	| ------ | ------ | ------ | ------ |
	| `Azure AD Tenant Name/ID (deprecated)` | `auth.cloudidp.aad_tenant` | string | empty *Default* |
	| `Identity Provider URL (deprecated)` | `auth.cloudidp.idpurl` | string | empty *Default* |
	| `Client/Application ID (deprecated)` | `auth.cloudidp.client_id` | string | empty *Default* |
	| `Client secret (deprecated)` | `auth.cloudidp.client_secret` | string | empty *Default* |

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
```

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

| Parameter | Registry | Type | Value |
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