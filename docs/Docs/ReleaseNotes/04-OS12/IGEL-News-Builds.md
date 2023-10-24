# IGEL News: Builds OS 12

**NOTE:**

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