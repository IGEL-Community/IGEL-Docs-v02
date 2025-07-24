IGEL OS Creator  
===============

Firmware version 12.01.120.1  
Release date 2023-06-05  
Last update of this document 2023-06-05  


Supported Devices  
-------------------------------------------------------------------------------

[> Supported IGEL OS 12 devices](https://kb.igel.com/os12-supported-hardware)


Component Versions
-------------------------------------------------------------------------------

| Components                                |                                  |
|-------------------------------------------|----------------------------------|
| OpenSSL                                   | 1.1.1f-1ubuntu2.18               |
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
| Kernel                                    | 6.1.5 #mainline-lxos12-g1682595586   |
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


Release Notes of installable IGEL OS 12 base system  
================================================================================

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


