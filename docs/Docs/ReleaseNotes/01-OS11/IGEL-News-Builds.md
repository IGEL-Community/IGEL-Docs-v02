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

## 2024-05-15 - [11.09.168](readme11.09.168.txt)

```
The new PRIVATE BUILD 11.09.168 for IGEL Workspace is ready.

This build is based on 11.09.160.

These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------

### Hardware

* New setup registry parameter to turn on / off USB power when device is in
power-off state. Please note that this is an experimental feature to resolve a
specific issue with UD3 devices. Use this to update BIOS settings at your own
risk. This feature will not be available in future releases. The setup
parameter is fwtools.insyde_bios_tools.turn_off_usb_when_device_is_off.
Changing it via UMS or on the device will immediately update the corresponding
BIOS setting.
```

-----

## 2024-05-14 - [11.09.318](readme11.09.318.txt)

```
The new PRIVATE BUILD 11.09.318 for IGEL Workspace is ready.

This build is based on 11.09.310.

These are the release notes published with that release:

Known Issues
--------------------------------------------------------------------------------

### Citrix

* Adding smartcard readers during running / active session does not work. The
  reader is visible, but cannot be used due to unknown reader status. Only
  relevant for CWA versions earlier than 2112.
* Browser Content Redirection (BCR) does not work if DRI3 and hardware
  accelerated H.264 deep compression codec is enabled.
* Citrix H.264 acceleration plugin does not work with **enabled** server policy
  "Optimize for 3D graphics workload" in combination with server policy "Use
  video codec compression" -> *"For the entire screen"**.
* To launch multiple desktop sessions with Citrix HDX RTME and Citrix H.264  
  acceleration plugin, the following registry key needs to be enabled:

+------------+-----------------------------------------------------------------+
|Parameter   |`Activate workaround for dual RTME sessions and H264 acceleration` |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.workaround-dual-rtme`                                       |
+------------+-----------------------------------------------------------------+
|Range       |enabled / **disabled** (default)                                 |
+------------+-----------------------------------------------------------------+

* This workaround is not applicable when "Enable Secure ICA" is active for the  
  specific delivery group.
* Currently H.264 for Citrix sessions cannot be used in parallel with video
  input acceleration.
* While starting Self-Service, it is possible that process ServiceRecord
  segfaults -> Self-Service cannot be started afterwards.  
  A cache cleanup with reboot is needed. In addition, the following parameters
  should set to true.

+------------+-----------------------------------------------------------------+
|Parameter   |`Clean up UI cache after Self-Service termination`               |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.selfservice.cleanupwebui`                                   |
+------------+-----------------------------------------------------------------+
|Value       |**false** (default)/true                                         |
+------------+-----------------------------------------------------------------+
|Parameter   |`Clean up Store cache after Self-Service termination`            |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.selfservice.cleanupstore`                                   |
+------------+-----------------------------------------------------------------+
|Value       |**false** (default)/true                                         |
+------------+-----------------------------------------------------------------+

* Browser Content Redirection (BCR) may not work with Chrome version 105.0.* or
  later. See https://support.citrix.com/article/CTX473065/hdx-browser-content-
  redirection-broken-with-google-chrome-browser-version-105-or-higher
* White / green fragments may appear during desktop launch if JPEG graphical
  codec is used.
* MS Teams calls may stop if blurred background is enabled. This affects Citrix
  Workspace App 2305 and later.
* Regarding CVE-2023-41993, CVE-2023-39928 & CVE-2023-41074: For compatibility
  with Citrix Self-Service, older Webkit libraries are used instead of the
  latest ones to continue working properly.
* More information: https://kb.igel.com/securitysafety/en/isn-2023-25-webkit-
  vulnerabilities-101066782.html
* ZoomVDI version 5.16 or newer is no longer supported with Citrix Workspace app
  20.10
* Browser Content Redirection (BCR) may not work with Citrix workspace app 23.11
  and current Chrome versions.

### OSC Installer

* OSC not deployable with IGEL Deployment Appliance: Version 11.3 or later is
  required for deploying IGEL OS 11.06. and following.

### AVD

* H.264 hardware decoding for MS-Teams optimization is currently limited to non-
  AMD devices due to stability issues on AMD devices.

### VMware Horizon

* After disconnect of an RDP-based session, the Horizon main window which
  contains the server or sessions overview, cannot be resized anymore.
* Copying text from Horizon Blast sessions is not possible.
* The on-screen keyboard in Horizon appliance mode does not work correctly with
  local logon.  
  It is necessary to switch off local logon and enable the following two keys
  via IGEL registry:  
  userinterface.softkeyboard.autoshow  
  userinterface.softkeyboard.autohide
* With usage of PCoIP protocol, the virtual channel provided by VMware used for
  serial port and scanner redirection could freeze on logout from remote
  session.
* This happens only with enabled scanner or serial port redirection.  
  The freeze does not occur if both redirection methods are enabled or none of
  them. The Blast Protocol is not affected by this bug.
* The respective settings can be found in the IGEL Registry:  
  vmware.view.enable-serial-port-redir  
  vmware.view.enable-scanner-redir
* Keyboard Input Source Language Synchronization works only with usage of local
  layout and deadkeys enabled.  
  If a keyboard layout is used which has deadkeys disabled (which is the default
  on IGEL OS), Horizon client falls back to en-US layout.
* PCoIP sessions may crash in some cases, switch to Blast Protocol is
  recommended then. H.264/HEVC encoding can be disabled when overall performance
  is too low.
* Client drive mapping and USB redirection for storage devices can be enabled at
  the same time, but this could lead to sporadic problems.  
  Horizon Client tracks the drives which are dynamically mounted and adds them
  to the remote session using client drive mapping, means USB redirection is not
  used for theses devices then.  
  However, in case of devices like USB SD card readers, Horizon does not map
  them as client drives but forcefully uses USB-redirection which results in an
  unclean unmount.  
  As a work-around, the IDs of these card readers can be added to IGEL USB
  access rules and denied.

### Parallels Client

* Attached storage devices appear as network drives in the remote session  
* USB device redirection is considered as experimental for the Parallels client
  for Linux

### Chromium

* Hardware accelerated video decoding is currently not supported.

### Firefox

* With enabled Citrix Browser Content Redirection, Firefox has no H.264 and AAC
  multimedia codec support. Means, when codec support is needed in Firefox, BCR
  needs to be disabled. Citrix Browser Content Redirection is disabled by
  default.
* Firefox restart option currently not supported.

### Network

* Wakeup from system suspend fails on DELL Latitude 5510

### IGEL Agent for Imprivata

* IGEL Agent for Imprivata does not work in auth only - mode with VMware
  Horizon.

### Cisco JVDI Client

* There may be a segfault shown in the logs (during logout of Citrix Desktop
  session). Occurs only when using Citrix Workspace App 2010 and Cisco JVDI.
* Citrix Workspace app 2010 may cause problems with Cisco JVDI. New ZoomVDI
  versions and App Protection are no longer supported.

### Base system

* Update from memory stick requires network online state (at least when multiple
  update stages are triggered / necessary)
* It is not possible to perform an unattended OS12 migration to base system
  12.2.0 as an additional / manual reboot is necessary. The recommended upgrade
  version for unattended migration is base system 12.2.1.
* Due to suspend/resume issues of a Innodisk NVME we disabled the suspend
  support for systems where this NVME is present. The issue otherwise will lead
  to a complete loose of the storage device as the NVME will not work after
  resume.

### Conky

* The right screen when using multiscreen environment may not be shown
  correctly.  
  Workaround: The horizontal offset should be set to the width of the monitor
  (e.g. if the monitor has a width of 1920, the offset should be set to 1920)

### Firmware update

* On devices with 4 GB flash storage or smaller it could happen that there is
  not enough space for updating all features. In this case, a corresponding
  error message occurs. Please visit https://kb.igel.com/igelos-11.09/en/error-
  not-enough-space-on-local-drive-when-updating-to-igel-os-11-08-or-
  higher-101059051.html  for a possible solution and additional information.

### Appliance Mode

* When ending a Citrix session in browser appliance mode, the browser is
  restarted twice (instead of once).
* Appliance mode RHEV/Spice: spice-xpi firefox plugin is no longer supported.
  The "Console Invocation" has to allow 'Native' client (auto is also possible)
  and should be started in fullscreen to prevent any opening windows.
* Browser Appliance mode can fail when the Web URL contains special control
  characters like ampersand (& character).  
  Workaround: Add quotes at the beginning and the end of an affected URL. E.g.:  
  'https://www.google.com/search?q=aSearchTerm&source=lnms&tbm=isch'

### Audio

* Audio jack detection on Advantec POC-W243L does not work. Therefore, sound
  output goes through a possibly connected headset and also the internal
  speakers.
* UD3-M340C: Sound preferences are showing Headphone & Microphone, although not
  connected.
* IGEL UD2 (D220) fails to restore the volume level of the speaker when the
  device used firmware version 11.01.110 before.

### Multimedia

* Multimedia redirection with GStreamer could fail when using Nouveau GPU
  driver.

### Hardware

* Some newer Delock 62599 active DisplayPort to DVI (4k) adapters only work on
  INTEL-based devices.
* Wake up from suspend via UMS does not work on HP mt645 devices. Workaround:
  Disable system suspend and use shutdown instead.
* Built-in fingerprint sensor is not supported on HP mt440 and mt645.
* MAC-Address Passthrough not supported on Lenovo USB-C Hybrid Docking Station.
* Wake-on-Lan via docking stations is not supported.
* In some rare cases it is possible that connecting or booting Lenovo USB-C
  Hybrid Docking station over USB-C results in non working / faulty display
  output.  
** It may help to (re-)connect via USB-A. If this is the case, USB-C should be
  also functional then.
* Display configuration of displays connected to HP G5 Docking Station may fail
  with HP t655.

### Remote Management

* AIT feature with IGEL Starter License is only supported by UMS version
  6.05.100 or newer.
```

-----

## 2024-05-14 - [11.09.317](readme11.09.317.txt)

```
The new PRIVATE BUILD 11.09.317 for IGEL Workspace is ready.

This build is based on 11.09.310.

These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------

### Cisco Webex

* Updated Webex VDI to version 44.4.0.29324
```

-----

## 2024-04-26 - [11.99.997](readme11.99.997.txt)

```
The new PRIVATE BUILD 11.99.997 for IGEL Workspace is ready.

This build is based on 11.08.360.

These are the release notes published with that release:

Known Issues
--------------------------------------------------------------------------------

### Citrix

* Adding smartcard readers during running / active session does not work. The
  reader is visible, but cannot be used due to unknown reader status. Only
  relevant for CWA versions earlier than 2112.
* There are known issues with GStreamer 1.0 in combination with Citrix. These
  occure with multimedia redirection of H.264, MPEG1 and MPEG2. (GStreamer 1.0
  is used if browser content redirection is enabled active.)
* Browser Content Redirection (BCR) does not work if DRI3 and hardware
  accelerated H.264 deep compression codec is enabled.
* Citrix H.264 acceleration plugin does not work with **enabled** server policy
  "Optimize for 3D graphics workload" in combination with server policy "Use
  video codec compression" -> *"For the entire screen"**.
* To launch multiple desktop sessions with Citrix HDX RTME and Citrix H.264  
  acceleration plugin, the following registry key needs to be enabled:

+------------+-----------------------------------------------------------------+
|Parameter   |`Activate workaround for dual RTME sessions and H264 acceleration` |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.workaround-dual-rtme`                                       |
+------------+-----------------------------------------------------------------+
|Range       |enabled / **disabled** (default)                                 |
+------------+-----------------------------------------------------------------+

* This workaround is not applicable when "Enable Secure ICA" is active for the  
  specific delivery group.
* Currently H.264 for Citrix sessions cannot be used in parallel with video
  input acceleration.
* While starting Self-Service, it is possible that process ServiceRecord
  segfaults -> Self-Service cannot be started afterwards.  
  A cache cleanup with reboot is needed. In addition, the following parameters
  should set to true.

+------------+-----------------------------------------------------------------+
|Parameter   |`Clean up UI cache after Self-Service termination`               |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.selfservice.cleanupwebui`                                   |
+------------+-----------------------------------------------------------------+
|Value       |**false** (default)/true                                         |
+------------+-----------------------------------------------------------------+
|Parameter   |`Clean up Store cache after Self-Service termination`            |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.selfservice.cleanupstore`                                   |
+------------+-----------------------------------------------------------------+
|Value       |**false** (default)/true                                         |
+------------+-----------------------------------------------------------------+

* Logoff of Self-Service causes a segfault with CWAL 2211 which ends the
  application. Restart of Self-Service is functional.
* Browser Content Redirection (BCR) may not work with Chrome version 105.0.* or
  later. See https://support.citrix.com/article/CTX473065/hdx-browser-content-
  redirection-broken-with-google-chrome-browser-version-105-or-higher
* White / green fragments may appear during desktop launch if JPEG graphical
  codec is used.
* Under certain conditions, webcam redirection may not work.  
  If this is the case, GStreamer has to be set to version 1.0 via registry or by
  enabling Browser Content Redirection (BCR).

### OSC Installer

* OSC not deployable with IGEL Deployment Appliance: Version 11.3 or later is
  required for deploying IGEL OS 11.06. and following.

### AVD

* AVD MS-Teams optimization can crash the AVD client if H264 software decoder is
  used (fluh264dec). AVD prefers the hardware decoders (fluvadec) but when there
  are no hardware decoders or when all hardware decoders are in use already, the
  software decoder is utilized which may randomly crash the AVD client. It is
  likely when it crashes in a certain MS-Teams call, it might crash quite soon
  again when rejoining the same call. A fix for that is in development. A
  workaround is to disable incoming video in such MS-Teams calls, which is an
  option in the "..." menu from the control bar during an active call.
* H.264 hardware decoding for MS-Teams optimization is currently limited to non-
  AMD devices due to stability issues on AMD devices.
* Scanning images within AVD session (with usage of FabulaTech Scanner
  Redirection) might fail and cause a reconnection if the compression level is
  set to high quality.  
  As a workaround the compression level must be reduced.

### VMware Horizon

* After disconnect of an RDP-based session, the Horizon main window which
  contains the server or sessions overview, cannot be resized anymore.
* Copying text from Horizon Blast sessions is not possible.
* The on-screen keyboard in Horizon appliance mode does not work correctly with
  local logon.  
  It is necessary to switch off local logon and enable the following two keys
  via IGEL registry:  
  userinterface.softkeyboard.autoshow  
  userinterface.softkeyboard.autohide
* Zoom VDI Media Plugin versions below 5.8.0 make Horizon Client crash upon
  connection to the remote desktop when TCSetup is running at the same time.
* With usage of PCoIP protocol, the virtual channel provided by VMware used for
  serial port and scanner redirection could freeze on logout from remote
  session.
* This happens only with enabled scanner or serial port redirection.  
  The freeze does not occur if both redirection methods are enabled or none of
  them. The Blast Protocol is not affected by this bug.
* The respective settings can be found in the IGEL Registry:  
  vmware.view.enable-serial-port-redir  
  vmware.view.enable-scanner-redir
* Keyboard Input Source Language Synchronization works only with usage of local
  layout and deadkeys enabled.  
  If a keyboard layout is used which has deadkeys disabled (which is the default
  on IGEL OS), Horizon client falls back to en-US layout.
* PCoIP sessions may crash in some cases, switch to Blast Protocol is
  recommended then. H.264/HEVC encoding can be disabled when overall performance
  is too low.
* Client drive mapping and USB redirection for storage devices can be enabled at
  the same time, but this could lead to sporadic problems.  
  Horizon Client tracks the drives which are dynamically mounted and adds them
  to the remote session using client drive mapping, means USB redirection is not
  used for theses devices then.  
  However, in case of devices like USB SD card readers, Horizon does not map
  them as client drives but forcefully uses USB-redirection which results in an
  unclean unmount.  
  As a work-around, the IDs of these card readers can be added to IGEL USB
  access rules and denied.

### Parallels Client

* Attached storage devices appear as network drives in the remote session  
* USB device redirection is considered as experimental for the Parallels client
  for Linux

### Firefox

* With enabled Citrix Browser Content Redirection, Firefox has no H.264 and AAC
  multimedia codec support. Means, when codec support is needed in Firefox, BCR
  needs to be disabled. Citrix Browser Content Redirection is disabled by
  default.
* Multimedia playback in Firefox is unstable if GStreamer version 0.10 is
  active. The default GStreamer version for Firefox
  sessions.browser\<inst>.gstreamer_version was set to 1.0.

### Network

* Wakeup from system suspend fails on DELL Latitude 5510
* If applications are configured to start after established network connection
  and network mounts are configured, spurious "Failed to start application"
  notifications may be shown. The applications still start.
* Set of credentials for manual system wide proxy is broken.

### Cisco JVDI Client

* There may be a segfault shown in the logs (during logout of Citrix Desktop
  session). Occurs only when using Citrix Workspace App 2010 and Cisco JVDI.
* Citrix Workspace app 2010 may cause problems with Cisco JVDI. New ZoomVDI
  versions and App Protection are no longer supported.

### Base system

* Hyper-V (Generation 2) needs a lot of memory (RAM). The machine needs a
  sufficient amount of memory allocated.
* Update from memory stick requires network online state (at least when multiple
  update stages are triggered / necessary)

### Conky

* The right screen when using multiscreen environment may not be shown
  correctly.  
  Workaround: The horizontal offset should be set to the width of the monitor
  (e.g. if the monitor has a width of 1920, the offset should be set to 1920)

### Firmware update

* On devices with 2 GB of flash storage it could happen that there is not enough
  space for updating all features. In this case, a corresponding error message
  occurs. Please visit [https://kb.igel.com/igelos-11.04/en/error-not-enough-
  space-on-local-drive-when-updating-to-igel-os-11-04-or-higher-32870765.html]
  for a possible solution and additional information.

### Appliance Mode

* When ending a Citrix session in browser appliance mode, the browser is
  restarted twice (instead of once).
* Appliance mode RHEV/Spice: spice-xpi firefox plugin is no longer supported.
  The "Console Invocation" has to allow 'Native' client (auto is also possible)
  and should be started in fullscreen to prevent any opening windows.
* Browser Appliance mode can fail when the Web URL contains special control
  characters like ampersand (& character).  
  Workaround: Add quotes at the beginning and the end of an affected URL. E.g.:  
  'https://www.google.com/search?q=aSearchTerm&source=lnms&tbm=isch'

### Audio

* Audio jack detection on Advantec POC-W243L does not work. Therefore, sound
  output goes through a possibly connected headset and also the internal
  speakers.
* UD3-M340C: Sound preferences are showing Headphone & Microphone, although not
  connected.
* IGEL UD2 (D220) fails to restore the volume level of the speaker when the
  device used firmware version 11.01.110 before.

### Multimedia

* Multimedia redirection with GStreamer could fail when using Nouveau GPU
  driver.

### Hardware

* Some newer Delock 62599 active DisplayPort to DVI (4k) adapters only work on
  INTEL-based devices.
* Wake up from suspend via UMS does not work on HP mt645 devices. Workaround:
  Disable system suspend and use shutdown instead.
* System suspend is not supported on Lenovo L14 Gen 3 Intel based device.
* If bluetooth is disabled via tray icon / menu on Lenovo L14 Gen3 (Intel-
  based), bluetooth tray icon is permanently disabled. Can be solved / re-
  enabeld with console command rfkill unblock bluetooth
* Built-in fingerprint sensor is not supported on HP mt440 and mt645.

### Remote Management

* AIT feature with IGEL Starter License is only supported by UMS version
  6.05.100 or newer.
```

-----

## 2024-04-26 - [11.09.315](readme11.09.315.txt)

```
The new PRIVATE BUILD 11.09.315 for IGEL Workspace is ready.

This build is based on 11.09.310.

These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------

### Chromium

* Fixed an issue where Chromium Browser crashes if any other language than
  English was set.
```

-----

## 2024-04-26 - [11.09.219](readme11.09.219.txt)

```
The new PRIVATE BUILD 11.09.219 for IGEL Workspace is ready.

This build is based on 11.09.218.

These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------

### Fabulatech

* Integrated ftplugins 4.0.0.2 and ftusbrdp 6.1.4.1.
```

-----

## 2024-04-26 - [11.09.320](readme11.09.320.txt)

```
The new PRIVATE BUILD 11.09.320 for IGEL Workspace is ready.

This build is based on 11.09.310.

These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------

### Base system

* Fixed sporadic network connection problems on a Lenovo L14/L15 Gen4 AMD when
  the ethernet cable is unplugged and replugged.
```

-----

## 2024-04-23 - [11.09.314](readme11.09.314.txt)

```
The new PRIVATE BUILD 11.09.314 for IGEL Workspace is ready.

This build is based on 11.09.311.

These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------

### Network

* Made PKCS#7 encryption and signature algorithms configurable (see sscep
  options -E and -S)

+------------+-----------------------------------------------------------------+
| Parameter  | {{PKCS#7 encryption algorithm}}                                 |
+------------+-----------------------------------------------------------------+
| Registry   | {{network.scepclient.cert%.encalg}}                             |
+------------+-----------------------------------------------------------------+
| Range      | [automatic][des][3des][blowfish][aes128][aes192][aes256]        |
+------------+-----------------------------------------------------------------+
| Value      | __ (automatic)                                                  |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | {{PKCS#7 signature algorithm}}                                  |
+------------+-----------------------------------------------------------------+
| Registry   | {{network.scepclient.cert%.signalg}}                            |
+------------+-----------------------------------------------------------------+
| Range      | [automatic][md5][sha1][sha224][sha256][sha384][sha512]          |
+------------+-----------------------------------------------------------------+
| Value      | __ (automatic)                                                  |
+------------+-----------------------------------------------------------------+
```

-----

## 2024-04-17 - [11.09.313](readme11.09.313.txt)

```
The new PRIVATE BUILD 11.09.313 for IGEL Workspace is ready.

This build is based on 11.09.311.

These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------

### Citrix

* Updated Citrix Workspace App to version 2402.  
  Available Citrix Workspace Apps in this release: 2402 (default), 2311 and 2309
* New features:  
* Synchronize multiple keyboards at session start. All available keyboards on
  the client are synchronized with VDA after the session starts in full-screen
  mode.

+------------+-----------------------------------------------------------------+
|Parameter   |`Synchronize multiple keyboards at session start`                |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.wfclient.SyncKbdLayoutList`                                 |
+------------+-----------------------------------------------------------------+
|Value       | false (default) /  true                                         |
+------------+-----------------------------------------------------------------+

* Support for Audio volume synchronization. Synchronize audio volume between the
  VDA and your audio devices.

+------------+-----------------------------------------------------------------+
|Parameter   |`Support for Audio volume synchronization`                       |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.module.EnableVolumeSync`                                    |
+------------+-----------------------------------------------------------------+
|Value       | true (default)/ false                                           |
+------------+-----------------------------------------------------------------+

* Default values of the following have been changed as per Citrix.  
* Enable Packet Loss Concealment to improve audio performance.
  "ica.module.PacketLossConcealmentEnabled = True"  
* Loss tolerant mode for audio. "ica.module.EdtUnreliableAllowed = True"
* Use system Audio in MS Teams while screen sharing.

+------------+-----------------------------------------------------------------+
|Parameter   |`Use system Audio in MS Teams while screen sharing`              |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.module.EnableVolumeListener`                                |
+------------+-----------------------------------------------------------------+
|Value       | false (default)/ true                                           |
+------------+-----------------------------------------------------------------+

* Enhanced Desktop Viewer toolbar [Technical Preview]

+------------+-----------------------------------------------------------------+
|Parameter   |`Enhanced Desktop Viewer toolbar`                                |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.wfclient.ToolbarVersion`                                    |
+------------+-----------------------------------------------------------------+
|Value       | 0 (default)/ 1                                                  |
+------------+-----------------------------------------------------------------+

* Customize toolbar [Technical Preview]. From this version onwards, you can
  activate or deactivate each button individually instead of the entire toolbar.

+------------+-----------------------------------------------------------------+
|Parameter   |`Show USB device button`                                         |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.module.DevicesButtonVisible`                                |
+------------+-----------------------------------------------------------------+
|Value       | true (default)/ false                                           |
+------------+-----------------------------------------------------------------+

* Note: Similarly, you can activate or deactivate the following buttons in the
  toolbar. They are all activated by default.  
  ica.module.CloseButtonVisible  
  ica.module.FullscreenButtonVisible  
  ica.module.MinimizeButtonVisible  
  ica.module.PinButtonVisible  
  ica.module.PreferencesButtonVisible  
  ica.module.ShortcutsButtonVisible  
  ica.module.SwitchDesktopButtonVisible
* Include system audio while screen sharing in MS Teams

+------------+-----------------------------------------------------------------+
|Parameter   |`Share system audio`                                             |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.teams.sharesystemaudio`                                     |
+------------+-----------------------------------------------------------------+
|Value       | false (default)/ true                                           |
+------------+-----------------------------------------------------------------+

* Specify the minimum and maximum range of UDP ports for Microsoft Teams
  optimization. If the UDP Port cannot be allocated for any reason, the WebRTC
  falls back to TCP. Minimum range of UDP ports for Microsoft Teams
  optimization.

+------------+-----------------------------------------------------------------+
|Parameter   |`UDP Port range minimum`                                         |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.teams.PortRangeMin`                                         |
+------------+-----------------------------------------------------------------+
|Value       | 3000                                                            |
+------------+-----------------------------------------------------------------+

* Maximum range of UDP ports for Microsoft Teams optimization.

+------------+-----------------------------------------------------------------+
|Parameter   |`UDP Port range max`                                             |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.teams.PortRangeMax`                                         |
+------------+-----------------------------------------------------------------+
|Value       | 3100                                                            |
+------------+-----------------------------------------------------------------+

Resolved Issues
--------------------------------------------------------------------------------

### Citrix

* After connecting to Citrix VDA, support for multiple audio devices sometimes
  may not work. This problem has been fixed.
```

-----

## 2024-04-12 - [11.09.269](readme11.09.269.txt)

```
The new PRIVATE BUILD 11.09.269 for IGEL Workspace is ready.

This build is based on 11.09.263.

These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------

### Citrix

* Updated Citrix Workspace App to version 2402.  
  Available Citrix Workspace Apps in this release: 2402 (default), 2311 and 2010
* New features:  
* Synchronize multiple keyboards at session start. All available keyboards on
  the client are synchronized with VDA after the session starts in full-screen
  mode.

+------------+-----------------------------------------------------------------+
|Parameter   |`Synchronize multiple keyboards at session start`                |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.wfclient.SyncKbdLayoutList`                                 |
+------------+-----------------------------------------------------------------+
|Value       | false (default) /  true                                         |
+------------+-----------------------------------------------------------------+

* Support for Audio volume synchronization. Synchronize audio volume between the
  VDA and your audio devices.

+------------+-----------------------------------------------------------------+
|Parameter   |`Support for Audio volume synchronization`                       |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.module.EnableVolumeSync`                                    |
+------------+-----------------------------------------------------------------+
|Value       | true (default)/ false                                           |
+------------+-----------------------------------------------------------------+

* Default values of the following have been changed as per Citrix.  
* Enable Packet Loss Concealment to improve audio performance.
  "ica.module.PacketLossConcealmentEnabled = True"  
* Loss tolerant mode for audio. "ica.module.EdtUnreliableAllowed = True"
* Use system Audio in MS Teams while screen sharing.

+------------+-----------------------------------------------------------------+
|Parameter   |`Use system Audio in MS Teams while screen sharing`              |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.module.EnableVolumeListener`                                |
+------------+-----------------------------------------------------------------+
|Value       | false (default)/ true                                           |
+------------+-----------------------------------------------------------------+

* Enhanced Desktop Viewer toolbar [Technical Preview]

+------------+-----------------------------------------------------------------+
|Parameter   |`Enhanced Desktop Viewer toolbar`                                |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.wfclient.ToolbarVersion`                                    |
+------------+-----------------------------------------------------------------+
|Value       | 0 (default)/ 1                                                  |
+------------+-----------------------------------------------------------------+

* Customize toolbar [Technical Preview]. From this version onwards, you can
  activate or deactivate each button individually instead of the entire toolbar.

+------------+-----------------------------------------------------------------+
|Parameter   |`Show USB device button`                                         |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.module.DevicesButtonVisible`                                |
+------------+-----------------------------------------------------------------+
|Value       | true (default)/ false                                           |
+------------+-----------------------------------------------------------------+

* Note: Similarly, you can activate or deactivate the following buttons in the
  toolbar. They are all activated by default.  
  ica.module.CloseButtonVisible  
  ica.module.FullscreenButtonVisible  
  ica.module.MinimizeButtonVisible  
  ica.module.PinButtonVisible  
  ica.module.PreferencesButtonVisible  
  ica.module.ShortcutsButtonVisible  
  ica.module.SwitchDesktopButtonVisible
* Include system audio while screen sharing in MS Teams

+------------+-----------------------------------------------------------------+
|Parameter   |`Share system audio`                                             |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.teams.sharesystemaudio`                                     |
+------------+-----------------------------------------------------------------+
|Value       | false (default)/ true                                           |
+------------+-----------------------------------------------------------------+

* Specify the minimum and maximum range of UDP ports for Microsoft Teams
  optimization. If the UDP Port cannot be allocated for any reason, the WebRTC
  falls back to TCP. Minimum range of UDP ports for Microsoft Teams
  optimization.

+------------+-----------------------------------------------------------------+
|Parameter   |`UDP Port range minimum`                                         |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.teams.PortRangeMin`                                         |
+------------+-----------------------------------------------------------------+
|Value       | 3000                                                            |
+------------+-----------------------------------------------------------------+

* Maximum range of UDP ports for Microsoft Teams optimization.

+------------+-----------------------------------------------------------------+
|Parameter   |`UDP Port range max`                                             |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.teams.PortRangeMax`                                         |
+------------+-----------------------------------------------------------------+
|Value       | 3100                                                            |
+------------+-----------------------------------------------------------------+
```

-----

## 2024-04-10 - [11.09.312](readme11.09.312.txt)

```
The new PRIVATE BUILD 11.09.312 for IGEL Workspace is ready.

This build is based on 11.09.311.

These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------

### Citrix

* Updated Citrix Workspace app. Available versions: 24.02 [default], 23.11,
23.09

### Chromium

* Updated Chromium Browser to version 123.0.6312.105
```

-----

## 2024-04-09 - [11.09.311](readme11.09.311.txt)

```
The new PRIVATE BUILD 11.09.311 for IGEL Workspace is ready.

This build is based on 11.09.310.

These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------


### Citrix

* Updated Citrix Workspace App to version 2402.  
  Available Citrix Workspace Apps in this release: 2402 (default), 2311 and 2309
* New features:  
* Synchronize multiple keyboards at session start. All available keyboards on
  the client are synchronized with VDA after the session starts in full-screen
  mode.

+------------+-----------------------------------------------------------------+
|Parameter   |`Synchronize multiple keyboards at session start`                |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.wfclient.SyncKbdLayoutList`                                 |
+------------+-----------------------------------------------------------------+
|Value       | false (default) /  true                                         |
+------------+-----------------------------------------------------------------+

* Support for Audio volume synchronization. Synchronize audio volume between the
  VDA and your audio devices.

+------------+-----------------------------------------------------------------+
|Parameter   |`Support for Audio volume synchronization`                       |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.module.EnableVolumeSync`                                    |
+------------+-----------------------------------------------------------------+
|Value       | true (default)/ false                                           |
+------------+-----------------------------------------------------------------+

* Default values of the following have been changed as per Citrix.  
* Enable Packet Loss Concealment to improve audio performance.
  "ica.module.PacketLossConcealmentEnabled = True"  
* Loss tolerant mode for audio. "ica.module.EdtUnreliableAllowed = True"
* Use system Audio in MS Teams while screen sharing.

+------------+-----------------------------------------------------------------+
|Parameter   |`Use system Audio in MS Teams while screen sharing`              |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.module.EnableVolumeListener`                                |
+------------+-----------------------------------------------------------------+
|Value       | false (default)/ true                                           |
+------------+-----------------------------------------------------------------+

* Enhanced Desktop Viewer toolbar [Technical Preview]

+------------+-----------------------------------------------------------------+
|Parameter   |`Enhanced Desktop Viewer toolbar`                                |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.wfclient.ToolbarVersion`                                    |
+------------+-----------------------------------------------------------------+
|Value       | 0 (default)/ 1                                                  |
+------------+-----------------------------------------------------------------+

* Customize toolbar [Technical Preview]. From this version onwards, you can
  activate or deactivate each button individually instead of the entire toolbar.

+------------+-----------------------------------------------------------------+
|Parameter   |`Show USB device button`                                         |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.module.DevicesButtonVisible`                                |
+------------+-----------------------------------------------------------------+
|Value       | true (default)/ false                                           |
+------------+-----------------------------------------------------------------+

* Note: Similarly, you can activate or deactivate the following buttons in the
  toolbar. They are all activated by default.  

  ica.module.CloseButtonVisible  
  ica.module.FullscreenButtonVisible  
  ica.module.MinimizeButtonVisible  
  ica.module.PinButtonVisible  
  ica.module.PreferencesButtonVisible  
  ica.module.ShortcutsButtonVisible  
  ica.module.SwitchDesktopButtonVisible

* Include system audio while screen sharing in MS Teams

+------------+-----------------------------------------------------------------+
|Parameter   |`Share system audio`                                             |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.teams.sharesystemaudio`                                     |
+------------+-----------------------------------------------------------------+
|Value       | false (default)/ true                                           |
+------------+-----------------------------------------------------------------+

* Specify the minimum and maximum range of UDP ports for Microsoft Teams
  optimization. If the UDP Port cannot be allocated for any reason, the WebRTC
  falls back to TCP. Minimum range of UDP ports for Microsoft Teams
  optimization.

+------------+-----------------------------------------------------------------+
|Parameter   |`UDP Port range minimum`                                         |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.teams.PortRangeMin`                                         |
+------------+-----------------------------------------------------------------+
|Value       | 3000                                                            |
+------------+-----------------------------------------------------------------+

* Maximum range of UDP ports for Microsoft Teams optimization.

+------------+-----------------------------------------------------------------+
|Parameter   |`UDP Port range max`                                             |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.teams.PortRangeMax`                                         |
+------------+-----------------------------------------------------------------+
|Value       | 3100                                                            |
+------------+-----------------------------------------------------------------+


### zoomvdi

* Available Zoom VDI Client versions : 5.17.5.24630 (default) , 5.16.10.24420,
  and 5.15.2.23760
```

-----

## 2024-04-08 - [11.09.268](readme11.09.268.txt)

```
The new PRIVATE BUILD 11.09.268 for IGEL Workspace is ready.

This build is based on 11.09.263.

These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------

### Chromium

- Updated Chromium Browser to version 123.0.6312.105 (critical fix)
```

-----

## 2024-04-03 - [11.09.310](readme11.09.310.txt)

```
The new PUBLIC BUILD 11.09.310 for IGEL Workspace is ready.

This build is based on 11.09.260.

These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------

### Citrix

* Added parameters for enhanced configuration of Teams optimization within
  Citrix. Further details via Citrix documentation:  
```

- [Citrix Workspace app for Linux](https://docs.citrix.com/en-us/citrix-workspace-app-for-linux/configure-xenapp.html#optimization-for-microsoft-teams|https://docs.citrix.com/en-us/citrix-workspace-app-for-linux/configure-xenapp.html#optimization-for-microsoft-teams)

```
* Configure MS Teams either via custom or predefined options.
* Custom options:

+------------+-----------------------------------------------------------------+
|Registry    |ica.teams.config%.enabled                                        |
+------------+-----------------------------------------------------------------+
|Value       |**disabled** (default) / enabled                                 |
+------------+-----------------------------------------------------------------+
|Registry    |ica.teams.config%.name                                           |
+------------+-----------------------------------------------------------------+
|Value       |“ “                                                              |
+------------+-----------------------------------------------------------------+
|Registry    |ica.teams.config%.type                                           |
+------------+-----------------------------------------------------------------+
|Range       | [**String**] [Integer]                                          |
+------------+-----------------------------------------------------------------+
|Registry    |ica.teams.config%.value                                          |
+------------+-----------------------------------------------------------------+
|Value       |“ “                                                              |
+------------+-----------------------------------------------------------------+

* Predefined options:

+------------+-----------------------------------------------------------------+
|Parameter   |AdaptResolutionAllowCroppingVideo                                |
+------------+-----------------------------------------------------------------+
|Registry    |ica.teams.adaptresolutionallowcroppingvideo.enabled              |
+------------+-----------------------------------------------------------------+
|Value       |**Disabled** (default) / Enabled                                 |
+------------+-----------------------------------------------------------------+

* Enable if video in optimized MS Teams call is stretched

+------------+-----------------------------------------------------------------+
|Parameter   |EnableAEC                                                        |
+------------+-----------------------------------------------------------------+
|Registry    |ica.teams.enableaec.enabled                                      |
+------------+-----------------------------------------------------------------+
|Value       |**Disabled** (default) / Enabled                                 |
+------------+-----------------------------------------------------------------+

* Enables echo cancellation; used for troubleshooting audio issues

+------------+-----------------------------------------------------------------+
|Parameter   |EnableAGC                                                        |
+------------+-----------------------------------------------------------------+
|Registry    |ica.teams.enableagc.enabled                                      |
+------------+-----------------------------------------------------------------+
|Value       |**Enabled** (default) / Disabled                                 |
+------------+-----------------------------------------------------------------+

* Disables gain control; used for troubleshooting audio issues

+------------+-----------------------------------------------------------------+
|Parameter   |EnableNS                                                         |
+------------+-----------------------------------------------------------------+
|Registry    |ica.teams.enablens.enabled                                       |
+------------+-----------------------------------------------------------------+
|Value       |**Enabled** (default) / Disabled                                 |
+------------+-----------------------------------------------------------------+

* Disables noise suppression; used for troubleshooting audio issues

+------------+-----------------------------------------------------------------+
|Parameter   |ms_teams_remote_audio_notifications                              |
+------------+-----------------------------------------------------------------+
|Registry    |ica.teams.remoteaudionotifications.enabled                       |
+------------+-----------------------------------------------------------------+
|Value       |**Enabled** (default) / Disabled                                 |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
|Parameter   |ms_teams_secondary_audio_notifications                           |
+------------+-----------------------------------------------------------------+
|Registry    |ica.teams.secondaryaudionotifications.enabled                    |
+------------+-----------------------------------------------------------------+
|Value       |**Enabled** (default) / Disabled                                 |
+------------+-----------------------------------------------------------------+

* Disables secondary ringtone

+------------+-----------------------------------------------------------------+
|Parameter   |UseGbufferScreenSharing                                          |
+------------+-----------------------------------------------------------------+
|Registry    |ica.teams.usegbufferscreensharing.enabled                        |
+------------+-----------------------------------------------------------------+
|Value       |**Disabled** (default) / Enabled                                 |
+------------+-----------------------------------------------------------------+

* Enables desktop share option while app protection is active

+------------+-----------------------------------------------------------------+
|Parameter   |VideoHwEncode                                                    |
+------------+-----------------------------------------------------------------+
|Registry    |ica.teams.videohwencode.enabled                                  |
+------------+-----------------------------------------------------------------+
|Value       |**Disabled** (default) / Enabled                                 |
+------------+-----------------------------------------------------------------+

* Enables hardware acceleration support

+------------+-----------------------------------------------------------------+
|Parameter   |WebrpcLogLevel                                                   |
+------------+-----------------------------------------------------------------+
|Registry    |ica.teams.webrpcloglevel.enabled                                 |
+------------+-----------------------------------------------------------------+
|Value       |**Disabled** (default) / Enabled                                 |
+------------+-----------------------------------------------------------------+

* Enables log collection for webrpc library

+------------+-----------------------------------------------------------------+
|Parameter   |WebrtcLogLevel                                                   |
+------------+-----------------------------------------------------------------+
|Registry    |ica.teams.webrtcloglevel.enabled                                 |
+------------+-----------------------------------------------------------------+
|Value       |**Disabled** (default) / Enabled                                 |
+------------+-----------------------------------------------------------------+

* Enables log collection for virtual channel

### Firefox

* Added BTRFS (improved / more efficient storage format) for Firefox profile
  partition.  
* Changed default of system.customization.ffpro.fs_type registry key from ntfs
  to btrfs.

+------------+-----------------------------------------------------------------+
| Parameter  | Firefox Profiles Partition Filesystem Type                      |
+------------+-----------------------------------------------------------------+
| Registry   | system.customization.ffpro.fs_type                              |
+------------+-----------------------------------------------------------------+
| Range      | [ext4]                                                          |
+------------+-----------------------------------------------------------------+
| Value      | _btrfs_                                                         |
+------------+-----------------------------------------------------------------+

### WiFi

* Added options for configuration of rtw89core and rtw89pci kernel modules (used
  e.g by the rtw_8852be driver).

+------------+-----------------------------------------------------------------+
| Parameter  | disable_clkreq                                                  |
+------------+-----------------------------------------------------------------+
| Registry   | network.drivers.rtw89pci.options.disable_clkreq                 |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | _enabled_ (default) / disabled                                  |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | disable_aspm_l1                                                 |
+------------+-----------------------------------------------------------------+
| Registry   | network.drivers.rtw89pci.options.disable_aspm_l1                |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | _enabled_ (default) / disabled                                  |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | disable_aspm_l1ss                                               |
+------------+-----------------------------------------------------------------+
| Registry   | network.drivers.rtw89pci.options.disable_aspm_l1ss              |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | _enabled_ (default) / disabled                                  |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | disable_ps_mode                                                 |
+------------+-----------------------------------------------------------------+
| Registry   | network.drivers.rtw89core.options.disable_ps_mode               |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | _enabled_ (default) / disabled                                  |
+------------+-----------------------------------------------------------------+

* Changed default for DHCP refresh after roaming (within the same network).

+------------+-----------------------------------------------------------------+
| Parameter  | `Refresh DHCP after roaming`                                    |
+------------+-----------------------------------------------------------------+
| Registry   | `network.interfaces.wirelesslan.device0.roam_refresh_dhcp`      |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | enabled / **disabled** (default)                                |
+------------+-----------------------------------------------------------------+

### Cisco Webex

* Updated Cisco Webex VDI plugin to version 44.2.0.28744.

### zoomvdi

* Updated Zoom VDI plugin to version 5.17.6 (24660).

Security Fixes
--------------------------------------------------------------------------------

### Chromium

* Updated Chromium Browser to version 122.0.6261.128

### Firefox

* Updated Mozilla Firefox to 115.9.1 ESR  
* Fixes for mfsa2024-16, also known as CVE-2024-29944.  
* Fixes for mfsa2024-13, also known as:  
  CVE-2024-0743, CVE-2024-2607, CVE-2024-2608, CVE-2024-2616,  
  CVE-2023-5388, CVE-2024-2610, CVE-2024-2611, CVE-2024-2612,  
  CVE-2024-2614.  
* Fixes for mfsa2024-06, also known as:  
  CVE-2024-1546, CVE-2024-1547, CVE-2024-1548, CVE-2024-1549,  
  CVE-2024-1550, CVE-2024-1551, CVE-2024-1552, CVE-2024-1553.

### Base system

* Fixed libxml2 security issue CVE-2024-25062

Resolved Issues
--------------------------------------------------------------------------------

### Citrix

* Citrix keyboard layout synchronization requires set of
  ica.wfclient.keyboardmappingfile to the new value `automatic`. With that, the
  local keystrokes are locally interpreted and correctly sent to the Citrix
  session. Icon in taskbar (within Citrix session) of set language may be wrong
  displayed but input is correct. It it also required to set the following
  parameters: ica.wfclient.keyboardeventmode=Unicode and
  ica.wfclient.keyboardsyncmode=Dynamic.
* Change the parameter `Keyboard mapping file` to automatic:

+------------+-----------------------------------------------------------------+
|Setup page  |`Sessions > Citrix > Citrix Global > Keyboard`                   |
+------------+-----------------------------------------------------------------+
|Parameter   |`Keyboard mapping file`                                          |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.wfclient.keyboardmappingfile`                               |
+------------+-----------------------------------------------------------------+
|Type        |range                                                            |
+------------+-----------------------------------------------------------------+
|Value       |**generic** (default) / linux / automatic                        |
+------------+-----------------------------------------------------------------+

### Network

* Fixed respecting NTP server from DHCP

### WiFi

* On HP mt645 network.drivers.realtek.use_8852be=auto is now equal to false
  (same as on other devices / platforms)

### Base system

* Fixed startup of System Log Viewer.

### Audio

* Increased master volume for internal speaker in HP t755

### Misc

* Fixed IGEL Agent for Imprivata in auth only mode with VMware Horizon.
```

-----

## 2024-04-02 - [11.08.472](readme11.08.472.txt)

```
The new PRIVATE BUILD 11.08.472 for IGEL Workspace is ready.

This build is based on 11.08.440.

These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------

### Hardware

* Updated hardware recognition to include LG 24CN670IK6N. This should fix the
audio issues.
```

-----

## 2024-04-02 - [11.09.131.DER](readme11.09.131.DER.txt)

```
The new PRIVATE BUILD 11.09.131.DER for IGEL Workspace is ready.

This build is based on 11.09.129.DER.

These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------

### Power Term

* fixed missing system fonts in PowerTerm 12.0.1.020170219.
```

-----

## 2024-03-28 - [11.09.263](readme11.09.263.txt)

```
The new PRIVATE BUILD 11.09.263 for IGEL Workspace is ready.

This build is based on 11.09.261.

These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------

### Citrix

* Updated Citrix Workspace App to version 2402.  
  Available Citrix Workspace Apps in this release: 2402 (default), 2311 and 2010

* New features:  

* Synchronize multiple keyboards at session start. All available keyboards on
  the client are synchronized with VDA after the session starts in full-screen
  mode.

+------------+-----------------------------------------------------------------+
|Parameter   |`Synchronize multiple keyboards at session start`                |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.wfclient.SyncKbdLayoutList`                                 |
+------------+-----------------------------------------------------------------+
|Value       | false (default) /  true                                         |
+------------+-----------------------------------------------------------------+

* Enhanced Desktop Viewer toolbar [Technical Preview]

+------------+-----------------------------------------------------------------+
|Parameter   |`Enhanced Desktop Viewer toolbar`                                |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.wfclient.ToolbarVersion`                                    |
+------------+-----------------------------------------------------------------+
|Value       | 1 (default)/ 0                                                  |
+------------+-----------------------------------------------------------------+

* Note: Switch Value to '0' for the old Toolbar.
* Support for Audio volume synchronization. Synchronize audio volume between the
  VDA and your audio devices.

+------------+-----------------------------------------------------------------+
|Parameter   |`Support for Audio volume synchronization`                       |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.module.EnableVolumeSync`                                    |
+------------+-----------------------------------------------------------------+
|Value       | true (default)/ false                                           |
+------------+-----------------------------------------------------------------+

* Use system Audio in MS Teams while screen sharing.

+------------+-----------------------------------------------------------------+
|Parameter   |`Use system Audio in MS Teams while screen sharing`              |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.module.EnableVolumeListener`                                |
+------------+-----------------------------------------------------------------+
|Value       | false (default)/ true                                           |
+------------+-----------------------------------------------------------------+

* Default values of the following have been changed as per Citrix.  
* Enable Packet Loss Concealment to improve audio performance.
  "ica.module.PacketLossConcealmentEnabled = True"  
* Loss tolerant mode for audio. "ica.module.EdtUnreliableAllowed = True"
```

-----

## 2024-03-28 - [11.09.265](readme11.09.265.txt)

```
The new PRIVATE BUILD 11.09.265 for IGEL Workspace is ready.

This build is based on 11.09.261.

These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------

### Citrix

* The following features have been added to this build:
* Citrix Workspace App: 23.05.0.58 ( Available in this release: 23.09.0.24
  (default), 23.11.0.82, and 23.05.0.58)  
* Zoom Media Plugin: 5.14.10.23670 ( Available in this release: 5.17.5.24630
  (default), 5.16.10.24420, and 5.14.10.23670)  
* Cisco Webex Meetings VDI plugin: 43.2.1.18 ( Available in this release:
  43.6.8.4 (default), 43.2.1.18, and 42.10.8.14)  
* Cisco Webex VDI plugin: 43.10
```

-----

## 2024-03-28 - [11.09.264](readme11.09.264.txt)

```
The new PRIVATE BUILD 11.09.264 for IGEL Workspace is ready.

This build is based on 11.09.260.

These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------

### Licensing

* fixed IGEL license detection on hardware where network interface
initialization takes more time.
```

-----

## 2024-03-16 - [11.08.471](readme11.08.471.txt)

```
The new PRIVATE BUILD 11.08.471 for IGEL Workspace is ready.

This build is based on 11.08.440.

These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------

### Hardware

* Updated hardware recognition to include LG 24CN670IK6N. This should fix the
audio issues.
```

-----

## 2024-03-08 - [11.09.261](readme11.09.261.txt)

```
The new PRIVATE BUILD 11.09.261 for IGEL Workspace is ready.

This build is based on 11.09.260.

These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------

### AVD

* AVD client version 1.1.84 with UDP shortpath enabled by default
```

-----

## 2024-03-07 - [11.09.260](readme11.09.260.txt)

```
The new PUBLIC BUILD 11.09.260 for IGEL Workspace is ready.

This build is based on 11.09.210.

These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------

### AVD

* Updated AVD client to version 1.1.40.  
* Improved login speed.  
* Added support for Okta and Ping Identity IDPs.  
* Fixed resizing if external monitor is disconnected while laptop lid is closed
  and opened again.

### VMware Horizon

* Updated VMware Horizon client to version 2312-8.12.0-23149323

+------------+-----------------------------------------------------------------+
| Parameter  | `Lock user name`                                                |
+------------+-----------------------------------------------------------------+
| Registry   | `vmware.view.lock-user-name`                                    |
+------------+-----------------------------------------------------------------+
| Range      | [on][off]                                                       |
+------------+-----------------------------------------------------------------+
| Value      | **off**                                                         |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | `Lock user name`                                                |
+------------+-----------------------------------------------------------------+
| Registry   | `sessions.vdm_client%.options.lock-user-name`                   |
+------------+-----------------------------------------------------------------+
| Range      | [Global setting][on][off]                                       |
+------------+-----------------------------------------------------------------+
| Value      | **Global setting**                                              |
+------------+-----------------------------------------------------------------+

### ThinLinc

* Updated ThinLinc to version 4.16.0 to fix CVE-2023-3446, CVE-2023-3817,
  CVE-2023-4807, CVE-2023-5678.

### deviceTRUST

* Updated deviceTRUST Client Extension to version 23.1.200.  
* Added support for IGEL Remote Desktop (RDP3) sessions.

+------------+-----------------------------------------------------------------+
|Parameter   |deviceTRUST                                                      |
+------------+-----------------------------------------------------------------+
|Registry    |sessions.msigelrdp<inst>.plugins.devicetrust                     |
+------------+-----------------------------------------------------------------+
|Value       |disabled (default)/ enabled                                      |
+------------+-----------------------------------------------------------------+

### Network

* Added WWAN support on HP mt440 device with BIOS v1.08.00 and Intel XMM7560
  module Firmware v1.16.48.

### Smartcard

* Updated Pointsharp Net iD Client to version 1.1.3.37. All details via
  https://docs.pointsharp.com/net-id-client/latest/nic-release-
  notes/nic-113-release-notes.html

### Base system

* Added ready-made challenge password retrieval for Microsoft NDES
* Set the following to NDES for enabling the feature:

+------------+-----------------------------------------------------------------+
| Parameter  | `Ready-made Challenge Password Command`                         |
+------------+-----------------------------------------------------------------+
| Registry   | `network.scepclient.cert%.use_ready_made_challenge_password_command` |
+------------+-----------------------------------------------------------------+
| Range      | [none][NDES]                                                    |
+------------+-----------------------------------------------------------------+
| Value      | **none**                                                        |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | `User name`                                                     |
+------------+-----------------------------------------------------------------+
| Registry   | `network.scepclient.cert%.ndes.challenge_password_retrieval.user` |
+------------+-----------------------------------------------------------------+
| Type       | string                                                          |
+------------+-----------------------------------------------------------------+
| Value      | empty **Default**                                               |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | `Password`                                                      |
+------------+-----------------------------------------------------------------+
| Registry   | `network.scepclient.cert%.ndes.challenge_password_retrieval.crypt_password` |
+------------+-----------------------------------------------------------------+
| Type       | string                                                          |
+------------+-----------------------------------------------------------------+
| Value      | empty **Default**                                               |
+------------+-----------------------------------------------------------------+

* If the following is not 'none', https will be used. The default "getca" means
  the CA certificate received in the SCEP GetCA operation. The full path to a
  different CA certificate may also be specified.

+------------+-----------------------------------------------------------------+
| Parameter  | `CA certificate`                                                |
+------------+-----------------------------------------------------------------+
| Registry   | `network.scepclient.cert%.ndes.challenge_password_retrieval.cacert` |
+------------+-----------------------------------------------------------------+
| Range      | [none (not using https)][from getca operation]                  |
+------------+-----------------------------------------------------------------+
| Value      | **from getca operation**                                        |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | `Debug level`                                                   |
+------------+-----------------------------------------------------------------+
| Registry   | `network.scepclient.cert%.ndes.challenge_password_retrieval.debuglevel` |
+------------+-----------------------------------------------------------------+
| Type       | integer                                                         |
+------------+-----------------------------------------------------------------+
| Value      | 0 **Default**                                                   |
+------------+-----------------------------------------------------------------+

* Added registry key to prevent terrapin attack (mitigation is not active as
  default) on the SSH server:

+------------+-----------------------------------------------------------------+
| Parameter  | Disable weak MACs and Chipers to prevent terrapin attack.       |
+------------+-----------------------------------------------------------------+
| Registry   | network.ssh_server.enable_terrapin_mitigation                   |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | enabled / _disabled_ (default)                                  |
+------------+-----------------------------------------------------------------+

* Added registry key to prevent terrapin attack (mitigation is not active as
  default) on the SSH client:

+------------+-----------------------------------------------------------------+
| Parameter  | Disable weak MACs and Chipers to prevent terrapin attack.       |
+------------+-----------------------------------------------------------------+
| Registry   | network.ssh_client.enable_terrapin_mitigation                   |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | enabled / _disabled_ (default)                                  |
+------------+-----------------------------------------------------------------+

* Added power saving settings for Intel and AMD devices.  
* Changed some powersave settings defaults to _Auto_ so powersave is enabled as
  default on Lenovo laptops:

+------------+-----------------------------------------------------------------+
| Parameter  | Use powertop auto tune to reduce power usage                    |
+------------+-----------------------------------------------------------------+
| Registry   | system.powersave.powertop_auto_tune                             |
+------------+-----------------------------------------------------------------+
| Range      | [Auto][Enable][Disable]                                         |
+------------+-----------------------------------------------------------------+
| Value      | _Auto_                                                          |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | Use laptop mode to reduce power usage                           |
+------------+-----------------------------------------------------------------+
| Registry   | system.powersave.laptop_mode                                    |
+------------+-----------------------------------------------------------------+
| Range      | [Auto][Enable][Disable]                                         |
+------------+-----------------------------------------------------------------+
| Value      | _Auto_                                                          |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | Clock down AMDGPU if system is idle (idle action time reached). |
+------------+-----------------------------------------------------------------+
| Registry   | system.powersave.clock_down_amdgpu_on_idle                      |
+------------+-----------------------------------------------------------------+
| Range      | [Auto][Enable][Disable]                                         |
+------------+-----------------------------------------------------------------+
| Value      | _Auto_                                                          |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | Set Ryzen CPU to power save mode if system is idle (idle action time reached). |
+------------+-----------------------------------------------------------------+
| Registry   | system.powersave.use_ryzenadj_on_idle                           |
+------------+-----------------------------------------------------------------+
| Range      | [Auto][Enable][Disable]                                         |
+------------+-----------------------------------------------------------------+
| Value      | _Auto_                                                          |
+------------+-----------------------------------------------------------------+

* Set idle action default time to 50 seconds:

+------------+-----------------------------------------------------------------+
| Parameter  | Call idle actions on AC after this time of inactivity (greater 10 seconds, value 9 or lower is never) |
+------------+-----------------------------------------------------------------+
| Registry   | system.powersave.idle_action_on_ac                              |
+------------+-----------------------------------------------------------------+
| Type       | integer                                                         |
+------------+-----------------------------------------------------------------+
| Value      | 50 _Default_                                                    |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | Call idle actions on battery after this time of inactivity (greater 10 seconds, value 9 or lower is never) |
+------------+-----------------------------------------------------------------+
| Registry   | system.powersave.idle_action_on_battery                         |
+------------+-----------------------------------------------------------------+
| Type       | integer                                                         |
+------------+-----------------------------------------------------------------+
| Value      | 50 _Default_                                                    |
+------------+-----------------------------------------------------------------+

* Added registry keys for Intel system specific power saving settings:

+------------+-----------------------------------------------------------------+
| Parameter  | Clock down Intel GPU if system is idle (idle action time reached). |
+------------+-----------------------------------------------------------------+
| Registry   | system.powersave.clock_down_i915_on_idle                        |
+------------+-----------------------------------------------------------------+
| Range      | [Auto][Enable][Disable]                                         |
+------------+-----------------------------------------------------------------+
| Value      | _Auto_                                                          |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | Set Intel CPU to power save mode if system is idle (idle action time reached). |
+------------+-----------------------------------------------------------------+
| Registry   | system.powersave.use_energy_policy_on_idle                      |
+------------+-----------------------------------------------------------------+
| Range      | [Auto][Enable][Disable]                                         |
+------------+-----------------------------------------------------------------+
| Value      | _Auto_                                                          |
+------------+-----------------------------------------------------------------+

* Changed default of power saving settings for screen getting dimmed to 20%
  after 120 seconds inactivity.

+------------+-----------------------------------------------------------------+
| Setup page | `System > Power Options > Display > Brightness Reduction`       |
+------------+-----------------------------------------------------------------+
| Parameter  | `Reduce after`                                                  |
+------------+-----------------------------------------------------------------+
| Registry   | `x.xserver%.brightness_on_ac`                                   |
+------------+-----------------------------------------------------------------+
| Type       | integer                                                         |
+------------+-----------------------------------------------------------------+
| Value      | 120 **Default**                                                 |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | `Reduce after`                                                  |
+------------+-----------------------------------------------------------------+
| Registry   | `x.xserver%.brightness_on_battery`                              |
+------------+-----------------------------------------------------------------+
| Type       | integer                                                         |
+------------+-----------------------------------------------------------------+
| Value      | 120 **Default**                                                 |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | `On inactivity reduce to`                                       |
+------------+-----------------------------------------------------------------+
| Registry   | `x.xserver%.brightness_level_ac`                                |
+------------+-----------------------------------------------------------------+
| Type       | integer                                                         |
+------------+-----------------------------------------------------------------+
| Value      | 20 **Default**                                                  |
+------------+-----------------------------------------------------------------+

### Driver

* Updated Thales SafeNet Authentication Client to version 10.8.1050.

### zoomvdi

* Updated Zoom VDI plugin to version 5.17.5 (24500).

### Hardware

* Added support for Lenovo USB-C to Ethernet Adapter
* Added hardware support for HP Elite t755.
* Added BIOS configuration support for HP Elite t755. IGEL supports the BIOS
  update mechanism. The BIOS update itself is validated by the device
  manufacturer and performed at your own risk.

Security Fixes
--------------------------------------------------------------------------------

### Firefox

* Updated Mozilla Firefox to 115.7 ESR  
  Fixes for mfsa2024-02, also known as:  
  CVE-2024-0741, CVE-2024-0742, CVE-2024-0746, CVE-2024-0747,  
  CVE-2024-0749, CVE-2024-0750, CVE-2024-0751, CVE-2024-0753,  
  CVE-2024-0755.  
  Fixes for mfsa2023-54, also known as:  
  CVE-2023-6856, CVE-2023-6865, CVE-2023-6857, CVE-2023-6858,  
  CVE-2023-6859, CVE-2023-6860, CVE-2023-6867, CVE-2023-6861,  
  CVE-2023-6862, CVE-2023-6863, CVE-2023-6864.  
  Fixes for mfsa2023-50, also known as:  
  CVE-2023-6204, CVE-2023-6205, CVE-2023-6206, CVE-2023-6207,  
  CVE-2023-6208, CVE-2023-6209, CVE-2023-6212.

### Base system

* Fixed a privilege escalation in setup_cmd utility.
* Fixed bluez security issue CVE-2023-45866.
* Fixed pam security issue CVE-2024-22365.  
* Fixed xorg-server security issues CVE-2024-21886, CVE-2024-21885,
  CVE-2024-0409, CVE-2024-0408, CVE-2024-0229 and CVE-2023-6816.  
* Fixed gnutls28 security issues CVE-2024-0567 and CVE-2024-0553.  
* Fixed openldap security issue CVE-2023-2953.  
* Fixed openssl security issues CVE-2024-0727, CVE-2023-6237, CVE-2023-6129 and
  CVE-2023-5678.  
* Fixed xerces-c security issues CVE-2023-37536 and CVE-2018-1311.  
* Fixed mysql-8.0 security issues CVE-2024-20985, CVE-2024-20984,
  CVE-2024-20983, CVE-2024-20982, CVE-2024-20981, CVE-2024-20978,
  CVE-2024-20977, CVE-2024-20976, CVE-2024-20974, CVE-2024-20973,
  CVE-2024-20972, CVE-2024-20971, CVE-2024-20970, CVE-2024-20969,
  CVE-2024-20967, CVE-2024-20966, CVE-2024-20965, CVE-2024-20964,
  CVE-2024-20963, CVE-2024-20962, CVE-2024-20961 and CVE-2024-20960.  
* Fixed paramiko security issue CVE-2023-48795.  
* Fixed pillow security issues CVE-2023-50447 and CVE-2023-44271.  
* Fixed pycryptodome security issue CVE-2023-52323.  
* Fixed qtbase-opensource-src security issue CVE-2023-51714.  
* Fixed qemu security issues CVE-2023-6693 and CVE-2023-6683.  
* Fixed zulu17-ca security issues CVE-2024-20932, CVE-2024-20926,
  CVE-2024-20925, CVE-2024-20923, CVE-2024-20922, CVE-2024-20918,
  CVE-2024-20952, CVE-2024-20945, CVE-2024-20921 and CVE-2024-20919.  
* Fixed curl security issue CVE-2024-0853.  
* Fixed expat security issues CVE-2023-52426 and CVE-2023-52425.  
* Fixed webkit2gtk security issues CVE-2024-23222, CVE-2024-23213,
  CVE-2024-23206, CVE-2023-42833, CVE-2023-40414 and CVE-2014-1745.  
* Fixed libde265 security issues CVE-2022-43253, CVE-2022-43252, CVE-2022-43248,
  CVE-2022-43243, CVE-2022-43242, CVE-2022-43241, CVE-2022-43240,
  CVE-2022-43239, CVE-2022-43238, CVE-2022-43237, CVE-2022-43236,
  CVE-2022-43235, CVE-2022-1253, CVE-2021-36411, CVE-2021-36410, CVE-2021-36409,
  CVE-2021-36408 and CVE-2021-35452.  
* Fixed gst-plugins-bad1.0 security issues CVE-2024-0444, CVE-2023-44446,
  CVE-2023-44429, CVE-2023-40476, CVE-2023-40475 and CVE-2023-40474.  
* Fixed bind9 security issues CVE-2023-5679, CVE-2023-5517, CVE-2023-50868,
  CVE-2023-50387 and CVE-2023-4408.  
* Fixed shadow security issue CVE-2023-4641.  
* Fixed qtbase-opensource-src security issue CVE-2024-25580.
* Updated ca-certificates to version 20240203.
* Fixed libde265 security issues CVE-2023-25221, CVE-2023-24758, CVE-2023-24757,
  CVE-2023-24756, CVE-2023-24755, CVE-2023-24754, CVE-2023-24752,
  CVE-2023-24751, CVE-2022-47665, CVE-2022-43250, CVE-2022-43249, CVE-2022-43245
  and CVE-2022-43244.  
* Fixed libpq5 security issue CVE-2024-0985.  
* Fixed libtiff5 security issues CVE-2023-6228, CVE-2023-6277 and
  CVE-2023-52356.  
* Fixed dnsmasq security issues CVE-2023-50868 and CVE-2023-50387.  
* Fixed python-cryptography security issue CVE-2023-50782.  
* Fixed less security issue CVE-2022-48624.  
* Fixed libuv1 security issue CVE-2024-24806.  
* Fixed libssh1.1 security issues 2023-3446 and CVE-2023-3817.

Resolved Issues
--------------------------------------------------------------------------------

### Citrix

* Missing icons are now displayed.

### Remote Desktop (RDP3)

* Fixed IGEL Remote Desktop (RDP3) audio input redirection.

### VMware Horizon

* Updated VMware Horizon Client to version 2312-8.12.0-23149323 which fixes
  setting the relative mouse feature

### Network

* Added registry key for ignoring hostname received via DHCP

+------------+-----------------------------------------------------------------+
| Parameter  | Ignore hostname received via DHCP                               |
+------------+-----------------------------------------------------------------+
| Registry   | network.dns.hostname_ignore_dhcp                                |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | enabled / _disabled_ (default)                                  |
+------------+-----------------------------------------------------------------+

### WiFi

* Added certain module options for configuration of iwlwifi/iwlmvm drivers. For
  details the output of the modinfo command can be used.

+------------+-----------------------------------------------------------------+
| Parameter  | 11n_disable                                                     |
+------------+-----------------------------------------------------------------+
| Registry   | network.drivers.iwlwifi.options.o_11n_disable                   |
+------------+-----------------------------------------------------------------+
| Type       | integer                                                         |
+------------+-----------------------------------------------------------------+
| Value      | 0 _Default_                                                     |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | disable_11ac                                                    |
+------------+-----------------------------------------------------------------+
| Registry   | network.drivers.iwlwifi.options.disable_11ac                    |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | enabled / _disabled_ (default)                                  |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | disable_11ax                                                    |
+------------+-----------------------------------------------------------------+
| Registry   | network.drivers.iwlwifi.options.disable_11ax                    |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | enabled / _disabled_ (default)                                  |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | disable_11be                                                    |
+------------+-----------------------------------------------------------------+
| Registry   | network.drivers.iwlwifi.options.disable_11be                    |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | enabled / _disabled_ (default)                                  |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | bt_coex_active                                                  |
+------------+-----------------------------------------------------------------+
| Registry   | network.drivers.iwlwifi.options.bt_coex_active                  |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | _enabled_ (default) / disabled                                  |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | power_save                                                      |
+------------+-----------------------------------------------------------------+
| Registry   | network.drivers.iwlwifi.options.power_save                      |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | enabled / _disabled_ (default)                                  |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | power_level                                                     |
+------------+-----------------------------------------------------------------+
| Registry   | network.drivers.iwlwifi.options.power_level                     |
+------------+-----------------------------------------------------------------+
| Type       | integer                                                         |
+------------+-----------------------------------------------------------------+
| Value      | 0 _Default_                                                     |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | swcrypto                                                        |
+------------+-----------------------------------------------------------------+
| Registry   | network.drivers.iwlwifi.options.swcrypto                        |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | enabled / _disabled_ (default)                                  |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | power_scheme                                                    |
+------------+-----------------------------------------------------------------+
| Registry   | network.drivers.iwlmvm.options.power_scheme                     |
+------------+-----------------------------------------------------------------+
| Type       | integer                                                         |
+------------+-----------------------------------------------------------------+
| Value      | 2 _Default_                                                     |
+------------+-----------------------------------------------------------------+

### HID

* Improved palm detection on certain newer laptops via change of default for
  parameter "userinterface.touchpad.driver". This has changed from "Synaptics"
  to 'Auto'. 'Auto' setting will set the actual driver to Synaptics for most
  devices but to Libinput for HP mt440 G3 and HP mt645 G7 notebooks. By changing
  'userinterface.touchpad.driver' to 'Synaptics' or 'Libinput', the auto
  mechanism is overwritten.

### Firmware update

* Fixed firmware update process on encrypted devices. The PIN prompt is shown
  now before update starts - in case a reboot is needed during the update
  process.
* Fixed OS12 migration on devices with 4GB IGEL Partition.
* Fixed OS 12 Migration with HP_TOOLS partition present.
* Fixed fallback to IGEL App Portal in case of migrating to OS12 and usage UMS
  as App Proxy but UMS is not reachable.
* Fixed sporadic premature break while writing downloaded firmware data to the
  local storage.

### VirtualBox

* Fixed mouse offset if using multimonitor setup as VirtualBox guest.

### Audio

* Fixed internal microphone on Fujitsu E5412.
* Fixed: The headphone jack port on front of HP t755 is now the prioritized one
  - in case the port on the back is also used.

### Hardware

* Fixed screen lagging issue with Dell Latitude 7430  
* Added possibility to configure Intel PSR setting via registry

+------------+-----------------------------------------------------------------+
|Parameter   |`Change settings for intel PSR (panel self refresh).`            |
+------------+-----------------------------------------------------------------+
|Registry    |`x.drivers.intel.psr`                                            |
+------------+-----------------------------------------------------------------+
|Range       | [Default][Disable][Enable][Use only up to PSR1][Use up to PSR2] |
+------------+-----------------------------------------------------------------+
|Value       |**Default**                                                      |
+------------+-----------------------------------------------------------------+

### Remote Management

* Fixed handling of CA chains missing certificates of public CAs.  
* Reworked the EST protocol implementing the TLS certificate enrollement.
* Fixed certificate verifying of the UMS server in case of using legacy weak
  keys.
* Fixed: Required session renegotiation on TLS v1.2 connections used in the IGEL
  remote management.
```

-----

## 2024-02-26 - [11.09.218](readme11.09.218.txt)

```
The new PRIVATE BUILD 11.09.218 for IGEL Workspace is ready.

This build is based on 11.09.210.

These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------

### AVD

* AVD 1.1.97 with MMR (browser webrtc redirection) in RdClientSDK. No libwebrtc-
plugin.so needed anymore.
```

-----

## 2024-02-19 - [11.09.129.DER](readme11.09.129.DER.txt)

```
The new PRIVATE BUILD 11.09.129.DER for IGEL Workspace is ready.

This build is based on 11.09.210.

These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------

### Power Term

* Added Ericom PowerTerm version 12.0.1.020170219 again.
```

-----

## 2024-02-19 - [11.09.217](readme11.09.217.txt)

```
The new PRIVATE BUILD 11.09.217 for IGEL Workspace is ready.

This build is based on 11.09.211.

These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------

### Citrix

* The missing icons should now be displayed.
```

-----

## 2024-02-19 - [11.09.128](readme11.09.128.txt)

```
The new PRIVATE BUILD 11.09.128 for IGEL Workspace is ready.

This build is based on 11.09.117.

These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------

### Cisco Webex

* Updated Cisco Webex VDI to version 43.10.0.28101.

### zoomvdi

* Integrated Zoom Plugins: 5.14.10.23670, 5.15.2.23760, 5.16.10.24420
```

-----

## 2024-02-16 - [11.09.216](readme11.09.216.txt)

```
The new PRIVATE BUILD 11.09.216 for IGEL Workspace is ready.

This build is based on 11.09.210.

These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------

### AVD

* Support Okta IDP username/password auto-fill and form submit.  
* Improved AAD login speed.  
* AVD version 1.1.39
```

-----

## 2024-02-01 - [11.09.167](readme11.09.167.txt)

```
The new PRIVATE BUILD 11.09.167 for IGEL Workspace is ready.

This build is based on 11.09.160.

These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------

### Cisco JVDI Client

* Updated Cisco JVDI to version 14.3.0.
```

-----

## 2024-01-31 - [11.09.211](readme11.09.211.txt)

```
The new PRIVATE BUILD 11.09.211 for IGEL Workspace is ready.

This build is based on 11.09.210.

These are the release notes published with that release:

Known Issues
--------------------------------------------------------------------------------

### Citrix

* Adding smartcard readers during running / active session does not work. The
  reader is visible, but cannot be used due to unknown reader status. Only
  relevant for CWA versions earlier than 2112.
* Browser Content Redirection (BCR) does not work if DRI3 and hardware
  accelerated H.264 deep compression codec is enabled.
* Citrix H.264 acceleration plugin does not work with **enabled** server policy
  "Optimize for 3D graphics workload" in combination with server policy "Use
  video codec compression" -> *"For the entire screen"**.
* To launch multiple desktop sessions with Citrix HDX RTME and Citrix H.264  
  acceleration plugin, the following registry key needs to be enabled:

+------------+-----------------------------------------------------------------+
|Parameter   |`Activate workaround for dual RTME sessions and H264 acceleration` |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.workaround-dual-rtme`                                       |
+------------+-----------------------------------------------------------------+
|Range       |enabled / **disabled** (default)                                 |
+------------+-----------------------------------------------------------------+

* This workaround is not applicable when "Enable Secure ICA" is active for the  
  specific delivery group.
* Currently H.264 for Citrix sessions cannot be used in parallel with video
  input acceleration.
* While starting Self-Service, it is possible that process ServiceRecord
  segfaults -> Self-Service cannot be started afterwards.  
  A cache cleanup with reboot is needed. In addition, the following parameters
  should set to true.

+------------+-----------------------------------------------------------------+
|Parameter   |`Clean up UI cache after Self-Service termination`               |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.selfservice.cleanupwebui`                                   |
+------------+-----------------------------------------------------------------+
|Value       |**false** (default)/true                                         |
+------------+-----------------------------------------------------------------+
|Parameter   |`Clean up Store cache after Self-Service termination`            |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.selfservice.cleanupstore`                                   |
+------------+-----------------------------------------------------------------+
|Value       |**false** (default)/true                                         |
+------------+-----------------------------------------------------------------+

* Browser Content Redirection (BCR) may not work with Chrome version 105.0.* or
  later. See https://support.citrix.com/article/CTX473065/hdx-browser-content-
  redirection-broken-with-google-chrome-browser-version-105-or-higher
* White / green fragments may appear during desktop launch if JPEG graphical
  codec is used.
* MS Teams calls may stop if blurred background is enabled. This affects Citrix
  Workspace App 2305 and later.
* Regarding CVE-2023-41993, CVE-2023-39928 & CVE-2023-41074: For compatibility
  with Citrix Self-Service, older Webkit libraries are used instead of the
  latest ones to continue working properly.
* More information: https://kb.igel.com/securitysafety/en/isn-2023-25-webkit-
  vulnerabilities-101066782.html
* ZoomVDI version 5.16 or newer is no longer supported with Citrix Workspace app
  20.10
* Browser Content Redirection (BCR) may not work with Citrix workspace app 23.11
  and current Chrome versions.

### OSC Installer

* OSC not deployable with IGEL Deployment Appliance: Version 11.3 or later is
  required for deploying IGEL OS 11.06. and following.

### AVD

* H.264 hardware decoding for MS-Teams optimization is currently limited to non-
  AMD devices due to stability issues on AMD devices.

### VMware Horizon

* After disconnect of an RDP-based session, the Horizon main window which
  contains the server or sessions overview, cannot be resized anymore.
* Copying text from Horizon Blast sessions is not possible.
* The on-screen keyboard in Horizon appliance mode does not work correctly with
  local logon.  
  It is necessary to switch off local logon and enable the following two keys
  via IGEL registry:  
  userinterface.softkeyboard.autoshow  
  userinterface.softkeyboard.autohide
* With usage of PCoIP protocol, the virtual channel provided by VMware used for
  serial port and scanner redirection could freeze on logout from remote
  session.
* This happens only with enabled scanner or serial port redirection.  
  The freeze does not occur if both redirection methods are enabled or none of
  them. The Blast Protocol is not affected by this bug.
* The respective settings can be found in the IGEL Registry:  
  vmware.view.enable-serial-port-redir  
  vmware.view.enable-scanner-redir
* Keyboard Input Source Language Synchronization works only with usage of local
  layout and deadkeys enabled.  
  If a keyboard layout is used which has deadkeys disabled (which is the default
  on IGEL OS), Horizon client falls back to en-US layout.
* PCoIP sessions may crash in some cases, switch to Blast Protocol is
  recommended then. H.264/HEVC encoding can be disabled when overall performance
  is too low.
* Client drive mapping and USB redirection for storage devices can be enabled at
  the same time, but this could lead to sporadic problems.  
  Horizon Client tracks the drives which are dynamically mounted and adds them
  to the remote session using client drive mapping, means USB redirection is not
  used for theses devices then.  
  However, in case of devices like USB SD card readers, Horizon does not map
  them as client drives but forcefully uses USB-redirection which results in an
  unclean unmount.  
  As a work-around, the IDs of these card readers can be added to IGEL USB
  access rules and denied.

### Parallels Client

* Attached storage devices appear as network drives in the remote session  
* USB device redirection is considered as experimental for the Parallels client
  for Linux

### Chromium

* Hardware accelerated video decoding is currently not supported.

### Firefox

* With enabled Citrix Browser Content Redirection, Firefox has no H.264 and AAC
  multimedia codec support. Means, when codec support is needed in Firefox, BCR
  needs to be disabled. Citrix Browser Content Redirection is disabled by
  default.
* Firefox restart option currently not supported.

### Network

* Wakeup from system suspend fails on DELL Latitude 5510

### WiFi

* TP-Link Archer T2UH WiFi adapters does not work after system suspend/resume.
  Workaround: Disabling system suspend at IGEL Setup > System > Power Options >
  Shutdown.

### Cisco JVDI Client

* There may be a segfault shown in the logs (during logout of Citrix Desktop
  session). Occurs only when using Citrix Workspace App 2010 and Cisco JVDI.

### Base system

* Update from memory stick requires network online state (at least when multiple
  update stages are triggered / necessary)
* It is not possible to perform an unattended OS12 migration to base system
  12.2.0 as an additional / manual reboot is necessary. The recommended upgrade
  version for unattended migration is base system 12.2.1.
* Due to suspend/resume issues of a Innodisk NVME we disabled the suspend
  support for systems where this NVME is present. The issue otherwise will lead
  to a complete loose of the storage device as the NVME will not work after
  resume.

### Conky

* The right screen when using multiscreen environment may not be shown
  correctly.  
  Workaround: The horizontal offset should be set to the width of the monitor
  (e.g. if the monitor has a width of 1920, the offset should be set to 1920)

### Firmware update

* On devices with 4 GB flash storage or smaller it could happen that there is
  not enough space for updating all features. In this case, a corresponding
  error message occurs. Please visit https://kb.igel.com/igelos-11.09/en/error-
  not-enough-space-on-local-drive-when-updating-to-igel-os-11-08-or-
  higher-101059051.html  for a possible solution and additional information.

### Appliance Mode

* When ending a Citrix session in browser appliance mode, the browser is
  restarted twice (instead of once).
* Appliance mode RHEV/Spice: spice-xpi firefox plugin is no longer supported.
  The "Console Invocation" has to allow 'Native' client (auto is also possible)
  and should be started in fullscreen to prevent any opening windows.
* Browser Appliance mode can fail when the Web URL contains special control
  characters like ampersand (& character).  
  Workaround: Add quotes at the beginning and the end of an affected URL. E.g.:  
  'https://www.google.com/search?q=aSearchTerm&source=lnms&tbm=isch'

### Audio

* Audio jack detection on Advantec POC-W243L does not work. Therefore, sound
  output goes through a possibly connected headset and also the internal
  speakers.
* UD3-M340C: Sound preferences are showing Headphone & Microphone, although not
  connected.
* IGEL UD2 (D220) fails to restore the volume level of the speaker when the
  device used firmware version 11.01.110 before.

### Multimedia

* Multimedia redirection with GStreamer could fail when using Nouveau GPU
  driver.

### Hardware

* Some newer Delock 62599 active DisplayPort to DVI (4k) adapters only work on
  INTEL-based devices.
* Wake up from suspend via UMS does not work on HP mt645 devices. Workaround:
  Disable system suspend and use shutdown instead.
* Built-in fingerprint sensor is not supported on HP mt440 and mt645.
* MAC-Address Passthrough not supported on Lenovo USB-C Hybrid Docking Station.
* Wake-on-Lan via docking stations is not supported.
* In some rare cases it is possible that connecting or booting Lenovo USB-C
  Hybrid Docking station over USB-C results in non working / faulty display
  output.  
** It may help to (re-)connect via USB-A. If this is the case, USB-C should be
  also functional then.
* Display configuration of displays connected to HP G5 Docking Station may fail
  with HP t655.

### Remote Management

* AIT feature with IGEL Starter License is only supported by UMS version
  6.05.100 or newer.
```

-----

## 2024-01-25 - [11.09.210](readme11.09.210.txt)

```
The new PUBLIC BUILD 11.09.210 for IGEL Workspace is ready.

This build is based on 11.09.150.

These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------

### Citrix

* Added: Notification handling for applications launched via Citrix Self-
  Service, Browser or Storebrowse.
* Added Citrix Workspace App 2311  
  Available Citrix Workspace Apps in this release: 2311, 2309 (default) and 2010
* Fast SmartCard Feature

+------------+-----------------------------------------------------------------+
|Parameter   |`SmartCardCryptographicRedirection`                              |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.module.virtualdriver.smartcard.SmartCardCryptographicRedirection` |
+------------+-----------------------------------------------------------------+
|Type        |bool                                                             |
+------------+-----------------------------------------------------------------+
|Value       |enabled / **disabled** (default)                                 |
+------------+-----------------------------------------------------------------+

  > Fast smartcard is an improvement over the existing HDX PC/SC-based smartcard
  > redirection. It improves performance when smartcards are used in
  > high-latency WAN environments.

* Improved loading experience for shared user mode

+------------+-----------------------------------------------------------------+
|Parameter   |`KioskFUIEnhanced`                                               |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.authman.KioskFUIEnhanced`                                   |
+------------+-----------------------------------------------------------------+
|Type        |bool                                                             |
+------------+-----------------------------------------------------------------+
|Value       |enabled / **disabled** (default)                                 |
+------------+-----------------------------------------------------------------+

  > The time taken to load the store is reduced and thus the loading experience
  > for the shared user mode is improved.

* Collecting user activity logs

+------------+-----------------------------------------------------------------+
|Parameter   |`UserActivityLogsDisabled`                                       |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.authman.UserActivityLogsDisabled`                           |
+------------+-----------------------------------------------------------------+
|Type        |bool                                                             |
+------------+-----------------------------------------------------------------+
|Value       |**enabled** (default) / disabled                                 |
+------------+-----------------------------------------------------------------+

  > It is now possible to collect the user activity logs. Activities related to
  > most of the Storebrowse commands are saved in the log file.

  > /userhome/.ICAClient/logs/userActivitylog/


### AVD

* Added full support for the secondary ringer feature for MS-Teams optimization.
* Updated IGEL AVD client to version 1.1.37.

### VMware Horizon

* Updated VMware Horizon Client to version 2309 8.11.0-22660930

+------------+-----------------------------------------------------------------+
| Parameter  | `Disable network state display`                                 |
+------------+-----------------------------------------------------------------+
| Registry   | `vmware.view.blast-network-state`                               |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | enabled / **disabled** (default)                                |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | `Allow Blast connections to use proxy settings`                 |
+------------+-----------------------------------------------------------------+
| Registry   | `vmware.view.blast-proxy`                                       |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | enabled / **disabled** (default)                                |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | `Allow changing the use of HEVC decoding`                       |
+------------+-----------------------------------------------------------------+
| Registry   | `vmware.view.allow-enable-hevc`                                 |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | **enabled** (default) / disabled                                |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | `Blast HEVC decoding`                                           |
+------------+-----------------------------------------------------------------+
| Registry   | `vmware.view.blast-hevc`                                        |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | **enabled** (default) / disabled                                |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | `Blast AV1 decoding`                                            |
+------------+-----------------------------------------------------------------+
| Registry   | `vmware.view.blast-av1`                                         |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | **enabled** (default) / disabled                                |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | `High Color Accuracy mode for Blast/HEVC`                       |
+------------+-----------------------------------------------------------------+
| Registry   | `vmware.view.high-color-accuracy-mode-hevc`                     |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | enabled / **disabled** (default)                                |
+------------+-----------------------------------------------------------------+


### Chromium

* Updated Chromium Browser to version 120.0.6099.216.

### Network

* Added Quectel EM05-G support for Lenovo ThinkPad L13 AMD Gen4 and L13 Intel
  Gen4.  
* Added regional support with Quectel EM05-G for US SIM cards on supported
  Lenovo Laptop devices.

### Smartcard

* Updated Pointsharp (SecMaker) Net iD Enterprise to version 6.9.1.17.
* Updated 90meter PKCS#11 library to version 3.0.0.45. Besides the SIPR version
  of the library, the NIPR version is added now. Additional smartcard types,
  specified by ATR, are possible to add to allow list.

+------------+-----------------------------------------------------------------+
|Parameter   |`Library type`                                                   |
+------------+-----------------------------------------------------------------+
|Registry    |`scard.pkcs11.90meter.library_type`                              |
+------------+-----------------------------------------------------------------+
|Value       |**SIPR**, NIPR                                                   |
+------------+-----------------------------------------------------------------+
|Parameter   |`Log level`                                                      |
+------------+-----------------------------------------------------------------+
|Registry    |`scard.pkcs11.90meter.loglevel`                                  |
+------------+-----------------------------------------------------------------+
|Value       |**none**, error, warn, trace                                     |
+------------+-----------------------------------------------------------------+
|Parameter   |`Log file`                                                       |
+------------+-----------------------------------------------------------------+
|Registry    |`scard.pkcs11.90meter.logfile`                                   |
+------------+-----------------------------------------------------------------+
|Value       |**/var/log/lib90meterpk11.log**                                  |
+------------+-----------------------------------------------------------------+
|Parameter   |`Card name`                                                      |
+------------+-----------------------------------------------------------------+
|Registry    |`scard.pkcs11.90meter.card%.name`                                |
+------------+-----------------------------------------------------------------+
|Value       |**(empty)**                                                      |
+------------+-----------------------------------------------------------------+
|Parameter   |`ATR`                                                            |
+------------+-----------------------------------------------------------------+
|Registry    |`scard.pkcs11.90meter.card%.atr`                                 |
+------------+-----------------------------------------------------------------+
|Value       |**(empty)**                                                      |
+------------+-----------------------------------------------------------------+
|Parameter   |`ATR mask`                                                       |
+------------+-----------------------------------------------------------------+
|Registry    |`scard.pkcs11.90meter.card%.mask`                                |
+------------+-----------------------------------------------------------------+
|Value       |**(empty)**                                                      |
+------------+-----------------------------------------------------------------+


### Cisco JVDI Client

* Updated Cisco JVDI to version 14.3.0.

### Cisco Webex

* Integrated Cisco Webex Meetings VDI 43.6.8.4
* Updated Cisco Webex VDI to version 43.12.0.28141.

### zoomvdi

* Added Zoom VDI 5.16.10.24420.
* Available Zoom VDI plugins: 5.16.10.24420 (default), 5.15.2.23760, and
  5.14.10.23670

### Hardware

* Added hardware support for LG AiO 27CQ650.
* Added hardware support for LG AiO 34CR650.
* Removed: Support ended for UD2-LX 40 (D220), UD2-LX 50 (M250C 4GB eMMC),
  UD3-LX 51 (M340C) and UD6-LX 51 (H830C) .
* Added hardware support for Lenovo ThinkPad L13 Intel Gen4.
* Added hardware support for Lenovo ThinkPad L13 AMD Gen4.

Security Fixes
--------------------------------------------------------------------------------

### Base system

* Fixed webkit2gtk issues CVE-2023-42916, CVE-2023-42917, CVE-2023-42883 and
  CVE-2023-42890.  
* Fixed vim security issues CVE-2023-48706, CVE-2023-48237, CVE-2023-48236,
  CVE-2023-48235, CVE-2023-48234, CVE-2023-48233, CVE-2023-48231,
  CVE-2023-46246, CVE-2022-2042, CVE-2022-2000, CVE-2022-1897, CVE-2022-1886,
  CVE-2022-1771 and CVE-2022-1725.  
* Fixed curl security issues CVE-2023-46219 and CVE-2023-46218.  
* Fixed avahi security issues CVE-2023-38473, CVE-2023-38472, CVE-2023-38471,
  CVE-2023-38470 and CVE-2023-38469.  
* Fixed glibc security issues CVE-2023-5156, CVE-2023-4813 and CVE-2023-4806.  
* Fixed gnutls28 security issue CVE-2023-5981.  
* Fixed ghostscript security issue CVE-2023-46751.  
* Fixed nghttp2 security issue CVE-2023-44487.  
* Fixed poppler security issues CVE-2022-38349, CVE-2022-37052, CVE-2022-37051
  and CVE-2022-37050.  
* Fixed postgresql-14 security issues CVE-2023-5870, CVE-2023-5869 and
  CVE-2023-5868.  
* Fixed python3.10 security issue CVE-2023-40217.  
* Fixed sqlite3 security issues CVE-2023-7104 and CVE-2022-46908.  
* Fixed tiff security issues CVE-2023-3576 and CVE-2022-40090.  
* Fixed yajl security issues CVE-2023-33460, CVE-2022-24795 and CVE-2017-16516.  
* Fixed python-cryptography security issues CVE-2023-49083 and CVE-2023-23931.  
* Fixed tar security issue CVE-2023-39804.
* Fixed libssh2 security issue CVE-2023-48795.  
* Fixed libssh security issues CVE-2023-6918, CVE-2023-6004 and CVE-2023-48795.  
* Fixed openssh security issues CVE-2023-51385, CVE-2023-51384 and
  CVE-2023-48795.

### X server

* Fixed xorg-server security issues CVE-2023-6478 and CVE-2023-6377.

Resolved Issues
--------------------------------------------------------------------------------

### Citrix

* Fixed: The error message **_Broken Pipe_* should no longer appears during
  login process.
* Fixed usage of Ctrl+Alt+End in Citrix sessions.

### AVD

* Fixed issues when multiple workspace resources have the same name.
* Fixed AVD app taskbar issues when apps are closed.

### RD Web Access

* Fixed possible error when starting Remote Desktop Web Access applications.

### VMware Horizon

* Fixed switch for serial port- and scanner redirection in UMS Web App by using
  a checkbox instead of customized on/off dropdown box.

### Network

* Added new registry key to switch between 8852be and rtw_8852be WiFi driver
  (Auto will use the 8852be on HP mt645 G7)

+------------+-----------------------------------------------------------------+
|Parameter   |Use 8852be driver instead of rtw_8852be for WLAN.                |
+------------+-----------------------------------------------------------------+
|Registry    |network.drivers.realtek.use_8852be                               |
+------------+-----------------------------------------------------------------+
|Range       | [Auto][Yes][No]                                                 |
+------------+-----------------------------------------------------------------+
|Value       |_Auto_                                                           |
+------------+-----------------------------------------------------------------+

### HID

* Fixed handling / calibration of ELO touch devices in multi-monitor
  configuration.

### CUPS Printing

* Fixed handling of SMB network printers.

### Base system

* Fixed: Post-Session Command for VMware Horizon and protocol RDP.
```

-----

## 2024-01-10 - [11.09.163](readme11.09.163.txt)

```
The new PRIVATE BUILD 11.09.163 for IGEL Workspace is ready.

This build is based on 11.09.162.

These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------


### VMware Horizon

* Updated VMware Horizon Client to version 2309 8.11.0-22660930

+------------+-----------------------------------------------------------------+
| Parameter  | `Disable network state display`                                 |
+------------+-----------------------------------------------------------------+
| Registry   | `vmware.view.blast-network-state`                               |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | enabled / **disabled** (default)                                |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | `Allow Blast connections to use proxy settings`                 |
+------------+-----------------------------------------------------------------+
| Registry   | `vmware.view.blast-proxy`                                       |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | enabled / **disabled** (default)                                |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | `Allow changing the use of HEVC decoding`                       |
+------------+-----------------------------------------------------------------+
| Registry   | `vmware.view.allow-enable-hevc`                                 |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | **enabled** (default) / disabled                                |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | `Blast HEVC decoding`                                           |
+------------+-----------------------------------------------------------------+
| Registry   | `vmware.view.blast-hevc`                                        |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | **enabled** (default) / disabled                                |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | `Blast AV1 decoding`                                            |
+------------+-----------------------------------------------------------------+
| Registry   | `vmware.view.blast-av1`                                         |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | **enabled** (default) / disabled                                |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | `High Color Accuracy mode for Blast/HEVC`                       |
+------------+-----------------------------------------------------------------+
| Registry   | `vmware.view.high-color-accuracy-mode-hevc`                     |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | enabled / **disabled** (default)                                |
+------------+-----------------------------------------------------------------+
```

-----

## 2024-01-12 - [11.09.164](readme11.09.164.txt)

```
The new PRIVATE BUILD 11.09.164 for IGEL Workspace is ready.

This build is based on 11.09.160.

These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------

### AVD

* Implemented full support for the secondary ringer feature for MS-Teams
optimization.

Resolved Issues
--------------------------------------------------------------------------------

### AVD

* Fixed issues when multiple workspace resources have the same name.
* Fixed AVD app taskbar issues when apps are closed.
* AVD client version 1.1.92 implemented.
```

-----

## 2024-01-10 - [11.09.162](readme11.09.162.txt)

```
The new PRIVATE BUILD 11.09.162 for IGEL Workspace is ready.

This build is based on 11.09.160.

These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------

### Citrix

* Updated to Citrix Workspace app 2311  

  Available Citrix Workspace Apps in this release: 2311 (default), 2309 and 2010

* New Features:

* Fast Smart Card Feature

+------------+-----------------------------------------------------------------+
|Parameter   |`SmartCardCryptographicRedirection`                              |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.module.virtualdriver.smartcard.SmartCardCryptographicRedirection` |
+------------+-----------------------------------------------------------------+
|Type        |bool                                                             |
+------------+-----------------------------------------------------------------+
|Value       |enabled / **disabled** (default)                                 |
+------------+-----------------------------------------------------------------+

** Fast smart card is an improvement over the existing HDX PC/SC‑based smart
  card redirection. It improves performance when smart cards are used in
  high‑latency WAN environments.  
* Improved loading experience for shared user mode

+------------+-----------------------------------------------------------------+
|Parameter   |`KioskFUIEnhanced`                                               |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.authman.KioskFUIEnhanced`                                   |
+------------+-----------------------------------------------------------------+
|Type        |bool                                                             |
+------------+-----------------------------------------------------------------+
|Value       |enabled / **disabled** (default)                                 |
+------------+-----------------------------------------------------------------+

** The time taken to load the store is reduced and thus the loading experience
  for the shared user mode is improved.  
* Collecting user activity logs

+------------+-----------------------------------------------------------------+
|Parameter   |`UserActivityLogsDisabled`                                       |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.authman.UserActivityLogsDisabled`                           |
+------------+-----------------------------------------------------------------+
|Type        |bool                                                             |
+------------+-----------------------------------------------------------------+
|Value       |**enabled** (default) / disabled                                 |
+------------+-----------------------------------------------------------------+

** You can collect the user activity logs. Activities related to most of the
  Storebrowse commands are saved in the log file
  “/userhome/.ICAClient/logs/userActivitylog/”.

### Cisco JVDI Client

* Integrated Cisco JVDI 14.3.0

### Cisco Webex

* Integrated Cisco Webex Meetings VDI 43.6.8.4
* Available Cisco Webex Meetings Clients: 43.6.8.4 (default), 42.10.8.14, and
  42.6.11.6
* Integrated Cisco Webex VDI 43.12.0.28141

### zoomvdi

* Integrated Zoom VDI 5.16.10.24420
* Available Zoom VDI clients: 5.16.10.24420 (default), 5.15.2.23760, and
  5.14.10.23670

Resolved Issues
--------------------------------------------------------------------------------

### Citrix

* The error message **_Broken Pipe_* should no longer appear during the login
  process.
* Fixed the use of ctrl+alt+end for Citrix sessions
```

-----

## 2023-12-26 - [11.08.459](readme11.08.459.txt)

```
The new PRIVATE BUILD 11.08.459 for IGEL Workspace is ready.

This build is based on 11.08.458.

These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------

### Citrix

* Integrated Citrix workspace app 23.09.  
  Available workspace apps in this release: 23.09 (default), 23.08, and 23.05
```

-----

## 2023-12-20 - [11.09.160](readme11.09.160.txt)

```
The new PUBLIC BUILD 11.09.160 for IGEL Workspace is ready.

This build is based on 11.09.150.

These are the release notes published with that release:

Security Fixes
--------------------------------------------------------------------------------

### Base system

* Fixed libminizip1 security issue CVE-2023-45853.  
* Fixed perl security issues CVE-2022-48522, CVE-2023-47038.

Resolved Issues
--------------------------------------------------------------------------------

### RD Web Access

* Fixed possible error when starting Remote Desktop Web Access applications.
```

-----

## 2023-12-20 - [11.09.154](readme11.09.154.txt)

```
The new PRIVATE BUILD 11.09.154 for IGEL Workspace is ready.

This build is based on 11.09.150.

These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------

### Cisco JVDI Client

* Added Cisco JVDI 14.1.2
```

-----

## 2023-12-14 - [11.09.153](readme11.09.153.txt)

```
The new PRIVATE BUILD 11.09.153 for IGEL Workspace is ready.

This build is based on 11.09.151.

These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------

### Cisco Webex

* Integrated Webex VDI 43.10.0.28101

### zoomvdi

* Integrated Zoom VDI 5.16.10.24420
```

-----

## 2023-12-11 - [11.09.151](readme11.09.151.txt)

```
The new PRIVATE BUILD 11.09.151 for IGEL Workspace is ready.

This build is based on 11.09.150.

These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------

### Chromium

* Updated Chromium to version 119.0.6045.199

### Cisco Webex

* Integrated Webex Meetings VDI 43.6.8.4

### zoomvdi

* Integrated Zoom VDI 5.16.0.2428
```

-----

## 2023-12-06 - [11.09.150](readme11.09.150.txt)

```
The new PUBLIC BUILD 11.09.150 for IGEL Workspace is ready.

This build is based on 11.09.110.

These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------

### Citrix

* Integrated Citrix Workspace app 2309  
  Available workspace apps in this release: 23.09 (default), 23.07, and 20.10  
  New Features:
* Enhancement to multiple monitors [Technical Preview]

+------------+-----------------------------------------------------------------+
|Parameter   |`Multi Monitor enhancement`                                      |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.wfclient.wfclient.MultiMonitorPnPEnabled`                   |
+------------+-----------------------------------------------------------------+
|Value       |true / false (default)                                           |
+------------+-----------------------------------------------------------------+

* Support for 32-bit cursor  
* Copy and paste files and folders between two virtual desktops  
* Improved error messages
* New features:  
* HDX Adaptive Transport over EDT

+------------+-----------------------------------------------------------------+
|Parameter   |`HDX Adaptive Transport over EDT`                                |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.allregions.hdxoverudp`                                      |
+------------+-----------------------------------------------------------------+
|Value       |<>(default), true, and false                                     |
+------------+-----------------------------------------------------------------+

* Note: Update "ica.wfclient.proxytype" = Secure, and "ica.wfclient.proxyhost"
  in the following format = \<IP>:\<PORT>. For example "192.168.101.37:6153".
* Enable Packet Loss Concealment to improve audio performance

+------------+-----------------------------------------------------------------+
|Parameter   |`Enable Packet Loss Concealment to improve audio performance`    |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.module.PacketLossConcealmentEnabled`                        |
+------------+-----------------------------------------------------------------+
|Value       |false (default)/ true                                            |
+------------+-----------------------------------------------------------------+

* Policy tampering detection feature prevents the user from accessing the
  Virtual App or Desktop session if the App Protection anti-screen capture and
  anti-keylogging policies are tampered with. If policy tampering is detected.
* Enhancement to multiple monitors [Technical Preview]

+------------+-----------------------------------------------------------------+
|Parameter   |`Multi Monitor enhancement`                                      |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.wfclient.MultiMonitorPnPEnabled`                            |
+------------+-----------------------------------------------------------------+
|Value       |true / false (default)                                           |
+------------+-----------------------------------------------------------------+

* HTTPS protocol support for proxy server

+------------+-----------------------------------------------------------------+
|Parameter   |`HTTPS protocol support for proxy server`                        |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.allregions.hdxoverudp`                                      |
+------------+-----------------------------------------------------------------+
|Value       |true (default)/ false                                            |
+------------+-----------------------------------------------------------------+

* Note: Update "ica.allregions.proxytype" = Secure, and
  "ica.allregions.proxyhost" in the following format = \<IP>:\<PORT>. For
  example "192.168.101.37:6153".  
* Policy tampering detection feature prevents the user from accessing the
  Virtual App or Desktop session if the App Protection anti-screen capture and
  anti-keylogging policies are tampered with. If policy tampering is detected.  
* Support for 32-bit cursor  
* Copy and paste files and folders between two virtual desktops  
* Improved error messages
* Updated Citrix EPA client to version 23.10.3.
* Updated Citrix Secure Access client to version 23.10.3.
* New features:  
* HDX Adaptive Transport over EDT

+------------+-----------------------------------------------------------------+
|Parameter   |`HDX Adaptive Transport over EDT`                                |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.allregions.hdxoverudp`                                      |
+------------+-----------------------------------------------------------------+
|Value       |<>(default), true, and false                                     |
+------------+-----------------------------------------------------------------+

* Note: Update "ica.wfclient.proxytype" = Secure, and "ica.wfclient.proxyhost"
  in the following format = \<IP>:\<PORT>. For example "192.168.101.37:6153".
* Enable Packet Loss Concealment to improve audio performance

+------------+-----------------------------------------------------------------+
|Parameter   |`Enable Packet Loss Concealment to improve audio performance`    |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.module.PacketLossConcealmentEnabled`                        |
+------------+-----------------------------------------------------------------+
|Value       |false (default)/ true                                            |
+------------+-----------------------------------------------------------------+

* Policy tampering detection feature prevents the user from accessing the
  Virtual App or Desktop session if the App Protection anti-screen capture and
  anti-keylogging policies are tampered with. If policy tampering is detected.

### OSC Installer

* Added support for custom Unit ID rules. This offers possibility to choose
  appropriate MAC address of an internal network interface as Unit ID. Please
  visit the IGEL Knowledge Base for further details / how-to use this feature.

### AVD

* Updated IGEL AVD client to version 1.1.35.

### Remote Desktop (RDP3)

* Added new Remote Desktop client (RDP3) based on Microsoft's RdClientSDK. RDP3
  sessions have basically the same options like AVD sessions except for their
  connection details and their separate gateway settings.

### Teradici PCoIP Client

* Updated HP Anyware PCoIP Client to version 23.08.

### WiFi

* Added support for RTL8852CE WiFi chipset - validated on HP Pro t550 Thin
  Client.

### IGEL Agent for Imprivata

* Added: In FUS and Follow Policies mode, only Citrix sessions being started by
  the IGEL Agent for Imprivata will be disconnected / signed out, others remain
  intact.
* Added: the resource chooser is now part of the lock screen (if lock screen is
  enabled).
* Changed chooser from a grid view to list view
* Added registry key for hiding horizon apps on chooser (and thus show desktops
  only)

+------------+-----------------------------------------------------------------+
|Registry    |`iia.hide_horizon_apps_on_chooser`                               |
+------------+-----------------------------------------------------------------+
|Type        |bool                                                             |
+------------+-----------------------------------------------------------------+
|Value       |**enabled** (default) / disabled)                                |
+------------+-----------------------------------------------------------------+

* Added reg key for hiding Citrix apps on chooser (and thus show desktops only)

+------------+-----------------------------------------------------------------+
|Registry    |`iia.hide_citrix_apps_on_chooser`                                |
+------------+-----------------------------------------------------------------+
|Type        |bool                                                             |
+------------+-----------------------------------------------------------------+
|Value       |**enabled** (default) / disabled                                 |
+------------+-----------------------------------------------------------------+

* Added the ability to run Horizon Apps
* Changed reg key 'iia.query_moniker' from bool to string to hold the moniker
  name to query for

+------------+-----------------------------------------------------------------+
|Registry    |`iia.query_moniker`                                              |
+------------+-----------------------------------------------------------------+
|Type        |string                                                           |
+------------+-----------------------------------------------------------------+
|Value       |""                                                               |
+------------+-----------------------------------------------------------------+

* Fixed: Program rfideas also in FUS mode
* Fixed: Password change

### Cisco JVDI Client

* Updated Cisco JVDI to version 14.2.1.

### Cisco Webex

* Updated Cisco Webex VDI plugin to version 43.10.0.27853.

### Base system

* Added registry keys for changing Intel kernel graphic driver settings:

+------------+-----------------------------------------------------------------+
|Parameter   |`Change settings for Intel PSR (panel self refresh).`            |
+------------+-----------------------------------------------------------------+
|Registry    |`x.drivers.intel.psr`                                            |
+------------+-----------------------------------------------------------------+
|Range       | [Default][Disable][Enable][Use only up to PSR1][Use up to PSR2] |
+------------+-----------------------------------------------------------------+
|Value       |**Default**                                                      |
+------------+-----------------------------------------------------------------+
|Parameter   |`Allow PSR2 selective fetch.`                                    |
+------------+-----------------------------------------------------------------+
|Registry    |`x.drivers.intel.psr2_sel_fetch`                                 |
+------------+-----------------------------------------------------------------+
|Range       | [Default][Disable][Enable]                                      |
+------------+-----------------------------------------------------------------+
|Value       |**Default**                                                      |
+------------+-----------------------------------------------------------------+
|Parameter   |`Enable GuC load for GuC submission and/or HuC load.`            |
+------------+-----------------------------------------------------------------+
|Registry    |`x.drivers.intel.guc`                                            |
+------------+-----------------------------------------------------------------+
|Range       | [Default][Disable][GuC submission][HuC load]                    |
+------------+-----------------------------------------------------------------+
|Value       |**Default**                                                      |
+------------+-----------------------------------------------------------------+
|Parameter   |`Disable display power wells when possible.`                     |
+------------+-----------------------------------------------------------------+
|Registry    |`x.drivers.intel.power_well`                                     |
+------------+-----------------------------------------------------------------+
|Range       | [Default][Auto][always on][disable when possible]               |
+------------+-----------------------------------------------------------------+
|Value       |**Default**                                                      |
+------------+-----------------------------------------------------------------+

* Added further options for Intel kernel graphic driver - via registry keys:

+------------+-----------------------------------------------------------------+
|Parameter   |`Power saving display C-States to use.`                          |
+------------+-----------------------------------------------------------------+
|Registry    |`x.drivers.intel.dc_setting`                                     |
+------------+-----------------------------------------------------------------+
|Range       | [Default][Disable][Up to DC5][Up to DC6][Up to DC5 with DC3C0]  |
|            | [Up to DC6 with DC3C0]                                          |
+------------+-----------------------------------------------------------------+
|Value       |**Default**                                                      |
+------------+-----------------------------------------------------------------+
|Parameter   |`Use framebuffer compression.`                                   |
+------------+-----------------------------------------------------------------+
|Registry    |`x.drivers.intel.fbc_setting`                                    |
+------------+-----------------------------------------------------------------+
|Range       | [Default][Disable][Enable]                                      |
+------------+-----------------------------------------------------------------+
|Value       |**Default**                                                      |
+------------+-----------------------------------------------------------------+

* Enabled DEBUG_INFO_BTF in the kernel.
* Added further registry keys for influencing power consumption:

+------------+-----------------------------------------------------------------+
|Parameter   |`Use powertop auto tune to reduce power usage`                   |
+------------+-----------------------------------------------------------------+
|Registry    |`system.powersave.powertop_auto_tune`                            |
+------------+-----------------------------------------------------------------+
|Range       | [Auto][Enable][Disable]                                         |
+------------+-----------------------------------------------------------------+
|Value       |**Disable**                                                      |
+------------+-----------------------------------------------------------------+
|Parameter   |`Use laptop mode to reduce power usage`                          |
+------------+-----------------------------------------------------------------+
|Registry    |`system.powersave.laptop_mode`                                   |
+------------+-----------------------------------------------------------------+
|Range       | [Auto][Enable][Disable]                                         |
+------------+-----------------------------------------------------------------+
|Value       |**Disable**                                                      |
+------------+-----------------------------------------------------------------+
|Parameter   |`Clock down AMDGPU if system is idle (idle action time reached).` |
+------------+-----------------------------------------------------------------+
|Registry    |`system.powersave.clock_down_amdgpu_on_idle`                     |
+------------+-----------------------------------------------------------------+
|Type        |bool                                                             |
+------------+-----------------------------------------------------------------+
|Value       |enabled / **disabled** (default)                                 |
+------------+-----------------------------------------------------------------+
|Parameter   |`Set Ryzen CPU to power save mode if system is idle (idle action time reached).` |
+------------+-----------------------------------------------------------------+
|Registry    |`system.powersave.use_ryzenadj_on_idle`                          |
+------------+-----------------------------------------------------------------+
|Type        |bool                                                             |
+------------+-----------------------------------------------------------------+
|Value       |enabled / **disabled** (default)                                 |
+------------+-----------------------------------------------------------------+
|Parameter   |`Call idle actions on AC after this time of inactivity (greater 10 seconds, value 9 or lower is never)` |
+------------+-----------------------------------------------------------------+
|Registry    |`system.powersave.idle_action_on_ac`                             |
+------------+-----------------------------------------------------------------+
|Type        |integer                                                          |
+------------+-----------------------------------------------------------------+
|Value       |9 **Default**                                                    |
+------------+-----------------------------------------------------------------+
|Parameter   |`Call idle actions on battery after this time of inactivity (greater 10 seconds, value 9 or lower is never)` |
+------------+-----------------------------------------------------------------+
|Registry    |`system.powersave.idle_action_on_battery`                        |
+------------+-----------------------------------------------------------------+
|Type        |integer                                                          |
+------------+-----------------------------------------------------------------+
|Value       |9 **Default**                                                    |
+------------+-----------------------------------------------------------------+

* Integrated required versions for private build:  
** Webex Teams Plugin: 43.6.0.26643  
** Webex Meetings Plugins: 43.6.5.20, 2.10.8.14 and 42.6.11.6  
** Zoom Plugins: 5.12.6.22200, 5.13.10.23090, 5.14.10.23670  
** Kernel with activated CONFIG_DEBUG_INFO_BTF option.

### Driver

* Updated Nuance Citrix Client Audio Extension for dictation to version B308.
  This fixes several security issues and adds support for Nuance PowerMic 4.
* Updated dpmuxd of HID Global fingerprint reader driver to version 1114. This
  fixes sharing the reader in applications (rather than desktops) via Citrix.

### Custom Partition

* Enabled DEBUG_INFO_BTF in the kernel.

### X11 system

* Added new registry key quirk to fix screen stays black after reconfiguration
  issue on NVIDIA graphic cards.

+------------+-----------------------------------------------------------------+
| Parameter  | `Quirk to fix NVIDIA issues with screen stays black after reconfiguration.` |
+------------+-----------------------------------------------------------------+
| Registry   | `x.xserver%.quirks.nvidia_screen_stay_black`                    |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | enabled / **disabled** (default)                                |
+------------+-----------------------------------------------------------------+


### VNC Viewer

* Updated TigerVNC Viewer to version 1.13.1. This adds support for new RSA-AES
  connection security types. The list of connection security types to use is
  configurable now.

+------------+-----------------------------------------------------------------+
|Setup       |Sessions>VNC Viewer>VNC Viewer Sessions>Name>Connection          |
+------------+-----------------------------------------------------------------+
|Parameter   |`Security types`                                                 |
+------------+-----------------------------------------------------------------+
|Registry    |`sessions.vncviewer<INST>.option.securitytype`                   |
+------------+-----------------------------------------------------------------+
|Value       |{**}empty{**}                                                    |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
|Setup       |Sessions>VNC Viewer>VNC Viewer Sessions>Name>Connection          |
+------------+-----------------------------------------------------------------+
|Parameter   |`Pathname for CA certificates file`                              |
+------------+-----------------------------------------------------------------+
|Registry    |`sessions.vncviewer<INST>.option.x509capath`                     |
+------------+-----------------------------------------------------------------+
|Value       |{**}/etc/ssl/certs/ca-certificates.crt{**}                       |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
|Setup       |Sessions>VNC Viewer>VNC Viewer Sessions>Name>Connection          |
+------------+-----------------------------------------------------------------+
|Parameter   |`Pathname for certificate revocation list file`                  |
+------------+-----------------------------------------------------------------+
|Registry    |`sessions.vncviewer<INST>.option.x509crlpath`                    |
+------------+-----------------------------------------------------------------+
|Value       |{**}empty{**}                                                    |
+------------+-----------------------------------------------------------------+

### Audio

* Updated EPOS Connect to version 7.7.

### Evidian

* Updated rsUserAuth to version 1.5.8705

### Hardware

* Validated 256GB 2230 PCIe NVMe module for HP t550 and t655.
* Validated 256GB 2280 PCIe NVMe module for HP t550 and t655.
* Validated 512GB 2280 PCIe NVMe module for HP t550 and t655.
* Validated Fujitsu Futro S7011. 
* Validated Fujitsu Lifebook E5412.
* Added hardware support for LG 24CR670I-6N.
* Added AMI BIOS tools support for HP t430, t550, t655 and t740. HP is
  responsible for the validation and approval of the BIOS update and BIOS
  settings change features.

Security Fixes
--------------------------------------------------------------------------------

### Firefox

* Updated Mozilla Firefox browser to version 115.4.0 ESR.  
  
  Fixes for mfsa2023-46, also known as: CVE-2023-5721, CVE-2023-5732,
  CVE-2023-5724, CVE-2023-5725, CVE-2023-5728, CVE-2023-5730.

### Chromium

* Fixed Chromium browser security issues CVE-2023-5996, CVE-2023-5859,
  CVE-2023-5858, CVE-2023-5857, CVE-2023-5856, CVE-2023-5855, CVE-2023-5854,
  CVE-2023-5853, CVE-2023-5852, CVE-2023-5851, CVE-2023-5850, CVE-2023-5849,
  CVE-2023-5482, CVE-2023-5480, CVE-2023-6112 and CVE-2023-5997  
* Updated Chromium browser to current version 119.0.6045.159.

### Base system

* Fixed open-vm-tools security issues CVE-2023-34059, CVE-2023-34058,
  CVE-2023-20900 and CVE-2023-20867.  
* Fixed vim security issues CVE-2023-5535, CVE-2023-5441, CVE-2023-5344,
  CVE-2023-4781, CVE-2023-4752, CVE-2023-4751, CVE-2023-4750, CVE-2023-4735,
  CVE-2023-4734, CVE-2023-4733, CVE-2022-4293, CVE-2022-4292, CVE-2022-3705,
  CVE-2022-3591, CVE-2022-3520, CVE-2022-3491, CVE-2022-3352, CVE-2022-3324,
  CVE-2022-3297, CVE-2022-3278, CVE-2022-3256, CVE-2022-3235, CVE-2022-3234,
  CVE-2022-3153, CVE-2022-3134, CVE-2022-3099, CVE-2022-3037, CVE-2022-3016,
  CVE-2022-2982, CVE-2022-2889, CVE-2022-2874, CVE-2022-2862, CVE-2022-2819,
  CVE-2022-2817, CVE-2022-2816, CVE-2022-2598, CVE-2022-2580 and CVE-2022-2522.  
* Fixed krb5 security issue CVE-2023-36054.  
* Fixed gawk security issue CVE-2023-4156.  
* Fixed bind9 security issues CVE-2023-4236, CVE-2023-3341, CVE-2023-3341,
  CVE-2023-2911 and CVE-2023-2828.  
* Fixed flac security issue CVE-2020-22219.  
* Fixed ghostscript security issues CVE-2023-38559 and CVE-2023-43115.  
* Fixed file security issue CVE-2022-48554.  
* Fixed postgresql-14 security issue CVE-2023-39417.  
* Fixed libtommath security issue CVE-2023-36328.  
* Fixed mysql-8.0 security issues CVE-2023-22114, CVE-2023-22112,
  CVE-2023-22103, CVE-2023-22097, CVE-2023-22092, CVE-2023-22084,
  CVE-2023-22079, CVE-2023-22078, CVE-2023-22070, CVE-2023-22068,
  CVE-2023-22066, CVE-2023-22064, CVE-2023-22059, CVE-2023-22032,
  CVE-2023-22058, CVE-2023-22057, CVE-2023-22056, CVE-2023-22054,
  CVE-2023-22053, CVE-2023-22048, CVE-2023-22046, CVE-2023-22038,
  CVE-2023-22033, CVE-2023-22008 and CVE-2023-22005.  
* Fixed procps security issue CVE-2023-4016.  
* Fixed cairo security issue CVE-2019-6462.  
* Fixed cups security issues CVE-2023-4504 and CVE-2023-32360.  
* Fixed curl security issues CVE-2023-38546, CVE-2023-38545 and CVE-2023-38039.  
* Fixed qemu security issues CVE-2023-42467, CVE-2023-4135, CVE-2023-40360,
  CVE-2023-3019, CVE-2021-3750 and CVE-2021-20255.  
* Fixed webkit2gtk security issues CVE-2023-41993, CVE-2023-41074,
  CVE-2023-40451, CVE-2023-39928, CVE-2023-39434 and CVE-2023-35074.  
* Fixed samba security issues CVE-2023-42669, CVE-2023-4154 and CVE-2023-4091.  
* Fixed tiff security issue CVE-2023-1916.  
* Fixed aom security issue CVE-2023-39616.  
* Fixed zulu8-ca security issues CVE-2023-22081 and CVE-2023-22025.  
* Updated Chromium to version 118.0.5993.117 which fixes following security
  issues CVE-2023-5472, CVE-2023-5487, CVE-2023-5486, CVE-2023-5485,
  CVE-2023-5484, CVE-2023-5483, CVE-2023-5481, CVE-2023-5479, CVE-2023-5478,
  CVE-2023-5477, CVE-2023-5476, CVE-2023-5475, CVE-2023-5474, CVE-2023-5473,
  CVE-2023-5346, CVE-2023-5218, CVE-2023-5217, CVE-2023-5187, CVE-2023-5186,
  CVE-2023-4909, CVE-2023-4908, CVE-2023-4907, CVE-2023-4906, CVE-2023-4905,
  CVE-2023-4904, CVE-2023-4903, CVE-2023-4902, CVE-2023-4901, CVE-2023-4900,
  CVE-2023-4764, CVE-2023-4763, CVE-2023-4762, CVE-2023-4761, CVE-2023-4572,
  CVE-2023-4431, CVE-2023-4430, CVE-2023-4429, CVE-2023-4428, CVE-2023-4427,
  CVE-2023-4368, CVE-2023-4367, CVE-2023-4366, CVE-2023-4365, CVE-2023-4364,
  CVE-2023-4363, CVE-2023-4362, CVE-2023-4361, CVE-2023-4360, CVE-2023-4359,
  CVE-2023-4358, CVE-2023-4357, CVE-2023-4356, CVE-2023-4355, CVE-2023-4354,
  CVE-2023-4353, CVE-2023-4352, CVE-2023-4351, CVE-2023-4350, CVE-2023-4349 and
  CVE-2023-2312.  
* Fixed openssl security issues CVE-2023-5363, CVE-2023-3817, CVE-2023-3446 and
  CVE-2023-2975.  
* Fixed opensc security issues CVE-2023-4535, CVE-2023-40661 and CVE-2023-40660.  
* Fixed python-urllib3 security issues CVE-2023-45803 and CVE-2023-43804.  
* Fixed openvpn security issues CVE-2023-46850 and CVE-2023-46849.  
* Fixed ffmpeg security issue CVE-2022-4907.  
* Fixed libvpx security issue CVE-2023-44488.
* Updated Intel-microcode to version 20231114 to fix security issue
  CVE-2023-23583.

### X server

* Fixed X.Org-server security issues CVE-2023-5574, CVE-2023-5380 and
  CVE-2023-5367.

Resolved Issues
--------------------------------------------------------------------------------

### Citrix

* Fixed MS Teams for Citrix Workspace App 2307 and higher
* Added registry key ica.chrome-double-download to control flock feature at
  wfica_wrapper. 'Enable flock' blocks double app starts (due to double
  downloads by Chromium browser).

+------------+-----------------------------------------------------------------+
|Parameter   |`Control download mechanic for Citrix applications for Chrome web access` |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.chrome-double-download`                                     |
+------------+-----------------------------------------------------------------+
|Range       | [Enable Lock][Disable Lock]                                     |
+------------+-----------------------------------------------------------------+
|Value       |enable / **disable** (default)                                   |
+------------+-----------------------------------------------------------------+

### RDP/IGEL RDP Client 2

* Fixed RDWeb Access using gateway when direct connection is possible.
* Fixed RDP session crash after pressing CTRL + ALT + ENTER.

### AVD

* Fixed Pause key to work as expected.
* Fixed: Calculator key on keyboards opens the calculator app in the AVD
  session.

### VMware Horizon

* Added possibility to customize waiting time after unplugging a device from a
  usb port before re-plug - to ensure automatic redirection to remote desktop.

+------------+-----------------------------------------------------------------+
|Parameter   |`Customize delay time needed between unplug and replug of usb devices` |
+------------+-----------------------------------------------------------------+
|Registry    |`vmware.view.usb-reconnect-delay`                                |
+------------+-----------------------------------------------------------------+
|Type        |bool                                                             |
+------------+-----------------------------------------------------------------+
|Value       |enabled / **disabled** (default)                                 |
+------------+-----------------------------------------------------------------+
|Parameter   |`Minimum time (in ms) you have to wait between unplug and replug of redirected usb devices` |
+------------+-----------------------------------------------------------------+
|Registry    |`vmware.view.usb-reconnect-time`                                 |
+------------+-----------------------------------------------------------------+
|Type        |int                                                              |
+------------+-----------------------------------------------------------------+
|Value       |6000 **Default**                                                 |
+------------+-----------------------------------------------------------------+

* Added possibility to enable automatic connection for redirected usb devices
  which are excluded from this mechanism like HID bootable devices by also
  setting the Device Quirk option in the devices allow rule.

+------------+-----------------------------------------------------------------+
|Parameter   |`Device Quirk`                                                   |
+------------+-----------------------------------------------------------------+
|Registry    |`vmware.view.usb.devicepolicy.product_rule%.devicequirk`         |
+------------+-----------------------------------------------------------------+
|Type        |bool                                                             |
+------------+-----------------------------------------------------------------+
|Value       |enabled / **disabled** (default)                                 |
+------------+-----------------------------------------------------------------+

### Network

* Fixed mobile broadband support on Lenovo L14/L15 Gen3 AMD with Quectel EM05.
* Fixed tcpdump debug logging functionality.

### WiFi

* Fixed Mediatek WiFi not working after Suspend / Resume.

### HID

* Fixed handling of ELO touch devices in multi-monitor configuration.
* Fixed touchscreen configuration for devices using standard mouse interface.

### CUPS Printing

* Fixed CUPS printer model name used in IGEL OS.

### ThinPrint

* Added definition of printer device /dev/usblp which is used for Thinprint
  printers.  
  The need for such a device is due to the fact that a usb printer in some cases
  does not always get named /dev/usblp0 - even if it's the only one.  
  Note: With more than one usb printer connected at the same time, /dev/usblp
  should not be used but rather a device specific name based on usb ids, the usb
  port, or a usb class based device selection.

### Base system

* Fixed x.drivers.kms.debug_level configuration.
* Fixed user permission configuration of editor mousepad.

### Custom Partition

* Fixed errors during removal of custom partitions.

### X11 system

* Fixed issues with 4K monitors on Lenovo m75n IoT.

### IgelDesktop

* Fixed hiding mouse cursor.

### Audio

* Fixed Sound Mixer default setting.

### Multimedia

* Fixed virtual webcam - choosing webcam by device name.  
* Added 640x360 as 16:9 resolution to possible webcam resolutions registry key:

+------------+-----------------------------------------------------------------+
|Parameter   |`Select resolution to use.`                                      |
+------------+-----------------------------------------------------------------+
|Registry    |`multimedia.webcam.virtual_background.resolution`                |
+------------+-----------------------------------------------------------------+
|Range       | [webcam default][webcam max][1920x1080][1280x720][640x480]      |
|            | [640x360][480x360][424x240][320x240][320x180]                   |
+------------+-----------------------------------------------------------------+
|Value       |**webcam default**                                               |
+------------+-----------------------------------------------------------------+

### Java

* Fixed java runtime environment integration (certificate store)
```

-----

## 2023-12-05 - [11.08.469.DER](readme11.08.469.DER.txt)

```
The new PRIVATE BUILD 11.08.469.DER for IGEL Workspace is ready.

This build is based on 11.08.468.DER.

These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------

### Cisco Webex

* Integrated Cisco Webex Meetings VDI 43.6.8.4
```

-----

## 2023-11-28 - [11.08.468.DER](readme11.08.468.DER.txt)

```
The new PRIVATE BUILD 11.08.468.DER for IGEL Workspace is ready.

This build is based on 11.08.466.DER.

These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------

### Cisco Webex

* Integrated Webex VDI 43.8.0.27945
```

-----

## 2023-11-22 - [11.09.123](readme11.09.123.txt)

```
The new PRIVATE BUILD 11.09.123 for IGEL Workspace is ready.

This build is based on 11.09.116.

These are the release notes published with that release:

Known Issues
--------------------------------------------------------------------------------

### Citrix

* To launch multiple desktop sessions with Citrix HDX RTME and Citrix H.264
acceleration plugin, the following registry key needs to be enabled:

+------------+-----------------------------------------------------------------+
|Parameter |`Activate workaround for dual RTME sessions and H264 acceleration` |
+------------+-----------------------------------------------------------------+
|Registry |`ica.workaround-dual-rtme` |
+------------+-----------------------------------------------------------------+
|Range |enabled / **disabled** (default) |
+------------+-----------------------------------------------------------------+

* This workaround is not applicable when \\"Enable Secure ICA\\" is active for the
specific delivery group.
* Adding smartcard readers during running / active session does not work. The
reader is visible, but cannot be used due to unknown reader status. Only
relevant for CWA versions earlier than 2112.
* Browser Content Redirection (BCR) does not work if DRI3 and hardware
accelerated H.264 deep compression codec is enabled.
* Citrix H.264 acceleration plugin does not work with **enabled** server policy
\\"Optimize for 3D graphics workload\\" in combination with server policy \\"Use
video codec compression\\" -> *\\"For the entire screen\\"**.
* Currently H.264 for Citrix sessions cannot be used in parallel with video
input acceleration.
* While starting Self-Service, it is possible that process ServiceRecord
segfaults -> Self-Service cannot be started afterwards.

A cache cleanup with reboot is needed. In addition, the following parameters
should set to true.

+------------+-----------------------------------------------------------------+
|Parameter |`Clean up UI cache after Self-Service termination` |
+------------+-----------------------------------------------------------------+
|Registry |`ica.selfservice.cleanupwebui` |
+------------+-----------------------------------------------------------------+
|Value |**false** (default)/true |
+------------+-----------------------------------------------------------------+
|Parameter |`Clean up Store cache after Self-Service termination` |
+------------+-----------------------------------------------------------------+
|Registry |`ica.selfservice.cleanupstore` |
+------------+-----------------------------------------------------------------+
|Value |**false** (default)/true |
+------------+-----------------------------------------------------------------+

* Browser Content Redirection (BCR) may not work with Chrome version 105.0.* or
later. See https://support.citrix.com/article/CTX473065/hdx-browser-content-
redirection-broken-with-google-chrome-browser-version-105-or-higher
* White / green fragments may appear during desktop launch if JPEG graphical
codec is used.
* MS Teams calls may stop if blurred background is enabled. This affects Citrix
Workspace App 2305 and later.
* Regarding CVE-2023-41993, CVE-2023-39928 & CVE-2023-41074: For compatibility
with Citrix Self-Service, older Webkit libraries are used instead of the
latest ones to continue working properly.

More information: [https://kb.igel.com/securitysafety/en/isn-2023-25-webkit-
vulnerabilities-101066782.html]

### OSC Installer

* OSC not deployable with IGEL Deployment Appliance: Version 11.3 or later is
required for deploying IGEL OS 11.06. and following.

### AVD

* H.264 hardware decoding for MS-Teams optimization is currently limited to non-
AMD devices due to stability issues on AMD devices.

### VMware Horizon

* After disconnect of an RDP-based session, the Horizon main window which
contains the server or sessions overview, cannot be resized anymore.
* Copying text from Horizon Blast sessions is not possible.
* The on-screen keyboard in Horizon appliance mode does not work correctly with
local logon.

It is necessary to switch off local logon and enable the following two keys
via IGEL registry:

userinterface.softkeyboard.autoshow
userinterface.softkeyboard.autohide

* With usage of PCoIP protocol, the virtual channel provided by VMware used for
serial port and scanner redirection could freeze on logout from remote
session.

This happens only with enabled scanner or serial port redirection.
The freeze does not occur if both redirection methods are enabled or none of
them. The Blast Protocol is not affected by this bug.

The respective settings can be found in the IGEL Registry:

vmware.view.enable-serial-port-redir
vmware.view.enable-scanner-redir

* Keyboard Input Source Language Synchronization works only with usage of local
layout and deadkeys enabled.

If a keyboard layout is used which has deadkeys disabled (which is the default
on IGEL OS), Horizon client falls back to en-US layout.

* PCoIP sessions may crash in some cases, switch to Blast Protocol is
recommended then. H.264/HEVC encoding can be disabled when overall performance
is too low.
* Client drive mapping and USB redirection for storage devices can be enabled at
the same time, but this could lead to sporadic problems.

Horizon Client tracks the drives which are dynamically mounted and adds them
to the remote session using client drive mapping, means USB redirection is not
used for theses devices then.

However, in case of devices like USB SD card readers, Horizon does not map
them as client drives but forcefully uses USB-redirection which results in an
unclean unmount.

As a work-around, the IDs of these card readers can be added to IGEL USB
access rules and denied.

### Parallels Client

* Attached storage devices appear as network drives in the remote session
* USB device redirection is considered as experimental for the Parallels client
for Linux

### Firefox

* With enabled Citrix Browser Content Redirection, Firefox has no H.264 and AAC
multimedia codec support. Means, when codec support is needed in Firefox, BCR
needs to be disabled. Citrix Browser Content Redirection is disabled by
default.

### Chromium

* Hardware accelerated video decoding is currently not supported.

### Network

* Wakeup from system suspend fails on DELL Latitude 5510

### WiFi

* TP-Link Archer T2UH WiFi adapters does not work after system suspend/resume.
Workaround: Disabling system suspend at IGEL Setup > System > Power Options >
Shutdown.

### Cisco JVDI Client

* There may be a segfault shown in the logs (during logout of Citrix Desktop
session). Occurs only when using Citrix Workspace App 2010 and Cisco JVDI.

### Base system

* Update from memory stick requires network online state (at least when multiple
update stages are triggered / necessary)
* It is not possible to perform an unattended OS12 migration to base system
12.2.0 as an additional / manual reboot is necessary. The recommended upgrade
version for unattended migration is base system 12.2.1.

### Conky

* The right screen when using multiscreen environment may not be shown
correctly.

Workaround: The horizontal offset should be set to the width of the monitor
(e.g. if the monitor has a width of 1920, the offset should be set to 1920)

### Firmware update

* On devices with 4 GB flash storage or smaller it could happen that there is
not enough space for updating all features. In this case, a corresponding
error message occurs. Please visit [https://kb.igel.com/igelos-11.04/en/error-
not-enough-space-on-local-drive-when-updating-to-igel-os-11-04-or-
higher-32870765.html] for a possible solution and additional information.

### Appliance Mode

* When ending a Citrix session in browser appliance mode, the browser is
restarted twice (instead of once).
* Appliance mode RHEV/Spice: spice-xpi firefox plugin is no longer supported.

The \\"Console Invocation\\" has to allow 'Native' client (auto is also possible)
and should be started in fullscreen to prevent any opening windows.

* Browser Appliance mode can fail when the Web URL contains special control
characters like ampersand (& character).

Workaround: Add quotes at the beginning and the end of an affected URL. E.g.:
'https://www.google.com/search?q=aSearchTerm&source=lnms&tbm=isch'

### Audio

* IGEL UD2 (D220) fails to restore the volume level of the speaker when the
device used firmware version 11.01.110 before.
* Audio jack detection on Advantec POC-W243L does not work. Therefore, sound
output goes through a possibly connected headset and also the internal
speakers.
* UD3-M340C: Sound preferences are showing Headphone & Microphone, although not
connected.

### Multimedia

* Multimedia redirection with GStreamer could fail when using Nouveau GPU
driver.

### Hardware

* Some newer Delock 62599 active DisplayPort to DVI (4k) adapters only work on
INTEL-based devices.
* Wake up from suspend via UMS does not work on HP mt645 devices. Workaround:
Disable system suspend and use shutdown instead.
* Built-in fingerprint sensor is not supported on HP mt440 and mt645.
* MAC-Address Passthrough not supported on Lenovo USB-C Hybrid Docking Station.
* Wake-on-Lan via docking stations is not supported.
* In some rare cases it is possible that connecting or booting Lenovo USB-C
Hybrid Docking station over USB-C results in non working / faulty display
output.
** It may help to (re-)connect via USB-A. If this is the case, USB-C should be
also functional then.
* Display configuration of displays connected to HP G5 Docking Station may fail
with HP t655.

### Remote Management

* AIT feature with IGEL Starter License is only supported by UMS version
6.05.100 or newer.
```

-----

## 2023-11-22 - [11.08.352](readme11.08.352.txt)

```
The new PRIVATE BUILD 11.08.352 for IGEL Workspace is ready.

This build is based on 11.08.351.

These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------

### VMware Horizon

* Fixed Horizon USB redirection issues when used in Imprivata context.

Added TCSetup 12.3.101 which supports setting quirks needed for some usb
devices in the device Rule dialog of Horizon Client.

Updated zulu jre providing a java17 environment (needed to run the new
TCSetup).
```

-----

## 2023-11-22 - [11.08.448](readme11.08.448.txt)

```
The new PRIVATE BUILD 11.08.448 for IGEL Workspace is ready.

This build is based on 11.08.440.

These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------

### RDP/IGEL RDP Client 2

* Fixed RDP session crash after pressing CTRL + ALT + ENTER.
```

-----

## 2023-11-17 - [11.09.122](readme11.09.122.txt)

```
The new PRIVATE BUILD 11.09.122 for IGEL Workspace is ready.

This build is based on 11.09.117.

These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------

### Base system

* Integrated components:

Cisco Webex VDI: Version 43.10.0.27605
```

-----

## 2023-11-14 - [11.09.119](readme11.09.119.txt)

```
The new PRIVATE BUILD 11.09.119 for IGEL Workspace is ready.

This build is based on 11.09.114.

These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------

### IGEL Agent for Imprivata

* In FUS and Follow Policies mode, only Citrix sessions being started by the
IGEL Agent for Imprivata will be disconnected / signed out, others remain
intact
* the resource chooser is now part of the lock screen (if lock screen is
enabled)
* changed chooser from a grid view to a list view
* added reg key to hide horizon apps on the chooser (and thus show desktops
only)

+------------+-----------------------------------------------------------------+
| Registry | `iia.hide_horizon_apps_on_chooser` |
+------------+-----------------------------------------------------------------+
| Type | bool |
+------------+-----------------------------------------------------------------+
| Value | **enabled** (default) / disabled) |
+------------+-----------------------------------------------------------------+
* added reg key to hide citrix apps on the chooser (and thus show desktops only)
+------------+-----------------------------------------------------------------+
| Registry | `iia.hide_citrix_apps_on_chooser` |
+------------+-----------------------------------------------------------------+
| Type | bool |
+------------+-----------------------------------------------------------------+
| Value | **enabled** (default) / disabled |
+------------+-----------------------------------------------------------------+

* added the ability to run Horizon Apps
* changed reg key 'iia.query_moniker' from bool to string to hold the moniker
name to query for

+------------+-----------------------------------------------------------------+
| Registry | `iia.query_moniker` |
+------------+-----------------------------------------------------------------+
| Type | string |
+------------+-----------------------------------------------------------------+
| Value | \\"\\" |
+------------+-----------------------------------------------------------------+

* bugfix: program rfideas also in FUS mode
* bugfix: password change
```

-----

## 2023-11-10 - [11.09.118](readme11.09.118.txt)

```
The new PRIVATE BUILD 11.09.118 for IGEL Workspace is ready.

This build is based on 11.09.117.

These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------

### Base system

* Integrated components:

Cisco Webex VDI: Version 43.10.0.27605
```

-----

## 2023-11-09 - [11.09.117](readme11.09.117.txt)

```
The new PRIVATE BUILD 11.09.117 for IGEL Workspace is ready.

This build is based on 11.09.114.

These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------

### Base system

* Integrated required versions for private build:

** Webex Teams Plugin: 43.6.0.26643
** Webex Meetings Plugins: 43.6.5.20, 2.10.8.14 and 42.6.11.6
** Citrix Workspace Apps: 23.05.0.58, 23.09.02.24 and 20.10.0.6
** Zoom Plugins: 5.12.6.22200, 5.13.10.23090, 5.14.10.23670
** Kernel with activated CONFIG_DEBUG_INFO_BTF option.
```

-----

## 2023-11-08 - [11.09.116](readme11.09.116.txt)

```
The new PRIVATE BUILD 11.09.116 for IGEL Workspace is ready.

This build is based on 11.09.114.

These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------

### zoomvdi

* Integrated components:

Zoom VDI Plugin: Version 5.10.6.21295
```

-----

## 2023-11-07 - [11.09.115](readme11.09.115.txt)

```
The new PRIVATE BUILD 11.09.115 for IGEL Workspace is ready.

This build is based on 11.09.110.

These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------

### Cisco JVDI Client

* Integrated Cisco JVDI 14.1.2
```

-----

## 2023-11-06 - [11.09.112](readme11.09.112.txt)

```
The new PRIVATE BUILD 11.09.112 for IGEL Workspace is ready.

This build is based on 11.09.110.

These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------

### AVD

* Public UDP shortpath supported and enabled by default
* Video resolution fix that fixes MS-Teams black video / video freezes
* Timezone handling fix from latest RdClientSDK (with RDS AAD disabled)
included.
```

-----

## 2023-10-31 - [11.09.114](readme11.09.114.txt)

```
The new PRIVATE BUILD 11.09.114 for IGEL Workspace is ready.

This build is based on 11.09.110.

These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------

### Citrix

* Upgraded Citrix EPA client to version 23.10.3
* Updated Citrix Workspace App to version 2309.
Available Citrix Workspace Apps in this release: 2309 (default), 2307 and 2010
* Enhancement to multiple monitors [Technical Preview]

+------------+-----------------------------------------------------------------+
|Parameter |`Multi Monitor enhancement` |
+------------+-----------------------------------------------------------------+
|Registry |`ica.wfclient.MultiMonitorPnPEnabled` |
+------------+-----------------------------------------------------------------+
|Value |true / false (default) |
+------------+-----------------------------------------------------------------+
* HTTPS protocol support for proxy server
+------------+-----------------------------------------------------------------+
|Parameter |`HTTPS protocol support for proxy server` |
+------------+-----------------------------------------------------------------+
|Registry |`ica.wfclient.hdxoverudp` |
+------------+-----------------------------------------------------------------+
|Value |true (default)/ false |
+------------+-----------------------------------------------------------------+

* Note: Update \\"ica.allregions.proxytype\\" = Secure, and
\\"ica.allregions.proxyhost\\" in the following format = \\<IP>:\\<PORT>. For
example “192.168.101.37:6153”.
* Policy tampering detection feature prevents the user from accessing the
Virtual App or Desktop session if the App Protection anti-screen capture and
anti-keylogging policies are tampered with. If policy tampering is detected.
* Support for 32-bit cursor
* Copy and paste files and folders between two virtual desktops
* Improved error messages

### Cisco JVDI Client

* Integrated Cisco JVDI 14.2.1

Resolved Issues
--------------------------------------------------------------------------------

### Cisco Webex

* Fixed Webex VDI/ Webex Meetings VDI not connecting to the enterprise site.
```

-----

## 2023-10-27 - [11.08.351](readme11.08.351.txt)

```
The new PRIVATE BUILD 11.08.351 for IGEL Workspace is ready.

This build is based on 11.08.330.

These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------

### VMware Horizon

* Added possibility to customize the time you have to wait after unplugging a
device from a usb port before you re-plug to ensure automatic redirection to
the remote desktop.

+------------+-----------------------------------------------------------------+
| Parameter | `Customize delay time needed between unplug and replug of usb devices` |
+------------+-----------------------------------------------------------------+
| Registry | `vmware.view.usb-reconnect-delay` |
+------------+-----------------------------------------------------------------+
| Type | bool |
+------------+-----------------------------------------------------------------+
| Value | enabled / **disabled** (default) |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter | `Minimum time (in ms) you have to wait between unplug and replug of redirected usb devices` |
+------------+-----------------------------------------------------------------+
| Registry | `vmware.view.usb-reconnect-time` |
+------------+-----------------------------------------------------------------+
| Type | int |
+------------+-----------------------------------------------------------------+
| Value | 6000 **Default** |
+------------+-----------------------------------------------------------------+

* Added possibility to enable automatic connection for redirected usb devices
which are excluded from this mechanism like HID bootable devices by also
setting the Device Quirk option in the devices allow rule.

+------------+-----------------------------------------------------------------+
| Parameter | `Device Quirk` |
+------------+-----------------------------------------------------------------+
| Registry | `vmware.view.usb.devicepolicy.product_rule%.devicequirk` |
+------------+-----------------------------------------------------------------+
| Type | bool |
+------------+-----------------------------------------------------------------+
| Value | enabled / **disabled** (default) |
+------------+-----------------------------------------------------------------+
```

-----

## 2023-10-26 - [11.08.470](readme11.08.470.txt)

```
The new PRIVATE BUILD 11.08.470 for IGEL Workspace is ready.

This build is based on 11.08.460.

These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------

### WiFi

* Fixed issue with Mediatek WiFi not working after Suspend/Resume.
```

-----

## 2023-10-25 - [11.09.108](readme11.09.108.txt)

```
The new PRIVATE BUILD 11.09.108 for IGEL Workspace is ready.

This build is based on 11.08.360.

These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------

### Jabra

* Updated Fabulatech USB for Remote Desktop to version 6.1.3.13
```

-----

## 2023-10-25 - [11.08.121](readme11.08.121.txt)

```
The new PRIVATE BUILD 11.08.121 for IGEL Workspace is ready.

This build is based on 11.08.118.DER.

These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------

### Cisco Webex

* Available Cisco WebEx Meetings VDI Clients: 43.6 (default), 43.2, and 42.10
Integrated Cisco JVDI Client 14.2
```

-----

## 2023-10-25 - [11.09.111](readme11.09.111.txt)

```
The new PRIVATE BUILD 11.09.111 for IGEL Workspace is ready.

This build is based on 11.09.110.

These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------

### VMware Horizon

* Added possibility to customize the time you have to wait after unplugging a
device from a usb port before you re-plug to ensure automatic redirection to
the remote desktop.

+------------+-----------------------------------------------------------------+
| Parameter | `Customize delay time needed between unplug and replug of usb devices` |
+------------+-----------------------------------------------------------------+
| Registry | `vmware.view.usb-reconnect-delay` |
+------------+-----------------------------------------------------------------+
| Type | bool |
+------------+-----------------------------------------------------------------+
| Value | enabled / **disabled** (default) |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter | `Minimum time (in ms) you have to wait between unplug and replug of redirected usb devices` |
+------------+-----------------------------------------------------------------+
| Registry | `vmware.view.usb-reconnect-time` |
+------------+-----------------------------------------------------------------+
| Type | int |
+------------+-----------------------------------------------------------------+
| Value | 6000 **Default** |
+------------+-----------------------------------------------------------------+

* Added possibility to enable automatic connection for redirected usb devices
which are excluded from this mechanism like HID bootable devices by also
setting the Device Quirk option in the devices allow rule.

+------------+-----------------------------------------------------------------+
| Parameter | `Device Quirk` |
+------------+-----------------------------------------------------------------+
| Registry | `vmware.view.usb.devicepolicy.product_rule%.devicequirk` |
+------------+-----------------------------------------------------------------+
| Type | bool |
+------------+-----------------------------------------------------------------+
| Value | enabled / **disabled** (default) |
+------------+-----------------------------------------------------------------+
```

-----

## 2023-10-24 - [11.09.110](readme11.09.110.txt)

```
The new PUBLIC BUILD 11.09.110 for IGEL Workspace is ready.

This build is based on 11.09.100.

These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------

### Chromium

* Updated Chromium to version 118.0.5993.70

### Firefox

* Updated Firefox to ESR version 115.3.1

### Base system

* Added new registry keys to improve power usage of the system (not enabled as
  default)

+------------+-----------------------------------------------------------------+
| Parameter  | `Use powertop auto tune to reduce power usage`                  |
+------------+-----------------------------------------------------------------+
| Registry   | `system.powersave.powertop_auto_tune`                           |
+------------+-----------------------------------------------------------------+
| Range      | [Auto][Enable][Disable]                                         |
+------------+-----------------------------------------------------------------+
| Value      | **Disable**                                                     |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | `Use laptop mode to reduce power usage`                         |
+------------+-----------------------------------------------------------------+
| Registry   | `system.powersave.laptop_mode`                                  |
+------------+-----------------------------------------------------------------+
| Range      | [Auto][Enable][Disable]                                         |
+------------+-----------------------------------------------------------------+
| Value      | **Disable**                                                     |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | `Clock down AMDGPU if screen dims down (due to inactivity ).`   |
+------------+-----------------------------------------------------------------+
| Registry   | `system.powersave.clock_down_amdgpu_on_dim`                     |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | **disabled** (default) / enabled                                |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | `Set Ryzen CPU to power save mode if screen dims down (due to inactivity).` |
+------------+-----------------------------------------------------------------+
| Registry   | `system.powersave.use_ryzenadj_on_dim`                          |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | **disabled** (default) / enabled                                |
+------------+-----------------------------------------------------------------+


Security Fixes
--------------------------------------------------------------------------------

### Base system

* Fixed curl security issues CVE-2023-38546, CVE-2023-38545 and CVE-2023-38039.  
* Updated Firefox to ESR version 115.3.1  
** Fixes for mfsa2023-44, also known as:  
  CVE-2023-5217  
** Fixes for mfsa2023-42, also known as:  
  CVE-2023-5169, CVE-2023-5171, CVE-2023-5176.   
* Updated Chromium to version 118.0.5993.70 which fixes following security
  issues CVE-2023-5487, CVE-2023-5486, CVE-2023-5485, CVE-2023-5484,
  CVE-2023-5483, CVE-2023-5481, CVE-2023-5479, CVE-2023-5478, CVE-2023-5477,
  CVE-2023-5476, CVE-2023-5475, CVE-2023-5474, CVE-2023-5473, CVE-2023-5346,
  CVE-2023-5218, CVE-2023-5217, CVE-2023-5187, CVE-2023-5186, CVE-2023-4909,
  CVE-2023-4908, CVE-2023-4907, CVE-2023-4906, CVE-2023-4905, CVE-2023-4904,
  CVE-2023-4903, CVE-2023-4902, CVE-2023-4901, CVE-2023-4900, CVE-2023-4764,
  CVE-2023-4763, CVE-2023-4762, CVE-2023-4761, CVE-2023-4572, CVE-2023-4431,
  CVE-2023-4430, CVE-2023-4429, CVE-2023-4428, CVE-2023-4427, CVE-2023-4368,
  CVE-2023-4367, CVE-2023-4366, CVE-2023-4365, CVE-2023-4364, CVE-2023-4363,
  CVE-2023-4362, CVE-2023-4361, CVE-2023-4360, CVE-2023-4359, CVE-2023-4358,
  CVE-2023-4357, CVE-2023-4356, CVE-2023-4355, CVE-2023-4354, CVE-2023-4353,
  CVE-2023-4352, CVE-2023-4351, CVE-2023-4350, CVE-2023-4349 and CVE-2023-2312.  
* Fixed webkit2gtk security issues CVE-2023-41993, CVE-2023-41074,
  CVE-2023-40451, CVE-2023-39928, CVE-2023-39434 and CVE-2023-35074.

Resolved Issues
--------------------------------------------------------------------------------

### Cisco Webex

* Fixed Webex VDI/ Webex Meetings VDI not connecting to the enterprise site.
```

-----

## 2023-10-20 - [11.09.103](readme11.09.103.txt)

```
The new PRIVATE BUILD 11.09.103 for IGEL Workspace is ready.

This build is based on 11.09.100.

These are the release notes published with that release:

Security Fixes
--------------------------------------------------------------------------------

### Base system

* Fixed curl security issues CVE-2023-38546, CVE-2023-38545 and CVE-2023-38039.
* Updated Firefox to ESR version 115.3.1 (fixes CVE-2023-5217)
* Updated Chromium to version 118.0.5993.70 which fixes following security
issues CVE-2023-5487, CVE-2023-5486, CVE-2023-5485, CVE-2023-5484,
CVE-2023-5483, CVE-2023-5481, CVE-2023-5479, CVE-2023-5478, CVE-2023-5477,
CVE-2023-5476, CVE-2023-5475, CVE-2023-5474, CVE-2023-5473, CVE-2023-5346,
CVE-2023-5218, CVE-2023-5217, CVE-2023-5187, CVE-2023-5186, CVE-2023-4909,
CVE-2023-4908, CVE-2023-4907, CVE-2023-4906, CVE-2023-4905, CVE-2023-4904,
CVE-2023-4903, CVE-2023-4902, CVE-2023-4901, CVE-2023-4900, CVE-2023-4764,
CVE-2023-4763, CVE-2023-4762, CVE-2023-4761, CVE-2023-4572, CVE-2023-4431,
CVE-2023-4430, CVE-2023-4429, CVE-2023-4428, CVE-2023-4427, CVE-2023-4368,
CVE-2023-4367, CVE-2023-4366, CVE-2023-4365, CVE-2023-4364, CVE-2023-4363,
CVE-2023-4362, CVE-2023-4361, CVE-2023-4360, CVE-2023-4359, CVE-2023-4358,
CVE-2023-4357, CVE-2023-4356, CVE-2023-4355, CVE-2023-4354, CVE-2023-4353,
CVE-2023-4352, CVE-2023-4351, CVE-2023-4350, CVE-2023-4349 and CVE-2023-2312.
* Fixed webkit2gtk security issues CVE-2023-41993, CVE-2023-41074,
CVE-2023-40451, CVE-2023-39928, CVE-2023-39434 and CVE-2023-35074.

New Features
--------------------------------------------------------------------------------

### Base system

* Added new registry keys to improve power usage of the system (not enabled as
default)

+------------+-----------------------------------------------------------------+
| Parameter | `Use powertop auto tune to reduce power usage` |
+------------+-----------------------------------------------------------------+
| Registry | `system.powersave.powertop_auto_tune` |
+------------+-----------------------------------------------------------------+
| Range | [Auto][Enable][Disable] |
+------------+-----------------------------------------------------------------+
| Value | **Disable** |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter | `Use laptop mode to reduce power usage` |
+------------+-----------------------------------------------------------------+
| Registry | `system.powersave.laptop_mode` |
+------------+-----------------------------------------------------------------+
| Range | [Auto][Enable][Disable] |
+------------+-----------------------------------------------------------------+
| Value | **Disable** |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter | `Clock down AMDGPU if screen dims down (due to inactivity ).` |
+------------+-----------------------------------------------------------------+
| Registry | `system.powersave.clock_down_amdgpu_on_dim` |
+------------+-----------------------------------------------------------------+
| Type | bool |
+------------+-----------------------------------------------------------------+
| Value | **disabled** (default) / enabled |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter | `Set Ryzen CPU to power save mode if screen dims down (due to inactivity).` |
+------------+-----------------------------------------------------------------+
| Registry | `system.powersave.use_ryzenadj_on_dim` |
+------------+-----------------------------------------------------------------+
| Type | bool |
+------------+-----------------------------------------------------------------+
| Value | **disabled** (default) / enabled |
+------------+-----------------------------------------------------------------+
```

-----

## 2023-10-19 - [11.09.104](readme11.09.104.txt)

```
The new PRIVATE BUILD 11.09.104 for IGEL Workspace is ready.

This build is based on 11.09.100.

These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------

### Citrix

* [https://docs.citrix.com/en-us/citrix-workspace-app-for-linux/ear.html]
* New Parameters:

+------------+-----------------------------------------------------------------+
|Parameter   |`EDT Lossy protocol`                                             |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.module.EdtUnreliableAllowed`                                |
+------------+-----------------------------------------------------------------+
|Type        |bool                                                             |
+------------+-----------------------------------------------------------------+
|Value       |enabled / **disabled** (default)                                 |
+------------+-----------------------------------------------------------------+
|Parameter   |`Enable Packet Loss Concealment to improve audio performance`    |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.module.PacketLossConcealmentEnabled`                        |
+------------+-----------------------------------------------------------------+
|Type        |bool                                                             |
+------------+-----------------------------------------------------------------+
|Value       |enabled / **disabled** (default)                                 |
+------------+-----------------------------------------------------------------+
|Parameter   |`Support for keyboard shortcut to switch between Full-screen and Window mode` |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.allregions.FullScreenShortcutSupport`                       |
+------------+-----------------------------------------------------------------+
|Type        |string                                                           |
+------------+-----------------------------------------------------------------+
|Value       |true / false / *** (default)                                     |
+------------+-----------------------------------------------------------------+

* New Features with this Citrix Workspace app 2309
* Support for MJPEG webcams
* Support for EDT Lossy protocol [Technical Preview]  
  > This feature increases the user experience for real-time streaming.  
  > Therefore activate `app.cwa.module.clientaudio.EdtUnreliableAllowed`
* Enable Packet Loss Concealment to improve audio performance [Technical
  Preview]  
  > Improve audio performance with Speex and Opus codec. Also, enable
  JitterBufferEnabled.  
  > Therefore enable `app.cwa.module.clientaudio.PacketLossConcealmentEnabled`
  and `app.cwa.module.clientaudio.JitterBufferEnabled`
* Supports system certificate paths for SSL connection  
  > With this release, Citrix Workspace app supports system certificate paths
  for SSL connection. This feature simplifies the certificate management process
  on the client side and improves the user experience. With this feature, Citrix
  Workspace can create a TLS connection with the certificate in the system
  certificate path. This feature is enabled by default.
* Multi-touch support [Technical Preview]  
  > Select an item: Tap on the touchpad.  
  > Scroll: Place two fingers on the touchpad and slide horizontally or
  vertically.  
  > Zoom in or out: Place two fingers on the touchpad and pinch in or stretch
  out.  
  > Show more commands (similar to right-clicking): Tap the touchpad with two
  fingers, or press in the lower-right corner
* Support for keyboard shortcut to switch between Full-screen and Window mode  
  > Set the parameter
  `app.cwa.allregions.client_engine.PacketLossConcealmentEnabled` to true.  
  > By default, the keyboard shortcut is Ctrl+F2.
* Updated Citrix Workspace App to version 2309.  
  Available Citrix Workspace Apps in this release: 2309 (default), 2307 and 2010
* Enhancement to multiple monitors [Technical Preview]

+------------+-----------------------------------------------------------------+
|Parameter   |`Multi Monitor enhancement`                                      |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.wfclient.MultiMonitorPnPEnabled`                            |
+------------+-----------------------------------------------------------------+
|Value       |true / false (default)                                           |
+------------+-----------------------------------------------------------------+

* HTTPS protocol support for proxy server

+------------+-----------------------------------------------------------------+
|Parameter   |`HTTPS protocol support for proxy server`                        |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.wfclient.hdxoverudp`                                        |
+------------+-----------------------------------------------------------------+
|Value       |true (default)/ false                                            |
+------------+-----------------------------------------------------------------+

* Note: Update "ica.allregions.proxytype" = Secure, and
  "ica.allregions.proxyhost" in the following format = \<IP>:\<PORT>. For
  example "192.168.101.37:6153".  
* Policy tampering detection feature prevents the user from accessing the
  Virtual App or Desktop session if the App Protection anti-screen capture and
  anti-keylogging policies are tampered with. If policy tampering is detected.  
* Support for 32-bit cursor  
* Copy and paste files and folders between two virtual desktops  
* Improved error messages
* Existing Parameters:  
  The following parameters are duplicated to All_regionis.ini from wfclient.ini  
*  
  |Parameter|`Proxy type`|  
  |Registry|`ica.allregions.proxytype`|  
  |Value| (default), Socks, and Secure |
*  
  |Parameter|`Proxy host`|  
  |Registry|`ica.allregions.proxyhost`|
*  
  |Parameter|`Proxy port|  
  |Registry|`ica.allregions.proxyport`|
*  
  |Parameter|`Proxy timeout`|  
  |Registry|`ica.allregions.proxytimeout`|
*  
  |Parameter|`Proxy bypass list|  
  |Registry|`ica.allregions.proxybypasslist`|

### Cisco JVDI Client

* Integrated Cisco JVDI 14.2.1

Resolved Issues
--------------------------------------------------------------------------------

### Cisco Webex

* Fixed Webex VDI/ Webex Meetings VDI not connecting to the enterprise site.
```

-----

## 2023-10-18 - [11.09.105](readme11.09.105.txt)

```
The new PRIVATE BUILD 11.09.105 for IGEL Workspace is ready.

This build is based on 11.09.100.

These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------

### OSC Installer

* Added support for custom Unit Id rules.

### Base system

* Added support for custom Unit Id rules.
```

-----

## 2023-10-16 - [11.08.460](readme11.08.460.txt)

```
The new PRIVATE BUILD 11.08.460 for IGEL Workspace is ready.

This build is based on 11.08.440.

These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------

### Base system

* Changed label of mobile broadband configuration dialogue in IGEL OS setup
  (Country or Region).

Resolved Issues
--------------------------------------------------------------------------------

### Base system

* Changed IGEL registry settings so screen is dimmed to 20% after 120 seconds
  inactivity.

+------------+-----------------------------------------------------------------+
| Parameter  | `Reduce after`                                                  |
+------------+-----------------------------------------------------------------+
| Registry   | `x.xserver%.brightness_on_ac`                                   |
+------------+-----------------------------------------------------------------+
| Type       | integer                                                         |
+------------+-----------------------------------------------------------------+
| Value      | 120 **Default**                                                 |
+------------+-----------------------------------------------------------------+
+------------+-----------------------------------------------------------------+
| Parameter  | `Reduce after`                                                  |
+------------+-----------------------------------------------------------------+
| Registry   | `x.xserver%.brightness_on_battery`                              |
+------------+-----------------------------------------------------------------+
| Type       | integer                                                         |
+------------+-----------------------------------------------------------------+
| Value      | 120 **Default**                                                 |
+------------+-----------------------------------------------------------------+
+------------+-----------------------------------------------------------------+
| Parameter  | `On inactivity reduce to`                                       |
+------------+-----------------------------------------------------------------+
| Registry   | `x.xserver%.brightness_level_ac`                                |
+------------+-----------------------------------------------------------------+
| Type       | integer                                                         |
+------------+-----------------------------------------------------------------+
| Value      | 20 **Default**                                                  |
+------------+-----------------------------------------------------------------+
* Added new registry keys to improve power usage of the system
+------------+-----------------------------------------------------------------+
| Parameter  | `Use powertop auto tune to reduce power usage`                  |
+------------+-----------------------------------------------------------------+
| Registry   | `system.powersave.powertop_auto_tune`                           |
+------------+-----------------------------------------------------------------+
| Range      | [Auto][Enable][Disable]                                         |
+------------+-----------------------------------------------------------------+
| Value      | **Auto**                                                        |
+------------+-----------------------------------------------------------------+
+------------+-----------------------------------------------------------------+
| Parameter  | `Use laptop mode to reduce power usage`                         |
+------------+-----------------------------------------------------------------+
| Registry   | `system.powersave.laptop_mode`                                  |
+------------+-----------------------------------------------------------------+
| Range      | [Auto][Enable][Disable]                                         |
+------------+-----------------------------------------------------------------+
| Value      | **Auto**                                                        |
+------------+-----------------------------------------------------------------+
+------------+-----------------------------------------------------------------+
| Parameter  | `Clock down AMDGPU if screen dims down (due to inactivity ).`   |
+------------+-----------------------------------------------------------------+
| Registry   | `system.powersave.clock_down_amdgpu_on_dim`                     |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | **enabled** (default) / disabled                                |
+------------+-----------------------------------------------------------------+
+------------+-----------------------------------------------------------------+
| Parameter  | `Set Ryzen CPU to power save mode if screen dims down (due to inactivity).` |
+------------+-----------------------------------------------------------------+
| Registry   | `system.powersave.use_ryzenadj_on_dim`                          |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | **enabled** (default) / disabled                                |
+------------+-----------------------------------------------------------------+
```

-----

## 2023-10-12 - [11.09.100](readme11.09.100.txt)

```
The new PUBLIC BUILD 11.09.100 for IGEL Workspace is ready.

These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------

### Citrix

* Updated Citrix Workspace App to version 2307.  
  Available Citrix Workspace Apps in this release: 2307 (default), 2305 and 2010
* Added support for playing short tones in optimized Microsoft Teams - requires
  update to latest version of Microsoft Teams.
* Changes with Citrix Workspace App 2305 and 2307:  
  New features:  
* Copy and paste files and folders between two virtual desktops [Technical
  Preview]

+------------+-----------------------------------------------------------------+
|Parameter   |`Copy and paste files and folders between two virtual desktops`  |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.module.vdgdt`                                               |
+------------+-----------------------------------------------------------------+
|Value       |true(default)/ false                                             |
+------------+-----------------------------------------------------------------+

* Enhancement on 32-bit cursor support [Technical Preview]

+------------+-----------------------------------------------------------------+
|Parameter   |`Enhancement on 32-bit cursor support`                           |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.wfclient.Cursor32bitSupport`                                |
+------------+-----------------------------------------------------------------+
|Value       |true(default)/ false                                             |
+------------+-----------------------------------------------------------------+

* Change the default browser for FIDO2

+------------+-----------------------------------------------------------------+
|Parameter   |`Change the default browser for FIDO2`                           |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.authman.fido2authbrowser`                                   |
+------------+-----------------------------------------------------------------+
|Value       |CEB (default), chromium, firefox, chromium-browser               |
+------------+-----------------------------------------------------------------+

* Support for authentication using FIDO2 when connecting to on-premises stores
  [Technical Preview]

+------------+-----------------------------------------------------------------+
|Parameter   |`Support for authentication using FIDO2 when connecting to on-premises stores` |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.authman.fido2enabled`                                       |
+------------+-----------------------------------------------------------------+
|Value       |false (default)/ true                                            |
+------------+-----------------------------------------------------------------+

* Fixed:  
* App Protection works with all the Citrix session types including Firefox
  browser. Reboot of system after enabling/disabling the feature
  (ica.appprotection) is required.

### OSC Installer

* Added possibility to create a minimal (self extracting) factory image with the
  OSC installer.

### AVD

* Updated IGEL AVD Client to version 1.1.30.

### Chromium

* Added possibility to use compressed BTRFS for Chromium profile partition. This
  is enabled by default.  
* Enhanced registry key system.customization.chpro.fs_type with new option
  btrfs.

+------------+-----------------------------------------------------------------+
|Parameter   |`Chromium Profiles Partition Filesystem Type`                    |
+------------+-----------------------------------------------------------------+
|Registry    |`system.customization.chpro.fs_type`                             |
+------------+-----------------------------------------------------------------+
|Range       | [ext4][f2fs][ntfs][ntfs-3g][btrfs]                              |
+------------+-----------------------------------------------------------------+
|Value       |**btrfs**                                                        |
+------------+-----------------------------------------------------------------+

* Added registry key to block the restore popup which is shown if Chromium
  browser is (re-)started after a crash.

### Firefox

* Added possibility to use compressed BTRFS and ntfs-3g for firefox profile
  partition.  
* Enhanced registry key system.customization.chpro.fs_type with new options
  btrfs and ntfs-3g.

+------------+-----------------------------------------------------------------+
| Parameter  | `Firefox Profiles Partition Filesystem Type`                    |
+------------+-----------------------------------------------------------------+
| Registry   | `system.customization.ffpro.fs_type`                            |
+------------+-----------------------------------------------------------------+
| Range      | [ext4][f2fs][ntfs][ntfs-3g][btrfs]                              |
+------------+-----------------------------------------------------------------+
| Value      | **ntfs**                                                        |
+------------+-----------------------------------------------------------------+


### Network

* Added MAC-address passthrough among Ethernet devices. With the following
  registry key a LAN device can be specified from which the MAC address shall be
  adopted. The donor device and any conflicting receiver device will be removed
  (by unbinding the driver) as long as the receiving device is present.

+------------+-----------------------------------------------------------------+
|Parameter   |`MAC address source`                                             |
+------------+-----------------------------------------------------------------+
|Registry    |`network.interfaces.ethernet.device%.mac_source`                 |
+------------+-----------------------------------------------------------------+
|Range       | [none][LAN][LAN2][LAN3][LAN4]                                   |
+------------+-----------------------------------------------------------------+
|Value       |**none**                                                         |
+------------+-----------------------------------------------------------------+

* Example: If LAN2 and LAN3 are configurations for docking stations that shall
  adopt the MAC address from LAN, the following two parameters must be set to
  "LAN":  
  network.interfaces.ethernet.device1.mac_source  
  network.interfaces.ethernet.device2.mac_source  
  Warning: Misconfiguration may result in loss of connectivity
* Added Lenovo FCC unlock tool for Quectel EM05

### NCP VPN

* Updated NCP Enterprise client to version 6.0 r29368.

### OpenConnect VPN

* Added further supported protocols for OpenConnect VPN client by adding
  Fortinet, F5 and Array. OpenConnect VPN is a feature with limited support, and
  the new protocols are not validated by IGEL.

+------------+-----------------------------------------------------------------+
|Setup       |Network>VPN>OpenConnect VPN>Name>Session                         |
+------------+-----------------------------------------------------------------+
|Parameter   |`Protocol`                                                       |
+------------+-----------------------------------------------------------------+
|Registry    |`sessions.openconnect<INST>.vpnopts.protocol`                    |
+------------+-----------------------------------------------------------------+
|Value       |{**}anyconnect{**}/nc/pulse/gp/f5/fortinet/array                 |
+------------+-----------------------------------------------------------------+


### Imprivata

* Updated Imprivata bootstrap loader to version 7.12.0.688624  
  
  This version can only be used with G4 Appliance and PIE Agents 7.12 or later!!

### IGEL Agent for Imprivata

* Added: Computer policy affects showing shutdown and reboot buttons at lock
  screen.  
* Added: Query email from standard principal information.  
  The following registry key will override it with an email provided by the App
  Moniker - if available.

+------------+-----------------------------------------------------------------+
|Parameter   |`Query Email from App Moniker`                                   |
+------------+-----------------------------------------------------------------+
|Registry    |`iia.query_moniker`                                              |
+------------+-----------------------------------------------------------------+
|Type        |bool                                                             |
+------------+-----------------------------------------------------------------+
|Value       |**enabled** (default) / disabled                                 |
+------------+-----------------------------------------------------------------+

* Added: Reporting IGEL OS version to Imprivata Appliance  
* Added: Display user name on 2nd factor query  
* Added: Minor UI improvements

### HID

* Updated ELO touch driver to version 5.4 for single touch and 4.3 for multi
  touch.
* Added support for usage or more than one touch screen (without calibration for
  now).

### CUPS Printing

* Updated PrinterLogic PrinterInstallerClient to version 25.1.0.637.  
  The update fixes the determination of AD user if Kerberos login is used.

### Cisco JVDI Client

* Integrated Cisco JVDI 14.1.4

### Base system

* Updated kernel to version 6.1.42.
* Added support for migrating IGEL OS11 to IGEL OS12. Details can be found here:
  https://kb.igel.com/igelos-11.09/en/upgrading-from-igel-os-11-to-igel-
  os-12-101063106.html. UMS 12.02.120 or later is required.  
  Migration related parameters:

+------------+-----------------------------------------------------------------+
| Registry   | `system.upgrade_igelos.ignore_memory_requirement`               |
+------------+-----------------------------------------------------------------+
| Value      | **false** (default) / true                                      |
+------------+-----------------------------------------------------------------+
| Hint       | Force upgrade of the IGEL OS if the device does not meet the minimal hardware requirement regarding RAM. Upgrade is performed on own risk and without official support by IGEL. |
+------------+-----------------------------------------------------------------+
| Registry   | `system.upgrade_igelos.delete_custom_partition`                 |
+------------+-----------------------------------------------------------------+
| Value      | **false** (default) / true                                      |
+------------+-----------------------------------------------------------------+
| Hint       | Automatically delete the existing custom partition while upgrading to the IGEL OS12. |
+------------+-----------------------------------------------------------------+

* Changed: If firmware is reset to factory defaults or reinstalled with OSC, the
  IGEL Setup Assistant starts again.
* Added some additional resolutions to the webcam virtual background solution
  (see changed registry keys).  
* Enables to choose webcams for virtual background by device name and priority.  
* Added new registry keys:

+------------+-----------------------------------------------------------------+
| Parameter  | `Select webcam by devicename for example /dev/video0 or video0 (only valid if choose by devicename is used)` |
+------------+-----------------------------------------------------------------+
| Registry   | `multimedia.webcam.virtual_background.webcam_device`            |
+------------+-----------------------------------------------------------------+
| Type       | string                                                          |
+------------+-----------------------------------------------------------------+
| Value      | empty **Default**                                               |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | `Select webcam by priority list for example dev=video0;name=HD_Webcam_C270 (only valid if choose by priority is used)` |
+------------+-----------------------------------------------------------------+
| Registry   | `multimedia.webcam.virtual_background.webcam_priority`          |
+------------+-----------------------------------------------------------------+
| Type       | string                                                          |
+------------+-----------------------------------------------------------------+
| Value      | empty **Default**                                               |
+------------+-----------------------------------------------------------------+

* Changed registry keys

+------------+-----------------------------------------------------------------+
| Parameter  | `Select how the webcam to use should be choosen.`               |
+------------+-----------------------------------------------------------------+
| Registry   | `multimedia.webcam.virtual_background.choose_webcam_by`         |
+------------+-----------------------------------------------------------------+
| Range      | [Use first webcam][Choose by name]                              |
|            | [Choose by vendor_id:product_id][Choose by number]              |
|            | [Choose by devicename][Choose by priority]                      |
+------------+-----------------------------------------------------------------+
| Value      | **Use first webcam**                                            |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | `Select resolution to use.`                                     |
+------------+-----------------------------------------------------------------+
| Registry   | `multimedia.webcam.virtual_background.resolution`               |
+------------+-----------------------------------------------------------------+
| Range      | [webcam default][webcam max][1920x1080][1280x720][640x480]      |
|            | [480x360][424x240][320x240][320x180]                            |
+------------+-----------------------------------------------------------------+
| Value      | **webcam default**                                              |
+------------+-----------------------------------------------------------------+

* Updated base system to Ubuntu Jammy 22.04.
* Enabled Wifi Manager, Multi Monitor configuration and Display Switch to be
  fully functional also when endpoint is unlicensed.
* Updated NVIDIA driver to version 525.
* Added ddcutil and ddcui to firmware which are tools to reading and changing
  monitor settings.
* Changed: IGEL Setup Assistant will come up on every boot as long as the system
  has starter- or no license. Setup Assistant is not triggered anymore if demo-
  or productive license is deployed and / or device is connected to an UMS.
* Changed label of mobile broadband configuration dialogue in IGEL OS setup
  (Country or Region).

### X11 system

* Changed default of DRI3 parameter. This is now enabled by default.

+------------+-----------------------------------------------------------------+
|Parameter   |`Use DRI3`                                                       |
+------------+-----------------------------------------------------------------+
|Registry    |`x.drivers.use_dri3`                                             |
+------------+-----------------------------------------------------------------+
|Type        |bool                                                             |
+------------+-----------------------------------------------------------------+
|Value       |**enabled** (default) / disabled                                 |
+------------+-----------------------------------------------------------------+


### zoomvdi

* Updated Zoom VDI plugin 5.15.2.23760  
  
  Available plugins in this release: 5.15.2.23760 (default), 5.14.10.23670 and
  5.14.10.23670

### Multimedia

* Removed GStreamer 0.10 support.
* Changed: Backscrub package is still from Bionic compile. So, rebuilded against
  current Jammy libs to get rid of old dependencies.

### Hardware

* Added hardware support for LG USB Multi Port Hub.
* Added hardware support for Lenovo ThinkPad L14 (AMD) Gen 4
* Added hardware support for Lenovo ThinkPad L15 (AMD) Gen 4.
* Added hardware support for Pepperl&Fuchs BTC12N and BTC14N
* Added hardware support for HP Pro mt440 G3.
* Added hardware support for Lenovo ThinkPad L14 Intel Gen 4.
* Added hardware support for Lenovo ThinkPad L15 Intel Gen 4.

### Java

* Updated java runtime environment to Zulu JRE version 17.0.8-1.

### Remote Management

* Added: Transfer devices serial number to UMS on first boot of device.
* If requirements for upgrading to IGEL OS12 are fulfilled, the field 'OS Type'
  in UMS is extended by the 'OS12 Upgrade Ready' attribute - e.g. 'IGEL Linux 11
  (OS12 Upgrade Ready; Kernel Version 6.1.42)'


Security Fixes
--------------------------------------------------------------------------------


### IBM_5250

* Updated IBM iAccess Client Solutions to version 1.1.9.2. Complete changelog
  via [https://www.ibm.com/support/pages/ibm-i-access-acs-updates]

### Chromium

* Updated Chromium browser to version 115.0.5790.170.

### Firefox

* Updated Mozilla Firefox browser to version 115.2.1

### Base system

* Fixed nss security issue CVE-2023-0767.  
* Fixed libxml2 security issues CVE-2023-29469, CVE-2023-28484, CVE-2022-40304
  and CVE-2022-40303.  
* Fixed wavpack security issue CVE-2021-44269.  
* Fixed tar security issue CVE-2022-48303.  
* Fixed python3.6 security issue CVE-2022-37454.  
* Fixed tiff security issues CVE-2023-0804, CVE-2023-0803, CVE-2023-0802,
  CVE-2023-0801, CVE-2023-0800, CVE-2023-0799, CVE-2023-0798, CVE-2023-0797,
  CVE-2023-0796 and CVE-2023-0795.  
* Fixed rsync security issue CVE-2022-29154.  
* Fixed vim security issues CVE-2022-2946, CVE-2022-2923, CVE-2022-2849,
  CVE-2022-2845, CVE-2022-2581, CVE-2022-2571, CVE-2022-2345, CVE-2022-2304,
  CVE-2022-2206, CVE-2022-2183, CVE-2022-2175, CVE-2022-2129, CVE-2022-2126,
  CVE-2022-2125, CVE-2022-2124, CVE-2022-1968, CVE-2022-1942, CVE-2022-1898,
  CVE-2022-1851, CVE-2022-1796, CVE-2022-1785, CVE-2022-1735, CVE-2022-1733,
  CVE-2022-1720, CVE-2022-1674, CVE-2022-1629, CVE-2022-0413, CVE-2023-1175,
  CVE-2023-1170, CVE-2023-0433, CVE-2023-0288, CVE-2023-0054, CVE-2023-0049 and
  CVE-2022-47024.  
* Fixed systemd security issues CVE-2022-4415 and CVE-2022-3821.  
* Fixed curl security issues CVE-2023-27538, CVE-2023-27537, CVE-2023-27536,
  CVE-2023-27535, CVE-2023-27534 and CVE-2023-27533.  
* Fixed xorg-server security issue CVE-2023-1393.  
* Fixed protobuf security issues CVE-2022-1941 and CVE-2021-22570.  
* Fixed python2.7 security issue CVE-2023-24329.  
* Fixed python3.6 security issue CVE-2023-24329.  
* Fixed libtpms security issues CVE-2023-1018 and CVE-2023-1017.  
* Fixed chromium-browser security issues CVE-2023-1534, CVE-2023-1533,
  CVE-2023-1532, CVE-2023-1531, CVE-2023-1530, CVE-2023-1529, CVE-2023-1528,
  CVE-2023-1236, CVE-2023-1235, CVE-2023-1234, CVE-2023-1233, CVE-2023-1232,
  CVE-2023-1231, CVE-2023-1230, CVE-2023-1229, CVE-2023-1228, CVE-2023-1227,
  CVE-2023-1226, CVE-2023-1225, CVE-2023-1224, CVE-2023-1223, CVE-2023-1222,
  CVE-2023-1221, CVE-2023-1220, CVE-2023-1219, CVE-2023-1218, CVE-2023-1217,
  CVE-2023-1216, CVE-2023-1215, CVE-2023-1214 and CVE-2023-1213.  
* Fixed sudo security issues CVE-2023-28487, CVE-2023-28486 and CVE-2023-2848.  
* Fixed vim security issues CVE-2022-2207, CVE-2022-0729, CVE-2022-0714,
  CVE-2022-0685, CVE-2022-0572, CVE-2022-0554, CVE-2022-0443, CVE-2022-0408,
  CVE-2022-0368, CVE-2022-0361, CVE-2022-0359, CVE-2022-0351, CVE-2022-0319,
  CVE-2022-0318, CVE-2022-0261, CVE-2022-0213, CVE-2021-4193 and CVE-2021-4192.  
* Fixed heimdal security issue CVE-2022-45142.  
* Fixed ghostscript security issue CVE-2023-28879.  
* Fixed dnsmasq security issue CVE-2023-28450.  
* Fixed zulu8-ca security issues CVE-2023-21930, CVE-2023-21937, CVE-2023-21938,
  CVE-2023-21939, CVE-2023-21954, CVE-2023-21967 and CVE-2023-21968.
* Updated Intel microcode to version 20230808.  
* Updated AMD microcode to version 20230809.
* Fixed libwebp security issue CVE-2023-4863 (initial only Chromium related) and
  CVE-2023-5129.
* Fixed libvpx security issue CVE-2023-5217.  
* Fixed libx11 security issues CVE-2023-43787, CVE-2023-43786 and
  CVE-2023-43785.  
* Fixed Chromium security issue CVE-2023-5217.  
* Fixed libxpm security issues CVE-2023-43789, CVE-2023-43788, CVE-2023-43787
  and CVE-2023-43786.  
* Fxied glibc security issue CVE-2023-4911.


Resolved Issues
--------------------------------------------------------------------------------


### Citrix

* Fixed: Situations where hardware decoder has not enough memory to handle
  certain video formats properly, are optimized / better handled now.
* Fixed: In rare situations (observed when using teams app sharing) intermixed
  video frames appear which come from different H.264 streams. These frames are
  now being separated from each other and will be decoded separately.  
* Added a new registry key to suppress such secondary frames entirely, as they
  render mostly duplicated content of the primary frames.

+------------+-----------------------------------------------------------------+
|Parameter   |`In case of mixed up H264 streams: Don't display frames from secondary streams` |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.hw-accelerated-h264-suppress-secondary-frames`              |
+------------+-----------------------------------------------------------------+
|Type        |bool                                                             |
+------------+-----------------------------------------------------------------+
|Value       |**enabled** (default) / disabled                                 |
+------------+-----------------------------------------------------------------+

* Fixed: Refresh/Redraw issues of Citrix session windows. Resuming from
  screensaver or uncovering a session window which was covered by another window
  works as expected now.
* Changed: Default for ica.module.audioredirectionv4=true due to connection
  problems with some VDI versions.
* Fixed: H.264 streams with multiple reference frames (as produced by hardware
  encoders) are supported properly and do not lead to a potential crash anymore.
* Fixed: In special situations certain frames did not show up on the screen when
  VDPAU was configured.
* Fixed MS Teams optimization (CWA 2307).

### AVD

* Changed the x264enc QP setting to do less aggressive video quantization to
  improve outgoing video quality in MS Teams.
* Fixed smartcard redirection in AVD client.
* Fixed crash when last audio device was removed.  
* Adaptive (average) MS-Teams video playback delay calculation and no key frame
  skipping on decoding to make playback more reliable.
* Changed: Raised net.core.wmem_max setting if AVD sessions are configured to
  avoid TCP connection resets being triggered by the Linux Kernel on large
  RdClientSDK data transfers.
* Fixed screenshare issue with direct MS Teams calls when screen share is
  already active.  
* Fixed potential client crash when virtual backgrounds are enabled in MS Teams.  
* Fixed stale video window content in MS Teams when video feeds are switched but
  incoming video is not directly decodable.  
* Changed quantization range for the x264enc to allow a little more quantization
  being applied to outgoing MS Teams video streams.  
* Fixed: Avoid large display delay of incoming MS Teams video streams by
  measuring NTP latency.
* Changed MS-Teams video scaling default to fill-frame, instead of fit-frame.
  Note that the related MS Teams settings are not redirected through the
  RdClientSDK, so it will always show in fill-frame mode in MS Teams.

### RDP/IGEL RDP Client 2

* Removed Multimedia Redirection for Windows Server2012r2 RDP Sessions.

### VMware Horizon

* Fixed: Horizon session starter cannot handle backslashes in password.

### Parallels Client

* Fixed an issue with multiple USB devices not being redirected correctly

### Network

* Added possibility to set a antenna bitmap to configure which antenna should be
  used (for iwlwifi devices)  
* Added new registry key to configure the antenna bitmap

+------------+-----------------------------------------------------------------+
| Parameter  | `Tx antenna bitmap`                                             |
+------------+-----------------------------------------------------------------+
| Registry   | `network.interfaces.wirelesslan.device0.antenna_bitmap_tx`      |
+------------+-----------------------------------------------------------------+
| Type       | string                                                          |
+------------+-----------------------------------------------------------------+
| Value      | empty **Default**                                               |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | `Rx antenna bitmap`                                             |
+------------+-----------------------------------------------------------------+
| Registry   | `network.interfaces.wirelesslan.device0.antenna_bitmap_rx`      |
+------------+-----------------------------------------------------------------+
| Type       | string                                                          |
+------------+-----------------------------------------------------------------+
| Value      | empty **Default**                                               |
+------------+-----------------------------------------------------------------+

* Improved behaviour of WWAN devices on suspend/resume

### WiFi

* Improved handling of WiFi network names with non-ASCII characters
* Added registry keys for restricting frequencies used by WPA Supplicant (see
  the WPA Supplicant documentation regarding the network-specific settings
  freq_list and scan_freq). In IGEL OS, the settings affect all configured
  WiFi´s - these may be useful to improve roaming behavior..

+------------+-----------------------------------------------------------------+
|Parameter   |`List of allowed frequencies`                                    |
+------------+-----------------------------------------------------------------+
|Registry    |`network.interfaces.wirelesslan.device0.freq_list`               |
+------------+-----------------------------------------------------------------+
|Type        |string                                                           |
+------------+-----------------------------------------------------------------+
|Value       |empty **Default**                                                |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
|Parameter   |`List of frequencies to scan`                                    |
+------------+-----------------------------------------------------------------+
|Registry    |`network.interfaces.wirelesslan.device0.scan_freq`               |
+------------+-----------------------------------------------------------------+
|Type        |string                                                           |
+------------+-----------------------------------------------------------------+
|Value       |empty **Default**                                                |
+------------+-----------------------------------------------------------------+


### CUPS Printing

* Fixed cups not starting properly

### Cisco Webex

* Fixed Webex Meetings VDI not connecting to enterprise site.

### Base system

* Fixed reconnect of Lenovo Docking Station TBT Gen 3.
* Added new registry key to set acpi= kernel cmdline options (some devices needs
  acpi=off).

+------------+-----------------------------------------------------------------+
| Parameter  | `Set ACPI kernel parameters.`                                   |
+------------+-----------------------------------------------------------------+
| Registry   | `system.kernel.bootparams.acpi`                                 |
+------------+-----------------------------------------------------------------+
| Range      | [No setting][Force][On][Off][Noirq][Strict][Rsdt][Copy_dsdt]    |
+------------+-----------------------------------------------------------------+
| Value      | **No setting**                                                  |
+------------+-----------------------------------------------------------------+

* Added new registry key to set reboot kernel cmdline which can be used if
  reboot or shutdown issues are present.

+------------+-----------------------------------------------------------------+
| Parameter  | `Set reboot kernel parameters.`                                 |
+------------+-----------------------------------------------------------------+
| Registry   | `system.kernel.bootparams.reboot`                               |
+------------+-----------------------------------------------------------------+
| Range      | [Default][Bios][Triple][Kbd][Acpi][Efi][Pci]                    |
+------------+-----------------------------------------------------------------+
| Value      | **Default**                                                     |
+------------+-----------------------------------------------------------------+

* Fixed ELO AccuTouch not picking up selection.
* Fixed reloading of license page in IGEL Setup Assistant.
* Added licensing information for Lenovo's FCC unlock tool.
* Changed to s2idle on HP mt440 G3 as it improves behavior.  
* Changed registry key for use mem sleep mode, depending on hardware

+------------+-----------------------------------------------------------------+
|Parameter   |`Set suspend mem sleep mode.`                                    |
+------------+-----------------------------------------------------------------+
|Registry    |`system.suspend.sleep_mode`                                      |
+------------+-----------------------------------------------------------------+
|Range       | [Default][Suspend to RAM][Suspend to idle]                      |
+------------+-----------------------------------------------------------------+
|Value       |**Default**                                                      |
+------------+-----------------------------------------------------------------+

* Fixed ELO multitouch configuration: No kernel module is needed anymore.
* Fixed handling of custom bootsplash and wallpaper download-url
* Fixed feature selection in OS Creator.
* Changed the default setting for the mirror mode to biggest common resolution
  (was Panning before)

+------------+-----------------------------------------------------------------+
| Parameter  | `Choose the mode which should be used for mirroring monitors if resolution differs.` |
+------------+-----------------------------------------------------------------+
| Registry   | `x.xserver%.mirror_mode`                                        |
+------------+-----------------------------------------------------------------+
| Range      | [Panning][Biggest common resolution][Scaling][Scaling down]     |
+------------+-----------------------------------------------------------------+
| Value      | **Biggest common resolution**                                   |
+------------+-----------------------------------------------------------------+

* Changed the handle_brightness_keys default to enabled as this setting is
  needed for most of the current laptops anyways.

+------------+-----------------------------------------------------------------+
| Parameter  | `Handle Brightness Keys`                                        |
+------------+-----------------------------------------------------------------+
| Registry   | `x.xserver%.handle_brightness_keys`                             |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | **enabled** (default) / disabled                                |
+------------+-----------------------------------------------------------------+

* Use new DP MST connector setup name handling as new default as this avoids
  issue with only one monitor could get configured. This may cause issues with
  already present display profiles so you may need to revert this but in most
  cases you will already have this key set.

+------------+-----------------------------------------------------------------+
| Parameter  | `Use new DP MST connector setup name handling.`                 |
+------------+-----------------------------------------------------------------+
| Registry   | `x.drm_daemon.use_new_dp_mst_handling`                          |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | **enabled** (default) / disabled                                |
+------------+-----------------------------------------------------------------+

* Fixed suspend / resume support on Lenovo L14 Intel Gen3 device.

### H264

* Fixed: H.264 streams with multiple reference frames (as produced by hardware
  encoders) are supported properly and do not lead to a potential crash anymore.
* Fixed: In special situations certain frames did not show up on the screen when
  VDPAU was configured.

### X11 system

* Changed default setting for DisplayLink Quirk which solves an issue with long
  startup times  
* Registry key parameter now defaults to true:

+------------+-----------------------------------------------------------------+
|Parameter   |`Quirk to fix issues with Xorg start take ages with DisplayLink connected.` |
+------------+-----------------------------------------------------------------+
|Registry    |`x.xserver%.quirks.displaylink_crash_workaround`                 |
+------------+-----------------------------------------------------------------+
|Type        |bool                                                             |
+------------+-----------------------------------------------------------------+
|Value       |**enabled** (default) / disabled                                 |
+------------+-----------------------------------------------------------------+

* Changed: Update of screen configuration after resume - to ensure changes while
  suspend are detected / effective.

### Audio

* Fixed: Sound preferences not getting saved over reboot.

### Misc

* Fixed autostart notification of sessions in case restart is also active.

### Hardware

* Fixed screen lagging issue with Dell Latitude 7430  
* Added possibility to configure Intel PSR setting via registry

+------------+-----------------------------------------------------------------+
|Parameter   |`Change settings for intel PSR (panel self refresh).`            |
+------------+-----------------------------------------------------------------+
|Registry    |`x.drivers.intel.psr`                                            |
+------------+-----------------------------------------------------------------+
|Range       | [Default][Disable][Enable][Use only up to PSR1][Use up to PSR2] |
+------------+-----------------------------------------------------------------+
|Value       |**Default**                                                      |
+------------+-----------------------------------------------------------------+

* Fixed immediate wakeup issue after shutdown on some HP mt645 G7.

### Remote Management

* Fixed submitting device states to the UMS.
* Fixed: Web console shadowing via ICG.
* Fixed submitting device's uptime and total usage over ICG.
```

-----

## 2023-10-12 - [11.08.466.DER](readme11.08.466.DER.txt)

```
The new PRIVATE BUILD 11.08.466.DER for IGEL Workspace is ready.

This build is based on 11.08.454.

These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------

### Citrix

* Integrated Citrix Workspace app 2309  
  Available workspace apps in this release: 23.09 (default), 23.07, and 20.10  
  New Features:
* Enhancement to multiple monitors [Technical Preview]

+------------+-----------------------------------------------------------------+
|Parameter   |`Multi Monitor enhancement`                                      |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.wfclient.wfclient.MultiMonitorPnPEnabled`                   |
+------------+-----------------------------------------------------------------+
|Value       |true / false (default)                                           |
+------------+-----------------------------------------------------------------+

* Support for 32-bit cursor  
* Copy and paste files and folders between two virtual desktops  
* Improved error messages

Resolved Issues
--------------------------------------------------------------------------------

### Citrix

* Fix MS Teams for Citrix Workspace App 2307 and higher
```

-----

## 2023-10-11 - [11.08.465](readme11.08.465.txt)

```
The new PRIVATE BUILD 11.08.465 for IGEL Workspace is ready.

This build is based on 11.08.454.

These are the release notes published with that release:

Known Issues
--------------------------------------------------------------------------------

### Citrix

* To launch multiple desktop sessions with Citrix HDX RTME and Citrix H.264  
  acceleration plugin, the following registry key needs to be enabled:

+------------+-----------------------------------------------------------------+
|Parameter   |`Activate workaround for dual RTME sessions and H264 acceleration` |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.workaround-dual-rtme`                                       |
+------------+-----------------------------------------------------------------+
|Range       |enabled / **disabled** (default)                                 |
+------------+-----------------------------------------------------------------+

* This workaround is not applicable when \\"Enable Secure ICA\\" is active for the  
  specific delivery group.
* Adding smartcard readers during running / active session does not work. The
  reader is visible, but cannot be used due to unknown reader status. Only
  relevant for CWA versions earlier than 2112.
* There are known issues with GStreamer 1.0 in combination with Citrix. These
  occure with multimedia redirection of H.264, MPEG1 and MPEG2. (GStreamer 1.0
  is used if browser content redirection is enabled active.)
* Browser Content Redirection (BCR) does not work if DRI3 and hardware
  accelerated H.264 deep compression codec is enabled.
* Citrix H.264 acceleration plugin does not work with **enabled** server policy
  \\"Optimize for 3D graphics workload\\" in combination with server policy \\"Use
  video codec compression\\" -> *\\"For the entire screen\\"**.
* Currently H.264 for Citrix sessions cannot be used in parallel with video
  input acceleration.
* While starting Self-Service, it is possible that process ServiceRecord
  segfaults -> Self-Service cannot be started afterwards.  
  A cache cleanup with reboot is needed. In addition, the following parameters
  should set to true.

+------------+-----------------------------------------------------------------+
|Parameter   |`Clean up UI cache after Self-Service termination`               |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.selfservice.cleanupwebui`                                   |
+------------+-----------------------------------------------------------------+
|Value       |**false** (default)/true                                         |
+------------+-----------------------------------------------------------------+
|Parameter   |`Clean up Store cache after Self-Service termination`            |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.selfservice.cleanupstore`                                   |
+------------+-----------------------------------------------------------------+
|Value       |**false** (default)/true                                         |
+------------+-----------------------------------------------------------------+

* Logoff of Self-Service causes a segfault with CWAL 2211 which ends the
  application. Restart of Self-Service is functional.
* Browser Content Redirection (BCR) may not work with Chrome version 105.0.* or
  later. See https://support.citrix.com/article/CTX473065/hdx-browser-content-
  redirection-broken-with-google-chrome-browser-version-105-or-higher
* White/ green fragments may appear during desktop launch if JPEG graphical
  codec is used.
* Under certain conditions, webcam redirection may not work.  
  If this is the case, GStreamer has to be set to version 1.0 via registry or by
  enabling Browser Content Redirection (BCR).

### OSC Installer

* OSC not deployable with IGEL Deployment Appliance: Version 11.3 or later is
  required for deploying IGEL OS 11.06. and following.

### AVD

* H.264 hardware decoding for MS-Teams optimization is currently limited to non-
  AMD devices due to stability issues on AMD devices.

### VMware Horizon

* After disconnect of an RDP-based session, the Horizon main window which
  contains the server or sessions overview, cannot be resized anymore.
* Copying text from Horizon Blast sessions is not possible.
* The on-screen keyboard in Horizon appliance mode does not work correctly with
  local logon.  
  It is necessary to switch off local logon and enable the following two keys
  via IGEL registry:  
  userinterface.softkeyboard.autoshow  
  userinterface.softkeyboard.autohide
* Zoom VDI Media Plugin versions below 5.8.0 make Horizon Client crash upon
  connection to the remote desktop when TCSetup is running at the same time.
* With usage of PCoIP protocol, the virtual channel provided by VMware used for
  serial port and scanner redirection could freeze on logout from remote
  session.  
  
  This happens only with enabled scanner or serial port redirection.  
  The freeze does not occur if both redirection methods are enabled or none of
  them. The Blast Protocol is not affected by this bug.  
  
  The respective settings can be found in the IGEL Registry:  
  vmware.view.enable-serial-port-redir  
  vmware.view.enable-scanner-redir
* Keyboard Input Source Language Synchronization works only with usage of local
  layout and deadkeys enabled.  
  If a keyboard layout is used which has deadkeys disabled (which is the default
  on IGEL OS), Horizon client falls back to en-US layout.
* PCoIP sessions may crash in some cases, switch to Blast Protocol is
  recommended then. H.264/HEVC encoding can be disabled when overall performance
  is too low.
* Client drive mapping and USB redirection for storage devices can be enabled at
  the same time, but this could lead to sporadic problems.  
  Horizon Client tracks the drives which are dynamically mounted and adds them
  to the remote session using client drive mapping, means USB redirection is not
  used for theses devices then.  
  However, in case of devices like USB SD card readers, Horizon does not map
  them as client drives but forcefully uses USB-redirection which results in an
  unclean unmount.  
  As a work-around, the IDs of these card readers can be added to IGEL USB
  access rules and denied.

### Parallels Client

* Attached storage devices appear as network drives in the remote session  
* USB device redirection is considered as experimental for the Parallels client
  for Linux

### Firefox

* With enabled Citrix Browser Content Redirection, Firefox has no H.264 and AAC
  multimedia codec support. Means, when codec support is needed in Firefox, BCR
  needs to be disabled. Citrix Browser Content Redirection is disabled by
  default.
* Multimedia playback in Firefox is unstable if GStreamer version 0.10 is
  active. The default GStreamer version for Firefox
  sessions.browser\\<inst>.gstreamer_version was set to 1.0.

### Network

* Wakeup from system suspend fails on DELL Latitude 5510
* If applications are configured to start after established network connection
  and network mounts are configured, spurious \\"Failed to start application\\"
  notifications may be shown. The applications still start.

### WiFi

* TP-Link Archer T2UH WiFi adapters does not work after system suspend/resume.
  Workaround: Disabling system suspend at IGEL Setup > System > Power Options >
  Shutdown.

### Cisco JVDI Client

* There may be a segfault shown in the logs (during logout of Citrix Desktop
  session). Occurs only when using Citrix Workspace App 2010 and Cisco JVDI.

### Base system

* Update from memory stick requires network online state (at least when multiple
  update stages are triggered / necessary)

### Conky

* The right screen when using multiscreen environment may not be shown
  correctly.  
  Workaround: The horizontal offset should be set to the width of the monitor
  (e.g. if the monitor has a width of 1920, the offset should be set to 1920)

### Firmware update

* On devices with 2 GB of flash storage it could happen that there is not enough
  space for updating all features. In this case, a corresponding error message
  occurs. Please visit [https://kb.igel.com/igelos-11.04/en/error-not-enough-
  space-on-local-drive-when-updating-to-igel-os-11-04-or-higher-32870765.html]
  for a possible solution and additional information.

### Appliance Mode

* When ending a Citrix session in browser appliance mode, the browser is
  restarted twice (instead of once).
* Appliance mode RHEV/Spice: spice-xpi firefox plugin is no longer supported.
  The \\"Console Invocation\\" has to allow 'Native' client (auto is also possible)
  and should be started in fullscreen to prevent any opening windows.
* Browser Appliance mode can fail when the Web URL contains special control
  characters like ampersand (& character).  
  Workaround: Add quotes at the beginning and the end of an affected URL. E.g.:  
  'https://www.google.com/search?q=aSearchTerm&source=lnms&tbm=isch'

### Audio

* IGEL UD2 (D220) fails to restore the volume level of the speaker when the
  device used firmware version 11.01.110 before.
* Audio jack detection on Advantec POC-W243L does not work. Therefore, sound
  output goes through a possibly connected headset and also the internal
  speakers.
* UD3-M340C: Sound preferences are showing Headphone & Microphone, although not
  connected.

### Multimedia

* Multimedia redirection with GStreamer could fail when using Nouveau GPU
  driver.

### Hardware

* Some newer Delock 62599 active DisplayPort to DVI (4k) adapters only work on
  INTEL-based devices.
* Wake up from suspend via UMS does not work on HP mt645 devices. Workaround:
  Disable system suspend and use shutdown instead.
* System suspend is not supported on Lenovo L14 Gen 3 Intel based device.
* Built-in fingerprint sensor is not supported on HP mt440 and mt645.
* Mac-Address Passthrough not supported on Lenovo USB-C Hybrid Docking Station.
* Wake on Lan via docking stations is not supported.

### Remote Management

* AIT feature with IGEL Starter License is only supported by UMS version
  6.05.100 or newer.
```

-----

## 2023-09-21 - [11.08.441](readme11.08.441.txt)

```
The new PRIVATE BUILD 11.08.441 for IGEL Workspace is ready.

This build is based on 11.08.440.

These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------

### Base system

* Added BIOS tools support for HP t430, t550, t655 and t740.  
* HP is responsible for the validation of the proper BIOS update and BIOS
  settings change functionality.
```

-----

## 2023-09-21 - [11.08.463](readme11.08.463.txt)

```
The new PRIVATE BUILD 11.08.463 for IGEL Workspace is ready.

This build is based on 11.08.440.

These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------

### AVD

* Includes AVD version 1.1.30  
* The MS-Teams secondary ringer feature currently requires the following
  setting: sessions.wvd%.options.cmd_ext = --webrtc-ring-all-devices
* Fixed crash when last audio device was removed.  
* Adaptive (average) MS-Teams video playback delay calculation and no key frame
  skipping on decoding to make playback more reliable.
* Raised net.core.wmem_max setting when AVD sessions are configured to avoid TCP
  connection resets being triggered by the Linux Kernel on large RdClientSDK
  data transfers.
* Potential black video issue fix in MS Teams optimization.  
* MS-Teams optimization shows video in fill-frame instead of fit-frame mode.
```

-----

## 2023-09-20 - [11.08.279](readme11.08.279.txt)

```
The new PRIVATE BUILD 11.08.279 for IGEL Workspace is ready.

This build is based on 11.08.230.

These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------

### Base system

* Added BIOS tools.  
* HP is responsible for the validation of the proper BIOS update and BIOS
  settings change functionality.
```

-----

## 2023-09-20 - [11.08.461](readme11.08.461.txt)

```
The new PRIVATE BUILD 11.08.461 for IGEL Workspace is ready.

This build is based on 11.08.440.

These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------

### Remote Management

* Added: Create log for support information if rmagent has been requested to
  release the device from UMS.  
* Retrieve the device's unit id in more robust way.  
* The log file is only accessible to root  
* Also log when the UMS autoconnection is established
```

-----

## 2023-09-18 - [11.08.388](readme11.08.388.txt)

```
The new PRIVATE BUILD 11.08.388 for IGEL Workspace is ready.

This build is based on 11.08.360.

These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------

### Base system

* Added libwebkit in a debug version.
```

-----

## 2023-09-13 - [11.08.458](readme11.08.458.txt)

```
The new PRIVATE BUILD 11.08.458 for IGEL Workspace is ready.

This build is based on 11.08.457.

These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------

### Remote Management

* Fixed submitting device states to the UMS.
```

-----

## 2023-09-11 - [11.08.457](readme11.08.457.txt)

```
The new PRIVATE BUILD 11.08.457 for IGEL Workspace is ready.

This build is based on 11.08.455.

These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------

### Citrix

* Updated Citrix Workspace App to version 2308.  
  Available Citrix Workspace Apps in this release: 2308 (default), 2307 and 2305
* New features:  
* HTTPS protocol support for proxy server

+------------+-----------------------------------------------------------------+
|Parameter   |`HTTPS protocol support for proxy server`                        |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.wfclient.hdxoverudp`                                        |
+------------+-----------------------------------------------------------------+
|Value       |true (default)/ false                                            |
+------------+-----------------------------------------------------------------+

* Note: Update \\"ica.wfclient.proxytype\\" = Secure, and \\"ica.wfclient.proxyhost\\"
  in the following format = \\<IP>:\\<PORT>. For example “192.168.101.37:6153”.  
* Enable Packet Loss Concealment to improve audio performance

+------------+-----------------------------------------------------------------+
|Parameter   |`Enable Packet Loss Concealment to Improve Audio Performance`    |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.module.PacketLossConcealmentEnabled`                        |
+------------+-----------------------------------------------------------------+
|Value       |false (default)/ true                                            |
+------------+-----------------------------------------------------------------+
* |Parameter|`proxy bypass list`|  
  |Registry|`ica.wfclient.proxybypasslist`|
* Policy tampering detection feature prevents the user from accessing the
  Virtual App or Desktop session if the App Protection anti-screen capture and
  anti-keylogging policies are tampered with. If policy tampering is detected.
```

-----

## 2023-09-08 - [11.08.455](readme11.08.455.txt)

```
The new PRIVATE BUILD 11.08.455 for IGEL Workspace is ready.

This build is based on 11.08.440.

These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------

### Citrix

* Updated Citrix Workspace App to version 2308.  
  Available Citrix Workspace Apps in this release: 2308 (default), 2307 and 2010
* New features:  
* HTTPS protocol support for proxy server

+------------+-----------------------------------------------------------------+
|Parameter   |`HTTPS protocol support for proxy server`                        |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.wfclient.hdxoverudp`                                        |
+------------+-----------------------------------------------------------------+
|Value       |false(default)/ true                                             |
+------------+-----------------------------------------------------------------+

* Note: Update \\"ica.wfclient.proxytype\\" = Secure, and \\"ica.wfclient.proxyhost\\"
  in the following format = \\<IP>:\\<PORT>. For example “192.168.101.37:6153”.
* Enable Packet Loss Concealment to improve audio performance

+------------+-----------------------------------------------------------------+
|Parameter   |`Enable Packet Loss Concealment to improve audio performance`    |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.module.PacketLossConcealmentEnabled`                        |
+------------+-----------------------------------------------------------------+
|Value       |false (default)/ true                                            |
+------------+-----------------------------------------------------------------+
* Policy tampering detection feature prevents the user from accessing the
  Virtual App or Desktop session if the App Protection anti-screen capture and
  anti-keylogging policies are tampered with. If policy tampering is detected.

### zoomvdi

* Integrated Zoom VDI: 5.15.2  
  Available Zoom client versions: 5.15.2 (default), 5.14.0, and 5.13.10
```

-----

## 2023-09-08 - [11.08.454](readme11.08.454.txt)

```
The new PRIVATE BUILD 11.08.454 for IGEL Workspace is ready.

This build is based on 11.08.440.

These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------

### Citrix

* Updated Citrix Workspace App to version 2308.  
  Available Citrix Workspace Apps in this release: 2308 (default), 2307 and 2010
* New features:  
* HTTPS protocol support for proxy server

+------------+-----------------------------------------------------------------+
|Parameter   |`HTTPS protocol support for proxy server`                        |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.wfclient.hdxoverudp`                                        |
+------------+-----------------------------------------------------------------+
|Value       |false(default)/ true                                             |
+------------+-----------------------------------------------------------------+

* Note: Update \\"ica.wfclient.proxytype\\" = Secure, and \\"ica.wfclient.proxyhost\\"
  in the following format = \\<IP>:\\<PORT>. For example “192.168.101.37:6153”.
* Enable Packet Loss Concealment to improve audio performance

+------------+-----------------------------------------------------------------+
|Parameter   |`Enable Packet Loss Concealment to improve audio performance`    |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.module.PacketLossConcealmentEnabled`                        |
+------------+-----------------------------------------------------------------+
|Value       |false (default)/ true                                            |
+------------+-----------------------------------------------------------------+

* Policy tampering detection feature prevents the user from accessing the
  Virtual App or Desktop session if the App Protection anti-screen capture and
  anti-keylogging policies are tampered with. If policy tampering is detected.

### Cisco JVDI Client

* Integrated Cisco JVDI 14.2.0

### Cisco Webex

* Integrated Cisco Webex VDI 43.8
```

-----

## 2023-09-07 - [11.08.453](readme11.08.453.txt)

```
The new PRIVATE BUILD 11.08.453 for IGEL Workspace is ready.

This build is based on 11.08.440.

These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------

### Remote Management

* web console shadowing is working again
```

-----

## 2023-09-06 - [11.08.451](readme11.08.451.txt)

```
The new PRIVATE BUILD 11.08.451 for IGEL Workspace is ready.

This build is based on 11.08.440.

These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------

### Firefox

* Updated Mozilla Firefox to version 115.2.0
```

-----

## 2023-09-04 - [11.08.449](readme11.08.449.txt)

```
The new PRIVATE BUILD 11.08.449 for IGEL Workspace is ready.

This build is based on 11.08.440.

These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------

### zoomvdi

* Integrated Zoom VDI plugin 5.15.2.23760  
  
  Available plugins in this release: 5.15.2.23760 (default), 5.14.10.23670 and
  5.14.10.23670
```

-----

## 2023-08-29 - [11.08.387](readme11.08.387.txt)

```
The new PRIVATE BUILD 11.08.387 for IGEL Workspace is ready.

This build is based on 11.08.384.

These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------

### AVD

* Potential black video issue fix in MS Teams optimization.  
* MS-Teams optimization shows video in fill-frame instead of fit-frame mode.

### Remote Management

* Added: Create log for support information if rmagent has been requested to
  release the device from UMS.  
* Retrieve the device's unit id in more robust way.  
* The log file is only accessible to root
```

-----

## 2023-08-24 - [11.08.348](readme11.08.348.txt)

```
The new PRIVATE BUILD 11.08.348 for IGEL Workspace is ready.

This build is based on 11.08.330.

These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------

### Base system

* Added BIOS tools support for HP t430.  
* HP is responsible for the validation of the proper BIOS update and BIOS
  settings change functionality.
```

-----

## 2023-08-24 - [11.08.445](readme11.08.445.txt)

```
The new PRIVATE BUILD 11.08.445 for IGEL Workspace is ready.

This build is based on 11.08.440.

These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------

### WiFi

* Added registry keys for restricting frequencies used by WPA Supplicant. See
  the WPA Supplicant documentation regarding the network-specific settings
  freq_list and scan_freq. In IGEL OS these settings globally affect all WLANs
  configured. They may be useful when roaming requirements are a challenge.

+------------+-----------------------------------------------------------------+
| Parameter  | `List of allowed frequencies`                                   |
+------------+-----------------------------------------------------------------+
| Registry   | `network.interfaces.wirelesslan.device0.freq_list`              |
+------------+-----------------------------------------------------------------+
| Type       | string                                                          |
+------------+-----------------------------------------------------------------+
| Value      | empty **Default**                                               |
+------------+-----------------------------------------------------------------+
+------------+-----------------------------------------------------------------+
| Parameter  | `List of frequencies to scan`                                   |
+------------+-----------------------------------------------------------------+
| Registry   | `network.interfaces.wirelesslan.device0.scan_freq`              |
+------------+-----------------------------------------------------------------+
| Type       | string                                                          |
+------------+-----------------------------------------------------------------+
| Value      | empty **Default**                                               |
+------------+-----------------------------------------------------------------+
```

-----

## 2023-08-21 - [11.08.443](readme11.08.443.txt)

```
The new PRIVATE BUILD 11.08.443 for IGEL Workspace is ready.

This build is based on 11.08.440.

These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------

### Citrix

* Fixed Issue: Can't start more than one Citrix session from Firefox with hybrid
  launch config.  
  
Available Citrix workspace apps in this release:  23.02.0.10, 23.05.0.58, and
  23.07.0.17  
  
Available Plugins in this release:  
  
WebEx Teams Plugin: 43.4.0.25788  
  
WebEx Meetings Plugins: 42.10.8.14, 43.2.1.18, and 43.6.0.158  
  
Zoom Plugins: 5.10.6.21295, 5.12.1.21950, and 5.14.10.23670
```

-----

## 2023-08-21 - [11.08.442](readme11.08.442.txt)

```
The new PRIVATE BUILD 11.08.442 for IGEL Workspace is ready.

This build is based on 11.08.440.

These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------

### Cisco JVDI Client

* Integrated Cisco JVDI 14.1.4
```

-----

## 2023-08-16 - [11.08.440](readme11.08.440.txt)

```
The new PUBLIC BUILD 11.08.440 for IGEL Workspace is ready.

This build is based on 11.08.360.

These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------

### Citrix

* Updated Citrix Workspace App to version 2307.  
  Available Citrix Workspace Apps in this release: 2307 (default), 2305 and 2010
* Added support for playing short tones in optimized Microsoft Teams - requires
  update to the latest version of Microsoft Teams.
* Changes with Citrix Workspace App 2305 and 2307:  
  New features:  
* Copy and paste files and folders between two virtual desktops [Technical
  Preview]

+------------+-----------------------------------------------------------------+
|Parameter   |`Copy and paste files and folders between two virtual desktops`  |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.module.vdgdt`                                               |
+------------+-----------------------------------------------------------------+
|Value       |true(default)/ false                                             |
+------------+-----------------------------------------------------------------+

* Enhancement on 32-bit cursor support [Technical Preview]

+------------+-----------------------------------------------------------------+
|Parameter   |`Enhancement on 32-bit cursor support`                           |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.wfclient.Cursor32bitSupport`                                |
+------------+-----------------------------------------------------------------+
|Value       |true(default)/ false                                             |
+------------+-----------------------------------------------------------------+

* Change the default browser for FIDO2

+------------+-----------------------------------------------------------------+
|Parameter   |`Change the default browser for FIDO2`                           |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.authman.fido2authbrowser`                                   |
+------------+-----------------------------------------------------------------+
|Value       |CEB (default), chromium, firefox, chromium-browser               |
+------------+-----------------------------------------------------------------+

* Support for authentication using FIDO2 when connecting to on-premises stores
  [Technical Preview]

+------------+-----------------------------------------------------------------+
|Parameter   |`Support for authentication using FIDO2 when connecting to on-premises stores` |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.authman.fido2enabled`                                       |
+------------+-----------------------------------------------------------------+
|Value       |false (default)/ true                                            |
+------------+-----------------------------------------------------------------+

* Fixed:  

* App Protection works with all the Citrix session types including Firefox
  browser. Reboot of system after enabling/disabling the feature
  (ica.appprotection) is required.

### AVD

* Added WebRTC h264 encoder preset option:

+------------+-----------------------------------------------------------------+
| Registry   | `sessions.wvd%.options.webrtcencoderpreset`                     |
+------------+-----------------------------------------------------------------+
| Value      | none / ultrafast / superfast / veryfast / faster / fast / **medium** (default) / slow / slower / veryslow / placebo |
+------------+-----------------------------------------------------------------+

* Added initial secondary ringer support. But since the RdClientSDK support for
  it currently is non-functional (the sinkId does not change on the related MS-
  Teams setting), we added a command line option "--webrtc-ring-all-devices" and
  have set that as default in the cmd_ext setting. This makes MS-Teams ring on
  all audio output devices. This default setting will be removed as soon as the
  RdClientSDK implementation works as expected!
* Added clock to appbar - enable via System > Registry >
  sessions.wvd%.options.cmd_ext = -a  
* If appbar is enabled, the workarea of the session is reduced accordingly  
* The appbar is always visible now

### VMware Horizon

* Updated Horizon client to version 2306-8.10.0-21964631

+------------+-----------------------------------------------------------------+
| Parameter  | `Open local files in published applications`                    |
+------------+-----------------------------------------------------------------+
| Registry   | `vmware.view.enable-file-association`                           |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | **enabled** (default) / disabled                                |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | `Auto-connect to remote desktop or published app in case there's only one of them` |
+------------+-----------------------------------------------------------------+
| Registry   | `vmware.view.single-auto-connect`                               |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | enabled / **disabled** (default)                                |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | `Automatically connect to the desktop if there is only one or connect to the one which name is given` |
+------------+-----------------------------------------------------------------+
| Registry   | `vmware.view.auto-connect-desktop`                              |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | enabled / **disabled** (default)                                |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | `Automatically connect to this server when starting the client` |
+------------+-----------------------------------------------------------------+
| Registry   | `vmware.view.auto-connect-broker`                               |
+------------+-----------------------------------------------------------------+
| Type       | string                                                          |
+------------+-----------------------------------------------------------------+
| Value      | empty **Default**                                               |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | `Client behavior when all Sessions have been disconnected`      |
+------------+-----------------------------------------------------------------+
| Registry   | `vmware.view.all-sessions-disconnected-behavior`                |
+------------+-----------------------------------------------------------------+
| Range      | [Unconfigured][Quit client][Logoff from server]                 |
|            | [Keep current state]                                            |
+------------+-----------------------------------------------------------------+
| Value      | **Unconfigured**                                                |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | `Disconnect empty App session automatically`                    |
+------------+-----------------------------------------------------------------+
| Registry   | `vmware.view.auto-disconnect-empty-app-session`                 |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | **enabled** (default) / disabled                                |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | `Maximum count of core dump files allowed`                      |
+------------+-----------------------------------------------------------------+
| Registry   | `vmware.view.maxcoredumps`                                      |
+------------+-----------------------------------------------------------------+
| Type       | integer                                                         |
+------------+-----------------------------------------------------------------+
| Value      | 0 **Default**                                                   |
+------------+-----------------------------------------------------------------+

### Network

* Added MAC-address passthrough among Ethernet devices. With the following
  registry key a LAN device can be specified from which the MAC address shall be
  adopted. The donor device and any conflicting receiver device will be removed
  (by unbinding the driver) as long as the receiving device is present.

+------------+-----------------------------------------------------------------+
|Parameter   |`MAC address source`                                             |
+------------+-----------------------------------------------------------------+
|Registry    |`network.interfaces.ethernet.device%.mac_source`                 |
+------------+-----------------------------------------------------------------+
|Range       | [none][LAN][LAN2][LAN3][LAN4]                                   |
+------------+-----------------------------------------------------------------+
|Value       |**none**                                                         |
+------------+-----------------------------------------------------------------+

* Example: If LAN2 and LAN3 are configurations for docking stations that shall
  adopt the MAC address from LAN, the following two parameters must be set to
  "LAN":  
  network.interfaces.ethernet.device1.mac_source  
  network.interfaces.ethernet.device2.mac_source  
  Warning: Misconfiguration may result in loss of connectivity
* Added Lenovo FCC unlock tool for Quectel EM05

### Open VPN

* Updated cipher configuration of Open VPN. Now it is possible to specify the
  data-ciphers list. By default the default cipher list
  AES-256-GCM:AES-128-GCM:CHACHA20-POLY1305 is active. Otherwise a custom list
  can be specified in the Data ciphers parameter. Enter the ciphers separated
  with ':'. The existing parameter 'Cipher' was renamed to 'Cipher (legacy
  parameter)' and now has a new value 'unset' in range, which means that the
  parameter cipher will be omitted in the configuration.

+------------+-----------------------------------------------------------------+
|Setup       |`Network > VPN > Open VPN > Connection > Options`                |
+------------+-----------------------------------------------------------------+
|Parameter   |`Use default data cipher list`                                   |
+------------+-----------------------------------------------------------------+
|Registry    |`sessions.openvpn%.vpnopts.use_default_cipher_list`              |
+------------+-----------------------------------------------------------------+
|Value       |**on** / off                                                     |
+------------+-----------------------------------------------------------------+
|Setup       |`Network > VPN > Open VPN > Connection > Options`                |
+------------+-----------------------------------------------------------------+
|Parameter   |`Data ciphers`                                                   |
+------------+-----------------------------------------------------------------+
|Registry    |`sessions.openvpn%.vpnopts.data_ciphers`                         |
+------------+-----------------------------------------------------------------+
|Value       |empty **Default**                                                |
+------------+-----------------------------------------------------------------+

### OpenConnect VPN

* Added further supported protocols for OpenConnect VPN client by adding
  Fortinet, F5 and Array. OpenConnect VPN is a feature with limited support, and
  the new protocols are not validated by IGEL.

+------------+-----------------------------------------------------------------+
|Setup       |Network>VPN>OpenConnect VPN>Name>Session                         |
+------------+-----------------------------------------------------------------+
|Parameter   |`Protocol`                                                       |
+------------+-----------------------------------------------------------------+
|Registry    |`sessions.openconnect<INST>.vpnopts.protocol`                    |
+------------+-----------------------------------------------------------------+
|Value       |{**}anyconnect{**}/nc/pulse/gp/f5/fortinet/array                 |
+------------+-----------------------------------------------------------------+

### Imprivata

* Added 'IGEL Agent for Imprivata'. This requires an addon license (request via
  [https://www.igel.com/imprivata-agent/]).

### CUPS Printing

* Updated PrinterLogic PrinterInstallerClient to version 25.1.0.637  
  Fixes the determination of the AD user when Kerberos login is used.

### Cisco Webex

* Updated Cisco Webex Meetings VDI plugin to version 43.6.0.158  
** Available versions: 42.6.11.6, 42.10.8.14, 43.6.0.158
* Updated Cisco Webex VDI plugin to version 43.6.0.26643

### Base system

* Added some additional resolutions to the webcam virtual background solution
  (see changed registry keys).  
* Enables to choose webcams for virtual background by device name and priority.  
* Added new registry keys:

+------------+-----------------------------------------------------------------+
| Parameter  | `Select webcam by devicename for example /dev/video0 or video0 (only valid if choose by devicename is used)` |
+------------+-----------------------------------------------------------------+
| Registry   | `multimedia.webcam.virtual_background.webcam_device`            |
+------------+-----------------------------------------------------------------+
| Type       | string                                                          |
+------------+-----------------------------------------------------------------+
| Value      | empty **Default**                                               |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | `Select webcam by priority list for example dev=video0;name=HD_Webcam_C270 (only valid if choose by priority is used)` |
+------------+-----------------------------------------------------------------+
| Registry   | `multimedia.webcam.virtual_background.webcam_priority`          |
+------------+-----------------------------------------------------------------+
| Type       | string                                                          |
+------------+-----------------------------------------------------------------+
| Value      | empty **Default**                                               |
+------------+-----------------------------------------------------------------+

* Changed registry keys

+------------+-----------------------------------------------------------------+
| Parameter  | `Select how the webcam to use should be choosen.`               |
+------------+-----------------------------------------------------------------+
| Registry   | `multimedia.webcam.virtual_background.choose_webcam_by`         |
+------------+-----------------------------------------------------------------+
| Range      | [Use first webcam][Choose by name]                              |
|            | [Choose by vendor_id:product_id][Choose by number]              |
|            | [Choose by devicename][Choose by priority]                      |
+------------+-----------------------------------------------------------------+
| Value      | **Use first webcam**                                            |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | `Select resolution to use.`                                     |
+------------+-----------------------------------------------------------------+
| Registry   | `multimedia.webcam.virtual_background.resolution`               |
+------------+-----------------------------------------------------------------+
| Range      | [webcam default][webcam max][1920x1080][1280x720][640x480]      |
|            | [480x360][424x240][320x240][320x180]                            |
+------------+-----------------------------------------------------------------+
| Value      | **webcam default**                                              |
+------------+-----------------------------------------------------------------+

* Enabled Wifi Manager, Multi Monitor configuration and Display Switch to be
  fully functional also when endpoint is unlicensed.

### Driver

* Updated Olympus driver for dictation to version 4.0.4.
* Updated Philips Speech driver to version 13.2.3. Update fixes a minor bug in
  the Linux drivers which possibly caused unexpected error messages in some
  target software products. Furthermore, driver supports usage of PulseAudio
  (contrary to ALSA) audio interface. To be enabled via following registry
  parameter:

+------------+-----------------------------------------------------------------+
|Parameter   |`Use PulseAudio`                                                 |
+------------+-----------------------------------------------------------------+
|Registry    |`devices.philipsspeech.use_pulseaudio`                           |
+------------+-----------------------------------------------------------------+
|Type        |bool                                                             |
+------------+-----------------------------------------------------------------+
|Value       |enabled / **disabled** (default)                                 |
+------------+-----------------------------------------------------------------+

### zoomvdi

* Updated ZoomVDI to version 5.14.10.23670. Available versions: 5.14.10.23670
  (default), 5.13.10.23090 and 5.12.6.22200.

### Hardware

* Added hardware support for the Lenovo USB-C Universal Docking.
* Added hardware support for Lenovo L14 (AMD) Gen 4
* Added hardware support for Lenovo L15 (AMD) Gen 4.
* Added hardware support for HP Pro mt440 G3 (excluding WWAN support).

### Remote Management

* Added: Transfer devices serial number to UMS on first boot of device.

### Fabulatech

* Updated FabulaTech USB for Remote Desktop to version 6.1.3.1.
* Updated FabulaTech Plugins to version 3.10.1.5.
* Updated FabulaTech Scanner for Remote Desktop to version 3.3.0.2.
* Updated FabulaTech Webcam for Remote Desktop to version 2.8.11.

Security Fixes
--------------------------------------------------------------------------------

### IBM_5250

* Updated IBM iAccess Client Solutions to version 1.1.9.2. Complete changelog
  via [https://www.ibm.com/support/pages/ibm-i-access-acs-updates]

### Chromium

* Updated Chromium browser to version 114 (for fixing CVE-2023-3079).

### Firefox

* Updated Mozilla Firefox to version 102.13.0 ESR:  
* Fixes for mfsa2023-23, also known as: CVE-2023-37201, CVE-2023-37202,
  CVE-2023-37207, CVE-2023-37208, CVE-2023-37211.  
* Fixes for mfsa2023-19, also known as: CVE-2023-34414, CVE-2023-34416.  
* Fixes for mfsa2023-17, also known as: CVE-2023-32205, CVE-2023-32206,
  CVE-2023-32207, CVE-2023-32211, CVE-2023-32212, CVE-2023-32213,
  CVE-2023-32215.

### Base system

* Fixed cups security issue CVE-2023-32324.  
* Fixed libx11 security issue CVE-2023-3138.  
* Fixed libxml2 security issue CVE-2022-2309.  
* Fixed openssh security issue CVE-2023-28531.  
* Fixed dmidecode security issue CVE-2023-30630.  
* Fixed opensc security issue CVE-2023-2977.  
* Fixed texlive-bin security issue CVE-2023-32700.  
* Fixed ncurses security issues CVE-2023-29491, CVE-2022-29458, CVE-2021-39537,
  CVE-2019-17595 and CVE-2019-17594.  
* Fixed perl security issue CVE-2023-31484.  
* Fixed openssl1.0 security issue CVE-2023-2650.  
* Fixed openssl security issue CVE-2023-2650.  
* Fixed libuv1 security issue CVE-2021-22918.  
* Fixed zulu8-ca security issues CVE-2023-22049, CVE-2023-22043 and
  CVE-2023-22045.  
* Fixed openssh security issue CVE-2023-38408.  
* Fixed qemu security issues CVE-2023-2861, CVE-2023-1544, CVE-2023-0330 and
  CVE-2022-1050.

Resolved Issues
--------------------------------------------------------------------------------

### Citrix

* Fixed: Situations where hardware decoder has not enough memory to handle
  certain video formats properly, are optimized / better handled now.
* Fixed: In rare situations (observed when using teams app sharing) intermixed
  video frames appear which come from different H.264 streams. These frames are
  now being separated from each other and will be decoded separately.  
* Added a new registry key to suppress such secondary frames entirely, as they
  render mostly duplicated content of the primary frames.

+------------+-----------------------------------------------------------------+
|Parameter   |`In case of mixed up H264 streams: Don't display frames from secondary streams` |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.hw-accelerated-h264-suppress-secondary-frames`              |
+------------+-----------------------------------------------------------------+
|Type        |bool                                                             |
+------------+-----------------------------------------------------------------+
|Value       |**enabled** (default) / disabled                                 |
+------------+-----------------------------------------------------------------+

* Fixed: Refresh/Redraw issues of Citrix session windows. Resuming from
  screensaver or uncovering a session window which was covered by another window
  works as expected now.
* Fixed dynamic e911 feature.
* Added registry key ica.chrome-double-download to control flock feature at
  wfica_wrapper. 'Enable flock' blocks double app starts (due to double
  downloads by Chromium browser).

+------------+-----------------------------------------------------------------+
|Parameter   |`Control download mechanic for Citrix applications for Chrome web access` |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.chrome-double-download`                                     |
+------------+-----------------------------------------------------------------+
|Range       | [Enable Lock][Disable Lock]                                     |
+------------+-----------------------------------------------------------------+
|Value       |enable / **disable** (default)                                   |
+------------+-----------------------------------------------------------------+

* Fixed: Web-based Citrix Cloud authentication pages.
* Changed: Default for ica.module.audioredirectionv4=true due to connection
  problems with some VDI versions.
* Fixed: H.264 streams with multiple reference frames (as produced by hardware
  encoders) are supported properly and do not lead to a potential crash anymore.
* Fixed: In special situations certain frames did not show up on the screen when
  VDPAU was configured.

### AVD

* Improved: MS Teams video quality optimizations applied.
* Fixed broken appbar - which can be enabled with System > Registry >
  sessions.wvd%.options.cmd_ext = -a
* Changed the x264enc QP setting to do less aggressive video quantization to
  improve outgoing video quality in MS Teams.
* Fixed autostartsingle registry option.
* Fixed screenshare issue with direct MS Teams calls when a screenshare is
  already active.  
* Fixed potential client crash when virtual backgrounds are enabled in MS Teams.  
* Fixed stale video window content in MS Teams when video feeds are switched but
  incoming video is not directly decodable.  
* Adjusted the quantization range for the x264enc to allow a little more
  quantization being applied to outgoing MS Teams video streams.  
* Fixed: Avoid large display delay of incoming MS Teams video streams by
  measuring NTP latency.

### RDP/IGEL RDP Client 2

* Fixed RDP timezone redirection not working for some locations.
* Fixed fullscreen RDP session not starting with no monitor connected.

### VMware Horizon

* Fixed: Horizon session starter cannot handle backslashes in password.

### Chromium

* Added registry key to toggle prompt to accept downloads:

+------------+-----------------------------------------------------------------+
| Parameter  | `Enable IGEL Download Dialog`                                   |
+------------+-----------------------------------------------------------------+
| Registry   | `chromiumglobal.app.enable_download_dialog`                     |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | **enabled** (default) / disabled                                |
+------------+-----------------------------------------------------------------+

### Network

* Fixed network configuration on HyperV
* Added possibility to set a antenna bitmap to configure which antenna should be
  used (for iwlwifi devices)  
* Added new registry key to configure the antenna bitmap

+------------+-----------------------------------------------------------------+
| Parameter  | `Tx antenna bitmap`                                             |
+------------+-----------------------------------------------------------------+
| Registry   | `network.interfaces.wirelesslan.device0.antenna_bitmap_tx`      |
+------------+-----------------------------------------------------------------+
| Type       | string                                                          |
+------------+-----------------------------------------------------------------+
| Value      | empty **Default**                                               |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | `Rx antenna bitmap`                                             |
+------------+-----------------------------------------------------------------+
| Registry   | `network.interfaces.wirelesslan.device0.antenna_bitmap_rx`      |
+------------+-----------------------------------------------------------------+
| Type       | string                                                          |
+------------+-----------------------------------------------------------------+
| Value      | empty **Default**                                               |
+------------+-----------------------------------------------------------------+

* Improved behaviour of WWAN devices on suspend/resume
* Fixed setting credentials for system wide proxy.

### Cisco Webex

* Renamed libstdc++.so.6, Webex Meetings client expects the highest version of
  libstdc++.so.6

### Base system

* Added new registry key to set acpi= kernel cmdline options (some devices needs
  acpi=off).

+------------+-----------------------------------------------------------------+
| Parameter  | `Set ACPI kernel parameters.`                                   |
+------------+-----------------------------------------------------------------+
| Registry   | `system.kernel.bootparams.acpi`                                 |
+------------+-----------------------------------------------------------------+
| Range      | [No setting][Force][On][Off][Noirq][Strict][Rsdt][Copy_dsdt]    |
+------------+-----------------------------------------------------------------+
| Value      | **No setting**                                                  |
+------------+-----------------------------------------------------------------+

* Added new registry key to set reboot kernel cmdline which can be used if
  reboot or shutdown issues are present.

+------------+-----------------------------------------------------------------+
| Parameter  | `Set reboot kernel parameters.`                                 |
+------------+-----------------------------------------------------------------+
| Registry   | `system.kernel.bootparams.reboot`                               |
+------------+-----------------------------------------------------------------+
| Range      | [Default][Bios][Triple][Kbd][Acpi][Efi][Pci]                    |
+------------+-----------------------------------------------------------------+
| Value      | **Default**                                                     |
+------------+-----------------------------------------------------------------+

* Fixed issue with ELO AccuTouch not picking up selection.
* Changed the handle_brightness_keys default to enabled as this setting is
  needed for most of the current laptops anyways.

+------------+-----------------------------------------------------------------+
| Parameter  | `Handle Brightness Keys`                                        |
+------------+-----------------------------------------------------------------+
| Registry   | `x.xserver%.handle_brightness_keys`                             |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | **enabled** (default) / disabled                                |
+------------+-----------------------------------------------------------------+

* Fixed instability in handling of certain webcam devices, e.g. Meeting Owl 3.
* Added licensing information for Lenovo's FCC unlock tool.
* Use s2idle on HP mt440 G3 as it works better  
* Changed registry key to be able to use mem sleep mode depending on hardware

+------------+-----------------------------------------------------------------+
| Parameter  | `Set suspend mem sleep mode.`                                   |
+------------+-----------------------------------------------------------------+
| Registry   | `system.suspend.sleep_mode`                                     |
+------------+-----------------------------------------------------------------+
| Range      | [Default][Suspend to RAM][Suspend to idle]                      |
+------------+-----------------------------------------------------------------+
| Value      | **Default**                                                     |
+------------+-----------------------------------------------------------------+

### H264

* Fixed: H.264 streams with multiple reference frames (as produced by hardware
  encoders) are supported properly and do not lead to a potential crash anymore.
* Fixed: In special situations certain frames did not show up on the screen when
  VDPAU was configured.

### X11 system

* Changed default setting for DisplayLink Quirk which solves a issue with long
  startup times  
* Registry key parameter now defaults to true:

+------------+-----------------------------------------------------------------+
| Parameter  | `Quirk to fix issues with Xorg start take ages with DisplayLink connected.` |
+------------+-----------------------------------------------------------------+
| Registry   | `x.xserver%.quirks.displaylink_crash_workaround`                |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | **enabled** (default) / disabled                                |
+------------+-----------------------------------------------------------------+

### Audio

* Fixed: Sound preferences not getting saved over reboot.

### Remote Management

* Added: Create log for support information if rmagent has been requested to
  release the device from UMS.  
* Retrieve the device's unit id in more robust way.  
* The log file is only accessible to root
```

-----

## 2023-08-14 - [11.08.385](readme11.08.385.txt)

```
The new PRIVATE BUILD 11.08.385 for IGEL Workspace is ready.

This build is based on 11.08.381.

These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------

### Remote Management

* Create a log for device's support information if the rmagent has been
  requested to release the device from UMS.  
* Retrieve the device's unit id in more robust way.  
* The log file is only accessible to root
```

-----

## 2023-08-14 - [11.08.384](readme11.08.384.txt)

```
The new PRIVATE BUILD 11.08.384 for IGEL Workspace is ready.

This build is based on 11.08.382.

These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------

### AVD

* Fixed crash when last audio device was removed.  
* Adaptive (average) MS-Teams video playback delay calculation and no key frame
  skipping on decoding to make playback more reliable.
* Raised net.core.wmem_max setting when AVD sessions are configured to avoid TCP
  connection resets being triggered by the Linux Kernel on large RdClientSDK
  data transfers.
```

-----

## 2023-08-04 - [11.08.347](readme11.08.347.txt)

```
The new PRIVATE BUILD 11.08.347 for IGEL Workspace is ready.

This build is based on 11.08.330.

These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------

### Remote Management

* The network events dhcp4-change and dhcp6-change check whether the IP address
  has been changed. If no change has been made, the configuration is not
  transferred to the UMS.
```

-----

## 2023-08-04 - [11.08.382](readme11.08.382.txt)

```
The new PRIVATE BUILD 11.08.382 for IGEL Workspace is ready.

This build is based on 11.08.360.

These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------

### AVD

* Fixed screenshare issue with direct MS-Teams calls when a screenshare is
  already active.  
* Fixed potential client crash when virtual backgrounds are enabled in MS-Teams.  
* Fixed stale video window content in MS-Teams when video feeds are switched but
  incoming video is not directly decodable.  
* Adjusted the quantization range for the x264enc to allow a little more
  quantization being applied to outgoing MS-Teams video streams.  
* Avoid large display delay of incoming MS-Teams video streams by measuring NTP
  latency.
```

-----

## 2023-08-02 - [11.08.381](readme11.08.381.txt)

```
The new PRIVATE BUILD 11.08.381 for IGEL Workspace is ready.

This build is based on 11.08.360.

These are the release notes published with that release:

Known Issues
--------------------------------------------------------------------------------

### Citrix

* To launch multiple desktop sessions with Citrix HDX RTME and Citrix H.264  
  acceleration plugin, the following registry key needs to be enabled:

+------------+-----------------------------------------------------------------+
|Parameter   |`Activate workaround for dual RTME sessions and H264 acceleration` |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.workaround-dual-rtme`                                       |
+------------+-----------------------------------------------------------------+
|Range       |enabled / **disabled** (default)                                 |
+------------+-----------------------------------------------------------------+

* This workaround is not applicable when \\"Enable Secure ICA\\" is active for the  
  specific delivery group.
* Adding smartcard readers during running / active session does not work. The
  reader is visible, but cannot be used due to unknown reader status. Only
  relevant for CWA versions earlier than 2112.
* There are known issues with GStreamer 1.0 in combination with Citrix. These
  occure with multimedia redirection of H.264, MPEG1 and MPEG2. (GStreamer 1.0
  is used if browser content redirection is enabled active.)
* Browser Content Redirection (BCR) does not work if DRI3 and hardware
  accelerated H.264 deep compression codec is enabled.
* Enabled DRI3 on an AMD GPU with enabled Citrix H.264 acceleration could lead
  to a freeze. Selective H.264 mode (API v2) is not affected from this issue.  
* Citrix H.264 acceleration plugin does not work with **enabled** server policy
  \\"Optimize for 3D graphics workload\\" in combination with server policy \\"Use
  video codec compression\\" -> *\\"For the entire screen\\"**.
* Currently H.264 for Citrix sessions cannot be used in parallel with video
  input acceleration.
* While starting Self-Service, it is possible that process ServiceRecord
  segfaults -> Self-Service cannot be started afterwards.  
  A cache cleanup with reboot is needed. In addition, the following parameters
  should set to true.

+------------+-----------------------------------------------------------------+
|Parameter   |`Clean up UI cache after Self-Service termination`               |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.selfservice.cleanupwebui`                                   |
+------------+-----------------------------------------------------------------+
|Value       |**false** (default)/true                                         |
+------------+-----------------------------------------------------------------+
|Parameter   |`Clean up Store cache after Self-Service termination`            |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.selfservice.cleanupstore`                                   |
+------------+-----------------------------------------------------------------+
|Value       |**false** (default)/true                                         |
+------------+-----------------------------------------------------------------+

* Logoff of Self-Service causes a segfault with CWAL 2211 which ends the
  application. Restart of Self-Service is functional.
* Browser Content Redirection (BCR) may not work with Chrome version 105.0.* or
  later
* White/ green fragments may appear during desktop launch if JPEG graphical
  codec is used.
-There may be problems with webcam redirection at Citrix. To fix the problem
  Gstreamer 1.0 must be enabled, this can be done either via the registry for
  the session or by enabling the browser content redirection.-  
  Under certain conditions, webcam redirection may not work.  
  If this is the case, GStreamer has to be set to version 1.0 via registry or by
  enabling Browser Content Redirection (BCR).

### OSC Installer

* OSC not deployable with IGEL Deployment Appliance: Version 11.3 or later is
  required for deploying IGEL OS 11.06. and following.

### AVD

* AVD MS-Teams optimization can crash the AVD client if H264 software decoder is
  used (fluh264dec). AVD prefers the hardware decoders (fluvadec) but when there
  are no hardware decoders or when all hardware decoders are in use already, the
  software decoder is utilized which may randomly crash the AVD client. It is
  likely when it crashes in a certain MS-Teams call, it might crash quite soon
  again when rejoining the same call. A fix for that is in development. A
  workaround is to disable incoming video in such MS-Teams calls, which is an
  option in the \\"...\\" menu from the control bar during an active call.
* H.264 hardware decoding for MS-Teams optimization is currently limited to non-
  AMD devices due to stability issues on AMD devices.
* Scanning images within AVD session (with usage of FabulaTech Scanner
  Redirection) might fail and cause a reconnection if the compression level is
  set to high quality.  
  As a workaround the compression level must be reduced.

### VMware Horizon

* After disconnect of an RDP-based session, the Horizon main window which
  contains the server or sessions overview, cannot be resized anymore.
* Copying text from Horizon Blast sessions is not possible.
* The on-screen keyboard in Horizon appliance mode does not work correctly with
  local logon.  
  It is necessary to switch off local logon and enable the following two keys
  via IGEL registry:  

  userinterface.softkeyboard.autoshow  
  userinterface.softkeyboard.autohide

* Zoom VDI Media Plugin versions below 5.8.0 make Horizon Client crash upon
  connection to the remote desktop when TCSetup is running at the same time.
* With usage of PCoIP protocol, the virtual channel provided by VMware used for
  serial port and scanner redirection could freeze on logout from remote
  session.  
  
  This happens only with enabled scanner or serial port redirection.  
  The freeze does not occur if both redirection methods are enabled or none of
  them. The Blast Protocol is not affected by this bug.  
  
  The respective settings can be found in the IGEL Registry:  

  vmware.view.enable-serial-port-redir  
  vmware.view.enable-scanner-redir

* Keyboard Input Source Language Synchronization works only with usage of local
  layout and deadkeys enabled.  
  If a keyboard layout is used which has deadkeys disabled (which is the default
  on IGEL OS), Horizon client falls back to en-US layout.
* PCoIP sessions may crash in some cases, switch to Blast Protocol is
  recommended then. H.264/HEVC encoding can be disabled when overall performance
  is too low.
* Client drive mapping and USB redirection for storage devices can be enabled at
  the same time, but this could lead to sporadic problems.  
  Horizon Client tracks the drives which are dynamically mounted and adds them
  to the remote session using client drive mapping, means USB redirection is not
  used for theses devices then.  
  However, in case of devices like USB SD card readers, Horizon does not map
  them as client drives but forcefully uses USB-redirection which results in an
  unclean unmount.  
  As a work-around, the IDs of these card readers can be added to IGEL USB
  access rules and denied.

### Parallels Client

* Attached storage devices appear as network drives in the remote session  
* USB device redirection is considered as experimental for the Parallels client
  for Linux

### Firefox

* With enabled Citrix Browser Content Redirection, Firefox has no H.264 and AAC
  multimedia codec support. Means, when codec support is needed in Firefox, BCR
  needs to be disabled. Citrix Browser Content Redirection is disabled by
  default.
* Multimedia playback in Firefox is unstable if GStreamer version 0.10 is
  active. The default GStreamer version for Firefox
  sessions.browser\\<inst>.gstreamer_version was set to 1.0.

### Network

* Wakeup from system suspend fails on DELL Latitude 5510
* If applications are configured to start after established network connection
  and network mounts are configured, spurious \\"Failed to start application\\"
  notifications may be shown. The applications still start.
* Set of credentials for manual system wide proxy is broken.

### WiFi

* TP-Link Archer T2UH WiFi adapters does not work after system suspend/resume.
  Workaround: Disabling system suspend at IGEL Setup > System > Power Options >
  Shutdown.

### Cisco JVDI Client

* There may be a segfault shown in the logs (during logout of Citrix Desktop
  session). Occurs only when using Citrix Workspace App 2010 and Cisco JVDI.

### Base system

* Hyper-V (Generation 2) needs a lot of memory (RAM). The machine needs a
  sufficient amount of memory allocated.
* Update from memory stick requires network online state (at least when multiple
  update stages are triggered / necessary)

### Conky

* The right screen when using multiscreen environment may not be shown
  correctly.  
  Workaround: The horizontal offset should be set to the width of the monitor
  (e.g. if the monitor has a width of 1920, the offset should be set to 1920)

### Firmware update

* On devices with 2 GB of flash storage it could happen that there is not enough
  space for updating all features. In this case, a corresponding error message
  occurs. Please visit [https://kb.igel.com/igelos-11.04/en/error-not-enough-
  space-on-local-drive-when-updating-to-igel-os-11-04-or-higher-32870765.html]
  for a possible solution and additional information.

### Appliance Mode

* When ending a Citrix session in browser appliance mode, the browser is
  restarted twice (instead of once).
* Appliance mode RHEV/Spice: spice-xpi firefox plugin is no longer supported.
  The \\"Console Invocation\\" has to allow 'Native' client (auto is also possible)
  and should be started in fullscreen to prevent any opening windows.
* Browser Appliance mode can fail when the Web URL contains special control
  characters like ampersand (& character).  
  Workaround: Add quotes at the beginning and the end of an affected URL. E.g.:  
  'https://www.google.com/search?q=aSearchTerm&source=lnms&tbm=isch'

### Audio

* IGEL UD2 (D220) fails to restore the volume level of the speaker when the
  device used firmware version 11.01.110 before.
* Audio jack detection on Advantec POC-W243L does not work. Therefore, sound
  output goes through a possibly connected headset and also the internal
  speakers.
* UD3-M340C: Sound preferences are showing Headphone & Microphone, although not
  connected.

### Multimedia

* Multimedia redirection with GStreamer could fail when using Nouveau GPU
  driver.

### Hardware

* Some newer Delock 62599 active DisplayPort to DVI (4k) adapters only work on
  INTEL-based devices.
* Wake up from suspend via UMS does not work on HP mt645 devices. Workaround:
  Disable system suspend and use shutdown instead.
* System suspend is not supported on Lenovo L14 Gen 3 Intel based device.
* If bluetooth is disabled via tray icon / menu on Lenovo L14 Gen3 (Intel-
  based), bluetooth tray icon is permanently disabled. Can be solved / re-
  enabeld with console command rfkill unblock bluetooth
* Built-in fingerprint sensor is not supported on HP mt645.

### Remote Management

* AIT feature with IGEL Starter License is only supported by UMS version
  6.05.100 or newer.

### Fabulatech

* Scanning images within AVD session (with usage of FabulaTech Scanner
  Redirection) might fail and cause a reconnection if the compression level is
  set to high quality.  
  As a workaround the compression level must be reduced.
```

-----

## 2023-07-31 - [11.08.377](readme11.08.377.txt)

```
The new PRIVATE BUILD 11.08.377 for IGEL Workspace is ready.

This build is based on 11.08.360.

These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------

### Citrix

* Situations where the hardware decoder has not enough memory to handle a
  certain video format properly, are now better handled.
* In rare situations (observed when using teams app sharing) there appear
  intermixed video frames which come from different H264 streams. These frames
  are now being separated from each other and will be decoded separately.  
* Added a new registry key to suppress such secondary frames entirely, as they
  render mostly duplicated content of the primary frames.

+------------+-----------------------------------------------------------------+
|Parameter   |`In case of mixed up H264 streams: Don't display frames from secondary streams` |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.hw-accelerated-h264-suppress-secondary-frames`              |
+------------+-----------------------------------------------------------------+
|Type        |bool                                                             |
+------------+-----------------------------------------------------------------+
|Value       |**enabled** (default) / disabled                                 |
+------------+-----------------------------------------------------------------+

* Refresh/Redraw issues with Citrix session windows are fixed. Resuming from
  screensaver or uncovering a session window which was covered by another window
  now works as expected.

### H264

* Situations where the hardware decoder has not enough memory to handle a
  certain video format properly, are now better handled.
```

-----

## 2023-07-28 - [11.08.371](readme11.08.371.txt)

```
The new PRIVATE BUILD 11.08.371 for IGEL Workspace is ready.

This build is based on 11.08.364.

These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------

### Imprivata

* Pre-Release of IGEL Agent for Imprivata.
```

-----

## 2023-07-26 - [11.08.378](readme11.08.378.txt)

```
The new PRIVATE BUILD 11.08.378 for IGEL Workspace is ready.

This build is based on 11.08.360.

These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------

### Smartcard

* Fixed pcsc-lite SCardTransmit with undefined protocol.
```

-----

## 2023-07-24 - [11.08.376](readme11.08.376.txt)

```
The new PRIVATE BUILD 11.08.376 for IGEL Workspace is ready.

This build is based on 11.08.361.

These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------

### CUPS Printing

* Updated PrinterLogic PrinterInstallerClient to version 25.1.0.637  
  Fixes the determination of the AD user when Kerberos login is used.
```

-----

## 2023-07-18 - [11.08.374](readme11.08.374.txt)

```
The new PRIVATE BUILD 11.08.374 for IGEL Workspace is ready.

This build is based on 11.08.360.

These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------

### Smartcard

* Fixed pcsc-lite interoperability with VMWare Horizon client.
```

-----

## 2023-07-14 - [11.08.346](readme11.08.346.txt)

```
The new PRIVATE BUILD 11.08.346 for IGEL Workspace is ready.

This build is based on 11.08.345.

These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------

### Base system

* Fixed instability in handling of certain webcam devices, e.g. Meeting Owl 3.
```

-----

## 2023-07-10 - [11.08.373](readme11.08.373.txt)

```
The new PRIVATE BUILD 11.08.373 for IGEL Workspace is ready.

This build is based on 11.08.361.

These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------

### Driver

* Updated Philips Speech driver to version 13.1.14. Fixed a minor bug in the
  Linux drivers which possibly caused unexpected error messages in some target
  software products.
```

-----

## 2023-07-04 - [11.08.372](readme11.08.372.txt)

```
The new PRIVATE BUILD 11.08.372 for IGEL Workspace is ready.

This build is based on 11.08.360.

These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------

### Base system

* Added new registry key to set acpi= kernel cmdline options (some devices needs
  acpi=off).

+------------+-----------------------------------------------------------------+
| Parameter  | `Set ACPI kernel parameters.`                                   |
+------------+-----------------------------------------------------------------+
| Registry   | `system.kernel.bootparams.acpi`                                 |
+------------+-----------------------------------------------------------------+
| Range      | [No setting][Force][On][Off][Noirq][Strict][Rsdt][Copy_dsdt]    |
+------------+-----------------------------------------------------------------+
| Value      | **No setting**                                                  |
+------------+-----------------------------------------------------------------+

* Added new registry key to set reboot kernel cmdline which can be used if
  reboot or shutdown issues are present.

+------------+-----------------------------------------------------------------+
| Parameter  | `Set reboot kernel parameters.`                                 |
+------------+-----------------------------------------------------------------+
| Registry   | `system.kernel.bootparams.reboot`                               |
+------------+-----------------------------------------------------------------+
| Range      | [Default][Bios][Triple][Kbd][Acpi][Efi][Pci]                    |
+------------+-----------------------------------------------------------------+
| Value      | **Default**                                                     |
+------------+-----------------------------------------------------------------+
```

-----

## 2023-06-30 - [11.08.309](readme11.08.309.txt)

```
The new PRIVATE BUILD 11.08.309 for IGEL Workspace is ready.

This build is based on 11.08.299.

These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------

### Cisco JVDI Client

* Integrated Cisco JVDI 14.1.2
```

-----

## 2023-06-30 - [11.08.368](readme11.08.368.txt)

```
The new PRIVATE BUILD 11.08.368 for IGEL Workspace is ready.

This build is based on 11.08.360.

These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------

### Citrix

* Integrated Citrix workspace app 23.05  
  Available workspace apps in this release: 20.10 (default), 23.03, and 23.05
* New features:  
*  Copy and paste files and folders between two virtual desktops [Technical
  Preview]

+------------+-----------------------------------------------------------------+
|Parameter   |`Copy and paste files and folders between two virtual desktops`  |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.module.vdgdt`                                               |
+------------+-----------------------------------------------------------------+
|Value       |true(default)/ false                                             |
+------------+-----------------------------------------------------------------+
*  Enhancement on 32-bit cursor support [Technical Preview]
+------------+-----------------------------------------------------------------+
|Parameter   |`Enhancement on 32-bit cursor support`                           |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.wfclient.Cursor32bitSupport`                                |
+------------+-----------------------------------------------------------------+
|Value       |true(default)/ false                                             |
+------------+-----------------------------------------------------------------+
* Change the default browser for FIDO2
+------------+-----------------------------------------------------------------+
|Parameter   |`Change the default browser for FIDO2`                           |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.authman.fido2authbrowser`                                   |
+------------+-----------------------------------------------------------------+
|Value       |CEB (default), chromium, firefox, chromium-browser               |
+------------+-----------------------------------------------------------------+

*  Support for authentication using FIDO2 when connecting to on-premises stores
  [Technical Preview]

+------------+-----------------------------------------------------------------+
|Parameter   |`Support for authentication using FIDO2 when connecting to on-premises stores` |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.authman.fido2enabled`                                       |
+------------+-----------------------------------------------------------------+
|Value       |false (default)/ true                                            |
+------------+-----------------------------------------------------------------+

* Fixed Issues:  

* App Protection now works with all the Citrix session types including the
  Firefox browser. Please reboot the system after enabling/disabling the feature
  (ica.appprotection)
```

-----

## 2023-06-29 - [11.08.367](readme11.08.367.txt)

```
The new PRIVATE BUILD 11.08.367 for IGEL Workspace is ready.

This build is based on 11.08.360.

These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------

### Cisco JVDI Client

* Integrated Cisco JVDI 14.1.2
```

-----

## 2023-06-28 - [11.08.345](readme11.08.345.txt)

```
The new PRIVATE BUILD 11.08.345 for IGEL Workspace is ready.

This build is based on 11.08.344.

These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------

### Citrix

* Fixed issue with dynamic e911 feature.
```

-----

## 2023-06-26 - [11.08.364](readme11.08.364.txt)

```
The new PRIVATE BUILD 11.08.364 for IGEL Workspace is ready.

This build is based on 11.08.360.

These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------

### Imprivata

* Pre-Release of IGEL Agent for Imprivata.
```

-----

## 2023-06-23 - [11.08.344](readme11.08.344.txt)

```
The new PRIVATE BUILD 11.08.344 for IGEL Workspace is ready.

This build is based on 11.08.338.

These are the release notes published with that release:

Known Issues
--------------------------------------------------------------------------------

### Citrix

* To launch multiple desktop sessions with Citrix HDX RTME and Citrix H.264  
  acceleration plugin, the following registry key needs to be enabled:
+------------+-----------------------------------------------------------------+
|Parameter   |`Activate workaround for dual RTME sessions and H264 acceleration` |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.workaround-dual-rtme`                                       |
+------------+-----------------------------------------------------------------+
|Range       |enabled / **disabled** (default)                                 |
+------------+-----------------------------------------------------------------+
* This workaround is not applicable when \\"Enable Secure ICA\\" is active for the  
  specific delivery group.
* Adding smartcard readers during running / active session does not work. The
  reader is visible, but cannot be used due to unknown reader status. Only
  relevant for CWA versions earlier than 2112.
* There are known issues with GStreamer 1.0 in combination with Citrix. These
  occure with multimedia redirection of H.264, MPEG1 and MPEG2. (GStreamer 1.0
  is used if browser content redirection is enabled active.)
* Browser Content Redirection (BCR) does not work if DRI3 and hardware
  accelerated H.264 deep compression codec is enabled.
* Enabled DRI3 on an AMD GPU with enabled Citrix H.264 acceleration could lead
  to a freeze. Selective H.264 mode (API v2) is not affected from this issue.  
* Citrix H.264 acceleration plugin does not work with **enabled** server policy
  \\"Optimize for 3D graphics workload\\" in combination with server policy \\"Use
  video codec compression\\" -> *\\"For the entire screen\\"**.
* Currently H.264 for Citrix sessions cannot be used in parallel with video
  input acceleration.
* While starting Self-Service, it is possible that process ServiceRecord
  segfaults -> Self-Service cannot be started afterwards.  
  A cache cleanup with reboot is needed. In addition, the following parameters
  should set to true.
+------------+-----------------------------------------------------------------+
|Parameter   |`Clean up UI cache after Self-Service termination`               |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.selfservice.cleanupwebui`                                   |
+------------+-----------------------------------------------------------------+
|Value       |**false** (default)/true                                         |
+------------+-----------------------------------------------------------------+
|Parameter   |`Clean up Store cache after Self-Service termination`            |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.selfservice.cleanupstore`                                   |
+------------+-----------------------------------------------------------------+
|Value       |**false** (default)/true                                         |
+------------+-----------------------------------------------------------------+
* Logoff of Self-Service causes a segfault with CWAL 2211 which ends the
  application. Restart of Self-Service is functional.
* Browser Content Redirection (BCR) may not work with Chrome version 105.0.* or
  later
* White/ green fragments may appear during desktop launch if JPEG graphical
  codec is used.
-There may be problems with webcam redirection at Citrix. To fix the problem
  Gstreamer 1.0 must be enabled, this can be done either via the registry for
  the session or by enabling the browser content redirection.-  
  Under certain conditions, webcam redirection may not work.  
  If this is the case, GStreamer has to be set to version 1.0 via registry or by
  enabling Browser Content Redirection (BCR).

### OSC Installer

* OSC not deployable with IGEL Deployment Appliance: Version 11.3 or later is
  required for deploying IGEL OS 11.06. and following.

### AVD

* AVD MS-Teams optimization can crash the AVD client if H264 software decoder is
  used (fluh264dec). AVD prefers the hardware decoders (fluvadec) but when there
  are no hardware decoders or when all hardware decoders are in use already, the
  software decoder is utilized which may randomly crash the AVD client. It is
  likely when it crashes in a certain MS-Teams call, it might crash quite soon
  again when rejoining the same call. A fix for that is in development. A
  workaround is to disable incoming video in such MS-Teams calls, which is an
  option in the \\"...\\" menu from the control bar during an active call.
* H.264 hardware decoding for MS-Teams optimization is currently limited to non-
  AMD devices due to stability issues on AMD devices.
* Scanning images within AVD session (with usage of FabulaTech Scanner
  Redirection) might fail and cause a reconnection if the compression level is
  set to high quality.  
  As a workaround the compression level must be reduced.

### VMware Horizon

* After disconnect of an RDP-based session, the Horizon main window which
  contains the server or sessions overview, cannot be resized anymore.
* Copying text from Horizon Blast sessions is not possible.
* The on-screen keyboard in Horizon appliance mode does not work correctly with
  local logon.  
  It is necessary to switch off local logon and enable the following two keys
  via IGEL registry:  
  userinterface.softkeyboard.autoshow  
  userinterface.softkeyboard.autohide
* Zoom VDI Media Plugin versions below 5.8.0 make Horizon Client crash upon
  connection to the remote desktop when TCSetup is running at the same time.
* With usage of PCoIP protocol, the virtual channel provided by VMware used for
  serial port and scanner redirection could freeze on logout from remote
  session.  
  
  This happens only with enabled scanner or serial port redirection.  
  The freeze does not occur if both redirection methods are enabled or none of
  them. The Blast Protocol is not affected by this bug.  
  
  The respective settings can be found in the IGEL Registry:  
  vmware.view.enable-serial-port-redir  
  vmware.view.enable-scanner-redir
* Keyboard Input Source Language Synchronization works only with usage of local
  layout and deadkeys enabled.  
  If a keyboard layout is used which has deadkeys disabled (which is the default
  on IGEL OS), Horizon client falls back to en-US layout.
* PCoIP sessions may crash in some cases, switch to Blast Protocol is
  recommended then. H.264/HEVC encoding can be disabled when overall performance
  is too low.
* Client drive mapping and USB redirection for storage devices can be enabled at
  the same time, but this could lead to sporadic problems.  
  Horizon Client tracks the drives which are dynamically mounted and adds them
  to the remote session using client drive mapping, means USB redirection is not
  used for theses devices then.  
  However, in case of devices like USB SD card readers, Horizon does not map
  them as client drives but forcefully uses USB-redirection which results in an
  unclean unmount.  
  As a work-around, the IDs of these card readers can be added to IGEL USB
  access rules and denied.

### Parallels Client

* Attached storage devices appear as network drives in the remote session  
* USB device redirection is considered as experimental for the Parallels client
  for Linux

### Firefox

* With enabled Citrix Browser Content Redirection, Firefox has no H.264 and AAC
  multimedia codec support. Means, when codec support is needed in Firefox, BCR
  needs to be disabled. Citrix Browser Content Redirection is disabled by
  default.
* Multimedia playback in Firefox is unstable if GStreamer version 0.10 is
  active. The default GStreamer version for Firefox
  sessions.browser\\<inst>.gstreamer_version was set to 1.0.

### Network

* Wakeup from system suspend fails on DELL Latitude 5510
* If applications are configured to start after established network connection
  and network mounts are configured, spurious \\"Failed to start application\\"
  notifications may be shown. The applications still start.
* Set of credentials for manual system wide proxy is broken.

### WiFi

* TP-Link Archer T2UH WiFi adapters does not work after system suspend/resume.
  Workaround: Disabling system suspend at IGEL Setup > System > Power Options >
  Shutdown.

### Cisco JVDI Client

* There may be a segfault shown in the logs (during logout of Citrix Desktop
  session). Occurs only when using Citrix Workspace App 2010 and Cisco JVDI.

### Base system

* Hyper-V (Generation 2) needs a lot of memory (RAM). The machine needs a
  sufficient amount of memory allocated.
* Update from memory stick requires network online state (at least when multiple
  update stages are triggered / necessary)

### Conky

* The right screen when using multiscreen environment may not be shown
  correctly.  
  Workaround: The horizontal offset should be set to the width of the monitor
  (e.g. if the monitor has a width of 1920, the offset should be set to 1920)

### Firmware update

* On devices with 2 GB of flash storage it could happen that there is not enough
  space for updating all features. In this case, a corresponding error message
  occurs. Please visit [https://kb.igel.com/igelos-11.04/en/error-not-enough-
  space-on-local-drive-when-updating-to-igel-os-11-04-or-higher-32870765.html]
  for a possible solution and additional information.

### Appliance Mode

* When ending a Citrix session in browser appliance mode, the browser is
  restarted twice (instead of once).
* Appliance mode RHEV/Spice: spice-xpi firefox plugin is no longer supported.
  The \\"Console Invocation\\" has to allow 'Native' client (auto is also possible)
  and should be started in fullscreen to prevent any opening windows.
* Browser Appliance mode can fail when the Web URL contains special control
  characters like ampersand (& character).  
  Workaround: Add quotes at the beginning and the end of an affected URL. E.g.:  
  'https://www.google.com/search?q=aSearchTerm&source=lnms&tbm=isch'

### Audio

* IGEL UD2 (D220) fails to restore the volume level of the speaker when the
  device used firmware version 11.01.110 before.
* Audio jack detection on Advantec POC-W243L does not work. Therefore, sound
  output goes through a possibly connected headset and also the internal
  speakers.
* UD3-M340C: Sound preferences are showing Headphone & Microphone, although not
  connected.

### Multimedia

* Multimedia redirection with GStreamer could fail when using Nouveau GPU
  driver.

### Hardware

* Some newer Delock 62599 active DisplayPort to DVI (4k) adapters only work on
  INTEL-based devices.
* Wake up from suspend via UMS does not work on HP mt645 devices. Workaround:
  Disable system suspend and use shutdown instead.
* System suspend is not supported on Lenovo L14 Gen 3 Intel based device.
* If bluetooth is disabled via tray icon / menu on Lenovo L14 Gen3 (Intel-
  based), bluetooth tray icon is permanently disabled. Can be solved / re-
  enabeld with console command rfkill unblock bluetooth

### Remote Management

* AIT feature with IGEL Starter License is only supported by UMS version
  6.05.100 or newer.

### Fabulatech

* Scanning images within AVD session (with usage of FabulaTech Scanner
  Redirection) might fail and cause a reconnection if the compression level is
  set to high quality.  
  As a workaround the compression level must be reduced.
```

-----

## 2023-06-22 - [11.08.343](readme11.08.343.txt)

```
The new PRIVATE BUILD 11.08.343 for IGEL Workspace is ready.

This build is based on 11.08.338.

These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------

### Citrix

* Integrated Citrix workspace app 23.05  
  Available workspace apps in this release: 20.10 (default), 23.03, and 23.05
* New features:  
*  Copy and paste files and folders between two virtual desktops [Technical
  Preview]

+------------+-----------------------------------------------------------------+
|Parameter   |`Copy and paste files and folders between two virtual desktops`  |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.module.vdgdt`                                               |
+------------+-----------------------------------------------------------------+
|Value       |true(default)/ false                                             |
+------------+-----------------------------------------------------------------+
*  Enhancement on 32-bit cursor support [Technical Preview]
+------------+-----------------------------------------------------------------+
|Parameter   |`Enhancement on 32-bit cursor support`                           |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.wfclient.Cursor32bitSupport`                                |
+------------+-----------------------------------------------------------------+
|Value       |true(default)/ false                                             |
+------------+-----------------------------------------------------------------+
* Change the default browser for FIDO2
+------------+-----------------------------------------------------------------+
|Parameter   |`Change the default browser for FIDO2`                           |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.authman.fido2authbrowser`                                   |
+------------+-----------------------------------------------------------------+
|Value       |CEB (default), chromium, firefox, chromium-browser               |
+------------+-----------------------------------------------------------------+
*  Support for authentication using FIDO2 when connecting to on-premises stores
  [Technical Preview]
+------------+-----------------------------------------------------------------+
|Parameter   |`Support for authentication using FIDO2 when connecting to on-premises stores` |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.authman.fido2enabled`                                       |
+------------+-----------------------------------------------------------------+
|Value       |false (default)/ true                                            |
+------------+-----------------------------------------------------------------+

* Fixed Issues:  

* App Protection now works with all the Citrix session types including the
  Firefox browser. Please reboot the system after enabling/disabling the feature
  (ica.appprotection)
```

-----

## 2023-06-22 - [11.08.365](readme11.08.365.txt)

```
The new PRIVATE BUILD 11.08.365 for IGEL Workspace is ready.

This build is based on 11.08.360.

These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------

### RDP/IGEL RDP Client 2

* Fixed RDP timezone redirection not working for some locations.
* Fixed fullscreen RDP session not starting with no monitor connected.
```

-----

## 2023-06-20 - [11.08.361](readme11.08.361.txt)

```
The new PRIVATE BUILD 11.08.361 for IGEL Workspace is ready.

This build is based on 11.08.360.

These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------

### Citrix

* Integrated Citrix workspace app 23.05  
  Available workspace apps in this release: 20.10 (default), 23.03, and 23.05
* New features:  
*  Copy and paste files and folders between two virtual desktops [Technical
  Preview]

+------------+-----------------------------------------------------------------+
|Parameter   |`Copy and paste files and folders between two virtual desktops`  |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.module.vdgdt`                                               |
+------------+-----------------------------------------------------------------+
|Value       |true(default)/ false                                             |
+------------+-----------------------------------------------------------------+

*  Enhancement on 32-bit cursor support [Technical Preview]

+------------+-----------------------------------------------------------------+
|Parameter   |`Enhancement on 32-bit cursor support`                           |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.wfclient.Cursor32bitSupport`                                |
+------------+-----------------------------------------------------------------+
|Value       |true(default)/ false                                             |
+------------+-----------------------------------------------------------------+

* Change the default browser for FIDO2

+------------+-----------------------------------------------------------------+
|Parameter   |`Change the default browser for FIDO2`                           |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.authman.fido2authbrowser`                                   |
+------------+-----------------------------------------------------------------+
|Value       |CEB, chromium, firefox, chromium-browser                         |
+------------+-----------------------------------------------------------------+

* Fixed Issues:  

* App Protection now works with all the Citrix session types including the
  Firefox browser. Please reboot the system after enabling/disabling the feature
  (ica.appprotection)
* Integrated Citrix workspace app 23.05  
  Available workspace apps in this release: 20.10 (default), 23.03, and 23.05

* New features:  
*  Copy and paste files and folders between two virtual desktops [Technical
  Preview]

+------------+-----------------------------------------------------------------+
|Parameter   |`Copy and paste files and folders between two virtual desktops`  |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.module.vdgdt`                                               |
+------------+-----------------------------------------------------------------+
|Value       |true(default)/ false                                             |
+------------+-----------------------------------------------------------------+

*  Enhancement on 32-bit cursor support [Technical Preview]

+------------+-----------------------------------------------------------------+
|Parameter   |`Enhancement on 32-bit cursor support`                           |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.wfclient.Cursor32bitSupport`                                |
+------------+-----------------------------------------------------------------+
|Value       |true(default)/ false                                             |
+------------+-----------------------------------------------------------------+

* Change the default browser for FIDO2

+------------+-----------------------------------------------------------------+
|Parameter   |`Change the default browser for FIDO2`                           |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.authman.fido2authbrowser`                                   |
+------------+-----------------------------------------------------------------+
|Value       |CEB (default), chromium, firefox, chromium-browser               |
+------------+-----------------------------------------------------------------+

*  Support for authentication using FIDO2 when connecting to on-premises stores
  [Technical Preview]

+------------+-----------------------------------------------------------------+
|Parameter   |`Support for authentication using FIDO2 when connecting to on-premises stores` |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.authman.fido2enabled`                                       |
+------------+-----------------------------------------------------------------+
|Value       |false (default)/ true                                            |
+------------+-----------------------------------------------------------------+

* Fixed Issues:  

* App Protection now works with all the Citrix session types including the
  Firefox browser. Please reboot the system after enabling/disabling the feature
  (ica.appprotection)

### AVD

* Added initial secondary ringer support. But since the RdClientSDK support for
  it currently is non-functional (the sinkId does not change on the related MS-
  Teams setting), we added a command line option "--webrtc-ring-all-devices" and
  have set that as default in the cmd_ext setting. This makes MS-Teams ring on
  all audio output devices. This default setting will be removed as soon as the
  RdClientSDK implementation works as expected!

### Network

* Added MAC address passthrough among Ethernet devices. With the following
  registry key a LAN device can be specified from which the MAC address shall be
  adopted. The donor device and any conflicting receiver device will be removed
  (by unbinding the driver) as long as the receiving device is present.

+------------+-----------------------------------------------------------------+
| Parameter  | `MAC address source`                                            |
+------------+-----------------------------------------------------------------+
| Registry   | `network.interfaces.ethernet.device%.mac_source`                |
+------------+-----------------------------------------------------------------+
| Range      | [none][LAN][LAN2][LAN3][LAN4]                                   |
+------------+-----------------------------------------------------------------+
| Value      | **none**                                                        |
+------------+-----------------------------------------------------------------+

* Example: If LAN2 and LAN3 are configurations for docking stations that shall
  adopt the MAC address from LAN, the following two parameters must be set to
  "LAN":  
  network.interfaces.ethernet.device1.mac_source  
  network.interfaces.ethernet.device2.mac_source  
  Warning: Misconfiguration may result in loss of connectivity

Resolved Issues
--------------------------------------------------------------------------------

### AVD

* Fixed screenshare with audio-only direct calls.
* Includes latest RdClientSDK with tcp-no-delay socket option enabled to fix
  certain latency issues.

### VMware Horizon

* Fixed the Horizon session starter to be able to handle backslashes in the
  password
```

-----

## 2023-06-19 - [11.08.277](readme11.08.277.txt)

```
The new PRIVATE BUILD 11.08.277 for IGEL Workspace is ready.

This build is based on 11.08.264.

These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------

### AVD

* Fixed screenshare with audio-only direct calls.
* Includes latest RdClientSDK with tcp-no-delay socket option enabled to fix certain latency issues.
```

-----

## 2023-06-13 - [11.08.360](readme11.08.360.txt)

```
The new PUBLIC BUILD 11.08.360 for IGEL Workspace is ready.

This build is based on 11.08.330.

These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------

### Parallels Client

* Updated Parallels client to version 19.2.0

### Network

* Added support for WWAN chipset Quectel EM05 on Lenovo L14 Gen3

### WiFi

* Added option for DHCP refresh after roaming (within the same network).

+------------+-----------------------------------------------------------------+
|Parameter   |`Refresh DHCP after roaming`                                     |
+------------+-----------------------------------------------------------------+
|Registry    |`network.interfaces.wirelesslan.device0.roam_refresh_dhcp`       |
+------------+-----------------------------------------------------------------+
|Type        |bool                                                             |
+------------+-----------------------------------------------------------------+
|Value       |**enabled** (default) / disabled                                 |
+------------+-----------------------------------------------------------------+

### Base system

* Added possibility to clean-up IGEL licenses in license partition. License
  files which are superseded by other licenses will be removed and not
  downloaded from UMS again. This helps keeping free space for new license
  files. The following parameter activates the license cleanup:

+------------+-----------------------------------------------------------------+
|Parameter   |`Clean up redundant licenses`                                    |
+------------+-----------------------------------------------------------------+
|Registry    |`system.remotemanager.license_cleanup`                           |
+------------+-----------------------------------------------------------------+
|Value       |{**}true{**}(default)/false                                      |
+------------+-----------------------------------------------------------------+

### zoomvdi

* Integrated Zoom VDI 5.14.0.23370  
  Available Zoom VDI Clients: 5.12.6.22200, 5.13.10.23090, and 5.14.0.23370

### Hardware

* Added hardware support for LG CQ601I
* Added hardware support for Lenovo ThinkEdge SE10
* Added hardware support for HP mt645 G7 with Ryzen 5

Security Fixes
--------------------------------------------------------------------------------

### Base system

* For security reasons the accessory 'Network Tools' is enforced to run with
  Administrator (root) privileges only. Therefore, parameter 'Password
  protection on page Accessories>Network Tools was removed.
* Fixed cups-filters security issue CVE-2023-24805.  
* Fixed mysql-5.7 security issues CVE-2023-21980 and CVE-2023-21912.  
* Fixed libwebp security issue CVE-2023-1999.  
* Fixed libssh security issues CVE-2023-2283 and CVE-2023-1667.  
* Fixed webkit2gtk security issues CVE-2023-28205, CVE-2023-27954,
  CVE-2023-27932, CVE-2022-32885 and CVE-2022-0108.  
* Fixed binutils security issues CVE-2023-25588, CVE-2023-25585 and
  CVE-2023-25584.  
* Fixed postgresql-10 security issues CVE-2023-2455 and CVE-2023-2454.

Resolved Issues
--------------------------------------------------------------------------------

### RD Web Access

* Fixed mouse pointer disappearing in RemoteApp sessions.

### VMware Horizon

* Fixed Single Sign-On feature in Horizon.  
  The domain name is given by Kerberos in the format like in domain.com.  
  This does not work for all Horizon installations.
* Therefore, configuration option to specify / set domain format is added.

+------------+-----------------------------------------------------------------+
|Parameter   |`Fixup domain for Single Sign-On`                                |
+------------+-----------------------------------------------------------------+
|Registry    |`vmware.view.sso-cred-mode`                                      |
+------------+-----------------------------------------------------------------+
|Range       | [Derive domain from username][Use fully qualified domain name]  |
|            | [Use short domain name][Keep domain as is]                      |
+------------+-----------------------------------------------------------------+
|Value       |**Derive domain from username**                                  |
+------------+-----------------------------------------------------------------+

### Network

* Improved automatic connection with LTE module Quectel EM05.

### Cisco JVDI Client

* Fixed issue, Jabra Headset control button is not working.

### Base system

* Fixed issue that on some device the Bluetooth stays off if once disabled over
  Bluetooth tray menu.

### Audio

* New Parameter to disable the time scheduling in pulseaudio module-udev-detect.

+------------+-----------------------------------------------------------------+
|Parameter   |`Disable timer scheduling for module-udev`                       |
+------------+-----------------------------------------------------------------+
|Registry    |`multimedia.pulseaudio.daemon.disable-module-udev-tsched`        |
+------------+-----------------------------------------------------------------+
|Range       | [auto][true][false]                                             |
+------------+-----------------------------------------------------------------+
|Value       |**auto**                                                         |
+------------+-----------------------------------------------------------------+

### Remote Management

* Fixed assignment of the device's hostname by the UMS while registering a
  device.
```

-----

## 2023-06-10 - [11.08.338](readme11.08.338.txt)

```
The new PRIVATE BUILD 11.08.338 for IGEL Workspace is ready.

This build is based on 11.08.330.

These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------

### Citrix

* Integrated Citrix workspace app 23.05  
  Available workspace apps in this release: 20.10 (default), 23.03, and 23.05

* New features:  

*  Copy and paste files and folders between two virtual desktops [Technical
  Preview]

+------------+-----------------------------------------------------------------+
|Parameter   |`Copy and paste files and folders between two virtual desktops`  |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.module.vdgdt`                                               |
+------------+-----------------------------------------------------------------+
|Value       |true(default)/ false                                             |
+------------+-----------------------------------------------------------------+

*  Enhancement on 32-bit cursor support [Technical Preview]

+------------+-----------------------------------------------------------------+
|Parameter   |`Enhancement on 32-bit cursor support`                           |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.wfclient.Cursor32bitSupport`                                |
+------------+-----------------------------------------------------------------+
|Value       |true(default)/ false                                             |
+------------+-----------------------------------------------------------------+

* Change the default browser for FIDO2

+------------+-----------------------------------------------------------------+
|Parameter   |`Change the default browser for FIDO2`                           |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.authman.fido2authbrowser`                                   |
+------------+-----------------------------------------------------------------+
|Value       |CEB, chromium, firefox, chromium-browser                         |
+------------+-----------------------------------------------------------------+

* Fixed Issues:  

* App Protection now works with all the Citrix session types including the
  Firefox browser. Please reboot the system after enabling/disabling the feature
  (ica.appprotection)
```

-----

## 2023-06-06 - [11.08.337](readme11.08.337.txt)

```
The new PRIVATE BUILD 11.08.337 for IGEL Workspace is ready.

This build is based on 11.08.330.

These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------

### RD Web Access

* Fixed mouse pointer disappearing in RemoteApp sessions.
```

-----

## 2023-05-31 - [11.08.335](readme11.08.336.DER.txt)

```
The new PRIVATE BUILD 11.08.335 for IGEL Workspace is ready.

This build is based on 11.08.330.

These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------

### zoomvdi

* Integrated Zoom VDI 5.14.0.23370  
  Available Zoom VDI Clients: 5.12.6.22200, 5.13.10.23090, and 5.14.0.23370
```

-----

## 2023-05-30 - [11.08.336.DER](readme11.08.336.DER.txt)

```
The new PRIVATE BUILD 11.08.336.DER for IGEL Workspace is ready.

This build is based on 11.08.330.

These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------

### Base system

* Switched system kernel to version 5.15.111  
* Changed registry key x.server.use_legacy_xorg_server default to true so the
  older Xorg server is used.
```

-----

## 2023-05-27 - [11.08.333](readme11.08.333.txt)

```
The new PRIVATE BUILD 11.08.333 for IGEL Workspace is ready.

This build is based on 11.08.290.

These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------

### VMware Horizon

* Updated Horizon Client to version 2206-8.6.0-64817841
Resolved Issues
--------------------------------------------------------------------------------

### Firefox

* Fixed usage of more than one Firefox session. This was prevented by app-armor
  lacking an additional exception for Firefox 102 ESR.
* Fixed handling of ica files - required to start Citrix sessions (restored
  former behavior).
* Fixed typo in browser start script which could corrupt URL in some cases.
```

-----

## 2023-05-26 - [11.08.334](readme11.08.334.txt)

```
The new PRIVATE BUILD 11.08.334 for IGEL Workspace is ready.

This build is based on 11.08.330.

These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------

### AVD

* Added initial secondary ringer support. But since the RdClientSDK support for
  it currently is non-functional (the sinkId does not change on the related MS-
  Teams setting), we added a command line option \\"--webrtc-ring-all-devices\\" and
  have set that as default in the cmd_ext setting. This makes MS-Teams ring on
  all audio output devices. This default setting will be removed as soon as the
  RdClientSDK implementation works as expected!
```

-----

## 2023-05-24 - [11.08.331](readme11.08.331.txt)

```
The new PRIVATE BUILD 11.08.331 for IGEL Workspace is ready.

This build is based on 11.08.330.

These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------

### WiFi

* Made DHCP refresh after roaming within the same network configurable.
+------------+-----------------------------------------------------------------+
| Parameter  | `Refresh DHCP after roaming`                                    |
+------------+-----------------------------------------------------------------+
| Registry   | `network.interfaces.wirelesslan.device0.roam_refresh_dhcp`      |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | **enabled** (default) / disabled                                |
+------------+-----------------------------------------------------------------+
```

-----

## 2023-05-23 - [11.08.118.DER](readme11.08.118.DER.txt)

```
The new PRIVATE BUILD 11.08.118.DER for IGEL Workspace is ready.

This build is based on 11.08.110.

These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------

### Citrix

* Integrated Citrix Workspace App 2303  
* Integrated Cisco JVDI 14.1.2  
* Integrated Cisco Webex Meetings 43.2
```

-----

## 2023-05-17 - [11.08.330](readme11.08.330.txt)

```
The new PUBLIC BUILD 11.08.330 for IGEL Workspace is ready.

This build is based on 11.08.290.

These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------

### Citrix

* Integrated Citrix Workspace App 2303  
  Available Workspace Apps in this release: 2303 (default), 2302, and 2010
* New features:  
* Inactivity Timeout for Citrix Workspace app

+------------+-----------------------------------------------------------------+
|Parameter   |`Inactivity Timeout for Citrix Workspace app`                    |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.authman.itoenabled`                                         |
+------------+-----------------------------------------------------------------+
|Value       |false(default)/true                                              |
+------------+-----------------------------------------------------------------+

* Background blurring for webcam redirection

+------------+-----------------------------------------------------------------+
|Parameter   |`Background blurring for webcam redirection`                     |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.wfclient.HDXWebCamEnableBackgndEffect`                      |
+------------+-----------------------------------------------------------------+
|Value       |false(default)/true                                              |
+------------+-----------------------------------------------------------------+

* Integrated RTME 2.9.600 for Skype for Business

### AVD

* Updated IGEL AVD client to version 1.1.17  
* Added: Cache of last entered username for AVD sessions if no other username
  preset is active.  
* Added parameter to disable the username cache

+------------+-----------------------------------------------------------------+
|Registry    |`sessions.wvd%.options.cache-username`                           |
+------------+-----------------------------------------------------------------+
|Value       |**enabled** (default) / disabled                                 |
+------------+-----------------------------------------------------------------+


### VMware Horizon

* Updated Horizon client to version 2303-8.9.0-21435420  
  Added parameter for the browser redirection feature and  
  setting rtav related audio out option:

+------------+-----------------------------------------------------------------+
| Parameter  | `Browser Redirection`                                           |
+------------+-----------------------------------------------------------------+
| Registry   | `vmware.view.html5mmrbcr.enable-bcr`                            |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | **enabled** (default) / disabled                                |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | `Allow client webcam in Browser Redirection`                    |
+------------+-----------------------------------------------------------------+
| Registry   | `vmware.view.html5mmrbcr.media-stream-enabled`                  |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | **enabled** (default) / disabled                                |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | `Ignore website's certificate errors`                           |
+------------+-----------------------------------------------------------------+
| Registry   | `vmware.view.html5mmrbcr.ignore-certs`                          |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | enabled / **disabled** (default)                                |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | `Save Cookies for Browser Redirection`                          |
+------------+-----------------------------------------------------------------+
| Registry   | `vmware.view.html5mmrbcr.use-cache-enabled`                     |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | **enabled** (default) / disabled                                |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | `Select audio output devices`                                   |
+------------+-----------------------------------------------------------------+
| Registry   | `vmware.view.audio-out-option`                                  |
+------------+-----------------------------------------------------------------+
| Range      | [Default][All][User selection]                                  |
+------------+-----------------------------------------------------------------+
| Value      | **Default**                                                     |
+------------+-----------------------------------------------------------------+


### Chromium

* Updated Chromium browser to version 112.0.5615.165

### Firefox

* Updated Mozilla Firefox to version 102.10.0 esr

### WiFi

* Added iwlwifi backport WiFi driver which can be used if issues with Intel WiFi
  devices occur.  
* Added registry key (reboot is required to become effective)

+------------+-----------------------------------------------------------------+
|Parameter   |`Use the newer backport drivers for WLAN.`                       |
+------------+-----------------------------------------------------------------+
|Registry    |`network.drivers.use_backport_drivers`                           |
+------------+-----------------------------------------------------------------+
|Type        |bool                                                             |
+------------+-----------------------------------------------------------------+
|Value       |enabled / **disabled** (default)                                 |
+------------+-----------------------------------------------------------------+


### Smartcard

* Updated Pointsharp (formerly SecMaker) Net iD Client to version 1.1.0.37.

### CUPS Printing

* Added LRS printing agent V1R1.0.000
* Corresponding configuration options in setup - Devices > Printing > LRS

+------------+-----------------------------------------------------------------+
|Parameter   |`Custom path to LRS software`                                    |
+------------+-----------------------------------------------------------------+
|Registry    |`LRS.custom_path`                                                |
+------------+-----------------------------------------------------------------+
|Type        |string                                                           |
+------------+-----------------------------------------------------------------+
|Value       |empty **Default**                                                |
+------------+-----------------------------------------------------------------+
|Parameter   |`Manage printers by LRS VPSA`                                    |
+------------+-----------------------------------------------------------------+
|Registry    |`LRS.active`                                                     |
+------------+-----------------------------------------------------------------+
|Type        |bool                                                             |
+------------+-----------------------------------------------------------------+
|Value       |enabled / **disabled** (default)                                 |
+------------+-----------------------------------------------------------------+
|Parameter   |`Debug mode`                                                     |
+------------+-----------------------------------------------------------------+
|Registry    |`LRS.debug_mode`                                                 |
+------------+-----------------------------------------------------------------+
|Type        |bool                                                             |
+------------+-----------------------------------------------------------------+
|Value       |enabled / **disabled** (default)                                 |
+------------+-----------------------------------------------------------------+
|Parameter   |`Pass Username to the LRS Backend`                               |
+------------+-----------------------------------------------------------------+
|Registry    |`LRS.pass_username`                                              |
+------------+-----------------------------------------------------------------+
|Type        |bool                                                             |
+------------+-----------------------------------------------------------------+
|Value       |**enabled** (default) / disabled                                 |
+------------+-----------------------------------------------------------------+
|Parameter   |`Username Format`                                                |
+------------+-----------------------------------------------------------------+
|Registry    |`LRS.username_format`                                            |
+------------+-----------------------------------------------------------------+
|Range       | [Username][Domain\Username][Username@Domain]                    |
+------------+-----------------------------------------------------------------+
|Value       |**Username**                                                     |
+------------+-----------------------------------------------------------------+
|Parameter   |`Cups printer model name for local printing`                     |
+------------+-----------------------------------------------------------------+
|Registry    |`LRS.cups_model`                                                 |
+------------+-----------------------------------------------------------------+
|Type        |string                                                           |
+------------+-----------------------------------------------------------------+
|Value       |Generic Raw Queue **Default**                                    |
+------------+-----------------------------------------------------------------+
|Parameter   |`Driver name used in remote Windows session`                     |
+------------+-----------------------------------------------------------------+
|Registry    |`LRS.windows_driver`                                             |
+------------+-----------------------------------------------------------------+
|Type        |string                                                           |
+------------+-----------------------------------------------------------------+
|Value       |MS Publisher Color Printer **Default**                           |
+------------+-----------------------------------------------------------------+
|Parameter   |`VSPA URL`                                                       |
+------------+-----------------------------------------------------------------+
|Registry    |`LRS.homeurl`                                                    |
+------------+-----------------------------------------------------------------+
|Type        |string                                                           |
+------------+-----------------------------------------------------------------+
|Value       | [http://replace.me.server/lrs/nlrswc2.exe/vpsx]                 |
+------------+-----------------------------------------------------------------+
|Parameter   |`ICA Sessions`                                                   |
+------------+-----------------------------------------------------------------+
|Registry    |`LRS.map_ica`                                                    |
+------------+-----------------------------------------------------------------+
|Type        |bool                                                             |
+------------+-----------------------------------------------------------------+
|Value       |**enabled** (default) / disabled                                 |
+------------+-----------------------------------------------------------------+
|Parameter   |`RDP Sessions`                                                   |
+------------+-----------------------------------------------------------------+
|Registry    |`LRS.map_rdp`                                                    |
+------------+-----------------------------------------------------------------+
|Type        |bool                                                             |
+------------+-----------------------------------------------------------------+
|Value       |**enabled** (default) / disabled                                 |
+------------+-----------------------------------------------------------------+
|Parameter   |`Parallels Sessions`                                             |
+------------+-----------------------------------------------------------------+
|Registry    |`LRS.map_twox`                                                   |
+------------+-----------------------------------------------------------------+
|Type        |bool                                                             |
+------------+-----------------------------------------------------------------+
|Value       |enabled / **disabled** (default)                                 |
+------------+-----------------------------------------------------------------+
|Parameter   |`NX Client Sessions`                                             |
+------------+-----------------------------------------------------------------+
|Registry    |`LRS.map_nxclient`                                               |
+------------+-----------------------------------------------------------------+
|Type        |bool                                                             |
+------------+-----------------------------------------------------------------+
|Value       |enabled / **disabled** (default)                                 |
+------------+-----------------------------------------------------------------+
|Parameter   |`LRS Output Management`                                          |
+------------+-----------------------------------------------------------------+
|Registry    |`services.printing_lrs.enabled`                                  |
+------------+-----------------------------------------------------------------+
|Type        |bool                                                             |
+------------+-----------------------------------------------------------------+
|Value       |**enabled** (default) / disabled                                 |
+------------+-----------------------------------------------------------------+


### Cisco Webex

* Integrated Cisco Webex VDI  43.4.0.25788

### Base system

* Added Canadian Multilingual Standard keyboard layout.
* Added BIOS update and password management support for HP t540 and t640. How-
  to-guide via [https://kb.igel.com/hp-ami-bios], added parameters:

+------------+-----------------------------------------------------------------+
|Setup       |`System > Firmware Customization > Features`                     |
+------------+-----------------------------------------------------------------+
|Parameter   |`BIOS Tools`                                                     |
+------------+-----------------------------------------------------------------+
|Registry    |`services.bios_tools.enabled`                                    |
+------------+-----------------------------------------------------------------+
|Value       |enabled / **disabled** (default)                                 |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
|Registry    |`fwtools.bios_tools.bios_update_file`                            |
+------------+-----------------------------------------------------------------+
|Value       |empty **Default**                                                |
+------------+-----------------------------------------------------------------+
|Registry    |`fwtools.bios_tools.bios_settings_set_file`                      |
+------------+-----------------------------------------------------------------+
|Value       |empty **Default**                                                |
+------------+-----------------------------------------------------------------+
|Registry    |`fwtools.bios_tools.bios_settings_get_file`                      |
+------------+-----------------------------------------------------------------+
|Value       |empty **Default**                                                |
+------------+-----------------------------------------------------------------+
|Registry    |`fwtools.bios_tools.bios_pwd_file`                               |
+------------+-----------------------------------------------------------------+
|Value       |empty **Default**                                                |
+------------+-----------------------------------------------------------------+
|Registry    |`fwtools.bios_tools.bios_pwd_file_old`                           |
+------------+-----------------------------------------------------------------+
|Value       |empty **Default**                                                |
+------------+-----------------------------------------------------------------+
|Registry    |`fwtools.bios_tools.bios_download_username`                      |
+------------+-----------------------------------------------------------------+
|Value       |empty **Default**                                                |
+------------+-----------------------------------------------------------------+
|Registry    |`fwtools.bios_tools.bios_download_crypt_password`                |
+------------+-----------------------------------------------------------------+
|Value       |empty **Default**                                                |
+------------+-----------------------------------------------------------------+


### Driver

* Updated Olympus driver for dictation to version 4.0.3.

### Audio

* Updated EPOS Connect to version 7.4

### Hardware

* Added hardware support for Lenovo ThinkPad L14 Gen3 (Intel) - integrated LTE
  is not supported yet.
* Added hardware support for HP Elite mt645 G7, includes WWAN Intel XMM 7560 R+
* Added hardware support for LG CQ600i-6N.
* Added hardware support for LG 24CQ650i-6N.
* Added hardware support for HP t550.

### Remote Management

* Remote management evaluates a HTTP cookie which is propagated to the device
  during the ICG handshake and uses this cookie in all HTTP and Websocket
  connections belonging to the established ICG connection. This enables the load
  balancing mechanism involving an affinity HTTP cookie to relate device's HTTP
  and Websocket requests to a particular ICG connection.
* Upgraded libwebsockets to v4.1.6
* IGEL remote manager agent exposes in all ICG connections and HTTP(s) requests
  the User-Agent HTTP header in the form: igel-rmagent/\<RMAGENTVERSION>

### Fabulatech

* Updated Fabulatech plugins to version 3.10.0.9.


Security Fixes
--------------------------------------------------------------------------------

### Chromium

* Fixed Chromium browser security issues CVE-2023-1236, CVE-2023-1235,
  CVE-2023-1234, CVE-2023-1233, CVE-2023-1232, CVE-2023-1231, CVE-2023-1230,
  CVE-2023-1229, CVE-2023-1228, CVE-2023-1227, CVE-2023-1226, CVE-2023-1225,
  CVE-2023-1224, CVE-2023-1223, CVE-2023-1222, CVE-2023-1221, CVE-2023-1220,
  CVE-2023-1219, CVE-2023-1218, CVE-2023-1217, CVE-2023-1216, CVE-2023-1215,
  CVE-2023-1214 and CVE-2023-1213.
* Fixed Chromium browser security issues CVE-2023-2137, CVE-2023-2136,
  CVE-2023-2135, CVE-2023-2134, CVE-2023-2133, CVE-2023-2033, CVE-2023-1534,
  CVE-2023-1533, CVE-2023-1532, CVE-2023-1531, CVE-2023-1530, CVE-2023-1529,
  CVE-2023-1528, CVE-2022-2136 and CVE-2022-2033.  
* Updated chromium browser to version 112.0.5615.165

### Firefox

* Updated Mozilla Firefox to version 102.10.0 ESR  
  Security fixes for mfsa2023-14, also known as:  
  CVE-2023-29533, CVE-2023-29535, CVE-2023-29536, CVE-2023-29539,  
  CVE-2023-29541, CVE-2023-1945, CVE-2023-29548, CVE-2023-29550.  
  Security fixes for mfsa2023-10, also known as:  
  CVE-2023-25751, CVE-2023-28164, CVE-2023-28162, CVE-2023-25752,  
  CVE-2023-28176.

### Base system

* Updated Intel-microcode from 20221108 to 20230214 version for solving relevant
  security issues.  
* Fixed sudo security issues CVE-2023-28487, CVE-2023-28486 and CVE-2023-2848.  
* Fixed vim security issues CVE-2023-1175, CVE-2023-1170, CVE-2023-0433,
  CVE-2023-0288, CVE-2023-0054, CVE-2023-0049, CVE-2022-47024, CVE-2022-2946,
  CVE-2022-2923, CVE-2022-2849, CVE-2022-2845, CVE-2022-2581, CVE-2022-2571,
  CVE-2022-2345, CVE-2022-2304, CVE-2022-2206, CVE-2022-2183, CVE-2022-2175,
  CVE-2022-2129, CVE-2022-2126, CVE-2022-2125, CVE-2022-2124, CVE-2022-1968,
  CVE-2022-1942, CVE-2022-1898, CVE-2022-1851, CVE-2022-1796, CVE-2022-1785,
  CVE-2022-1735, CVE-2022-1733, CVE-2022-1720, CVE-2022-1674, CVE-2022-1629 and
  CVE-2022-0413.  
* Fixed bubblewrap security issue CVE-2021-41133.  
* Fixed heimdal security issue CVE-2022-45142.  
* Fixed xorg-server security issue CVE-2023-1393.  
* Fixed ghostscript security issue CVE-2023-28879.  
* Fixed protobuf security issues CVE-2022-1941 and CVE-2021-22570.  
* Fixed python2.7 security issue CVE-2023-24329.  
* Fixed python3.6 security issue CVE-2023-24329.  
* Fixed zulu8-ca security issues CVE-2023-21930, CVE-2023-21937, CVE-2023-21938,
  CVE-2023-21939, CVE-2023-21954, CVE-2023-21967 and CVE-2023-21968.  
* Fixed systemd security issues CVE-2022-3821 and CVE-2022-4415.  
* Fixed openssl1.0 security issues CVE-2023-0466, CVE-2023-0465 and
  CVE-2023-0464.  
* Fixed openssl security issues CVE-2023-0466, CVE-2023-0465 and CVE-2023-0464.  
* Fixed gnutls28 security issue CVE-2023-0361.  
* Fixed qemu security issue CVE-2022-1050.  
* Fixed ffmpeg security issues CVE-2022-48434, CVE-2022-3964, CVE-2022-3341 and
  CVE-2022-3109.

Resolved Issues
--------------------------------------------------------------------------------

### AVD

* Fixed MS-Teams video color issues for remote video feeds and screenshares.
* Optimized h.264 encoder settings for MS-Teams VDI calls.  
* Added a registry parameter to change the x264enc speed-preset property used
  for MS-Teams VDI

+------------+-----------------------------------------------------------------+
|Registry    |`sessions.wvd%.options.webrtcencoderpreset`                      |
+------------+-----------------------------------------------------------------+
|Value       | [none][ultrafast][superfast][veryfast][faster][fast]            |
|            | [ **medium** ][slow][slower][veryslow][placebo]                 |
+------------+-----------------------------------------------------------------+

* Removed smartcard option until smartcard support is stabilized. Smartcard
  redirection still can be enabled by setting sessions.wvd%.options.cmd_ext =
  --smartcard

### RDP/IGEL RDP Client 2

* Fixed RDP sessions not starting on configured monitor.
* Fixed RDP sessions no longer starting on multiple monitors when using
  different resolutions.
* Fixed cursor position not updated correctly in RDP sessions.

### Firefox

* Fixed browser startup behavior if multiple browser sessions are started. As
  example, different autostarted browser sessions on different monitors.  
  For that browser's remote interface is required to start the next session
  which takes time on slow endpoints.  
  A configurable timeout is implemented:

+------------+-----------------------------------------------------------------+
|Parameter   |`Timeout for starting next browser session`                      |
+------------+-----------------------------------------------------------------+
|Registry    |`browserglobal.app.startup-timeout`                              |
+------------+-----------------------------------------------------------------+
|Range       | [0][2][4][6][8][10][12][14][16][18][20]                         |
+------------+-----------------------------------------------------------------+
|Value       |**0**                                                            |
+------------+-----------------------------------------------------------------+

* Fixed usage of more than one Firefox session. This was prevented by app-armor
  lacking an additional exception for Firefox 102 ESR.
* Fixed handling of ica files - required to start Citrix sessions (restored
  former behavior).
* Fixed typo in browser start script which could corrupt URL in some cases.

### Network

* Fixed: Set thirdparty r8125 as default driver on Lenovo L14 Gen 3 (Intel-
  based)  
* Added new registry key to prefer thirdparty r8125 over r8169 network driver.

+------------+-----------------------------------------------------------------+
|Parameter   |`Use thirdparty r8125 kernel module.`                            |
+------------+-----------------------------------------------------------------+
|Registry    |`network.drivers.r8169.prefer_r8125`                             |
+------------+-----------------------------------------------------------------+
|Range       | [Auto][Yes][No]                                                 |
+------------+-----------------------------------------------------------------+
|Value       |**Auto**                                                         |
+------------+-----------------------------------------------------------------+

* Fixed tray icon for Fibocom L860-GL-16 LTE Module
* SCEP:  
    -Fixed SCEP via proxy  
    -Added separator definition to use if multiple values of distinguished name
      attributes are desired, e.g. multiple organizational units. The separator
      also affects organization, state, locality, and potentially more in the
      future.


+------------+-----------------------------------------------------------------+
|Parameter   |`Name separator`                                                 |
+------------+-----------------------------------------------------------------+
|Registry    |`network.scepclient.cert%.multivalueseparator`                   |
+------------+-----------------------------------------------------------------+
|Range       | [<none>]                                                        |
+------------+-----------------------------------------------------------------+
|Value       |**<none>**                                                       |
+------------+-----------------------------------------------------------------+


### WiFi

* Fixed: WiFi IP setting changes become effective immediately now.

### Base system

* Fixed serial port support for TSharc touch devices.  
* Added new registry key:

+------------+-----------------------------------------------------------------+
|Parameter   |`Set serial interface for TSharc touch (None for USB device).`   |
+------------+-----------------------------------------------------------------+
|Registry    |`userinterface.touchscreen.tsharc_serial_device`                 |
+------------+-----------------------------------------------------------------+
|Range       | [None][COM1][COM2][COM3][COM4][COM1 (USB)][COM2 (USB)]          |
+------------+-----------------------------------------------------------------+
|Value       |**None**                                                         |
+------------+-----------------------------------------------------------------+

* Fixed missing node actions for changing Device Encryption settings
* Disabled suspend support on Intel based Lenovo L14 Gen 3 as it does not work
  currently.
* Fixed handling of certificate files in PEM format which do not include a final
  newline character.

### Custom Partition

* Fixed: Creating or updating a custom partition is decoupled from the
  partition's mounting so that the creating process doesn't interrupt the boot
  process and runs in the background now. This fixes problems with premature
  abort while creating the custom partition by a timeout during boot.

### X11 system

* Fixed out of range issue for NEC EA223WM monitors.
* Added quirk for DisplayLink leads to long Xorg start on boot.  
* Added new registry key x.xserver0.quirks.displaylink_crash_workaround

+------------+-----------------------------------------------------------------+
| Parameter  | `Quirk to fix issues with Xorg start take ages with DisplayLink connected.` |
+------------+-----------------------------------------------------------------+
| Registry   | `x.xserver0.quirks.displaylink_crash_workaround`                |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | enabled / **disabled** (default)                                |
+------------+-----------------------------------------------------------------+


### VNC Viewer

* Added VNC viewer parameter to control if current or all monitors are used when
  switching to full-screen mode.

+------------+-----------------------------------------------------------------+
|Parameter   |`Use all monitors in full-screen mode`                           |
+------------+-----------------------------------------------------------------+
|Registry    |`sessions.vncviewer<num>.option.fullscreenallmonitors`           |
+------------+-----------------------------------------------------------------+
|Value       |**disabled**(default)/enabled                                    |
+------------+-----------------------------------------------------------------+


### Remote Management

* IGEL remote management reacts now on every change among the all available
  network interfaces in the running IGEL OS. So if a network interface becomes
  online or offline then the remote management tries to connect the UMS or the
  ICG server.
```

-----

## 2023-05-12 - [11.08.307](readme11.08.307.txt)

```
The new PRIVATE BUILD 11.08.307 for IGEL Workspace is ready.

This build is based on 11.08.256.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------

### zoomvdi

* Integraded Zoom VDI Versions: [5.10.6.21295]; [5.11.2.21530]; [5.12.1.21950]
```

-----

## 2023-05-04 - [11.08.305](readme11.08.305.txt)

```
The new PRIVATE BUILD 11.08.305 for IGEL Workspace is ready.

This build is based on 11.08.290.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

Known Issues
--------------------------------------------------------------------------------

### Citrix

* To launch multiple desktop sessions with Citrix HDX RTME and Citrix H.264  
  acceleration plugin, the following registry key needs to be enabled:

+------------+-----------------------------------------------------------------+
|Parameter   |`Activate workaround for dual RTME sessions and H264 acceleration` |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.workaround-dual-rtme`                                       |
+------------+-----------------------------------------------------------------+
|Range       |enabled / **disabled** (default)                                 |
+------------+-----------------------------------------------------------------+

* This workaround is not applicable when \\"Enable Secure ICA\\" is active for the  
  specific delivery group.
* Adding smartcard readers during running / active session does not work. The
  reader is visible, but cannot be used due to unknown reader status. Only
  relevant for CWA versions earlier than 2112.
* There are known issues with GStreamer 1.0 in combination with Citrix. These
  occure with multimedia redirection of H.264, MPEG1 and MPEG2. (GStreamer 1.0
  is used if browser content redirection is enabled active.)
* Browser content redirection does not work when DRI3 and hardware accelerated
  H.264 deep compression codec is enabled.
* Enabled DRI3 on an AMD GPU with enabled Citrix H.264 acceleration could lead
  to a freeze. Selective H.264 mode (API v2) is not affected from this issue.  
* Citrix H.264 acceleration plugin does not work with **enabled** server policy
  \\"Optimize for 3D graphics workload\\" in combination with server policy \\"Use
  video codec compression\\" -> *\\"For the entire screen\\"**.
* Currently H.264 for Citrix sessions cannot be used in parallel with video
  input acceleration.
* While starting Self-Service, it is possible that process ServiceRecord
  segfaults -> Self-Service cannot be started afterwards.  
  A cache cleanup with reboot is needed. In addition, the following parameters
  should set to true.

+------------+-----------------------------------------------------------------+
|Parameter   |`Clean up UI cache after Self-Service termination`               |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.selfservice.cleanupwebui`                                   |
+------------+-----------------------------------------------------------------+
|Value       |**false** (default)/true                                         |
+------------+-----------------------------------------------------------------+
|Parameter   |`Clean up Store cache after Self-Service termination`            |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.selfservice.cleanupstore`                                   |
+------------+-----------------------------------------------------------------+
|Value       |**false** (default)/true                                         |
+------------+-----------------------------------------------------------------+

* Logoff of Self-Service causes a segfault with CWAL 2211 which ends the
  application. Restart of Self-Service is functional.
* Browser Content Redirection (BCR) may not work with Chrome version 105.0.* or
  later
* White/ green fragments may appear during desktop launch, if JPEG graphical
  codec is used, 

### OSC Installer

* OSC not deployable with IGEL Deployment Appliance: Version 11.3 or later is
  required for deploying IGEL OS 11.06. and following.

### AVD

* AVD MS-Teams optimization can crash the AVD client if H264 software decoder is
  used (fluh264dec). AVD prefers the hardware decoders (fluvadec) but when there
  are no hardware decoders or when all hardware decoders are in use already, the
  software decoder is utilized which may randomly crash the AVD client. It is
  likely when it crashes in a certain MS-Teams call, it might crash quite soon
  again when rejoining the same call. A fix for that is in development. A
  workaround is to disable incoming video in such MS-Teams calls, which is an
  option in the \\"...\\" menu from the control bar during an active call.
* H.264 hardware decoding for MS-Teams optimization is currently limited to non-
  AMD devices due to stability issues on AMD devices.

### VMware Horizon

* After disconnect of an RDP-based session, the Horizon main window which
  contains the server or sessions overview, cannot be resized anymore.
* Copying text from Horizon Blast sessions is not possible.
* The on-screen keyboard in Horizon appliance mode does not work correctly with
  local logon.  
  It is necessary to switch off local logon and enable the following two keys
  via IGEL registry:  
  userinterface.softkeyboard.autoshow  
  userinterface.softkeyboard.autohide
* Zoom VDI Media Plugin versions below 5.8.0 make Horizon Client crash upon
  connection to the remote desktop when TCSetup is running at the same time.
* With usage of PCoIP protocol, the virtual channel provided by VMware used for
  serial port and scanner redirection could freeze on logout from remote
  session.  
  
  This happens only with enabled scanner or serial port redirection.  
  The freeze does not occur if both redirection methods are enabled or none of
  them. The Blast Protocol is not affected by this bug.  
  
  The respective settings can be found in the IGEL Registry:  
  vmware.view.enable-serial-port-redir  
  vmware.view.enable-scanner-redir
* Keyboard Input Source Language Synchronization works only with usage of local
  layout and deadkeys enabled.  
  If a keyboard layout is used which has deadkeys disabled (which is the default
  on IGEL OS), Horizon client falls back to en-US layout.
* PCoIP sessions may crash in some cases, switch to Blast Protocol is
  recommended then. H.264/HEVC encoding can be disabled when overall performance
  is too low.
* Client drive mapping and USB redirection for storage devices can be enabled at
  the same time, but this could lead to sporadic problems.  
  Horizon Client tracks the drives which are dynamically mounted and adds them
  to the remote session using client drive mapping, means USB redirection is not
  used for theses devices then.  
  However, in case of devices like USB SD card readers, Horizon does not map
  them as client drives but forcefully uses USB-redirection which results in an
  unclean unmount.  
  As a work-around, the IDs of these card readers can be added to IGEL USB
  access rules and denied.

### Parallels Client

* Attached storage devices appear as network drives in the remote session  
* USB device redirection is considered as experimental for the Parallels client
  for Linux

### Firefox

* With enabled Citrix Browser Content Redirection, Firefox has no H.264 and AAC
  multimedia codec support. Means, when codec support is needed in Firefox, BCR
  needs to be disabled. Citrix Browser Content Redirection is disabled by
  default.
* Multimedia playback in Firefox is unstable if GStreamer version 0.10 is
  active. The default GStreamer version for Firefox
  sessions.browser\\<inst>.gstreamer_version was set to 1.0.

### Network

* Wakeup from system suspend fails on DELL Latitude 5510
* If applications are configured to start after established network connection
  and network mounts are configured, spurious \\"Failed to start application\\"
  notifications may be shown. The applications still start.
* Set of credentials for manual system wide proxy is broken.

### WiFi

* TP-Link Archer T2UH WiFi adapters does not work after system suspend/resume.
  Workaround: Disable system suspend at IGEL Setup > System > Power Options >
  Shutdown.

### Cisco JVDI Client

* There may be a segfault shown in the logs (during logout of Citrix Desktop
  session). Occurs only when using Citrix Workspace App 2010 and Cisco JVDI.

### Base system

* Hyper-V (Generation 2) needs a lot of memory (RAM). The machine needs a
  sufficient amount of memory allocated.
* Update from memory stick requires network online state (at least when multiple
  update stages are triggered / necessary)

### Conky

* The right screen when using multiscreen environment may not be shown
  correctly.  
  Workaround: The horizontal offset should be set to the width of the monitor
  (e.g. if the monitor has a width of 1920, the offset should be set to 1920)

### Firmware update

* On devices with 2 GB of flash storage it could happen that there is not enough
  space for updating all features. In this case, a corresponding error message
  occurs. Please visit [https://kb.igel.com/igelos-11.04/en/error-not-enough-
  space-on-local-drive-when-updating-to-igel-os-11-04-or-higher-32870765.html]
  for a possible solution and additional information.

### Appliance Mode

* When ending a Citrix session in browser appliance mode, the browser is
  restarted twice (instead of once).
* Appliance mode RHEV/Spice: spice-xpi firefox plugin is no longer supported.
  The \\"Console Invocation\\" has to allow 'Native' client (auto is also possible)
  and should be started in fullscreen to prevent any opening windows.
* Browser Appliance mode can fail when the Web URL contains special control
  characters like ampersand (& character).  
  Workaround: Add quotes at the beginning and the end of an affected URL. E.g.:  
  'https://www.google.com/search?q=aSearchTerm&source=lnms&tbm=isch'

### Audio

* IGEL UD2 (D220) fails to restore the volume level of the speaker when the
  device used firmware version 11.01.110 before.
* Audio jack detection on Advantec POC-W243L does not work. Therefore, sound
  output goes through a possibly connected headset and also the internal
  speakers.
* UD3-M340C: Sound preferences are showing Headphone & Microphone, although not
  connected.

### Multimedia

* Multimedia redirection with GStreamer could fail when using Nouveau GPU
  driver.

### Hardware

* Some newer Delock 62599 active DisplayPort to DVI (4k) adapters only work on
  INTEL-based devices.
* Wake up from suspend via UMS does not work on HP mt645 devices. Workaround:
  Disable system suspend and use shutdown instead.

### Remote Management

* AIT feature with IGEL Starter License is only supported by UMS version
  6.05.100 or newer.

```

-----

## 2023-04-27 - [11.08.303](readme11.08.303.txt)

```
The new PRIVATE BUILD 11.08.303 for IGEL Workspace is ready.

This build is based on 11.08.290.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------

### Smartcard

* Updated Pointsharp (formerly SecMaker) Net iD Client to version 1.1.0.37.
```

-----

## 2023-04-25 - [11.08.301](readme11.08.301.txt)

```
The new PRIVATE BUILD 11.08.301 for IGEL Workspace is ready.

This build is based on 11.08.236.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------

### Base system
* Added Canadian Multilingual Standard keyboard layout.
```

-----

## 2023-04-19 - [11.08.299](readme11.08.299.txt)

```
The new PRIVATE BUILD 11.08.299 for IGEL Workspace is ready.

This build is based on 11.08.290.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------

### Firefox

* Fixed possibility to have more than one Firefox session running  
  which effectively was prevented by app-armor lacking  
  an additional exception for the Firefox 102 esr.
* Fixed possibility to handle ica files required to start  
  Citrix sessions by restoring the former Firefox behavior.  
  Thus download of temporary files which have a dedicated  
  handler can be made even when file download in general  
  is forbidden for the user.

### Network

* SCEP:  
    -Fixed SCEP via proxy  
    -Added separator definition for use if multiple values of distinguished name
      attributes are desired, e.g. multiple organizational units. The separator
      also affects organization, state, locality, and potentially more in the
      future.

+------------+-----------------------------------------------------------------+
| Parameter  | `Name separator`                                                |
+------------+-----------------------------------------------------------------+
| Registry   | `network.scepclient.cert%.multivalueseparator`                  |
+------------+-----------------------------------------------------------------+
| Range      | [<none>]                                                        |
+------------+-----------------------------------------------------------------+
| Value      | **<none>*                                                       |
+------------+-----------------------------------------------------------------+
```

-----

## 2023-04-18 - [11.08.296](readme11.08.296.txt)

```
The new PRIVATE BUILD 11.08.296 for IGEL Workspace is ready.

This build is based on 11.08.292.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------

### Citrix
* Integrated RTME 2.9.600 for Skype for Business
* Integrated Citrix workspace app 23.03  
  Available workspace apps in this release: 23.03 (default), 23.02, and 20.10
* New features:  
*  Inactivity Timeout for Citrix Workspace app
+------------+-----------------------------------------------------------------+
|Parameter   |`Inactivity Timeout for Citrix Workspace app`                    |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.authman.itoenabled`                                         |
+------------+-----------------------------------------------------------------+
|Value       |false(default)/true                                              |
+------------+-----------------------------------------------------------------+
*  Background blurring for webcam redirection
+------------+-----------------------------------------------------------------+
|Parameter   |`Background blurring for webcam redirection`                     |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.wfclient.HDXWebCamEnableBackgndEffect`                      |
+------------+-----------------------------------------------------------------+
|Value       |false(default)/true                                              |
+------------+-----------------------------------------------------------------+

Resolved Issues
--------------------------------------------------------------------------------

### Firefox
* Fixed possibility to have more than one Firefox session running  
  which effectively was prevented by app-armor lacking  
  an additional exception for the Firefox 102 esr.
* Fixed possibility to handle ica files required to start  
  Citrix sessions by restoring the former Firefox behavior.  
  Thus download of temporary files which have a dedicated  
  handler can be made even when file download in general  
  is be forbidden for the user.
```

-----

## 2023-04-18 - [11.08.298](readme11.08.298.txt)

```
The new PRIVATE BUILD 11.08.298 for IGEL Workspace is ready.

This build is based on 11.08.290.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

Resolved Issues
--------------------------------------------------------------------------------

### VNC Viewer
* Added VNC viewer parameter to control if current or all monitors are used when
  switching to full-screen mode.
+------------+-----------------------------------------------------------------+
|Parameter   |`Use all monitors in full-screen mode`                           |
+------------+-----------------------------------------------------------------+
|Registry    |`sessions.vncviewer<num>.option.fullscreenallmonitors`           |
+------------+-----------------------------------------------------------------+
|Value       |**disabled**(default)/enabled                                    |
+------------+-----------------------------------------------------------------+
```

-----

## 2023-04-18 - [11.08.297](readme11.08.297.txt)

```
The new PRIVATE BUILD 11.08.297 for IGEL Workspace is ready.

This build is based on 11.08.290.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------

### Citrix
* Integrated Citrix workspace app 23.03  
  Available workspace apps in this release: 22.09 (default), 23.02, and 23.03  
  New features:  
*  Inactivity Timeout for Citrix Workspace app
+------------+-----------------------------------------------------------------+
|Parameter   |`Inactivity Timeout for Citrix Workspace app`                    |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.authman.itoenabled`                                         |
+------------+-----------------------------------------------------------------+
|Value       |false(default)/true                                              |
+------------+-----------------------------------------------------------------+
*  Background blurring for webcam redirection
+------------+-----------------------------------------------------------------+
|Parameter   |`Background blurring for webcam redirection`                     |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.wfclient.HDXWebCamEnableBackgndEffect`                      |
+------------+-----------------------------------------------------------------+
|Value       |false(default)/true                                              |
+------------+-----------------------------------------------------------------+
* Integrated RTME 2.9.600 for Skype for Business
### zoomvdi
* Available Zoom VDI clients in this release: 5.13.1.22610 (default),
  5.12.6.22200 and 5.11.2.21530
Resolved Issues
--------------------------------------------------------------------------------

### Firefox
* Fixed possibility to have more than one Firefox session running  
  which effectively was prevented by app-armor lacking  
  an additional exception for the Firefox 102 esr.
* Fixed possibility to handle ica files required to start  
  Citrix sessions by restoring the former Firefox behavior.  
  Thus download of temporary files which have a dedicated  
  handler can be made even when file download in general  
  is be forbidden for the user.
```

-----

## 2023-04-13 - [11.08.295](readme11.08.295.txt)

```
The new PRIVATE BUILD 11.08.295 for IGEL Workspace is ready.

This build is based on 11.08.290.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------

### LRS Printing Agent

* Added LRS printing agent  V1R1.0.000
+------------+-----------------------------------------------------------------+
| Parameter  | `Custom path to LRS software`                                   |
+------------+-----------------------------------------------------------------+
| Registry   | `LRS.custom_path`                                               |
+------------+-----------------------------------------------------------------+
| Type       | string                                                          |
+------------+-----------------------------------------------------------------+
| Value      | empty **Default**                                               |
+------------+-----------------------------------------------------------------+
+------------+-----------------------------------------------------------------+
| Parameter  | `Manage printers by LRS VPSA`                                   |
+------------+-----------------------------------------------------------------+
| Registry   | `LRS.active`                                                    |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | enabled / **disabled** (default)                                |
+------------+-----------------------------------------------------------------+
+------------+-----------------------------------------------------------------+
| Parameter  | `Debug mode`                                                    |
+------------+-----------------------------------------------------------------+
| Registry   | `LRS.debug_mode`                                                |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | enabled / **disabled** (default)                                |
+------------+-----------------------------------------------------------------+
+------------+-----------------------------------------------------------------+
| Parameter  | `Pass Username to the LRS Backend`                              |
+------------+-----------------------------------------------------------------+
| Registry   | `LRS.pass_username`                                             |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | **enabled** (default) / disabled                                |
+------------+-----------------------------------------------------------------+
+------------+-----------------------------------------------------------------+
| Parameter  | `Username Format`                                               |
+------------+-----------------------------------------------------------------+
| Registry   | `LRS.username_format`                                           |
+------------+-----------------------------------------------------------------+
| Range      | [Username][Domain\\Username][Username@Domain]                    |
+------------+-----------------------------------------------------------------+
| Value      | **Username**                                                    |
+------------+-----------------------------------------------------------------+
+------------+-----------------------------------------------------------------+
| Parameter  | `Cups printer model name for local printing`                    |
+------------+-----------------------------------------------------------------+
| Registry   | `LRS.cups_model`                                                |
+------------+-----------------------------------------------------------------+
| Type       | string                                                          |
+------------+-----------------------------------------------------------------+
| Value      | Generic Raw Queue **Default**                                   |
+------------+-----------------------------------------------------------------+
+------------+-----------------------------------------------------------------+
| Parameter  | `Driver name used in remote Windows session`                    |
+------------+-----------------------------------------------------------------+
| Registry   | `LRS.windows_driver`                                            |
+------------+-----------------------------------------------------------------+
| Type       | string                                                          |
+------------+-----------------------------------------------------------------+
| Value      | MS Publisher Color Printer **Default**                          |
+------------+-----------------------------------------------------------------+
+------------+-----------------------------------------------------------------+
| Parameter  | `VSPA URL`                                                      |
+------------+-----------------------------------------------------------------+
| Registry   | `LRS.homeurl`                                                   |
+------------+-----------------------------------------------------------------+
| Type       | string                                                          |
+------------+-----------------------------------------------------------------+
| Value      | http://replace.me.server/lrs/nlrswc2.exe/vpsx **Default**       |
+------------+-----------------------------------------------------------------+
+------------+-----------------------------------------------------------------+
| Parameter  | `ICA Sessions`                                                  |
+------------+-----------------------------------------------------------------+
| Registry   | `LRS.map_ica`                                                   |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | **enabled** (default) / disabled                                |
+------------+-----------------------------------------------------------------+
+------------+-----------------------------------------------------------------+
| Parameter  | `RDP Sessions`                                                  |
+------------+-----------------------------------------------------------------+
| Registry   | `LRS.map_rdp`                                                   |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | **enabled** (default) / disabled                                |
+------------+-----------------------------------------------------------------+
+------------+-----------------------------------------------------------------+
| Parameter  | `2X Sessions`                                                   |
+------------+-----------------------------------------------------------------+
| Registry   | `LRS.map_twox`                                                  |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | enabled / **disabled** (default)                                |
+------------+-----------------------------------------------------------------+
+------------+-----------------------------------------------------------------+
| Parameter  | `NX Client Sessions`                                            |
+------------+-----------------------------------------------------------------+
| Registry   | `LRS.map_nxclient`                                              |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | enabled / **disabled** (default)                                |
+------------+-----------------------------------------------------------------+
+------------+-----------------------------------------------------------------+
| Parameter  | `LRS Output Management`                                         |
+------------+-----------------------------------------------------------------+
| Registry   | `services.printing_lrs.enabled`                                 |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | **enabled** (default) / disabled                                |
+------------+-----------------------------------------------------------------+

Resolved Issues
--------------------------------------------------------------------------------

### Firefox

* Fixed possibility to have more than one Firefox session running  
  which effectively was prevented by app-armor lacking  
  an additional exception for the Firefox 102 esr.
* Fixed possibility to handle ica files required to start  
  Citrix sessions by restoring the former Firefox behavior.  
  Thus download of temporary files which have a dedicated  
  handler can be made even when file download in general  
  is be forbidden for the user.
```

-----

## 2023-04-12 - [11.08.294](readme11.08.294.txt)

```
The new PRIVATE BUILD 11.08.294 for IGEL Workspace is ready.

This build is based on 11.08.290.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

New Features
--------------------------------------------------------------------------------

### Cisco JVDI Client
* Added  Cisco JVDI 14.1.2
```

-----

## 2023-03-31 - [11.08.292](readme11.08.292.txt)

```
The new PRIVATE BUILD 11.08.292 for IGEL Workspace is ready.

This build is based on 11.08.290.

********************************************************************************
Do not share this build unless you have customers who need one of
the integrated features or bugfixes.
 
Please keep in mind a Private Build is a fully supported firmware!
********************************************************************************
These are the release notes published with that release:

Known Issues
--------------------------------------------------------------------------------

### Citrix

* To launch multiple desktop sessions with Citrix HDX RTME and Citrix H.264  
  acceleration plugin, the following registry key needs to be enabled:
+------------+-----------------------------------------------------------------+
|Parameter   |`Activate workaround for dual RTME sessions and H264 acceleration` |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.workaround-dual-rtme`                                       |
+------------+-----------------------------------------------------------------+
|Range       |enabled / **disabled** (default)                                 |
+------------+-----------------------------------------------------------------+
* This workaround is not applicable when \\"Enable Secure ICA\\" is active for the  
  specific delivery group.
* Adding smartcard readers during running / active session does not work. The
  reader is visible, but cannot be used due to unknown reader status. Only
  relevant for CWA versions earlier than 2112.
* There are known issues with GStreamer 1.0 in combination with Citrix. These
  occure with multimedia redirection of H.264, MPEG1 and MPEG2. (GStreamer 1.0
  is used if browser content redirection is enabled active.)
* Browser content redirection does not work when DRI3 and hardware accelerated
  H.264 deep compression codec is enabled.
* Enabled DRI3 on an AMD GPU with enabled Citrix H.264 acceleration could lead
  to a freeze. Selective H.264 mode (API v2) is not affected from this issue.  
* Citrix H.264 acceleration plugin does not work with **enabled** server policy
  \\"Optimize for 3D graphics workload\\" in combination with server policy \\"Use
  video codec compression\\" -> *\\"For the entire screen\\"**.
* Currently H.264 for Citrix sessions cannot be used in parallel with video
  input acceleration.
* While starting Self-Service, it is possible that process ServiceRecord
  segfaults -> Self-Service cannot be started afterwards.  
  A cache cleanup with reboot is needed. In addition, the following parameters
  should set to true.
+------------+-----------------------------------------------------------------+
|Parameter   |`Clean up UI cache after Self-Service termination`               |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.selfservice.cleanupwebui`                                   |
+------------+-----------------------------------------------------------------+
|Value       |**false** (default)/true                                         |
+------------+-----------------------------------------------------------------+
|Parameter   |`Clean up Store cache after Self-Service termination`            |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.selfservice.cleanupstore`                                   |
+------------+-----------------------------------------------------------------+
|Value       |**false** (default)/true                                         |
+------------+-----------------------------------------------------------------+
* Logoff of Self-Service causes a segfault with CWAL 2211 which ends the
  application. Restart of Self-Service is functional.
* Browser Content Redirection (BCR) may not work with Chrome version 105.0.* or
  later
* White/ green fragments may appear during desktop launch, if JPEG graphical
  codec is used, 

### OSC Installer
* OSC not deployable with IGEL Deployment Appliance: Version 11.3 or later is
  required for deploying IGEL OS 11.06. and following.

### AVD
* AVD MS-Teams optimization can crash the AVD client if H264 software decoder is
  used (fluh264dec). AVD prefers the hardware decoders (fluvadec) but when there
  are no hardware decoders or when all hardware decoders are in use already, the
  software decoder is utilized which may randomly crash the AVD client. It is
  likely when it crashes in a certain MS-Teams call, it might crash quite soon
  again when rejoining the same call. A fix for that is in development. A
  workaround is to disable incoming video in such MS-Teams calls, which is an
  option in the \\"...\\" menu from the control bar during an active call.
* H.264 hardware decoding for MS-Teams optimization is currently limited to non-
  AMD devices due to stability issues on AMD devices.

### VMware Horizon
* After disconnect of an RDP-based session, the Horizon main window which
  contains the server or sessions overview, cannot be resized anymore.
* Copying text from Horizon Blast sessions is not possible.
* The on-screen keyboard in Horizon appliance mode does not work correctly with
  local logon.  
  It is necessary to switch off local logon and enable the following two keys
  via IGEL registry:  
  userinterface.softkeyboard.autoshow  
  userinterface.softkeyboard.autohide
* Zoom VDI Media Plugin versions below 5.8.0 make Horizon Client crash upon
  connection to the remote desktop when TCSetup is running at the same time.
* With usage of PCoIP protocol, the virtual channel provided by VMware used for
  serial port and scanner redirection could freeze on logout from remote
  session.  
  
  This happens only with enabled scanner or serial port redirection.  
  The freeze does not occur if both redirection methods are enabled or none of
  them. The Blast Protocol is not affected by this bug.  
  
  The respective settings can be found in the IGEL Registry:  
  vmware.view.enable-serial-port-redir  
  vmware.view.enable-scanner-redir
* Keyboard Input Source Language Synchronization works only with usage of local
  layout and deadkeys enabled.  
  If a keyboard layout is used which has deadkeys disabled (which is the default
  on IGEL OS), Horizon client falls back to en-US layout.
* PCoIP sessions may crash in some cases, switch to Blast Protocol is
  recommended then. H.264/HEVC encoding can be disabled when overall performance
  is too low.
* Client drive mapping and USB redirection for storage devices can be enabled at
  the same time, but this could lead to sporadic problems.  
  Horizon Client tracks the drives which are dynamically mounted and adds them
  to the remote session using client drive mapping, means USB redirection is not
  used for theses devices then.  
  However, in case of devices like USB SD card readers, Horizon does not map
  them as client drives but forcefully uses USB-redirection which results in an
  unclean unmount.  
  As a work-around, the IDs of these card readers can be added to IGEL USB
  access rules and denied.

### Parallels Client
* Attached storage devices appear as network drives in the remote session  
* USB device redirection is considered as experimental for the Parallels client
  for Linux

### Firefox
* With enabled Citrix Browser Content Redirection, Firefox has no H.264 and AAC
  multimedia codec support. Means, when codec support is needed in Firefox, BCR
  needs to be disabled. Citrix Browser Content Redirection is disabled by
  default.
* Multimedia playback in Firefox is unstable if GStreamer version 0.10 is
  active. The default GStreamer version for Firefox
  sessions.browser\\<inst>.gstreamer_version was set to 1.0.

### Network
* Wakeup from system suspend fails on DELL Latitude 5510
* If applications are configured to start after established network connection
  and network mounts are configured, spurious \\"Failed to start application\\"
  notifications may be shown. The applications still start.
* Set of credentials for manual system wide proxy is broken.

### WiFi
* TP-Link Archer T2UH WiFi adapters does not work after system suspend/resume.
  Workaround: Disable system suspend at IGEL Setup > System > Power Options >
  Shutdown.

### Cisco JVDI Client
* There may be a segfault shown in the logs (during logout of Citrix Desktop
  session). Occurs only when using Citrix Workspace App 2010 and Cisco JVDI.

### Base system
* Hyper-V (Generation 2) needs a lot of memory (RAM). The machine needs a
  sufficient amount of memory allocated.
* Update from memory stick requires network online state (at least when multiple
  update stages are triggered / necessary)

### Conky
* The right screen when using multiscreen environment may not be shown
  correctly.  
  Workaround: The horizontal offset should be set to the width of the monitor
  (e.g. if the monitor has a width of 1920, the offset should be set to 1920)

### Firmware update
* On devices with 2 GB of flash storage it could happen that there is not enough
  space for updating all features. In this case, a corresponding error message
  occurs. Please visit [https://kb.igel.com/igelos-11.04/en/error-not-enough-
  space-on-local-drive-when-updating-to-igel-os-11-04-or-higher-32870765.html]
  for a possible solution and additional information.

### Appliance Mode
* When ending a Citrix session in browser appliance mode, the browser is
  restarted twice (instead of once).
* Appliance mode RHEV/Spice: spice-xpi firefox plugin is no longer supported.
  The \\"Console Invocation\\" has to allow 'Native' client (auto is also possible)
  and should be started in fullscreen to prevent any opening windows.
* Browser Appliance mode can fail when the Web URL contains special control
  characters like ampersand (& character).  
  Workaround: Add quotes at the beginning and the end of an affected URL. E.g.:  
  'https://www.google.com/search?q=aSearchTerm&source=lnms&tbm=isch'

### Audio
* IGEL UD2 (D220) fails to restore the volume level of the speaker when the
  device used firmware version 11.01.110 before.
* Audio jack detection on Advantec POC-W243L does not work. Therefore, sound
  output goes through a possibly connected headset and also the internal
  speakers.
* UD3-M340C: Sound preferences are showing Headphone & Microphone, although not
  connected.

### Multimedia
* Multimedia redirection with GStreamer could fail when using Nouveau GPU
  driver.

### Hardware
* Some newer Delock 62599 active DisplayPort to DVI (4k) adapters only work on
  INTEL-based devices.
* Wake up from suspend via UMS does not work on HP mt645 devices. Workaround:
  Disable system suspend and use shutdown instead.

### Remote Management
* AIT feature with IGEL Starter License is only supported by UMS version
  6.05.100 or newer.
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
