# IGEL News: Builds

**NOTE:**

```
********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with each release:
```

-----

## 2023-03-30 - [11.08.290](readme11.08.290.txt)


```
The new BUILD 11.08.290 for IGEL Workspace is ready.

This build is based on 11.08.230.

These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------

### Citrix

* Added Citrix Workspace App 2302.
* New features:  
* Screen pinning in custom web stores [Technical Preview]

+------------+-----------------------------------------------------------------+
|Parameter   |`Multi-monitor support`                                          |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.authman.screenpinenabled`                                   |
+------------+-----------------------------------------------------------------+
|Value       |disabled(default)/enabled                                        |
+------------+-----------------------------------------------------------------+

* Available Citrix workspace apps: 23.02 (default), 22.11, and 20.10

### Citrix NSGClient

* Added Citrix EPA client for Netscaler analysis.  
  No configuration necessary. When the Netscaler URL is opened in the browser
  (Chromium or Firefox), the NSEPA checks configured in Netscaler are performed
  automatically.  
  Dynamic updates are not possible in IGEL OS, due to the read-only system.
  Therefore, the option "Linux EPA Plugin Upgrade" must be set to "Never" in
  Netscaler.  
  
* Added Citrix NSGClient client for Netscaler VPN connections.  
  No configuration necessary. When the Netscaler URL is called in the browser
  (Chromium or Firefox), the NSGClient is configured automatically. Additionally
  a desktop icon can be configured by adding an instance of sessions.nsgclient%

### AVD

* Updated AVD client to version 1.1.12 with MS-Teams screen share and tcp buffer
  bump fixes.

### VMware Horizon

* Updated VMware Horizon client to version 2212-8.8.0-21079016
* Fixed vmware-view protocol handler used for federated (SAML-based)
  authentication.
* Added support for the monitors option to specify which monitors (and in what
  order) are to be used for a all-monitros fullscreen mode.  
  Furthermore, added minimized launch of the client window and the use of the
  useExisting option for letting  
  the client use an already running client to start a new desktop or app
  session.

+------------+-----------------------------------------------------------------+
|Parameter   |`Specify a list of monitor numbers you want to use in all-monitors fullscreen mode` |
+------------+-----------------------------------------------------------------+
|Registry    |`vmware.view.use-monitors`                                       |
+------------+-----------------------------------------------------------------+
|Type        |string                                                           |
+------------+-----------------------------------------------------------------+
|Value       |empty **Default**                                                |
+------------+-----------------------------------------------------------------+
|Parameter   |`Specify a list of monitor numbers you want to use in all-monitors fullscreen mode` |
+------------+-----------------------------------------------------------------+
|Registry    |`sessions.vdm_client%.options.use-monitors`                      |
+------------+-----------------------------------------------------------------+
|Type        |string                                                           |
+------------+-----------------------------------------------------------------+
|Value       |empty **Default**                                                |
+------------+-----------------------------------------------------------------+
|Parameter   |`Use an already running Horizon session to start apps or desktops` |
+------------+-----------------------------------------------------------------+
|Registry    |`vmware.view.use-existing`                                       |
+------------+-----------------------------------------------------------------+
|Range       | [on][off]                                                       |
+------------+-----------------------------------------------------------------+
|Value       |**off**                                                          |
+------------+-----------------------------------------------------------------+
|Parameter   |`Use an already running Horizon session to start apps or desktops` |
+------------+-----------------------------------------------------------------+
|Registry    |`sessions.vdm_client%.options.use-existing`                      |
+------------+-----------------------------------------------------------------+
|Range       | [Global setting][on][off]                                       |
+------------+-----------------------------------------------------------------+
|Value       |**Global setting**                                               |
+------------+-----------------------------------------------------------------+
|Parameter   |`Run Horizon client in minimized mode`                           |
+------------+-----------------------------------------------------------------+
|Registry    |`vmware.view.launch-minimized`                                   |
+------------+-----------------------------------------------------------------+
|Range       | [on][off]                                                       |
+------------+-----------------------------------------------------------------+
|Value       |**off**                                                          |
+------------+-----------------------------------------------------------------+
|Parameter   |`Run Horizon client in minimized mode`                           |
+------------+-----------------------------------------------------------------+
|Registry    |`sessions.vdm_client%.options.launch-minimized`                  |
+------------+-----------------------------------------------------------------+
|Range       | [Global setting][on][off]                                       |
+------------+-----------------------------------------------------------------+
|Value       |**Global setting**                                               |
+------------+-----------------------------------------------------------------+

### Parallels Client

* Updated Parallels client to version 19.1.1.

### HP Anyware

* Updated HP Anyware PCoIP Software Client to version 23.01.1  
* Added new parameter in registry for enabling high-performance options

+------------+-----------------------------------------------------------------+
|Parameter   |`Enable high performance on endpoint`                            |
+------------+-----------------------------------------------------------------+
|Registry    |`pcoip.high_performance`                                         |
+------------+-----------------------------------------------------------------+
|Type        |bool                                                             |
+------------+-----------------------------------------------------------------+
|Value       |enabled / **disabled** (default)                                 |
+------------+-----------------------------------------------------------------+
|Parameter   |`Enable PCoIP Ultra on host`                                     |
+------------+-----------------------------------------------------------------+
|Registry    |`pcoip.ultra`                                                    |
+------------+-----------------------------------------------------------------+
|Range       | [Off][CPU Offload][GPU Offload][Auto]                           |
+------------+-----------------------------------------------------------------+
|Value       |**Off**                                                          |
+------------+-----------------------------------------------------------------+

### Firefox

* Updated Firefox to version 102.8.0.

### Network

* Added check if BIOS has Wake-on-LAN disabled. If disabled, it is not
  recommended to configure network interface to use WoL.  
** Registry key:

+------------+-----------------------------------------------------------------+
|Parameter   |`Respect the BIOS WoL setting so if disabled reflect this for the linux network devices settings.` |
+------------+-----------------------------------------------------------------+
|Registry    |`network.interfaces.respect_bios_wol_setting`                    |
+------------+-----------------------------------------------------------------+
|Type        |bool                                                             |
+------------+-----------------------------------------------------------------+
|Value       |**enabled** (default) / disabled                                 |
+------------+-----------------------------------------------------------------+

* This check is only supported / possible on Lenovo devices with official IGEL
  OS hardware support.

### WiFi

* Added: Set default wireless regulatory domain on HP devices, based on product
  option code.

### HID

* Changed touchpad parameter name from `Enable Touchpad` to `Enable Touchpad on
  Boot` - just to clarify what is meant here.

+------------+-----------------------------------------------------------------+
|Setup       |`User Interface > Input > Touchpad`                              |
+------------+-----------------------------------------------------------------+
|Parameter   |`Enable Touchpad on Boot`                                        |
+------------+-----------------------------------------------------------------+
|Tooltip     |`Can be overruled by Hotkey.`                                    |
+------------+-----------------------------------------------------------------+
|Registry    |`userinterface.touchpad.general.TouchpadEnable`                  |
+------------+-----------------------------------------------------------------+
|Type        |bool                                                             |
+------------+-----------------------------------------------------------------+
|Value       |**enabled** (default) / disabled                                 |
+------------+-----------------------------------------------------------------+

* Furthermore, changed function of TouchpadOff registry key. This is now only
  used used for switching on and off tapping.

+------------+-----------------------------------------------------------------+
|Setup       |`User Interface > Input > Touchpad`                              |
+------------+-----------------------------------------------------------------+
|Parameter   |`Tapping Mode`                                                   |
+------------+-----------------------------------------------------------------+
|Registry    |`userinterface.touchpad.general.TouchpadOff`                     |
+------------+-----------------------------------------------------------------+
|Range       | [With tapping][Without tapping]                                 |
+------------+-----------------------------------------------------------------+
|Value       |**With tapping**                                                 |
+------------+-----------------------------------------------------------------+

### CUPS Printing

* Updated PrinterLogic (Vasion) PrinterInstallerClient to version 25.1.0.625

### Cisco Webex

* Integrated Cisco Webex VDI 43.2  
  
  Note: Webex VDI requires a compatible Webex Meetings plugin installed in the
  client.
* Integrated Cisco Webex Meetings VDI Plugin 43.2.1.18  
  Available Webex Meetings Plugins in this release: 43.2.1.18 (default),
  42.10.8.14 and 42.6.11.6

### Cisco JVDI Client

* Integrated Cisco JVDI 14.1.3.307560

### Base system

* Updated sscep to version 0.10.0
* Added CPU temperature monitoring tools:  
  Graphical tool /usr/bin/psensor  
  Command line tool /usr/bin/sensors
* Changed the default mem sleep mode to deep as some devices defaults to s2idle
  which cases issues.  
* Added new registry key to set the suspend mem sleep mode.

+------------+-----------------------------------------------------------------+
| Parameter  | `Set suspend mem sleep mode.`                                   |
+------------+-----------------------------------------------------------------+
| Registry   | `system.suspend.sleep_mode`                                     |
+------------+-----------------------------------------------------------------+
| Range      | [Suspend to RAM][Suspend to idle]                               |
+------------+-----------------------------------------------------------------+
| Value      | **Suspend to RAM**                                              |
+------------+-----------------------------------------------------------------+

* Updated DriveLock Agent to version 22.2.2.42489 (2022.2).
* Added for LVFS Bios update support:  
** Improved version detection of installed BIOS version with fwupd.  
** Added registry key for enabling installion of not signed BIOS files

+------------+-----------------------------------------------------------------+
|Parameter   |`Allow only signed cab files (sometimes this must be switched off as not all BIOS files are signed).` |
+------------+-----------------------------------------------------------------+
|Registry    |`fwtools.bios_tools.allow_only_trusted`                          |
+------------+-----------------------------------------------------------------+
|Type        |bool                                                             |
+------------+-----------------------------------------------------------------+
|Value       |**enabled** (default) / disabled                                 |
+------------+-----------------------------------------------------------------+

* Added registry key to enable bluetooth debugging messages.

+------------+-----------------------------------------------------------------+
|Parameter   |`Activate bluetooth debugging.`                                  |
+------------+-----------------------------------------------------------------+
|Registry    |`devices.bluetooth.debug`                                        |
+------------+-----------------------------------------------------------------+
|Type        |bool                                                             |
+------------+-----------------------------------------------------------------+
|Value       |enabled / **disabled** (default)                                 |
+------------+-----------------------------------------------------------------+

### CID Key Agent

* Update of Stratusphere Connector ID Key to version 6.6.2-3

### X11 system

* Added new registry key to activate tear-free for modesetting driver

+------------+-----------------------------------------------------------------+
| Parameter  | `Enable tear free option for modesetting driver`                |
+------------+-----------------------------------------------------------------+
| Registry   | `x.drivers.modesetting.use_tear_free`                           |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | enabled / **disabled** (default)                                |
+------------+-----------------------------------------------------------------+

### Multimedia

* Added VP9 video hardware acceleration.
* Added new registry key to switch from fluendo to vaapi gstreamer plugin for
  h264 hardware acceleration.

+------------+-----------------------------------------------------------------+
| Parameter  | `Switch from Fluendo to VAAPI h264 hardware accelerated decoder.` |
+------------+-----------------------------------------------------------------+
| Registry   | `multimedia.gstreamer.use_vaapi_for_h264`                       |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | enabled / **disabled** (default)                                |
+------------+-----------------------------------------------------------------+

### zoomvdi

* Updated Zoom VDI plugin to version 5.13.1.22610 and 5.12.6.22200  
  Available Zoom VDI plugins in this release: 5.13.1.22610 (default),
  5.12.6.22200 and 5.8.4.21112
* Updated Zoom VDI plugin 5.13.10.23090  
  Available plugins in this release: 5.13.10.23090 (default), 5.12.6.22200 and
  5.8.4.21112

### Hardware

* Added hardware support for HP USB-C G5 ESSENTIAL DOCK
* Added hardware support for Lenovo ThinkCentre Neo50q Gen 4 (Celeron) device.  
* Added hardware support for Lenovo ThinkCentre Neo50q Gen 4 (i3) device.
* Added hardware support for Lenovo ThinkCentre M75q Gen 2 device.
* Added hardware support for Lenovo K14 Gen 1 (AMD based) device.
* Added hardware support for Lenovo ThinkCentre M70q Gen 3 device.
* Added hardware support for HP t740.
* Added hardware support for Lenovo K14 Gen1 (INTEL) device.

### TC Setup (Java)

* Added usage of long(er) device names - with port name in Audio Setup now. This
  affects "Default Sound Output" and "Default Sound Input" configuration at
  setup page Accessories - Sound Preferences - Options. The change is backwards-
  compatible.

### Fabulatech

* Updated Fabulatech USB for Remote Desktop version 6.1.2.9

Security Fixes
--------------------------------------------------------------------------------

### Chromium

* Fixed forbidden file access. If enabled, downloads, bookmarks and printing in
  Chromium is disabled.
* Fixed Chromium-browser security issues CVE-2023-0941, CVE-2023-0933,
  CVE-2023-0932, CVE-2023-0931, CVE-2023-0930, CVE-2023-0929, CVE-2023-0928,
  CVE-2023-0927, CVE-2023-0705, CVE-2023-0704, CVE-2023-0703, CVE-2023-0702,
  CVE-2023-0701, CVE-2023-0700, CVE-2023-0699, CVE-2023-0698, CVE-2023-0697,
  CVE-2023-0696, CVE-2023-0474, CVE-2023-0473, CVE-2023-0472, CVE-2023-0471,
  CVE-2023-0141, CVE-2023-0140, CVE-2023-0139, CVE-2023-0138, CVE-2023-0137,
  CVE-2023-0136, CVE-2023-0135, CVE-2023-0134, CVE-2023-0133, CVE-2023-0132,
  CVE-2023-0131, CVE-2023-0130, CVE-2023-0129, CVE-2023-0128, CVE-2022-4440,
  CVE-2022-4439, CVE-2022-4438, CVE-2022-4437 and CVE-2022-4436.  
* Updated Chromium-browser to version 110.0.5481.177.

### Network

* Fixed privilege escalation in network management.

### Base system

* Fixed privilege escalation in setup_cmd tool.
* Changed: For security reasons, the default password protection value for the
  System Information accessory is set to Administrator.

+------------+-----------------------------------------------------------------+
|IGEL Setup  |Accessories > System Information                                 |
+============+=================================================================+
|Parameter   |`Password protection`                                            |
+------------+-----------------------------------------------------------------+
|Registry    |`sessions.device_manager0.pwprotected`                           |
+------------+-----------------------------------------------------------------+
|Value       |**Administrator** (default)                                      |
+------------+-----------------------------------------------------------------+

* Fixed empty password entry for floppy group.
* Fixed sysstat security issue CVE-2022-39377.  
* Fixed binutils security issue CVE-2022-38533.  
* Fixed libarchive security issues CVE-2022-36227 and CVE-2022-28066.  
* Fixed curl security issues  CVE-2023-23916, CVE-2023-23915, CVE-2023-23914,
  CVE-2022-43552, CVE-2022-43551, CVE-2022-42916, CVE-2022-42915, CVE-2022-35260
  and CVE-2022-32221.  
* Fixed xorg-server security issues CVE-2022-46344, CVE-2022-46343,
  CVE-2022-46342, CVE-2022-46341, CVE-2022-46340 and CVE-2022-46283.  
* Fixed libksba security issue CVE-2022-47629.  
* Fixed nautilus security issue CVE-2022-37290.  
* Fixed python2.7 security issue CVE-2022-45061.  
* Fixed python3.6 security issue CVE-2022-45061.  
* Fixed net-snmp security issues CVE-2022-44793, CVE-2022-44792 and
  CVE-2022-4479.  
* Fixed tiff security issue CVE-2022-3970.  
* Fixed webkit2gtk security issues CVE-2023-23518, CVE-2023-23517,
  CVE-2022-42826, CVE-2022-46700, CVE-2022-46699, CVE-2022-46698,
  CVE-2022-46692, CVE-2022-46691, CVE-2022-42867, CVE-2022-42863, CVE-2022-42856
  and CVE-2022-42852.  
* Fixed qemu security issues CVE-2022-4172 and CVE-2022-3165.  
* Fixed vim security issue CVE-2022-0392.  
* Fixed sudo security issue CVE-2023-22809.  
* Fixed libxpm security issues CVE-2022-4883, CVE-2022-46285 and CVE-2022-44617.  
* Fixed zulu8-ca security issues CVE-2023-21830, CVE-2023-21835 and
  CVE-2023-21843.  
* Fixed heimdal security issues CVE-2022-45142, CVE-2022-44640, CVE-2022-42898,
  CVE-2022-41916, CVE-2022-3437 and CVE-2021-44758.  
* Fixed python-setuptools security issue CVE-2022-40897.  
* Fixed pam security issue CVE-2022-28321.  
* Fixed mysql-5.7 security issue CVE-2023-21840.  
* Fixed xorg-server security issue CVE-2023-0494.  
* Fixed e2fsprogs security issue CVE-2022-1304.  
* Fixed openssl1.0 security issues CVE-2023-0286 and CVE-2023-0215.  
* Fixed openssl security issues CVE-2023-0286, CVE-2023-0215, CVE-2022-4450 and
  CVE-2022-4304.  
* Fixed tpm2-tss security issue CVE-2023-22745.  
* Fixed nss security issue CVE-2023-0767.  
* Fixed python3.6 security issue CVE-2022-37454.  
* Fixed tiff security issues CVE-2023-0804, CVE-2023-0803, CVE-2023-0802,
  CVE-2023-0801, CVE-2023-0800, CVE-2023-0799, CVE-2023-0798, CVE-2023-0797,
  CVE-2023-0796 and CVE-2023-0795.  
* Fixed rsync security issue CVE-2022-29154.  
* Fixed tar security issue CVE-2022-48303.
* Updated ca-certificates to version 20230311.

Resolved Issues
--------------------------------------------------------------------------------

### Citrix

* Fixed H264 codec: When the server was configured to update only regions which
  have changed, sometimes massive glitches in the shape of green rectangles
  appeared.
* Fixed: Expired DigiCertSHA2SecureServerCA certificate was replaced with a
  valid one.

### RDP/IGEL RDP Client 2

* Fixed RDP fullscreen-toggle not working when trying to switch from fullscreen
  to windowed mode.

### AVD

* Fixed MS-Teams optimized video playback to not slow down on high CPU load.
* Fixed percentage (%) window size settings.
* Fixed workarea session window size.
* Fixed multimonitor switching during session.
* Supports all kinds of multi monitor constellations.
* MS-Teams optimization stability fixes.
* Fixed Zoom VDI support for multimonitor.
* Fixed video encoder buffer queuing up endlessly and crashing the client when
  it runs out of memory. Instead we drop webcam frames when the CPU cannot catch
  up with encoding.
* Fixed MS Teams screenshare on multi-monitor.
* Fixed session size preset to take effect when not multi-monitor.
* Added fixes from the latest RdClientSDK including the TCP buffer bump to avoid
  unwanted client session dis-/reconnections.

### NX client

* The value of sessions.nxclient%.general.commandline is not converted to
  lowercase anymore when being written to a session config file

### Chromium

* Fixed Chromium browser could not be restarted after closing it too quickly.
* Fixed ClearBrowsingDataOnExitList policy for Chromium browser.
* Fixed Chromium browser not starting if persistent partition was missing.

### Firefox

* Mozilla Firefox 102 ESR starting Citrix Desktops, requires an ica file to
  start sessions.
* In normal browser session, the following parameter must be disabled:  
  Sessions > Firefox Browser > Firefox Browser Global > Security > Hide local
  filesystem
* If browser appliance mode is used, following is required to activate :

+------------+-----------------------------------------------------------------+
|Parameter   |`File system access needed for ica file handling`                |
+------------+-----------------------------------------------------------------+
|Registry    |`browserglobal.app.ica-file-access-needed`                       |
+------------+-----------------------------------------------------------------+
|Type        |bool                                                             |
+------------+-----------------------------------------------------------------+
|Value       |enabled / **disabled** (default)                                 |
+------------+-----------------------------------------------------------------+

* Fixed Registry parameter sessions.browser\<instance>.gstreamer_version: If set
  to 1.0 via setup, 0.10 was activated and vice versa.

### Network

* Added registry key for choosing the base of decisions regarding automatically
  switching on and off enabling Wi-Fi carrier : either completed IP
  configuration of an Ethernet interface (default, traditional implementation)
  or just Ethernet carrier. The new key has no effect if
  network.applet.wireless.enable_wifi_auto_switch is false.

+------------+-----------------------------------------------------------------+
|Parameter   |`Enable Wi-Fi automatic switch on Ethernet carrier change`       |
+------------+-----------------------------------------------------------------+
|Registry    |`network.applet.wireless.enable_wifi_auto_switch_on_carrier`     |
+------------+-----------------------------------------------------------------+
|Type        |bool                                                             |
+------------+-----------------------------------------------------------------+
|Value       |enabled / **disabled** (default)                                 |
+------------+-----------------------------------------------------------------+

* Fixed set of 100Mbps ethernet modes
* Improved reliability of Ethernet configuration on IGEL D220 devices
* Fixed disabling of WoL - which was not applied without a reboot.

### WiFi

* Fixed: System regulatory domain now also set on the self-managed driver
  rtl8852be
* Fixed default wireless regulatory domain for HP devices delivered to Indonesia
  - by detecting the HP option code.
* Fixed: HP Probook 450 G8 with Intel AX201 Wifi.
* Improved finding hidden SSIDs with MT7922 WLAN adapter (e.g. in  Lenovo
  ThinkPad L14 Gen 3)
* Improved restoration of Wi-Fi rfkill state on startup

### Imprivata

* Improved error messages on PIN enrollment.

### Smartcard

* Fixed cryptas TicTok v3 smartcards for usage within Horizon sessions.
* Fixed sporadic duplicated smartcard user entries at login screen.

### Cisco Webex

* Integrated Cisco Webex Meetings VDI Plugin 42.6.11.6

### Base system

* Added new registry key to set left-hand on touchpad devices

+------------+-----------------------------------------------------------------+
| Parameter  | `Left hand`                                                     |
+------------+-----------------------------------------------------------------+
| Registry   | `userinterface.touchpad.general.LeftHand`                       |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | **disabled** (default)                                          |
+------------+-----------------------------------------------------------------+

* Fixed sporadic delayed local logon when logon logging is enabled.
* Fixed German translation of "Enter new password" in password change dialog of
  local login window.
* Fixed starter license on devices with multiple network interfaces.
* Fixed autostart notification.
* Fixed error message on login screen in case Kerberos KDC (domain controller)
  is unreachable.
* Added Fluendo h264 codec version 24012023, which fixes stability issues with
  AVD MS-Teams optimization.
* Changed default of registry key devices.bluetooth.connect_only to true to make
  connect after reboot for bluetooth the new default.

+------------+-----------------------------------------------------------------+
| Parameter  | `Connect devices without pairing`                               |
+------------+-----------------------------------------------------------------+
| Registry   | `devices.bluetooth.connect_only`                                |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | **enabled** (default) / disabled                                |
+------------+-----------------------------------------------------------------+

* Fixed WoL BIOS setting detection for Lenovo M75q Gen 2.
* Fixed "fwupdmgr get-devices" command.
* Fixed disabling of the "BIOS Tools" feature on setup page System > Firmware
  Customization > Features.
* Improved Bluetooth auto connect.

### X11 system

* Fixed monitor refresh rate handling in Display Switcher.
* Fixed issue that display switcher settings were overwritten by UMS if network
  connection changed and the display switcher is still open.
* Added registry key to influence the graphic card order in IGEL setup.

+------------+-----------------------------------------------------------------+
| Parameter  | `Preserve card order in setup even if the X11 order of the cards was changed.` |
+------------+-----------------------------------------------------------------+
| Registry   | `x.drivers.preserve_order_if_swapped`                           |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | enabled / **disabled** (default)                                |
+------------+-----------------------------------------------------------------+

* Changed default X11 graphic driver from modesetting to intel on Dell Wyse
  5070.

### Audio

* Added new registry key to limit max headphone volume (setting will survive a
  reset to factory defaults)

+------------+-----------------------------------------------------------------+
| Parameter  | `Limit max headphone volume (use auto or 0 - 100 as values).`   |
+------------+-----------------------------------------------------------------+
| Registry   | `multimedia.alsa.limit_headphone_volume`                        |
+------------+-----------------------------------------------------------------+
| Type       | string                                                          |
+------------+-----------------------------------------------------------------+
| Value      | auto **Default**                                                |
+------------+-----------------------------------------------------------------+

* Fixed audio output on jack in LG 24CN650N device.

### Hardware

* Fixed issue on specific monitors stayed black after resume (DPMS off).
```

-----

## 2023-03-20 - [11.08.274](readme11.08.274.txt)

```
The new PRIVATE BUILD 11.08.274 for IGEL Workspace is ready.

This build is based on 11.08.230.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------

### RDP/IGEL RDP Client 2

* Fixed RDP fullscreen-toggle not working when trying to switch from fullscreen
  to windowed mode.
```

-----

## 2023-03-16 - [11.08.273](readme11.08.273.txt)

```
The new PRIVATE BUILD 11.08.273 for IGEL Workspace is ready.

This build is based on 11.08.268.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------

### Citrix

* The expired certificate was replaced with a valid one.
```

The following changes have been applied:

- ​This private build fixes AVD login failures due to wrongly deployed certificates. The provided custom command that removes the offending certificates is not needed anymore.

- This private build contains the latest AVD client fixes provided in 11.08.264.

- This private build contains Citrix Workspace App 23.02. 

- Additionally we replaced the expired DigiCertSHA2SecureServerCA certificate as mentioned in [Citrix advisory](https://support.citrix.com/article/CTX483268/updating-expired-digicertsha2secureserverca-certificate-in-citrix-workspace-app-for-linux) in all integrated Citrix Workspace App versions.

-----

## 2023-03-15 - [11.08.268](readme11.08.268.txt)

```
The new Private Build 11.08.268 for IGEL Workspace is ready.

This build is based on 11.08.264.

********************************************************************************
Do not share this build unless you have customers who need one of the integrated
features or bugfixes.

Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

Security Fixes 
-------------------------------------------------------------------------------- 
### Base system 
* Updated ca-certificates to version 20230311. 

New Features 
-------------------------------------------------------------------------------- 
### Citrix 

* Integrated Citrix Workspace App 2302.  
Available Citrix Workspace apps in this release: 2302 (default), 2212 and 2010 

* New features:  

* Screen pinning in custom web stores [Technical Preview] 
+------------+-----------------------------------------------------------------+ 
|Parameter |`Multi-monitor support` | 
+------------+-----------------------------------------------------------------+ 
|Registry |`ica.authman.screenpinenabled` | 
+------------+-----------------------------------------------------------------+ 
|Value |**disabled**(default)/enabled | 
+------------+-----------------------------------------------------------------+ 

Resolved Issues 
-------------------------------------------------------------------------------- 

### Base system 
* Reorganized CA certificate handling. 
```

-----

## 2023-03-07 - [11.08.267](readme11.08.267.txt)

```
The new PRIVATE BUILD 11.08.267 for IGEL Workspace is ready.

This build is based on 11.08.256.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------

### Cisco Webex
* Available Webex VDI client: 42.6
```

-----

## 2023-03-01 – [11.08.266](readme11.08.266.txt)

```
The new PRIVATE BUILD 11.08.266 for IGEL Workspace is ready.

This build is based on 11.08.251.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------

### Citrix

* Available Citrix Workspace App versions in this release: 23.02 (default),
22.12 and 20.10 

Available Zoom VDI plugins in this release: 5.13.1.22610 (default),
5.12.6.22200 and 5.11.2.21530
```

-----

## 2023-03-01 – [11.08.265](readme11.08.265.txt)

```
The new PRIVATE BUILD 11.08.265 for IGEL Workspace is ready.

This build is based on 11.08.240.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------


### Smartcard

* Fixed use of cryptas TicTok v3 smart cards in Horizon sessions.
```

-----

## 2023-02-26 – [11.08.264](readme11.08.264.txt)

```
The new PRIVATE BUILD 11.08.264 for IGEL Workspace is ready.

This build is based on 11.08.252.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------

### AVD

* Included AVD version 1.1.12 with MS-Teams screenshare fixes and tcp buffer
  bump included.
```

-----

## 2023-02-24 – [11.08.263](readme11.08.263.txt)

```
The new PRIVATE BUILD 11.08.263 for IGEL Workspace is ready.

This build is based on 11.08.240.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------


### Citrix

* Integrated Citrix Workspace App 2302.  
  Available Citrix Workspace apps in this release: 2302 (default), 2212 and 2010
* New features:  
* Screen pinning in custom web stores [Technical Preview]

+------------+-----------------------------------------------------------------+
|Parameter   |`Multi-monitor support`                                          |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.authman.screenpinenabled`                                   |
+------------+-----------------------------------------------------------------+
|Value       |{**}false{**}(default)/true                                      |
+------------+-----------------------------------------------------------------+


### VMware Horizon

* Updated VMware Horizon client to version 2212-8.8.0-21079016
* Fixed  the vmware-view protocol handler used for federated (SAML-based)
  authentication.
* Added support for the monitors option to specify which monitors (and in what
  order) are to be used for a all-monitros fullscreen mode.  
  Also added minimized launch of the client window and the use of the
  useExisting option for letting  
  the client use an already running client to start  a new desktop or app
  session.

+------------+-----------------------------------------------------------------+
| Parameter  | `Specify a list of monitor numbers you want to use in all-monitors fullscreen mode` |
+------------+-----------------------------------------------------------------+
| Registry   | `vmware.view.use-monitors`                                      |
+------------+-----------------------------------------------------------------+
| Type       | string                                                          |
+------------+-----------------------------------------------------------------+
| Value      | empty **Default**                                               |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | `Specify a list of monitor numbers you want to use in all-monitors fullscreen mode` |
+------------+-----------------------------------------------------------------+
| Registry   | `sessions.vdm_client%.options.use-monitors`                     |
+------------+-----------------------------------------------------------------+
| Type       | string                                                          |
+------------+-----------------------------------------------------------------+
| Value      | empty **Default**                                               |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | `Use an already running Horizon session to start apps or desktops` |
+------------+-----------------------------------------------------------------+
| Registry   | `vmware.view.use-existing`                                      |
+------------+-----------------------------------------------------------------+
| Range      | [on][off]                                                       |
+------------+-----------------------------------------------------------------+
| Value      | **off**                                                         |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | `Use an already running Horizon session to start apps or desktops` |
+------------+-----------------------------------------------------------------+
| Registry   | `sessions.vdm_client%.options.use-existing`                     |
+------------+-----------------------------------------------------------------+
| Range      | [Global setting][on][off]                                       |
+------------+-----------------------------------------------------------------+
| Value      | **Global setting**                                              |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | `Run Horizon client in minimized mode`                          |
+------------+-----------------------------------------------------------------+
| Registry   | `vmware.view.launch-minimized`                                  |
+------------+-----------------------------------------------------------------+
| Range      | [on][off]                                                       |
+------------+-----------------------------------------------------------------+
| Value      | **off**                                                         |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | `Run Horizon client in minimized mode`                          |
+------------+-----------------------------------------------------------------+
| Registry   | `sessions.vdm_client%.options.launch-minimized`                 |
+------------+-----------------------------------------------------------------+
| Range      | [Global setting][on][off]                                       |
+------------+-----------------------------------------------------------------+
| Value      | **Global setting**                                              |
+------------+-----------------------------------------------------------------+


### Cisco Webex

* Integrated Cisco WebEx VDI plugin version 42.10.0.23814


Resolved Issues
--------------------------------------------------------------------------------


### Cisco Webex

* Integrated Cisco WebEx Meetings VDI Plugin 42.10.8.14
```

-----

## 2023-02-24 – [11.08.262](readme11.08.262.txt)

```
The new PRIVATE BUILD 11.08.262 for IGEL Workspace is ready.

This build is based on 11.08.200.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------


### Audio

* Added new registry key to limit max headphone volume (setting will survive a
  reset to factory defaults)

+------------+-----------------------------------------------------------------+
| Parameter  | `Limit max headphone volume (use auto or 0 - 100 as values).`   |
+------------+-----------------------------------------------------------------+
| Registry   | `multimedia.alsa.limit_headphone_volume`                        |
+------------+-----------------------------------------------------------------+
| Type       | string                                                          |
+------------+-----------------------------------------------------------------+
| Value      | auto **Default**                                                |
+------------+-----------------------------------------------------------------+
```

-----

## 2023-02-22 – [11.08.261](readme11.08.261.txt)

```
The new PRIVATE BUILD 11.08.261 for IGEL Workspace is ready.

This build is based on 11.08.255.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------

### WiFi

* Fixed: HP Probook 450 G8 with Intel AX201 Wifi.
```


-----

## 2023-02-22 – [11.08.257](readme11.08.257.txt)

```
The new PRIVATE BUILD 11.08.257 for IGEL Workspace is ready.

This build is based on 11.08.240.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------

### Audio

* Fixed too loud headphone issue on LG CQ600.  
* Added new registry key to limit max headphone volume (setting will survive a
  reset to factory defaults)

+------------+-----------------------------------------------------------------+
| Parameter  | `Limit max headphone volume (use auto or 0 - 100 as values).`   |
+------------+-----------------------------------------------------------------+
| Registry   | `multimedia.alsa.limit_headphone_volume`                        |
+------------+-----------------------------------------------------------------+
| Type       | string                                                          |
+------------+-----------------------------------------------------------------+
| Value      | auto **Default**                                                |
+------------+-----------------------------------------------------------------+
```

-----

## 2023-02-14 – [11.08.252](readme11.08.252.txt)

```
The new PRIVATE BUILD 11.08.252 for IGEL Workspace is ready.

This build is based on 11.08.232.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------

### AVD

* Fixed video encoder buffer queuing up endlessly and crashing the client when
  it runs out of memory. Instead we drop webcam frames when the CPU cannot catch
  up with encoding.
* Fixed MS-Teams screen share on multi monitor.
* Fixed session size preset to take effect when not multi monitor.
* Implemented the latest RdClientSDK including the TCP buffer bump to avoid
  unwanted client session dis-/reconnections.

```

-----

## 2023-02-10 – [11.08.251](readme11.08.251.txt)

```
The new PRIVATE BUILD 11.08.251 for IGEL Workspace is ready.

This build is based on 11.08.243.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

New Features 
-------------------------------------------------------------------------------- 
### Citrix 
* Available Citrix Workspace App versions in this release: 22.12 (default), 
22.11 and 22.09 

### zoomvdi 
* Available Zoom VDI plugins in this release: 5.13.1.22610 (default), 
5.12.6.22200 and 5.11.2.21530 

Resolved Issues 
-------------------------------------------------------------------------------- 
### Base system 
* Fixed sporadic delayed local logon when logon logging is enabled. 
```

-----

## 2023-02-10 – [11.08.240](readme11.08.240.txt)

```
The new PRIVATE BUILD 11.08.240 for IGEL Workspace is ready.

This build is based on 11.08.230.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------


### Network

* Added a check if BIOS has Wake on LAN disabled if so do not configure network
interface to use WoL. 
* Added new registry key:

+------------+-----------------------------------------------------------------+
| Parameter | `Respect the BIOS WoL setting so if disabled reflect this for the linux network devices settings.` |
+------------+-----------------------------------------------------------------+
| Registry | `network.interfaces.respect_bios_wol_setting` |
+------------+-----------------------------------------------------------------+
| Type | bool |
+------------+-----------------------------------------------------------------+
| Value | **enabled** (default) / disabled |
+------------+-----------------------------------------------------------------+


### WiFi

* Set default wireless regularity domain on HP devices based on product option
code.

### Base system

* Updated sscep to version 0.10.0
* Changed the default mem sleep mode to deep as some devices defaults to s2idle
which cases issues. 
* Added new registry key to set the suspend mem sleep mode.

+------------+-----------------------------------------------------------------+
| Parameter | `Set suspend mem sleep mode.` |
+------------+-----------------------------------------------------------------+
| Registry | `system.suspend.sleep_mode` |
+------------+-----------------------------------------------------------------+
| Range | [Suspend to RAM][Suspend to idle] |
+------------+-----------------------------------------------------------------+
| Value | **Suspend to RAM** |
+------------+-----------------------------------------------------------------+


### Hardware

* Added support for Lenovo ThinkCentre neo 50q Gen 4 device.
* Added support for Lenovo ThinkCentre M75q Gen 2 device.
* Added support for Lenovo K14 Gen 1 (AMD based) device.
* Added support for Lenovo ThinkCentre M70q Gen 3 device.

### TC Setup (Java)

* Using longer device names with port name in Audio Setup now. This affects the
\\"Default Sound Output\\" and \\"Default Sound Input\\" configuration at setup page
Accessories - Sound Preferences - Options. The change is backwards compatible.

Resolved Issues
--------------------------------------------------------------------------------


### Firefox

* Fixed Registry parameter sessions.browser\\<instance>.gstreamer_version: when
it was set to 1.0 in setup, 0.10 was activated and vice versa.

### Network

* Fixed setting 100Mbps Ethernet modes
* Fixed disabling of WoL was not applied without a reboot.

### WiFi

* Fixed: System regulatory domain now also set on the self-managed driver
rtl8852be
* Improved finding hidden SSIDs with MT7922 WLAN adapter (e.g. in Lenovo
ThinkPad L14 Gen 3)
* Improved restoration of Wi-Fi rfkill state on startup

### Base system

* Fixed sporadic delayed local logon when logon logging is enabled.
* Changed default of registry key devices.bluetooth.connect_only to true to make
connect after reboot for bluetooth the new default.

+------------+-----------------------------------------------------------------+
| Parameter | `Connect devices without pairing` |
+------------+-----------------------------------------------------------------+
| Registry | `devices.bluetooth.connect_only` |
+------------+-----------------------------------------------------------------+
| Type | bool |
+------------+-----------------------------------------------------------------+
| Value | **enabled** (default) / disabled |
+------------+-----------------------------------------------------------------+


### X11 system

* Fixed issue that display switcher settings were overwritten by UMS if network
connection changed and the display switcher is still open.

### Hardware

* Fixed issue with some monitors stayed black after resume or after DPMS off.
```

-----

## 2023-02-10 – [11.08.247](readme11.08.247.txt)

```
The new PRIVATE BUILD 11.08.247 for IGEL Workspace is ready.

This build is based on 11.08.230.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------


### VMware Horizon

* Updated VMware Horizon client to version 2212-8.8.0-21079016
* Fixed the vmware-view protocol handler used for federated (SAML-based)
authentication.
* Added support for the monitors option to specify which monitors (and in what
order) are to be used for a all-monitros fullscreen mode. 
Also added minimized launch of the client window and the use of the
useExisting option for letting 
the client use an already running client to start a new desktop or app
session.

+------------+-----------------------------------------------------------------+
| Parameter | `Specify a list of monitor numbers you want to use in all-monitors fullscreen mode` |
+------------+-----------------------------------------------------------------+
| Registry | `vmware.view.use-monitors` |
+------------+-----------------------------------------------------------------+
| Type | string |
+------------+-----------------------------------------------------------------+
| Value | empty **Default** |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter | `Specify a list of monitor numbers you want to use in all-monitors fullscreen mode` |
+------------+-----------------------------------------------------------------+
| Registry | `sessions.vdm_client%.options.use-monitors` |
+------------+-----------------------------------------------------------------+
| Type | string |
+------------+-----------------------------------------------------------------+
| Value | empty **Default** |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter | `Use an already running Horizon session to start apps or desktops` |
+------------+-----------------------------------------------------------------+
| Registry | `vmware.view.use-existing` |
+------------+-----------------------------------------------------------------+
| Range | [on][off] |
+------------+-----------------------------------------------------------------+
| Value | **off** |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter | `Use an already running Horizon session to start apps or desktops` |
+------------+-----------------------------------------------------------------+
| Registry | `sessions.vdm_client%.options.use-existing` |
+------------+-----------------------------------------------------------------+
| Range | [Global setting][on][off] |
+------------+-----------------------------------------------------------------+
| Value | **Global setting** |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter | `Run Horizon client in minimized mode` |
+------------+-----------------------------------------------------------------+
| Registry | `vmware.view.launch-minimized` |
+------------+-----------------------------------------------------------------+
| Range | [on][off] |
+------------+-----------------------------------------------------------------+
| Value | **off** |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter | `Run Horizon client in minimized mode` |
+------------+-----------------------------------------------------------------+
| Registry | `sessions.vdm_client%.options.launch-minimized` |
+------------+-----------------------------------------------------------------+
| Range | [Global setting][on][off] |
+------------+-----------------------------------------------------------------+
| Value | **Global setting** |
+------------+-----------------------------------------------------------------+
```

-----

## 2023-02-06 – [11.08.248](readme11.08.248.txt)

```
The new PRIVATE BUILD 11.08.248 for IGEL Workspace is ready.

This build is based on 11.08.245.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------

### Citrix

* Private Build with  
* CWA 2212  
* Webex Meetings VDI 42.10  
* Webex VDI 42.10

### Cisco Webex

* Integrated Cisco WebEx VDI plugin version 42.10.0.23814
* Private Build with  
* CWA 2212  
* Webex Meetings VDI 42.10  
* Webex VDI 42.10

Resolved Issues
--------------------------------------------------------------------------------

### Cisco Webex

* Integrated Cisco WebEx Meetings VDI Plugin 42.10.8.14  
  
  Available Webex Meetings Plugins in this release: 42.10.8.14
  {**}(default){**}, 42.2.10.7 and 41.12.6.12  
  
  Be aware of any compatibility restrictions for older plugin-version.

```

-----

## 2023-02-02 – [11.08.244](readme11.08.244.txt)

```
The new PRIVATE BUILD 11.08.244 for IGEL Workspace is ready.

This build is based on 11.08.230.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------

### Network

* Added registry key for choosing the base of decisions regarding automatically
  switching on and off Wi-Fi: either completed IP configuration of an Ethernet
  interface (default, traditional implementation) or just Ethernet carrier. The
  new key has no effect if network.applet.wireless.enable_wifi_auto_switch is
  false.

+------------+-----------------------------------------------------------------+
| Parameter  | `Enable Wi-Fi automatic switch on Ethernet carrier change`      |
+------------+-----------------------------------------------------------------+
| Registry   | `network.applet.wireless.enable_wifi_auto_switch_on_carrier`    |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | enabled / **disabled** (default)                                |
+------------+-----------------------------------------------------------------+
```

-----

## 2023-01-20 – [11.08.243](readme11.08.243.txt)

```
The new PRIVATE BUILD 11.08.243 for IGEL Workspace is ready.

This build is based on 11.08.236.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------

### Cisco JVDI Client

* Integrated Cisco JVDI 14.1.3

### zoomvdi

* Integrated Zoom VDI plugin 5.13.1.22610  
  Available plugins in this release: 5.13.1.22610 (default), 5.12.1.21950 and
  5.8.4.21112
```

-----

## 2022-12-20 – [11.08.236](readme11.08.236.txt)

```
The new PRIVATE BUILD 11.08.236 for IGEL Workspace is ready.

This build is based on 11.08.235.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------


### Citrix

* Removed pre-configured Netscaler Gateway Client session. It will be launched
automatically when accessing the Netscaler via browser. Additionally a desktop
icon can be configured by adding an instance of sessions.nsgclient% 
* Documentation about the param ica.nsepa is wrong. There are no options for
nsepa. It will be launched automatically when accessing the Netscaler via
browser.
```

-----

## 2022-12-20 – [11.08.235](readme11.08.235.txt)

```
The new PRIVATE BUILD 11.08.235 for IGEL Workspace is ready.

This build is based on 11.08.230.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------

### Citrix

* Integrated Citrix Workspace App 2212. 
Available Citrix Workspace apps in this release: 2212 (default), 2211 and 2010
* New features: 
* Addition of client-side jitter buffer mechanism (Technical Preview)

+------------+-----------------------------------------------------------------+
|Parameter |`Addition of client-side jitter buffer mechanism` |
+------------+-----------------------------------------------------------------+
|Registry |`ica.module.JitterBufferEnabled` |
+------------+-----------------------------------------------------------------+
|Value |{**}false{**}(default)/true |
+------------+-----------------------------------------------------------------+

* Note: This feature ensures smooth audio even when the network latency
fluctuates. 
* Citrix Optimized Teams in Citrix Workspace app for Linux now supports
background blurring and background replacement. You can use this feature by
selecting **More** > *Apply Background Effects** when you are in a meeting or
in a P2P call. [Techinical Preview]
* Integrated Citrix EPA client for Netscaler analysis.

+------------+-----------------------------------------------------------------+
|Parameter |`Citrix NSEPA` |
+------------+-----------------------------------------------------------------+
|Registry |`ica.nsepa` |
+------------+-----------------------------------------------------------------+
|Value |**False** (default)/True |
+------------+-----------------------------------------------------------------+


### Cisco Webex

* Integrated Cisco Webex VDI 42.12
```

-----

## 2022-12-07 – [11.08.218](readme11.08.218.txt)

```
The new PRIVATE BUILD 11.08.218 for IGEL Workspace is ready.

This build is based on 11.08.200.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------


### VMware Horizon

* Updated VMware Horizon client to version 2209-8.7.0-20616018
* Fixed the use of the standard Horizon client which crashed in version 2206. 
Since 2203 there was a also legacy variant of the client which was used by
default because it 
didn't show the client window during the run of the remote session. 
In 2209 the legacy version is gone but now there's an extra client option 
which is used instead to get the same behavior to not show the extra 
window during session runtime by default.

+------------+-----------------------------------------------------------------+
| Parameter | `Use single view window` |
+------------+-----------------------------------------------------------------+
| Registry | `vmware.view.use-single-window` |
+------------+-----------------------------------------------------------------+
| Type | bool |
+------------+-----------------------------------------------------------------+
| Value | **enabled** (default) / disabled |
+------------+-----------------------------------------------------------------+

* Added possibility to either keep the settings made in client by the user 
or reset them every client start. 
This includes RTAV device choices, MS Teams calls and sharing settings 
and settings regarding integrated printing

+------------+-----------------------------------------------------------------+
| Parameter | `Keep settings made in the client interactively` |
+------------+-----------------------------------------------------------------+
| Registry | `vmware.view.keep-user-settings` |
+------------+-----------------------------------------------------------------+
| Type | bool |
+------------+-----------------------------------------------------------------+
| Value | **enabled** (default) / disabled |
+------------+-----------------------------------------------------------------+
```

-----

## 2022-11-28 – [11.08.219](readme11.08.219.txt)

```
The new PRIVATE BUILD 11.08.219 for IGEL Workspace is ready.

This build is based on 11.08.216.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------

### AVD

* Fixed immediate AVD crash on M350C and similar hardware that was caused by
some compiler optimization that was applied at build time. This optimization
has been removed for the sake of compatibility!
```

-----

## 2022-11-25 – [11.08.216](readme11.08.216.txt)

Please note that 11.08.216 replaces 11.08.215. Make sure all customers that have 11.08.215 installed do update to 11.08.216:

-	11.08.216 disables the sessions.wvd?.options.workspace-1.enabled setting, which means that pre-production WVD deployments are not shown any more by default. This fixes the 5-minute timeout in the RdClientSDK on client startup for users that don't have pre-prod WVD resources assigned! For users that need access to pre-prod WVD resources it should be safe to explicitly enable it again.
-	The MS-Teams background blur and virtual background support should be more stable now. Nevertheless, if you experience instabilities in MS-Teams, also test without the background effects.


```
The new PRIVATE BUILD 11.08.216 for IGEL Workspace is ready.

This build is based on 11.08.215.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------


### AVD

* Added max-threads option for the WebRTC h264 decoder module fluh264dec.

+------------+-----------------------------------------------------------------+
| Registry | `sessions.wvd%.options.webrtcdecodermaxthreads` |
+------------+-----------------------------------------------------------------+
| Value | **1** (default) / 0-16 |
+------------+-----------------------------------------------------------------+


Resolved Issues
--------------------------------------------------------------------------------


### AVD

* Fixed umlaut keys for Swiss keyboard layout
* Fixed crash of AVD client when Fabulatech plugins were activated
* Fixed smartcard redirection
* Fixed eventually stuck incoming video in MS-Teams!
* Added paths where AVD searches for static, dynamic-1.1 and dynamic-2.0 virtual
channel plugins and automatically loads all of them: 
/usr/lib/igelrdp3/plugins/automatic/static-channels 
/usr/lib/igelrdp3/plugins/automatic/dynamic-1.1-channels 
/usr/lib/igelrdp3/plugins/automatic/dynamic-2.0-channels 
Note that this is picked up by all AVD sessions automatically on session
startup!
* Disabled legacy workspace download by default. It still can be enabled under
options.workspace-1.enabled per AVD session. This speeds up workspace download
time a little!
* Fixed MS-Teams background FX related client crashes.
* Based on Microsoft's new RdClientSDKv2 that includes stability and performance
fixes 
* MS-Teams stability fixes 
* MS-Teams background blur and virtual background support 
* Preliminary UDP short path support (disabled by default, enable on your own
risk)

+------------+-----------------------------------------------------------------+
| Registry | `sessions.avd%.options.udp-short-path` |
+------------+-----------------------------------------------------------------+
| Value | enabled / **disabled** (default) |
+------------+-----------------------------------------------------------------+
```

-----

## 2022-11-23 – [11.08.215](readme11.08.215.txt)

IMPORTANT NOTES for IGEL OS 11.08.215

-	Please make sure customers switch off sessions.wvd?.options.workspace-1.enabled when their users don't have any legacy WVD resources! Otherwise, the resource download will run into a 5 minute timeout during resource download in the RdClientSDK!
-	When using the background blur or the virtual background feature in MS-Teams it can crash the AVD client. Don't use it in 11.08.215.
- There will be an immediate follow-up release named 11.08.216 which fixes the above issues, ie. the options.workspace-1.enabled will be disabled by default and the background FX issues should be fixed in the AVD client!

```
The new PRIVATE BUILD 11.08.215 for IGEL Workspace is ready.

This build is based on 11.08.202.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------


### AVD

* Added max-threads option for the WebRTC h264 decoder module fluh264dec.

+------------+-----------------------------------------------------------------+
| Registry | `sessions.wvd%.options.webrtcdecodermaxthreads` |
+------------+-----------------------------------------------------------------+
| Value | **1** (default) / 0-16 |
+------------+-----------------------------------------------------------------+


Resolved Issues
--------------------------------------------------------------------------------


### AVD

* Fixed umlaut keys for Swiss keyboard layout
* Fixed crash of AVD client when Fabulatech plugins were activated
* Fixed smartcard redirection
* Fixed eventually stuck incoming video in MS-Teams!
* Added paths where AVD searches for static, dynamic-1.1 and dynamic-2.0 virtual
channel plugins and automatically loads all of them: 
/usr/lib/igelrdp3/plugins/automatic/static-channels 
/usr/lib/igelrdp3/plugins/automatic/dynamic-1.1-channels 
/usr/lib/igelrdp3/plugins/automatic/dynamic-2.0-channels 
Note that this is picked up by all AVD sessions automatically on session
startup!
* Based on Microsoft's new RdClientSDKv2 that includes stability and performance
fixes 
* MS-Teams stability fixes 
* MS-Teams background blur and virtual background support 
* Preliminary UDP short path support (disabled by default, enable on your own
risk)

+------------+-----------------------------------------------------------------+
| Registry | `sessions.avd%.options.udp-short-path` |
+------------+-----------------------------------------------------------------+
| Value | enabled / **disabled** (default) |
+------------+-----------------------------------------------------------------+
```

-----

## 2022-11-18 – [11.08.212](readme11.08.212.txt)

```
The new PRIVATE BUILD 11.08.212 for IGEL Workspace is ready.

This build is based on 11.08.200.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------


### RDP/IGEL RDP Client 2

* Fixed RDP fullscreen-toggle not working when trying to switch from fullscreen
to windowed mode.
```

-----

## 2022-11-17 – [11.08.211](readme11.08.211.txt)

```
The new PRIVATE BUILD 11.08.211 for IGEL Workspace is ready.

This build is based on 11.08.200.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------


### Citrix

* Integrated Citrix workspace app 22.11 

Available workspace app version in this release: 2211 (default), 2209, and 2010
```

-----

## 2022-11-08 – [11.08.207](readme11.08.207.txt)

```
The new PRIVATE BUILD 11.08.207 for IGEL Workspace is ready.

This build is based on 11.08.200.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------


### Misc

* Updated DriveLock Agent to version 2022.1 (22.1.2.38801). 
Fixed issues: 
On IgelOS, the DriveLock Linux Agent can not reset/disconnect USB drives
during policy updates. 
The Linux Agent now handles Unicode characters correctly. 
New parameter:

+------------+-----------------------------------------------------------------+
|Parameter |`Join Token` |
+------------+-----------------------------------------------------------------+
|Registry |`devices.drivelock.jointoken` |
+------------+-----------------------------------------------------------------+
|Value |**empty** (default) |
+------------+-----------------------------------------------------------------+
```

-----

## 2022-11-08 – 11.08.206

```
The new PRIVATE BUILD 11.08.206 for IGEL Workspace is ready.

This build is based on 11.08.200.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------


### Cisco Webex

* Integrated WebEx VDI Client 42.6.0.22645
```

-----

## 2022-10-27 – [11.08.205](readme11.08.205.txt)

```
The new PRIVATE BUILD 11.08.205 for IGEL Workspace is ready.

This build is based on 11.08.200.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------


### Smartcard

* Updated SecMaker Net iD Enterprise to version 6.8.5.20 with support for Thales
ID Prime 940.
```

-----

## 2022-10-25 – [11.08.204](readme11.08.204.txt)

```
The new PRIVATE BUILD 11.08.204 for IGEL Workspace is ready.

This build is based on 11.08.200.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------


### Base system

* Added new registry key system.kernel.bootparams.reboot to help with reboot
issues.

+------------+-----------------------------------------------------------------+
| Parameter | `Set reboot kernel parameters.` |
+------------+-----------------------------------------------------------------+
| Registry | `system.kernel.bootparams.reboot` |
+------------+-----------------------------------------------------------------+
| Range | [Default][Bios][Triple][Kbd][Acpi][Efi][Pci] |
+------------+-----------------------------------------------------------------+
| Value | **Default** |
+------------+-----------------------------------------------------------------+
```

-----

## 2022-10-25 – [11.07.207](readme11.07.207.txt)

```
The new PRIVATE BUILD 11.07.207 for IGEL Workspace is ready.

This build is based on 11.07.198.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------


### Cisco JVDI Client

* Integrated Cisco JVDI 14.0.0
```

-----

## 2022-10-19 – [11.08.202](readme11.08.202.txt)

```
The new PRIVATE BUILD 11.08.202 for IGEL Workspace is ready.

This build is based on 11.08.200.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------


### X11 system

* Added quirks to overcome Hotplug or DP MST issues. 
* Added new registry keys:

+------------+-----------------------------------------------------------------+
| Parameter | `Quirk to improve DP MST hotplug behaviour.` |
+------------+-----------------------------------------------------------------+
| Registry | `x.xserver%.quirks.dp_mst_hotplug` |
+------------+-----------------------------------------------------------------+
| Type | bool |
+------------+-----------------------------------------------------------------+
| Value | enabled / **disabled** (default) |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter | `Quirk to fix issues with screen stays black after DPMS off or DP MST hotplug.` |
+------------+-----------------------------------------------------------------+
| Registry | `x.xserver%.quirks.screen_stay_black` |
+------------+-----------------------------------------------------------------+
| Type | bool |
+------------+-----------------------------------------------------------------+
| Value | enabled / **disabled** (default) |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter | `Quirk to fix issues with screen stays black by switch screen off and on again.` |
+------------+-----------------------------------------------------------------+
| Registry | `x.xserver%.quirks.screen_stay_black_on_off` |
+------------+-----------------------------------------------------------------+
| Type | bool |
+------------+-----------------------------------------------------------------+
| Value | enabled / **disabled** (default) |
+------------+-----------------------------------------------------------------+


### Audio

* Fixed audio support on HP T240 hardware.

### Hardware

* Fixed bluetooth support on Lenovo L14 Gen3 hardware.
```

-----

## 2022-10-13 – [11.08.114](readme11.08.114.txt)

```
The new PRIVATE BUILD 11.08.114 for IGEL Workspace is ready.

This build is based on 11.08.113.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------


### Citrix

* Integrated Citrix Workspace App 2209. 
Available Citrix Workspace apps in this release: 2209 (default), 2207 and 2010
* New features: 
* Support for Authentication using FIDO2 (Technical Preview)

+------------+-----------------------------------------------------------------+
|Parameter |`FIDO2 Authentication` |
+------------+-----------------------------------------------------------------+
|Registry |`ica.module.virtualdriver.fido2.enable` |
+------------+-----------------------------------------------------------------+
|Value |{**}false{**}(default)/true |
+------------+-----------------------------------------------------------------+


### Cisco Webex

* Integrated Cisco WebEx Meetings VDI plugins 42.6.8.5 and 42.2.10.7 
Available plugins in this release: 42.6.8.5 (default), 42.2.10.7 and
41.12.6.12

### zoomvdi

* Integrated Zoom VDI plugin 5.12.1.21950 
Available plugins in this release: 5.12.1.21950 (default), 5.11.2.21530 and
5.8.4.21112
```

-----

## 2022-10-05 – [11.07.922](readme11.07.922.txt)

```
The new PRIVATE BUILD 11.07.922 for IGEL Workspace is ready.

This build is based on 11.07.921.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------


### Citrix

* Integrated Citrix Workspace App 2207. 
Available Citrix Workspace apps in this release: 2207 (default), 2205 and 2010 
* Composite USB redirection

+------------+-----------------------------------------------------------------+
|Parameter |`Native USB Redirection class rule` |
+------------+-----------------------------------------------------------------+
|Registry |`ica.usbredirection.devicepolicy.class_rule%.rule` |
+------------+-----------------------------------------------------------------+
|Value |{**}Deny{**}(default), Allow, Connect |
+------------+-----------------------------------------------------------------+
|Parameter |`Native USB Redirection product rule` |
+------------+-----------------------------------------------------------------+
|Registry |`ica.usbredirection.devicepolicy.product_rule%.rule` |
+------------+-----------------------------------------------------------------+
|Value |{**}Deny{**}(default), Allow, Connect |
+------------+-----------------------------------------------------------------+

* Citrix Workspace app allows the splitting of composite USB devices. A
composite USB device can perform more than one function. These functions are
accomplished by exposing each of those functions using different interfaces.
An example of a composite USB device is the Bloomberg keyboard which consists
of a keyboard, fingerprint reader, an audio device, and USB hub, etc.
* The Composite USB redirection feature adds the CONNECT value to the rules for
USB devices.
* CONNECT – Set the “CONNECT” keyword to enable auto-redirect of a device when a
session starts.
* ALLOW – Set the “ALLOW” keyword to allow auto-redirect of a device only after
a session starts. However, if the “CONNECT” or “ALLOW” keyword is set, the
device is auto-redirected when it is unplugged and plugged in during a
session.
* When we redirect the composite USB device, normally the whole device is
forwarded to the virtual host. However, now there is the possibility to split
and forward only the child interfaces that use a generic USB channel. To do
this, we need to add the following filter parameters (split and intf) to the
device rules. The split parameter specifies whether a composite device must be
forwarded as separate devices or as a single composite device. \\"Split=1\\" means
that the selected child interfaces of a composite device must be forwarded as
split devices, while split=0 must not be forwarded (If the split parameter is
omitted, Split=0 is assumed). The intf parameter selects the specific child
interfaces of the composite unit to which the action is to be applied.
* In the IGEL Setup assistant, the device rules can be added under \\"Sessions /
Citrix / Citrix Global / Native USB Redirection / Device Rules\\". Add the first
two filter parameters Vendor id/vid and Product id/ pid, which redirect the
entire composite device in the session. If splitting of the composite device
is required, add additional parameters in the \\"Extra config\\" as shown in the
example.
* Example: 
CONNECT: vid=047F pid=C039 split=1 intf=03 # Allow HID device and connect
automatically. 
DENY: vid=047F pid=C039 split=1 intf=00 # Deny audio endpoints 
ALLOW: vid=047F pid=C039 split=1 intf=05 # Allow mgmt intf but do not connect
automatically
* Note: [https://kb.igel.com/igelos-11.08/en/native-usb-
redirection-63804310.html] the third option \\"connect\\" has been added to the
class and device rules. Composite USB redirection can change the behavior. If
a device is no longer redirected with CWA 2207, please change the rule to
Connect. 
* Enhancement to improve audio quality 
** Playback Delay Thresh

+------------+-----------------------------------------------------------------+
|Parameter |`Playback Delay Thresh` |
+------------+-----------------------------------------------------------------+
|Registry |`ica.module.PlaybackDelayThreshV4` |
+------------+-----------------------------------------------------------------+
|Value |**50 (default)** |
+------------+-----------------------------------------------------------------+

* With this enhancement, the maximum output buffering value is decreased from
200 ms to 50 ms in Citrix Workspace app. As a result, the user experience of
the interactive audio application is improved. Also, the Round trip time (RTT)
is decreased by 150 ms. This parameter is valid only when `AudioRedirectionV4`
is set to `True`. 
** 
** Audio Temp Latency Boost

+------------+-----------------------------------------------------------------+
|Parameter |`Audio Temp Latency Boost` |
+------------+-----------------------------------------------------------------+
|Registry |`ica.module.AudioTempLatencyBoostV4` |
+------------+-----------------------------------------------------------------+
|Value |**100 (default)** |
+------------+-----------------------------------------------------------------+

* When the audio throughput undergoes a sudden spike or isn’t enough for an
unstable network, this value increases the output buffering value. This
increase in the output buffering value provides smooth audio. However, the
audio might be slightly delayed. This parameter is only valid when
`AudioRedirectionV4`, and `AudioLatencyControlEnabled` is set to True. 
* Improved audio echo cancellation support

+------------+-----------------------------------------------------------------+
|Parameter |`Improved audio echo cancellation support` |
+------------+-----------------------------------------------------------------+
|Registry |`ica.module.enableechocancellation` |
+------------+-----------------------------------------------------------------+
|Value |{**}false{**}(default)/true |
+------------+-----------------------------------------------------------------+

* Support for DPI matching

+------------+-----------------------------------------------------------------+
|Parameter |`Support for DPI matching` |
+------------+-----------------------------------------------------------------+
|Registry |`ica.wfclient.dpimatchingenabled` |
+------------+-----------------------------------------------------------------+
|Value |{**}false{**}(default)/true |
+------------+-----------------------------------------------------------------+

* The display resolution and DPI scale values set in the Citrix Workspace app
match the corresponding values in the virtual apps and desktops session. DPI
scaling is mostly used with large size and high-resolution monitors to display
applications, text, images, and other graphical elements in a size that can be
viewed comfortably. 
* App Protection

+------------+-----------------------------------------------------------------+
|Parameter |`Citrix App Protection` |
+------------+-----------------------------------------------------------------+
|Registry |`ica.appprotection` |
+------------+-----------------------------------------------------------------+
|Value |{**}false{**}(default)/true |
+------------+-----------------------------------------------------------------+

* App protection is an add-on feature for the Citrix Workspace app that provides
enhanced security when using Citrix Virtual Apps and Desktops published
resources. Two policies provide anti-keylogging and anti-screen-capturing
capabilities for a Citrix HDX session. This feature is fully supported only
for workspace app 2207, and with the older workspace apps, you may experience
x11vnc crashes.

Resolved Issues
--------------------------------------------------------------------------------


### X11 system

* Added quirks to overcome Hotplug or DP MST issues. 
* Added new registry keys:

+------------+-----------------------------------------------------------------+
| Parameter | `Quirk to improve DP MST hotplug behaviour.` |
+------------+-----------------------------------------------------------------+
| Registry | `x.xserver%.quirks.dp_mst_hotplug` |
+------------+-----------------------------------------------------------------+
| Type | bool |
+------------+-----------------------------------------------------------------+
| Value | enabled / **disabled** (default) |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter | `Quirk to fix issues with screen stays black after DPMS off or DP MST hotplug.` |
+------------+-----------------------------------------------------------------+
| Registry | `x.xserver%.quirks.screen_stay_black` |
+------------+-----------------------------------------------------------------+
| Type | bool |
+------------+-----------------------------------------------------------------+
| Value | enabled / **disabled** (default) |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter | `Quirk to fix issues with screen stays black by switch screen off and on again.` |
+------------+-----------------------------------------------------------------+
| Registry | `x.xserver%.quirks.screen_stay_black_on_off` |
+------------+-----------------------------------------------------------------+
| Type | bool |
+------------+-----------------------------------------------------------------+
| Value | enabled / **disabled** (default) |
+------------+-----------------------------------------------------------------+
```

-----

## 2022-10-04 – [11.08.113](readme11.08.113.txt)

```
The new PRIVATE BUILD 11.08.111 for IGEL Workspace is ready.

This build is based on 11.08.110.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------


### Citrix

* Support for dynamic emergency calling with MS Teams

+------------+-----------------------------------------------------------------+
|Parameter |`Citrix Support for dynamic e911` |
+------------+-----------------------------------------------------------------+
|Registry |`ica.emergencycalling` |
+------------+-----------------------------------------------------------------+
|Value |**false**(default)/true |
+------------+-----------------------------------------------------------------+

* Integrated Citrix Workspace App 2207. 
Available Citrix Workspace apps in this release: 2207 (default), 2205 and 2010
* Composite USB redirection

+------------+-----------------------------------------------------------------+
|Parameter |`Native USB Redirection class rule` |
+------------+-----------------------------------------------------------------+
|Registry |`ica.usbredirection.devicepolicy.class_rule%.rule` |
+------------+-----------------------------------------------------------------+
|Value |{**}Deny{**}(default), Allow, Connect |
+------------+-----------------------------------------------------------------+
|Parameter |`Native USB Redirection product rule` |
+------------+-----------------------------------------------------------------+
|Registry |`ica.usbredirection.devicepolicy.product_rule%.rule` |
+------------+-----------------------------------------------------------------+
|Value |{**}Deny{**}(default), Allow, Connect |
+------------+-----------------------------------------------------------------+

* Citrix Workspace app allows splitting of composite USB devices. A composite
USB device can perform more than one function. These functions are
accomplished by exposing each of those functions using different interfaces.
Examples of composite USB devices include HID devices that consist of audio
and video input and output.
* The Composite USB redirection feature adds the CONNECT value to the rules for
USB devices.
* CONNECT – Set the “CONNECT” keyword to enable auto redirect of a device when a
session starts.
* ALLOW – Set the “ALLOW” keyword to allow auto-redirect of a device only after
a session starts. However, if the “CONNECT” or “ALLOW” keyword is set, the
device is auto-redirected when it unplugged and plugged in during a session.
* Note: [https://kb.igel.com/igelos-11.08/en/native-usb-
redirection-63804310.html] the third option \\"connect\\" has been added to the
class and device rules. Composite USB redirection can change the behavior. If
a device is no longer redirected with CWA 2207, please change the rule to
Connect.
* Enhancement to improve audio quality 
** Playback Delay Thresh

+------------+-----------------------------------------------------------------+
|Parameter |`Playback Delay Thresh` |
+------------+-----------------------------------------------------------------+
|Registry |`ica.module.PlaybackDelayThreshV4` |
+------------+-----------------------------------------------------------------+
|Value |**50 (default)** |
+------------+-----------------------------------------------------------------+

* With this enhancement, the maximum output buffering value is decreased from
200 ms to 50 ms in Citrix Workspace app. As a result, the user experience of
the interactive audio application is improved. Also, the Round trip time (RTT)
is decreased by 150 ms. This parameter is valid only when `AudioRedirectionV4`
is set to `True`.
** Audio Temp Latency Boost

+------------+-----------------------------------------------------------------+
|Parameter |`Audio Temp Latency Boost` |
+------------+-----------------------------------------------------------------+
|Registry |`ica.module.AudioTempLatencyBoostV4` |
+------------+-----------------------------------------------------------------+
|Value |**100 (default)** |
+------------+-----------------------------------------------------------------+

* When the audio throughput undergoes a sudden spike or isn’t enough for an
unstable network, this value increases the output buffering value. This
increase in the output buffering value provides smooth audio. However, the
audio might be slightly delayed. This parameter is only valid when
`AudioRedirectionV4`, and `AudioLatencyControlEnabled` is set to True.
* Improved audio echo cancellation support

+------------+-----------------------------------------------------------------+
|Parameter |`Improved audio echo cancellation support` |
+------------+-----------------------------------------------------------------+
|Registry |`ica.module.enableechocancellation` |
+------------+-----------------------------------------------------------------+
|Value |**false**(default)/true |
+------------+-----------------------------------------------------------------+

* Support for DPI matching

+------------+-----------------------------------------------------------------+
|Parameter |`Support for DPI matching` |
+------------+-----------------------------------------------------------------+
|Registry |`ica.wfclient.dpimatchingenabled` |
+------------+-----------------------------------------------------------------+
|Value |**false**(default)/true |
+------------+-----------------------------------------------------------------+

* The display resolution and DPI scale values set in the Citrix Workspace app
match the corresponding values in the virtual apps and desktops session. DPI
scaling is mostly used with large size and high-resolution monitors to display
applications, text, images, and other graphical elements in a size that can be
viewed comfortably.
* App Protection

+------------+-----------------------------------------------------------------+
|Parameter |`Citrix App Protection` |
+------------+-----------------------------------------------------------------+
|Registry |`ica.appprotection` |
+------------+-----------------------------------------------------------------+
|Value |**false**(default)/true |
+------------+-----------------------------------------------------------------+

* App protection is an add-on feature for the Citrix Workspace app that provides
enhanced security when using Citrix Virtual Apps and Desktops published
resources. Two policies provide anti-keylogging and anti-screen-capturing
capabilities for a Citrix HDX session. This feature is fully supported only
for workspace app 2207, and with the older workspace apps, you may experience
x11vnc crashes.

Resolved Issues
--------------------------------------------------------------------------------


### Imprivata

* improve disconnect/reconnect speed with Imprivata and Horizon. 

fixes Imprivata/Horizon roaming issue
```

-----

## 2022-09-22 – [11.07.921](readme11.07.921.txt)

```
The new PRIVATE BUILD 11.07.921 for IGEL Workspace is ready.

This build is based on 11.07.910.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------


### Cisco Webex

* Available WebEx Meetings Plugins in this release: 42.6.8.5 {**}(default){**},
  42.2.10.7 and 41.10.9.15

```

-----

## 2022-09-22 – [11.08.112.DER](readme11.08.112.DER.txt)

```
The new PRIVATE BUILD 11.08.112.DER for IGEL Workspace is ready.

This build is based on 11.08.110.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

### Cisco JVDI Client

**Cisco JVDI client 12.9.3** available in this release
```

-----

## 2022-09-20 – [11.08.111](readme11.08.111.txt)

```
The new PRIVATE BUILD 11.08.111 for IGEL Workspace is ready.

This build is based on 11.08.110.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

### AVD

* Fixed frequent freezes of the AVD client when MS-Teams calls or screenshares
are ended.
```

-----

## 2022-09-15 – [11.07.920](readme11.07.920.txt)

```
The new PRIVATE BUILD 11.07.920 for IGEL Workspace is ready.

This build is based on 11.07.910.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------


### Network

* Fixed MBB connection editor

### Base system

* Fixed failed firmware update from servers with low bandwidth
```

-----

## 2022-09-15 – [11.08.110](readme11.08.110.txt)

```
The new PRIVATE BUILD 11.08.110 for IGEL Workspace is ready.

This build is based on 11.08.100.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------


### Network

* Fixed MBB connection editor

### Base system

* Fixed failed firmware update from servers with low bandwidth
```

-----

## 2022-09-14 – [11.07.205](readme11.07.205.txt)

```
The new PRIVATE BUILD 11.07.205 for IGEL Workspace is ready.

This build is based on 11.07.170.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------


### RDP/IGEL RDP Client 2

* Fix RDP Client displaying wrong error message when account is locked.
```

-----

## 2022-09-08 – [11.07.196](readme11.07.196.txt)

```
The new PRIVATE BUILD 11.07.196 for IGEL Workspace is ready.

This build is based on 11.07.189.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------


### Base system

* Write log file of deployment self check to dummy partition. 
* Add option in factory mode OSC to automatically shut down after self check.
* Fixed issue with write log file of deployment self check to dummy partition
not working in every case.
* If shutdown on boot is choosen do a shutdown and not suspend.

Resolved Issues
--------------------------------------------------------------------------------


### OSC Installer

* Fixed wrong icon in OSC installer.
```

-----

## 2022-09-07 – [11.08.101](readme11.08.101.txt)

```
The new PRIVATE BUILD 11.08.101 for IGEL Workspace is ready.

This build is based on 11.08.100.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------


### AVD

* Fixed audio crackling issues. 
* Added potential fix for the ClaimsTokenAuthChallenge issue that it pops up the
dialog to often! 
* Added SIGTERM and SIGHUP signal handlers to gracefully disconnect sessions. As
soon as the RdCoreSDK supports session log-off as well, we would do that for
the SIGHUP handler instead of the disconnect! 
* Added potential fixes for crash when printer redirection is enabled! 
* Fixed issue when in the MS-Teams VDI the local video window went black
sometimes! 
* Applied patch to fix bug in boost 1.69.0 that caused the \\"User cancelled\\"
issue. 
https://github.com/boostorg/container/commit/90de9533ecef08e98d82e8f8c26fad578
39e4184 at boost 1.74.0 
* Added two parameters regarding MS-Teams (WebRTC) redirection video decoding:

+------------+-----------------------------------------------------------------+
| Registry | `sessions.wvd0.options.webrtchardwaredecoding` |
+------------+-----------------------------------------------------------------+
| Value | on / **auto** (default) / off |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Registry | `sessions.wvd0.options.webrtcdecodermaxthreads` |
+------------+-----------------------------------------------------------------+
| Value | **1** (default) / 0 (auto) / 0-16 |
+------------+-----------------------------------------------------------------+

* Have set the default value of the new webrtcdecodermaxthreads option to 1 in
order to see if this helps the fluh264dec crashes!
```

-----

## 2022-09-02 – [11.07.203](readme11.07.203.txt)

```
The new PRIVATE BUILD 11.07.911 for IGEL Workspace is ready.

This build is based on 11.07.170.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------


### RD Web Access

* Added new parameter to enable support for Interactive Logon Messages.

+------------+-----------------------------------------------------------------+
|Registry |`rdp.rd_web_access.options.remote_app_interactive_logon_message |
+------------+-----------------------------------------------------------------+
|Type | bool |
+------------+-----------------------------------------------------------------+
|Value | enabled / **disabled** (default) |
+------------+-----------------------------------------------------------------+
```

-----

## 2022-09-01 – [11.07.911](readme11.07.911.txt)

```
The new PRIVATE BUILD 11.07.911 for IGEL Workspace is ready.

This build is based on 11.07.910.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------


### Citrix

* Integrated Citrix Workspace App 2207. 
Available Citrix Workspace apps in this release: 2207 (default), 2205 and 2010
* Newly added registry keys: 
* Enhancement to improve audio quality 
** Playback Delay Thresh

+------------+-----------------------------------------------------------------+
|Parameter |`Playback Delay Thresh` |
+------------+-----------------------------------------------------------------+
|Registry |`ica.module.PlaybackDelayThreshV4` |
+------------+-----------------------------------------------------------------+
|Value |**50 (default)** |
+------------+-----------------------------------------------------------------+

* With this enhancement, the maximum output buffering value is decreased from
200 ms to 50 ms in Citrix Workspace app. As a result, the user experience of
the interactive audio application is improved. Also, the Round trip time (RTT)
is decreased by 150 ms. This parameter is valid only when `AudioRedirectionV4`
is set to `True`. 
** 
** Audio Temp Latency Boost

+------------+-----------------------------------------------------------------+
|Parameter |`Audio Temp Latency Boost` |
+------------+-----------------------------------------------------------------+
|Registry |`ica.module.AudioTempLatencyBoostV4` |
+------------+-----------------------------------------------------------------+
|Value |**100 (default)** |
+------------+-----------------------------------------------------------------+

* When the audio throughput undergoes a sudden spike or isn’t enough for an
unstable network, this value increases the output buffering value. This
increase in the output buffering value provides smooth audio. However, the
audio might be slightly delayed. This parameter is only valid when
`AudioRedirectionV4`, and `AudioLatencyControlEnabled` is set to True. 
* Improved audio echo cancellation support

+------------+-----------------------------------------------------------------+
|Parameter |`Improved audio echo cancellation support` |
+------------+-----------------------------------------------------------------+
|Registry |`ica.module.enableechocancellation` |
+------------+-----------------------------------------------------------------+
|Value |**false**(default)/true |
+------------+-----------------------------------------------------------------+

* Support for DPI matching

+------------+-----------------------------------------------------------------+
|Parameter |`Support for DPI matching` |
+------------+-----------------------------------------------------------------+
|Registry |`ica.wfclient.dpimatchingenabled` |
+------------+-----------------------------------------------------------------+
|Value |**false**(default)/true |
+------------+-----------------------------------------------------------------+

* The display resolution and DPI scale values set in the Citrix Workspace app
match the corresponding values in the virtual apps and desktops session. DPI
scaling is mostly used with large size and high-resolution monitors to display
applications, text, images, and other graphical elements in a size that can be
viewed comfortably. 
* App Protection

+------------+-----------------------------------------------------------------+
|Parameter |`Citrix App Protection` |
+------------+-----------------------------------------------------------------+
|Registry |`ica.appprotection` |
+------------+-----------------------------------------------------------------+
|Value |**false**(default)/true |
+------------+-----------------------------------------------------------------+

* App protection is an add-on feature for the Citrix Workspace app that provides
enhanced security when using Citrix Virtual Apps and Desktops published
resources. Two policies provide anti-keylogging and anti-screen-capturing
capabilities for a Citrix HDX session. This feature is fully supported only
for workspace app 2207, and with the older workspace apps, you may experience
x11vnc crashes. 
* Support for dynamic emergency calling with MS Teams

+------------+-----------------------------------------------------------------+
|Parameter |`Citrix Support for dynamic e911` |
+------------+-----------------------------------------------------------------+
|Registry |`ica.emergencycalling` |
+------------+-----------------------------------------------------------------+
|Value |**false**(default)/true |
+------------+-----------------------------------------------------------------+


### Cisco Webex

* Integrated Cisco WebEx Meetings VDI Plugin 42.6.8.5 

Available Webex Meetings Plugins in this release: 41.10.11.5, 42.2.4.12, and
42.6.8.5 (default)
```

-----

## 2022-09-01 – [11.07.201](readme11.07.201.txt)

```
The new PRIVATE BUILD 11.07.201 for IGEL Workspace is ready.

This build is based on 11.07.170.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------


### Base system

* Fixed issue deploying IGEL OS gpt images to Fujitsu Lifebook U7311 via IGEL
SCCM Add-On
```

-----

## 2022-08-30 – [11.07.152](readme11.07.152.txt)

```
The new PRIVATE BUILD 11.07.152 for IGEL Workspace is ready.

This build is based on 11.07.139.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------


### AVD

* Fixed remote audio playback crackling and out of lip-sync that could happen
under certain circumstances.
* Fixed MS-Teams optimization local webcam video going black sometimes.
```

-----

## 2022-08-25 – [11.07.198](readme11.07.198.txt)

```
The new PRIVATE BUILD 11.07.198 for IGEL Workspace is ready.

This build is based on 11.07.181.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------


### Cisco JVDI Client

* Integrated Cisco JVDI 14.0.3
```

-----

## 2022-08-06 – [11.07.139](readme11.07.139.txt)


```
The new PRIVATE BUILD 11.07.139 for IGEL Workspace is ready.

This build is based on 11.07.136.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------


### AVD

* Included extra network online check (CheckNetworkReachability) reported to the
RdCoreSDK for further debugging heartbeat losses of some users!
```

-----

## 2022-08-03 – [11.07.191](readme11.07.191.txt)

```
The new PRIVATE BUILD 11.07.191 for IGEL Workspace is ready.

This build is based on 11.07.181.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------


### Base system

* Fix further sporadic downgrade issues from 11.07 to 11.05 (includes fixes from
11.07.137.tp2).

### zoomvdi

* Available Zoom Vdi plugins in this release: 5.11.0.21410 (default),
5.10.0.21068, and 5.8.4.21112
```

-----

## 2022-07-29 – [11.07.189](readme11.07.189.txt)

```
The new PRIVATE BUILD 11.07.188 for IGEL Workspace is ready.

This build is based on 11.07.170.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:


New Features
--------------------------------------------------------------------------------


### Base system

* Write log file of deployment self check to dummy partition.  
* Add option in factory mode OSC to automatically shut down after self check.
```

-----

## 2022-07-22 – [11.07.188](readme11.07.188.txt)

```
The new PRIVATE BUILD 11.07.188 for IGEL Workspace is ready.

This build is based on 11.07.170.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------


### RDP/IGEL RDP Client 2

* Fixed RDP Timezone Redirection not setting timezones correctly.
```

-----

## 2022-07-15 – [11.07.151](readme11.07.151.txt)

```
The new PRIVATE BUILD 11.07.151 for IGEL Workspace is ready.

This build is based on 11.07.147.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------


### Citrix

* Integrated Citrix Workspace App 2207. 
Available Citrix Workspace apps in this release: 2207 (default), 2205 and 2010
* Newly added registry keys: 
* Enhancement to improve audio quality 
** Playback Delay Thresh

+------------+-----------------------------------------------------------------+
|Parameter |`Playback Delay Thresh` |
+------------+-----------------------------------------------------------------+
|Registry |`ica.module.PlaybackDelayThreshV4` |
+------------+-----------------------------------------------------------------+
|Value |**50 (default)** |
+------------+-----------------------------------------------------------------+

* With this enhancement, the maximum output buffering value is decreased from
200 ms to 50 ms in Citrix Workspace app. As a result, the user experience of
the interactive audio application is improved. Also, the Round trip time (RTT)
is decreased by 150 ms. This parameter is valid only when `AudioRedirectionV4`
is set to `True`. 
** 
** Audio Temp Latency Boost

+------------+-----------------------------------------------------------------+
|Parameter |`Audio Temp Latency Boost` |
+------------+-----------------------------------------------------------------+
|Registry |`ica.module.AudioTempLatencyBoostV4` |
+------------+-----------------------------------------------------------------+
|Value |**100 (default)** |
+------------+-----------------------------------------------------------------+

* When the audio throughput undergoes a sudden spike or isn’t enough for an
unstable network, this value increases the output buffering value. This
increase in the output buffering value provides smooth audio. However, the
audio might be slightly delayed. This parameter is only valid when
`AudioRedirectionV4`, and `AudioLatencyControlEnabled` is set to True. 
* Improved audio echo cancellation support

+------------+-----------------------------------------------------------------+
|Parameter |`Improved audio echo cancellation support` |
+------------+-----------------------------------------------------------------+
|Registry |`ica.module.enableechocancellation` |
+------------+-----------------------------------------------------------------+
|Value |**false**(default)/true |
+------------+-----------------------------------------------------------------+

* Support for DPI matching

+------------+-----------------------------------------------------------------+
|Parameter |`Support for DPI matching` |
+------------+-----------------------------------------------------------------+
|Registry |`ica.wfclient.dpimatchingenabled` |
+------------+-----------------------------------------------------------------+
|Value |**false**(default)/true |
+------------+-----------------------------------------------------------------+

* The display resolution and DPI scale values set in the Citrix Workspace app
match the corresponding values in the virtual apps and desktops session. DPI
scaling is mostly used with large size and high-resolution monitors to display
applications, text, images, and other graphical elements in a size that can be
viewed comfortably. 
* App Protection

+------------+-----------------------------------------------------------------+
|Parameter |`Citrix App Protection` |
+------------+-----------------------------------------------------------------+
|Registry |`ica.appprotection` |
+------------+-----------------------------------------------------------------+
|Value |**false**(default)/true |
+------------+-----------------------------------------------------------------+

* App protection is an add-on feature for the Citrix Workspace app that provides
enhanced security when using Citrix Virtual Apps and Desktops published
resources. Two policies provide anti-keylogging and anti-screen-capturing
capabilities for a Citrix HDX session. This feature is fully supported only
for workspace app 2207, and with the older workspace apps, you may experience
x11vnc crashes.

### zoomvdi

* Integrated Zoom VDI client 5.11.0.21410, 

Available Zoom VDI clients in this release: 5.11.0.21410
(default), 5.10.6.21295, and 5.8.4.21112

Resolved Issues
--------------------------------------------------------------------------------


### Citrix

* Improved keyboard layout synchronisation: 
* required setting: ica.module.virtualdriver.keyboardsync.enable=true (changed
to default=true) 
* for configuring the new KeyboardSyncMode. Windows Server may require config,
see [https://docs.citrix.com/en-us/citrix-workspace-app-for-linux/configure-
xenapp.html#keyboard-layout-synchronization:] 
default for ica.wfclient.keyboardsyncmode changed to \\"dynamic\\" 
* for configuring new KeyboardEventMode: 
default for ica.wfclient.keyboardeventmode changed to \\"Unicode\\"
```

-----

## 2022-07-14 – [11.07.181](readme11.07.181.txt)

```
The new PRIVATE BUILD 11.07.181 for IGEL Workspace is ready.

This build is based on 11.07.170.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------


### Citrix

* Integrated Citrix Workspace App 2207. 
Available Citrix Workspace apps in this release: 2207 (default), 2205 and 2010
* Newly added registry keys: 
* Enhancement to improve audio quality 
** Playback Delay Thresh

+------------+-----------------------------------------------------------------+
|Parameter |`Playback Delay Thresh` |
+------------+-----------------------------------------------------------------+
|Registry |`ica.module.PlaybackDelayThreshV4` |
+------------+-----------------------------------------------------------------+
|Value |**50 (default)** |
+------------+-----------------------------------------------------------------+

* With this enhancement, the maximum output buffering value is decreased from
200 ms to 50 ms in Citrix Workspace app. As a result, the user experience of
the interactive audio application is improved. Also, the Round trip time (RTT)
is decreased by 150 ms. This parameter is valid only when `AudioRedirectionV4`
is set to `True`.
** Audio Temp Latency Boost

+------------+-----------------------------------------------------------------+
|Parameter |`Audio Temp Latency Boost` |
+------------+-----------------------------------------------------------------+
|Registry |`ica.module.AudioTempLatencyBoostV4` |
+------------+-----------------------------------------------------------------+
|Value |**100 (default)** |
+------------+-----------------------------------------------------------------+

* When the audio throughput undergoes a sudden spike or isn’t enough for an
unstable network, this value increases the output buffering value. This
increase in the output buffering value provides smooth audio. However, the
audio might be slightly delayed. This parameter is only valid when
`AudioRedirectionV4`, and `AudioLatencyControlEnabled` is set to True.
* Improved audio echo cancellation support

+------------+-----------------------------------------------------------------+
|Parameter |`Improved audio echo cancellation support` |
+------------+-----------------------------------------------------------------+
|Registry |`ica.module.enableechocancellation` |
+------------+-----------------------------------------------------------------+
|Value |**false**(default)/true |
+------------+-----------------------------------------------------------------+

* Support for DPI matching

+------------+-----------------------------------------------------------------+
|Parameter |`Support for DPI matching` |
+------------+-----------------------------------------------------------------+
|Registry |`ica.wfclient.dpimatchingenabled` |
+------------+-----------------------------------------------------------------+
|Value |**false**(default)/true |
+------------+-----------------------------------------------------------------+

* The display resolution and DPI scale values set in the Citrix Workspace app
match the corresponding values in the virtual apps and desktops session. DPI
scaling is mostly used with large size and high-resolution monitors to display
applications, text, images, and other graphical elements in a size that can be
viewed comfortably.
* App Protection

+------------+-----------------------------------------------------------------+
|Parameter |`Citrix App Protection` |
+------------+-----------------------------------------------------------------+
|Registry |`ica.appprotection` |
+------------+-----------------------------------------------------------------+
|Value |**false**(default)/true |
+------------+-----------------------------------------------------------------+

* App protection is an add-on feature for the Citrix Workspace app that provides
enhanced security when using Citrix Virtual Apps and Desktops published
resources. Two policies provide anti-keylogging and anti-screen-capturing
capabilities for a Citrix HDX session. This feature is fully supported only
for workspace app 2207, and with the older workspace apps, you may experience
x11vnc crashes.

### zoomvdi

* Integrated Zoom VDI client 5.11.0.21410, 

Available Zoom VDI clients in this release: 5.11.0.21410
(default), 5.10.6.21295, and 5.8.4.21112

Resolved Issues
--------------------------------------------------------------------------------


### Citrix

* Improved keyboard layout synchronisation: 
* required setting: ica.module.virtualdriver.keyboardsync.enable=true (changed
to default=true) 
* for configuring the new KeyboardSyncMode. Windows Server may require config,
see [https://docs.citrix.com/en-us/citrix-workspace-app-for-linux/configure-
xenapp.html#keyboard-layout-synchronization:] 
default for ica.wfclient.keyboardsyncmode changed to \\"dynamic\\" 
* for configuring new KeyboardEventMode: 
default for ica.wfclient.keyboardeventmode changed to \\"Unicode\\"
```

-----

## 2022-07-13 – [11.07.178](readme11.07.178.txt)

```
The new PRIVATE BUILD 11.07.178 for IGEL Workspace is ready.

This build is based on 11.07.170.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------


### CUPS Printing


+------------+-----------------------------------------------------------------+
|Parameter |`Make connected printer default printer` |
+------------+-----------------------------------------------------------------+
|Registry |`print.cups.dynamic_default` |
+------------+-----------------------------------------------------------------+
|Type |bool |
+------------+-----------------------------------------------------------------+
|Value |enabled / **disabled** (default) |
+------------+-----------------------------------------------------------------+

* Added the dynamic default printer feature: If several printer are defined 
the last which is plugged in will be made the default printer. 
On boot the printer will be selected which is connected at the time. 
If more than one printer are connected at boot then the one which is the 
last in the list of printers defined in the OS gets the default. 
If a printer which was default is removed then the remaining printer will 
be elected as default. 
If more than one remain then the last in the list of printers defined 
in the OS gets the default.
* Fixed printer activation on usb hotplug which could fail in rare occasions. 
* Fixed cases where choosing the first usb printer fails because 
it isn't named usblp0 by the kernel as expected but gets a higher number 
(e.g. usblp2) even when there are no other usb printers connected to the 
endpoint at that time. 
So the first usb printer is now defined as the one which is first in the
(sorted) 
list of all connected usb printers. 
Accordingly the second usb printer is the second in the list of usb printers. 
Note that in case you plan to use more than one usb printer at the same time 
you shouldn't use first or second printer as a selection method because the 
numbering is also depending on the timing the printer is registered 
on the endpoint, so on next boot-up the numbering can be different 
especially if the devices are switched on individually. 
In this case it's recommended to use instead the usbclass backend or selection 
by the USB Port on the endpoint or by the printers USB IDs.
```

-----

## 2022-07-13 – [11.07.179](readme11.07.179.txt)

```
The new PRIVATE BUILD 11.07.179 for IGEL Workspace is ready.

This build is based on 11.07.170.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------


### Cisco JVDI Client

* Integrated Cisco JVDI 12.9.3 client
```

-----

## 2022-07-13 – [11.07.182](readme11.07.182.txt)

```
The new PRIVATE BUILD 11.07.182 for IGEL Workspace is ready.

This build is based on 11.07.170.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------


### Power Term

* Updated Ericom PowerTerm LTC to version 14.0.3.71814. This fixes scaling the
emulation window to large sizes.
```

-----

## 2022-07-05 – [11.07.176](readme11.07.176.txt)

```
The new PRIVATE BUILD 11.07.176 for IGEL Workspace is ready.

This build is based on 11.07.170.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------


### AVD

* Added option to select WebRTC h264 hardware decoder usage:

+------------+-----------------------------------------------------------------+
|Parameter |WebRTC hardware decoding mode |
+------------+-----------------------------------------------------------------+
|Registry |`sessions.wvd%.options.webrtchardwaredecoding` |
+------------+-----------------------------------------------------------------+
|Range | [on] [**auto**] [off] |
+------------+-----------------------------------------------------------------+


Resolved Issues
--------------------------------------------------------------------------------


### AVD

* Fixed bug in boost library version 1.69.0 ([https://github.com/boostorg/contai
ner/commit/90de9533ecef08e98d82e8f8c26fad57839e4184)] to help the \\"User
cancelled\\" issue.
* Updated the Fluendo codec pack and switched the Radeon(SI) driver from vdpau
to vaapi to fix the h264 decoding stability issues in AVD with MS-Teams
optimization.
```

-----

## 2022-07-04 – [11.07.173](readme11.07.173.txt)

```
The new PRIVATE BUILD 11.07.173 for IGEL Workspace is ready.

This build is based on 11.07.170.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------


### Audio

* Use this registry key to set the default audio device as fallback device after
device unplug

+------------+-----------------------------------------------------------------+
| Parameter | `Use default audio device as fallback device` |
+------------+-----------------------------------------------------------------+
| Registry | `multimedia.use_default_fallback` |
+------------+-----------------------------------------------------------------+
| Type | bool |
+------------+-----------------------------------------------------------------+
| Value | enabled / **disabled** (default) |
+------------+-----------------------------------------------------------------+
```

-----

## 2022-07-01 – [11.07.175](readme11.07.175.txt)

```
The new PRIVATE BUILD 11.07.175 for IGEL Workspace is ready.

This build is based on 11.07.170.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------


### Smartcard

* Added support for Cherry eHealth ST-1506 in USB RNDIS mode. There is a systray
icon per device. The tooltip says whether it is connected or disconnected in
terms of network configuration. Per device one instance of the template
devices.cherry.terminal% must be created and configured. By default none is
configured and so the feature is essentially disabled.
* This is for potentially distinguishing multiple connected devices and may
contain a MAC address or the value of the udev property ID_NET_NAME_PATH. It
may be left empty if only one device shall be supported:

+------------+-----------------------------------------------------------------+
| Parameter | `Device ID` |
+------------+-----------------------------------------------------------------+
| Registry | `devices.cherry.terminal%.rndis.device_id` |
+------------+-----------------------------------------------------------------+
| Type | string |
+------------+-----------------------------------------------------------------+
| Value | empty **Default** |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter | `Device IP address` |
+------------+-----------------------------------------------------------------+
| Registry | `devices.cherry.terminal%.rndis.device_ipaddress` |
+------------+-----------------------------------------------------------------+
| Type | string |
+------------+-----------------------------------------------------------------+
| Value | 192.168.42.42 **Default** |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter | `Host IP address` |
+------------+-----------------------------------------------------------------+
| Registry | `devices.cherry.terminal%.rndis.host_ipaddress` |
+------------+-----------------------------------------------------------------+
| Type | string |
+------------+-----------------------------------------------------------------+
| Value | 192.168.42.1 **Default** |
+------------+-----------------------------------------------------------------+

* This port on the host will be passed through to the same port on the device:

+------------+-----------------------------------------------------------------+
| Parameter | `Device TCP port` |
+------------+-----------------------------------------------------------------+
| Registry | `devices.cherry.terminal%.rndis.device_tcpport` |
+------------+-----------------------------------------------------------------+
| Type | string |
+------------+-----------------------------------------------------------------+
| Value | 4742 **Default** |
+------------+-----------------------------------------------------------------+

* This port on the host will be passed through to the same port on the device:

+------------+-----------------------------------------------------------------+
| Parameter | `Passed through device UDP port` |
+------------+-----------------------------------------------------------------+
| Registry | `devices.cherry.terminal%.rndis.device_udpport` |
+------------+-----------------------------------------------------------------+
| Type | string |
+------------+-----------------------------------------------------------------+
| Value | 4742 **Default** |
+------------+-----------------------------------------------------------------+

* This port on the host will be forwarded to the device's port 443:

+------------+-----------------------------------------------------------------+
| Parameter | `Host SSL port` |
+------------+-----------------------------------------------------------------+
| Registry | `devices.cherry.terminal%.rndis.host_sslport` |
+------------+-----------------------------------------------------------------+
| Type | string |
+------------+-----------------------------------------------------------------+
| Value | empty **Default** |
+------------+-----------------------------------------------------------------+
```

-----

## 2022-07-01 – [11.07.174](readme11.07.174.txt)

```
The new PRIVATE BUILD 11.07.174 for IGEL Workspace is ready.

This build is based on 11.07.170.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------


### Network

* Fixed negotiation of inner method for 802.1X PEAP authentication

### WiFi

* Added registry key for setting the WPA supplicant parameter
wpa_deny_ptk0_rekey. This should be changed to \\"driver-dependent\\" (i.e. deny
unless driver explicitly asserts capability) or \\"always\\" when WLAN problems
are associated with messages of the form \\"kernel: Rekeying PTK for STA ... but
driver can't safely do that.\\". The default \\"never\\" preserves the traditional
behaviour.

+------------+-----------------------------------------------------------------+
| Parameter | `Deny PTK0 rekey` |
+------------+-----------------------------------------------------------------+
| Registry | `network.interfaces.wirelesslan.device0.wpa_deny_ptk0_rekey` |
+------------+-----------------------------------------------------------------+
| Range | [never][driver-dependent][always] |
+------------+-----------------------------------------------------------------+
| Value | **never** |
+------------+-----------------------------------------------------------------+
```

-----

## 2022-07-01 – [11.07.171](readme11.07.171.txt)

```
The new PRIVATE BUILD 11.07.171 for IGEL Workspace is ready.

This build is based on 11.07.170.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------


### Cisco JVDI Client

* Integrated Cisco JVDI 14.0.3
```

-----

## 2022-06-21 – [11.07.148](readme11.07.148.txt)

```
The new PRIVATE BUILD 11.07.148 for IGEL Workspace is ready.

This build is based on 11.07.140.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:


New Features
--------------------------------------------------------------------------------


### CUPS Printing


+------------+-----------------------------------------------------------------+
|Parameter   |`Make connected printer default printer`                         |
+------------+-----------------------------------------------------------------+
|Registry    |`print.cups.dynamic_default`                                     |
+------------+-----------------------------------------------------------------+
|Type        |bool                                                             |
+------------+-----------------------------------------------------------------+
|Value       |enabled / **disabled** (default)                                 |
+------------+-----------------------------------------------------------------+

* Added the dynamic default printer feature: When several possible  
  (usb connected) printers are defined but only one is actually present  
  at a given place or time, it now becomes the default.  
  If no usb printer is connected then the usual static default  
  printer setting is applied.  
  When more than one of the configured printers are connected  
  then the one which is last in the cups printer list gets the default setting.
* Fixed printer activation on usb hotplug which could fail in rare occasions.
* Fixed cases where choosing the first usb printer fails because  
  it isn't named usblp0 by the kernel as expected but gets a higher number  
  (e.g. usblp2) even when there are no other usb printers connected to the  
  endpoint at that time.  
  So the first usb printer is now defined as the one which is first in the
  (sorted)  
  list of all connected usb printers.  
  Accordingly the second usb printer is the second in the list of usb printers.  
  Note that in case you plan to use more than one usb printer at the same time  
  you shouldn't use first or second printer as a selection method because the  
  numbering is also depending on the timing the printer is registered  
  on the endpoint, so on next boot-up the numbering can be different  
  especially if the devices are switched on individually.  
  In this case it's recommended to use instead the usbclass backend or selection  
  by the USB Port on the endpoint or by the printers USB IDs.
```

-----

## 2022-06-21 – [11.07.147](readme11.07.147.txt)

```
The new PRIVATE BUILD 11.07.147 for IGEL Workspace is ready.

This build is based on 11.07.144.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------


### Base system

* Added new registry key to disable DisplayPort MST support for the amdgpu
driver.

+------------+-----------------------------------------------------------------+
| Parameter | `Disable DP MST support of the AMDPU DRM driver.` |
+------------+-----------------------------------------------------------------+
| Registry | `x.drivers.amdgpu.disable_dp_mst_support` |
+------------+-----------------------------------------------------------------+
| Type | bool |
+------------+-----------------------------------------------------------------+
| Value | enabled / **disabled** (default) |
+------------+-----------------------------------------------------------------+


Resolved Issues
--------------------------------------------------------------------------------


### HID

* Make touchpad acceleration setting work if libinput driver is used for
touchpad devices.

### Base system

* Added several registry keys to be able to set new kernel commandline options

+------------+-----------------------------------------------------------------+
| Parameter | `Use polling for IRQs.` |
+------------+-----------------------------------------------------------------+
| Registry | `system.kernel.bootparams.irqpoll` |
+------------+-----------------------------------------------------------------+
| Type | bool |
+------------+-----------------------------------------------------------------+
| Value | enabled / **disabled** (default) |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter | `Disable use of Hyperthreading.` |
+------------+-----------------------------------------------------------------+
| Registry | `system.kernel.bootparams.nosmt` |
+------------+-----------------------------------------------------------------+
| Type | bool |
+------------+-----------------------------------------------------------------+
| Value | enabled / **disabled** (default) |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter | `Enable debug output for i8042 driver.` |
+------------+-----------------------------------------------------------------+
| Registry | `system.kernel.bootparams.i8042.debug` |
+------------+-----------------------------------------------------------------+
| Type | bool |
+------------+-----------------------------------------------------------------+
| Value | enabled / **disabled** (default) |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter | `Do not use muxing for i8042 driver.` |
+------------+-----------------------------------------------------------------+
| Registry | `system.kernel.bootparams.i8042.nomux` |
+------------+-----------------------------------------------------------------+
| Type | bool |
+------------+-----------------------------------------------------------------+
| Value | enabled / **disabled** (default) |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter | `Disable use of PnP configuration for i8042 driver.` |
+------------+-----------------------------------------------------------------+
| Registry | `system.kernel.bootparams.i8042.nopnp` |
+------------+-----------------------------------------------------------------+
| Type | bool |
+------------+-----------------------------------------------------------------+
| Value | enabled / **disabled** (default) |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter | `Disable use of AUX loopback command for i8042 driver.` |
+------------+-----------------------------------------------------------------+
| Registry | `system.kernel.bootparams.i8042.noloop` |
+------------+-----------------------------------------------------------------+
| Type | bool |
+------------+-----------------------------------------------------------------+
| Value | enabled / **disabled** (default) |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter | `Ignore timeout signaled by controller for i8042 driver.` |
+------------+-----------------------------------------------------------------+
| Registry | `system.kernel.bootparams.i8042.notimeout` |
+------------+-----------------------------------------------------------------+
| Type | bool |
+------------+-----------------------------------------------------------------+
| Value | enabled / **disabled** (default) |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter | `Reset controller during init for i8042 driver.` |
+------------+-----------------------------------------------------------------+
| Registry | `system.kernel.bootparams.i8042.reset` |
+------------+-----------------------------------------------------------------+
| Type | bool |
+------------+-----------------------------------------------------------------+
| Value | enabled / **disabled** (default) |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter | `Set PCI kernel parameters.` |
+------------+-----------------------------------------------------------------+
| Registry | `system.kernel.bootparams.pci` |
+------------+-----------------------------------------------------------------+
| Range | [No setting][Conf1][Conf2][Nodomains][Nommconf][Nomsi][Nocrs] |
| | [Noacpi][Routeirq] |
+------------+-----------------------------------------------------------------+
| Value | **No setting** |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter | `Set kernel clocksource to use.` |
+------------+-----------------------------------------------------------------+
| Registry | `system.kernel.bootparams.clocksource` |
+------------+-----------------------------------------------------------------+
| Range | [Default][Jiffies][ACPI PM][HPET][TSC] |
+------------+-----------------------------------------------------------------+
| Value | **no** |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter | `PCIe Active State Power Management setting.` |
+------------+-----------------------------------------------------------------+
| Registry | `system.kernel.bootparams.pcie_aspm` |
+------------+-----------------------------------------------------------------+
| Range | [On][Off] |
+------------+-----------------------------------------------------------------+
| Value | **On** |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter | `Dynamic ticks setting.` |
+------------+-----------------------------------------------------------------+
| Registry | `system.kernel.bootparams.nohz` |
+------------+-----------------------------------------------------------------+
| Range | [On][Off] |
+------------+-----------------------------------------------------------------+
| Value | **On** |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter | `Delay in seconds before new devices are scanned.` |
+------------+-----------------------------------------------------------------+
| Registry | `system.kernel.bootparams.usb_storage_delay` |
+------------+-----------------------------------------------------------------+
| Type | integer |
+------------+-----------------------------------------------------------------+
| Value | 0 **Default** |
+------------+-----------------------------------------------------------------+


### X11 system

* Added new registry key to enable old monitor connector scheme

+------------+-----------------------------------------------------------------+
| Parameter | `Use old DP connector setup name handling.` |
+------------+-----------------------------------------------------------------+
| Registry | `x.drm_daemon.use_legacy_dp_handling` |
+------------+-----------------------------------------------------------------+
| Type | bool |
+------------+-----------------------------------------------------------------+
| Value | enabled / **disabled** (default) |
+------------+-----------------------------------------------------------------+

* Added new registry key to fix issues with DP MST handling:

+------------+-----------------------------------------------------------------+
| Parameter | `Use new DP MST connector setup name handling.` |
+------------+-----------------------------------------------------------------+
| Tooltip | `Use this if you have issues with not getting all displays configured.` |
+------------+-----------------------------------------------------------------+
| Registry | `x.drm_daemon.use_new_dp_mst_handling` |
+------------+-----------------------------------------------------------------+
| Type | bool |
+------------+-----------------------------------------------------------------+
| Value | enabled / **disabled** (default) |
+------------+-----------------------------------------------------------------+


### X server

* Some older ATI/Radeon cards make trouble with current Xorg servers so added
possibility to switch to a older one. 
* Added a new registry key to switch to a older Xorg server version.

+------------+-----------------------------------------------------------------+
| Parameter | `Use older xorg server version.` |
+------------+-----------------------------------------------------------------+
| Registry | `x.server.use_legacy_xorg_server` |
+------------+-----------------------------------------------------------------+
| Type | bool |
+------------+-----------------------------------------------------------------+
| Value | enabled / **disabled** (default) |
+------------+-----------------------------------------------------------------+
```

-----

## 2022-06-14 – [11.07.136](readme11.07.136.txt)


```
The new PRIVATE BUILD 11.07.136 for IGEL Workspace is ready.

This build is based on 11.07.133.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------


### AVD

* Fixed bug in boost library version 1.69.0 ([https://github.com/boostorg/contai
ner/commit/90de9533ecef08e98d82e8f8c26fad57839e4184)] to help the \\"User
cancelled\\" issue.
* Updated the Fluendo codec pack and switched the Radeon(SI) driver from vdpau
to vaapi to fix the h264 decoding stability issues in AVD with MS-Teams
optimization.
``` 

-----

## 2022-06-14 – [11.07.144](readme11.07.144.txt)

```
The new PRIVATE BUILD 11.07.144 for IGEL Workspace is ready.

This build is based on 11.07.140.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

    New Features
--------------------------------------------------------------------------------


### Citrix

* Integrated Citrix Workspace app 22.05. 
Available Citrix Workspace apps in this release: 22.05 (default), 22.03 and
20.10
* Added registry keys for Citrix Workspace app 22.05: 
* Authentication enhancement for Storebrowse

+------------+-----------------------------------------------------------------+
|Parameter |`Disable Authentication enhancement for Storebrowse` |
+------------+-----------------------------------------------------------------+
|Registry |`ica.authman.StorebrowseIPCDisabled` |
+------------+-----------------------------------------------------------------+
|Value |**true**(default)/false |
+------------+-----------------------------------------------------------------+

* Authentication dialog is present inside Citrix Workspace app and the store
details are displayed on the login screen. The authentication tokens are
encrypted and stored so that you don’t need to reenter credentials when your
system or session restarts. 
* Email-based auto-discovery of store

+------------+-----------------------------------------------------------------+
|Parameter |`Email-based auto-discovery of store` |
+------------+-----------------------------------------------------------------+
|Registry |`ica.authman.AppConfigEnabled` |
+------------+-----------------------------------------------------------------+
|Value |true/**false**(default) |
+------------+-----------------------------------------------------------------+

* Automatically discovers the store associated with the email address 
* Feature Flag Management

+------------+-----------------------------------------------------------------+
|Parameter |`Feature flag management` |
+------------+-----------------------------------------------------------------+
|Registry |`ica.module.enablelaunchdarkly` |
+------------+-----------------------------------------------------------------+
|Value |disable/**enable**(default) |
+------------+-----------------------------------------------------------------+

* If an issue occurs with Citrix Workspace app in production, we can disable an
affected feature dynamically in Citrix Workspace app even after the feature
ships. To do so, we use feature flags and a third-party service called
LaunchDarkly.

### Cisco JVDI Client

* Integrated **Cisco JVDI client 14.1.1**

### Cisco Webex

* Integrated Cisco WebEx Meetings VDI Plugin 42.5.5.9 

Available Webex Meetings Plugins in this release: 42.5.5.9 **(default)**,
42.2.7.20 and 41.10.13.18
```

-----

## 2022-06-13 – [11.07.143](readme11.07.143.txt)

```
The new PRIVATE BUILD 11.07.143 for IGEL Workspace is ready.

This build is based on 11.07.140.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

    Resolved Issues
--------------------------------------------------------------------------------


### X11 system

* Added new registry key to enable old monitor connector scheme

+------------+-----------------------------------------------------------------+
| Parameter | `Use old DP connector setup name handling.` |
+------------+-----------------------------------------------------------------+
| Registry | `x.drm_daemon.use_legacy_dp_handling` |
+------------+-----------------------------------------------------------------+
| Type | bool |
+------------+-----------------------------------------------------------------+
| Value | enabled / **disabled** (default) |
+------------+-----------------------------------------------------------------+


### X server

* Some older ATI/Radeon cards make trouble with current Xorg servers so added
possibility to switch to a older one. 
* Added a new registry key to switch to a older Xorg server version.

+------------+-----------------------------------------------------------------+
| Parameter | `Use older xorg server version.` |
+------------+-----------------------------------------------------------------+
| Registry | `x.server.use_legacy_xorg_server` |
+------------+-----------------------------------------------------------------+
| Type | bool |
+------------+-----------------------------------------------------------------+
| Value | enabled / **disabled** (default) |
+------------+-----------------------------------------------------------------+
```

-----

## 2022-06-10 – [11.07.160](readme11.07.160.txt)

```
The new PRIVATE BUILD 11.07.160 for IGEL Workspace is ready.

This build is based on 11.07.150.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

    Resolved Issues
--------------------------------------------------------------------------------


### Hardware

* Add support for HP T655 Elite Thin Client.
```

-----

## 2022-06-08 – [11.07.150](readme11.07.150.txt)

```
The new PRIVATE BUILD 11.07.150 for IGEL Workspace is ready.

This build is based on 11.07.140.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

    
New Features
--------------------------------------------------------------------------------


### Base system

* Add new generic job to update HP G5 USB-C docking stations.

+------------+-----------------------------------------------------------------+
| Parameter | `The path to the firmware file on the device` |
+------------+-----------------------------------------------------------------+
| Registry | `update.devices.hp_g5_dock.path` |
+------------+-----------------------------------------------------------------+
| Value | **/wfs/hp_g5_dock_firmware.cab** |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter | `Whether the update should proceed even if the provided firmware is older than the current one on the Dock.` |
+------------+-----------------------------------------------------------------+
| Registry | `update.devices.hp_g5_dock.allow_downgrade` |
+------------+-----------------------------------------------------------------+
| Value | enabled / **disabled** (default) |
+------------+-----------------------------------------------------------------+


Resolved Issues
--------------------------------------------------------------------------------


### Base system

* Apply kernel patch for AMD power management.
```

-----

## 2022-06-03 – [11.07.141](readme11.07.141.txt)

```
The new PRIVATE BUILD 11.07.141 for IGEL Workspace is ready.

This build is based on 11.07.140.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

    
Resolved Issues
--------------------------------------------------------------------------------

### RD Web Access

* Fixed virtual channel plugins in RD Web Access sessions: PhilipsSpeech,
  deviceTRUST, Diktamen, Grundig, Lakeside and Olympus.
```
