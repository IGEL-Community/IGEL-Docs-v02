IGEL OS 11  
==========

Firmware version 11.09.100  
Release date 2023-10-12  
Last update of this document 2023-10-12  

[> IGEL Release Notes](https://kb.igel.com/igelos11/releasenotes)


Supported Devices  
-------------------------------------------------------------------------------

UD2-LX 52, UD2-LX 51, UD2-LX 50, UD2-LX 40  
UD3-LX 60, UD3-LX 51  
UD6-LX 51  
UD7-LX 20, UD7-LX 11, UD7-LX 10  

[> Supported IGEL OS 11 thirdparty devices](https://kb.igel.com/os11-supported-hardware)


Release Notes 11.09.100
--------------------------------------------------------------------------------


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


Component Versions
-------------------------------------------------------------------------------

+-------------------------------------------+----------------------------------+
| Clients                                   |                                  |
+===========================================+==================================+
| Amazon WorkSpaces Client                  | 4.1.0                            |
+-------------------------------------------+----------------------------------+
| Chromium                                  | 115.0.5790.170-2igel1695992905   |
+-------------------------------------------+----------------------------------+
| Cisco JVDI Client                         | 14.1.4                           |
+-------------------------------------------+----------------------------------+
| Cisco Webex VDI plugin                    | 43.6.0.26643                     |
+-------------------------------------------+----------------------------------+
| Cisco Webex Meetings VDI plugin           | 42.10.8.14                       |
+-------------------------------------------+----------------------------------+
| Cisco Webex Meetings VDI plugin           | 42.6.11.6                        |
+-------------------------------------------+----------------------------------+
| Cisco Webex Meetings VDI plugin           | 43.6.0.158                       |
+-------------------------------------------+----------------------------------+
| Zoom Media Plugin                         | 5.13.10.23090                    |
+-------------------------------------------+----------------------------------+
| Zoom Media Plugin                         | 5.14.10.23670                    |
+-------------------------------------------+----------------------------------+
| Zoom Media Plugin                         | 5.15.2.23760                     |
+-------------------------------------------+----------------------------------+
| Citrix HDX Realtime Media Engine          | 2.9.600                          |
+-------------------------------------------+----------------------------------+
| Citrix Workspace App                      | 20.10.0.6                        |
+-------------------------------------------+----------------------------------+
| Citrix Workspace App                      | 23.05.0.58                       |
+-------------------------------------------+----------------------------------+
| Citrix Workspace App                      | 23.07.0.17                       |
+-------------------------------------------+----------------------------------+
| deviceTRUST Citrix Channel                | 21.1.310.0                       |
+-------------------------------------------+----------------------------------+
| Crossmatch DP Citrix Channel              | 0125                             |
+-------------------------------------------+----------------------------------+
| Conky System Monitor                      | 1.12.2-1                         |
+-------------------------------------------+----------------------------------+
| ControlUp Agent                           | 8.1.5.500                        |
+-------------------------------------------+----------------------------------+
| deskMate Client                           | 2.1.3                            |
+-------------------------------------------+----------------------------------+
| DriveLock Agent                           | 22.2.2.42489                     |
+-------------------------------------------+----------------------------------+
| EPOS connect                              | 7.4.0.37727                      |
+-------------------------------------------+----------------------------------+
| Ericom PowerTerm                          | 14.0.3.71814                     |
+-------------------------------------------+----------------------------------+
| Evidian AuthMgr                           | 1.5.8134                         |
+-------------------------------------------+----------------------------------+
| Evince PDF Viewer                         | 42.3-0ubuntu3                    |
+-------------------------------------------+----------------------------------+
| FabulaTech Plugins                        | 3.10.1.5                         |
+-------------------------------------------+----------------------------------+
| FabulaTech USB for Remote Desktop         | 6.1.3.1                          |
+-------------------------------------------+----------------------------------+
| FabulaTech Scanner for Remote Desktop     | 3.3.0.2                          |
+-------------------------------------------+----------------------------------+
| FabulaTech Webcam for Remote Desktop      | 2.8.11                           |
+-------------------------------------------+----------------------------------+
| Firefox                                   | 115.2.1                          |
+-------------------------------------------+----------------------------------+
| IBM iAccess Client Solutions              | 1.1.9.2                          |
+-------------------------------------------+----------------------------------+
| IGEL RDP Client                           | 2.2igel1687350866                |
+-------------------------------------------+----------------------------------+
| IGEL AVD Client                           | 1.1.30igel1695044534             |
+-------------------------------------------+----------------------------------+
| deviceTRUST RDP Channel                   | 21.1.310.0                       |
+-------------------------------------------+----------------------------------+
| Imprivata OneSign ProveID Embedded        | onesign-generic-bootstrap-loader_7.12.0.688624_amd64 |
+-------------------------------------------+----------------------------------+
| Lakeside SysTrack Channel                 | 9.0                              |
+-------------------------------------------+----------------------------------+
| Login VSI Enterprise                      | 4.8.6                            |
+-------------------------------------------+----------------------------------+
| NCP Secure Enterprise Client              | 6.00_rev29368                    |
+-------------------------------------------+----------------------------------+
| NX Client                                 | 7.8.2-4igel1685535669            |
+-------------------------------------------+----------------------------------+
| Open VPN                                  | 2.6.3-2igel1684821787            |
+-------------------------------------------+----------------------------------+
| Zulu JRE                                  | 17.0.8-1                         |
+-------------------------------------------+----------------------------------+
| Parallels Client                          | 19.2.0.23906                     |
+-------------------------------------------+----------------------------------+
| Spice GTK (Red Hat Virtualization)        | 0.42-2igel1684932691             |
+-------------------------------------------+----------------------------------+
| Remote Viewer (Red Hat Virtualization)    | 11.0-2igel1661863477             |
+-------------------------------------------+----------------------------------+
| Usbredir (Red Hat Virtualization)         | 0.13.0-2igel1677968775           |
+-------------------------------------------+----------------------------------+
| SpeechWrite                               | 1.0                              |
+-------------------------------------------+----------------------------------+
| Stratusphere UX Connector ID Key software | 6.6.2-3                          |
+-------------------------------------------+----------------------------------+
| Systancia AppliDis                        | 6.1.4-17                         |
+-------------------------------------------+----------------------------------+
| HP Anyware PCoIP Software Client          | 23.01.1-18.04                    |
+-------------------------------------------+----------------------------------+
| ThinLinc Client                           | 4.14.0-2324                      |
+-------------------------------------------+----------------------------------+
| ThinPrint Client                          | 7-7.6.126                        |
+-------------------------------------------+----------------------------------+
| Parole Media Player                       | 4.16.0-3igel1686304269           |
+-------------------------------------------+----------------------------------+
| VNC Viewer                                | 1.12.0+dfsg-8igel1675065715      |
+-------------------------------------------+----------------------------------+
| VMware Horizon client                     | 2306-8.10.0-21964631             |
+-------------------------------------------+----------------------------------+
| Voip Client Ekiga                         | 4.0.1-9build1igel1685429059      |
+-------------------------------------------+----------------------------------+

+-------------------------------------------+----------------------------------+
| Dictation                                 |                                  |
+===========================================+==================================+
| Diktamen driver for dictation             | 2017/09/29                       |
+-------------------------------------------+----------------------------------+
| Grundig Business Systems dictation driver | 0.12/21-12-21                    |
+-------------------------------------------+----------------------------------+
| Nuance Audio Extensions for dictation     | B301                             |
+-------------------------------------------+----------------------------------+
| Olympus driver for dictation              | 4.0.4                            |
+-------------------------------------------+----------------------------------+
| Philips Speech driver                     | 13.2.3                           |
+-------------------------------------------+----------------------------------+


+-------------------------------------------+----------------------------------+
| Signature                                 |                                  |
+===========================================+==================================+
| Kofax SPVC Citrix Channel                 | 3.1.41.0                         |
+-------------------------------------------+----------------------------------+
| signotec Citrix Channel                   | 8.0.10                           |
+-------------------------------------------+----------------------------------+
| signotec VCOM Daemon                      | 2.0.0                            |
+-------------------------------------------+----------------------------------+
| StepOver TCP Client                       | 2.4.2                            |
+-------------------------------------------+----------------------------------+


+-------------------------------------------+----------------------------------+
| Smartcard                                 |                                  |
+===========================================+==================================+
| PKCS#11 Library A.E.T. SafeSign           | 3.6.0.0-AET.000                  |
+-------------------------------------------+----------------------------------+
| PKCS#11 Library Athena IDProtect          | 7-20210902                       |
+-------------------------------------------+----------------------------------+
| PKCS#11 Library cryptovision sc/interface | 8.0.13                           |
+-------------------------------------------+----------------------------------+
| PKCS#11 Library Thales SafeNet            | 10.8.1013                        |
+-------------------------------------------+----------------------------------+
| PKCS#11 Library OpenSC                    | 0.23.0-0.3igel1686055473         |
+-------------------------------------------+----------------------------------+
| PKCS#11 Library SecMaker NetID Enterprise | 6.8.5.20                         |
+-------------------------------------------+----------------------------------+
| PKCS#11 Library SecMaker NetID Client     | 1.1.0.37                         |
+-------------------------------------------+----------------------------------+
| PKCS#11 Library 90meter                   | 20190522                         |
+-------------------------------------------+----------------------------------+
| Reader Driver ACS CCID                    | 1.1.10-1igel1691506428           |
+-------------------------------------------+----------------------------------+
| Reader Driver HID Global Omnikey          | 4.3.3                            |
+-------------------------------------------+----------------------------------+
| Reader Driver Identive CCID               | 5.0.35                           |
+-------------------------------------------+----------------------------------+
| Reader Driver Identive eHealth200         | 1.0.5                            |
+-------------------------------------------+----------------------------------+
| Reader Driver Identive SCRKBC             | 5.0.24                           |
+-------------------------------------------+----------------------------------+
| Reader Driver MUSCLE CCID                 | 1.5.2-1igel1678006273            |
+-------------------------------------------+----------------------------------+
| Reader Driver REINER SCT cyberJack        | 3.99.5final.sp14-2igel1686635168 |
+-------------------------------------------+----------------------------------+
| Resource Manager PC/SC Lite               | 2.0.0-1igel1691065840            |
+-------------------------------------------+----------------------------------+
| Cherry USB2LAN Proxy                      | 3.2.0.3                          |
+-------------------------------------------+----------------------------------+


+-------------------------------------------+----------------------------------+
| System Components                         |                                  |
+===========================================+==================================+
| OpenSSL                                   | 1.0.2n-1ubuntu5.13igel1686114423 |
+-------------------------------------------+----------------------------------+
| OpenSSL                                   | 1.1.1f-1ubuntu2.19               |
+-------------------------------------------+----------------------------------+
| OpenSSL                                   | 3.0.2-0ubuntu1.10                |
+-------------------------------------------+----------------------------------+
| OpenSSH Client                            | 9.3p2-1igel1690097953            |
+-------------------------------------------+----------------------------------+
| OpenSSH Server                            | 9.3p2-1igel1690097953            |
+-------------------------------------------+----------------------------------+
| Bluetooth Stack (bluez)                   | 5.66-1igel1669186181             |
+-------------------------------------------+----------------------------------+
| MESA OpenGL Stack                         | 23.1.2-1igel1686636111           |
+-------------------------------------------+----------------------------------+
| VDPAU Library Version                     | 1.5-2igel1677954724              |
+-------------------------------------------+----------------------------------+
| Graphics Driver INTEL                     | 2.99.917+git20210115-1igel1654609037 |
+-------------------------------------------+----------------------------------+
| Graphics Driver ATI/RADEON                | 19.1.0-3igel1657777718           |
+-------------------------------------------+----------------------------------+
| Graphics Driver ATI/AMDGPU                | 23.0.0-1igel1677481842           |
+-------------------------------------------+----------------------------------+
| Graphics Driver Nouveau (Nvidia Legacy)   | 1.0.17-2igel1654608979           |
+-------------------------------------------+----------------------------------+
| Graphics Driver Nvidia                    | 525.125.06-0ubuntu0.22.04.1      |
+-------------------------------------------+----------------------------------+
| Graphics Driver VMware                    | 13.3.0-3igel1654607153           |
+-------------------------------------------+----------------------------------+
| Graphics Driver QXL (Spice)               | 0.1.6-1igel1687782644            |
+-------------------------------------------+----------------------------------+
| Graphics Driver FBDEV                     | 0.5.0-2igel1654609009            |
+-------------------------------------------+----------------------------------+
| Graphics Driver VESA                      | 2.5.0-1+b1igel1647004096         |
+-------------------------------------------+----------------------------------+
| Input Driver Evdev                        | 2.10.6-2+b1igel1647004239        |
+-------------------------------------------+----------------------------------+
| Input Driver Elographics                  | 1.4.3-1igel1678083379            |
+-------------------------------------------+----------------------------------+
| Input Driver eGalax                       | 2.5.8825                         |
+-------------------------------------------+----------------------------------+
| Input Driver Synaptics                    | 1.9.2-1+b1igel1683803726         |
+-------------------------------------------+----------------------------------+
| Input Driver VMMouse                      | 13.1.0-1ubuntu2igel1628499891    |
+-------------------------------------------+----------------------------------+
| Input Driver Wacom                        | 1.2.0-1igel1686600941            |
+-------------------------------------------+----------------------------------+
| Input Driver ELO Multitouch               | 4.3.0.0                          |
+-------------------------------------------+----------------------------------+
| Input Driver ELO Singletouch              | 5.2                              |
+-------------------------------------------+----------------------------------+
| Kernel                                    | 6.1.42 #mainline-lxos-g1696246906 |
+-------------------------------------------+----------------------------------+
| Xorg X11 Server                           | 21.1.7-3igel1683808186           |
+-------------------------------------------+----------------------------------+
| Xorg Xephyr                               | 21.1.7-3igel1683808186           |
+-------------------------------------------+----------------------------------+
| CUPS Printing Daemon                      | 2.4.2-5igel1687852452            |
+-------------------------------------------+----------------------------------+
| PrinterLogic                              | 25.1.0.637                       |
+-------------------------------------------+----------------------------------+
| Lightdm Graphical Login Manager           | 1.30.0-0ubuntu5igel1685475374    |
+-------------------------------------------+----------------------------------+
| XFCE4 Window Manager                      | 4.14.5-1~18.04igel1643191202     |
+-------------------------------------------+----------------------------------+
| ISC DHCP Client                           | 4.4.1-2.3ubuntu2.4               |
+-------------------------------------------+----------------------------------+
| NetworkManager                            | 1.42.4-1igel1692869696           |
+-------------------------------------------+----------------------------------+
| ModemManager                              | 1.20.6-2igel1693224023           |
+-------------------------------------------+----------------------------------+
| GStreamer 1.x                             | 1.22.4-1igel1690179327           |
+-------------------------------------------+----------------------------------+
| Gstreamer 1.0 Fluendo aacdec              | 1.0.1                            |
+-------------------------------------------+----------------------------------+
| Gstreamer 1.0 Fluendo asfdemux            | 1.0.1                            |
+-------------------------------------------+----------------------------------+
| Gstreamer 1.0 Fluendo h264dec             | 1.0.4                            |
+-------------------------------------------+----------------------------------+
| Gstreamer 1.0 Fluendo mp3dec              | 1.0.1                            |
+-------------------------------------------+----------------------------------+
| Gstreamer 1.0 Fluendo mpeg4videodec       | 1.0.1                            |
+-------------------------------------------+----------------------------------+
| Gstreamer 1.0 Fluendo vadec               | 1.0.2                            |
+-------------------------------------------+----------------------------------+
| Gstreamer 1.0 Fluendo wmadec              | 1.0.1                            |
+-------------------------------------------+----------------------------------+
| Gstreamer 1.0 Fluendo wmvdec              | 1.0.1                            |
+-------------------------------------------+----------------------------------+
| WebKit2Gtk                                | 2.40.5-1igel1691399103           |
+-------------------------------------------+----------------------------------+
| Python2                                   | 2.7.18                           |
+-------------------------------------------+----------------------------------+
| Python3                                   | 3.10.12                          |
+-------------------------------------------+----------------------------------+

+-------------------------------------------+----------------------------------+
| VM Guest Support Components               |                                  |
+===========================================+==================================+
| Virtualbox Guest Utils                    | 7.0.8-dfsg-2igel1682408222       |
+-------------------------------------------+----------------------------------+
| Virtualbox X11 Guest Utils                | 7.0.8-dfsg-2igel1682408222       |
+-------------------------------------------+----------------------------------+
| Open VM Tools                             | 12.1.5-3~ubuntu0.22.04.1         |
+-------------------------------------------+----------------------------------+
| Open VM Desktop Tools                     | 12.1.5-3~ubuntu0.22.04.1         |
+-------------------------------------------+----------------------------------+
| Xen Guest Utilities                       | 7.20.2-0ubuntu1~22.04.2          |
+-------------------------------------------+----------------------------------+
| Spice Vdagent                             | 0.22.1-3+b2igel1680584586        |
+-------------------------------------------+----------------------------------+
| Qemu Guest Agent                          | 8.0.4+dfsg-1igel1691991170       |
+-------------------------------------------+----------------------------------+

+-------------------------------------------+----------------------------------+
| Features with Limited IGEL Support        |                                  |
+===========================================+==================================+
| Mobile Device Access USB (MTP)            | 1.1.21-1igel1690183811           |
+-------------------------------------------+----------------------------------+
| Mobile Device Access USB (imobile)        | 1.3.0-6+b3igel1677964762         |
+-------------------------------------------+----------------------------------+
| Mobile Device Access USB (gphoto)         | 2.5.30-1igel1677966247           |
+-------------------------------------------+----------------------------------+
| VPN OpenConnect                           | 9.12-1igel1687783022             |
+-------------------------------------------+----------------------------------+
| Scanner support                           | 1.1.1-5                          |
+-------------------------------------------+----------------------------------+
| VirtualBox VM within IGEL OS              | 7.0.8-dfsg-2igel1682408222       |
+-------------------------------------------+----------------------------------+
| Virtual Background for Webcam             |                                  |
+-------------------------------------------+----------------------------------+


+---------------------------------------------+--------+------------------+
| Services                                    | Size   | Reduced Firmware |
+=============================================+========+==================+
| Asian Language Support                      |  22.0M | Included         |
+---------------------------------------------+--------+------------------+
| Java SE Runtime Environment                 |  54.5M | Included         |
+---------------------------------------------+--------+------------------+
| Citrix StoreFront                           | 678.2M | Included         |
| Citrix Workspace app                        |        |                  |
| Citrix Appliance                            |        |                  |
+---------------------------------------------+--------+------------------+
| Ericom PowerTerm InterConnect               |  10.0M | Included         |
+---------------------------------------------+--------+------------------+
| Media Player                                | 256.0K | Included         |
+---------------------------------------------+--------+------------------+
| Citrix Appliance                            |  86.8M | Included         |
| Local Browser (Firefox)                     |        |                  |
+---------------------------------------------+--------+------------------+
| VMware Horizon                              |   4.0M | Included         |
| RDP                                         |        |                  |
+---------------------------------------------+--------+------------------+
| Cendio ThinLinc                             |  11.0M | Included         |
+---------------------------------------------+--------+------------------+
| Printing (Internet printing protocol CUPS)  |  19.0M | Included         |
+---------------------------------------------+--------+------------------+
| NoMachine NX                                |  27.0M | Included         |
+---------------------------------------------+--------+------------------+
| VMware Horizon                              | 176.8M | Included         |
+---------------------------------------------+--------+------------------+
| Voice over IP (Ekiga)                       |   6.2M | Included         |
+---------------------------------------------+--------+------------------+
| Citrix Appliance                            | 768.0K | Included         |
+---------------------------------------------+--------+------------------+
| NCP Enterprise VPN Client                   |  11.8M | Not included     |
+---------------------------------------------+--------+------------------+
| Fluendo GStreamer Codec Plugins             |   3.2M | Included         |
+---------------------------------------------+--------+------------------+
| IBM i Access Client Solutions               | 134.8M | Not included     |
+---------------------------------------------+--------+------------------+
| Red Hat Enterprise Virtualization           |   2.8M | Included         |
+---------------------------------------------+--------+------------------+
| Parallels Client                            |   6.0M | Included         |
+---------------------------------------------+--------+------------------+
| NVIDIA graphics driver                      | 378.2M | Not included     |
+---------------------------------------------+--------+------------------+
| Imprivata Appliance                         |  32.8M | Included         |
+---------------------------------------------+--------+------------------+
| AppliDis                                    | 512.0K | Included         |
+---------------------------------------------+--------+------------------+
| Evidian AuthMgr                             |   2.8M | Included         |
+---------------------------------------------+--------+------------------+
| Hardware Video Acceleration                 |  14.5M | Included         |
+---------------------------------------------+--------+------------------+
| Extra Font Package                          |   1.0M | Included         |
+---------------------------------------------+--------+------------------+
| Fluendo GStreamer AAC Decoder               | 768.0K | Included         |
+---------------------------------------------+--------+------------------+
| x32 Compatibility Support                   |   4.2M | Included         |
+---------------------------------------------+--------+------------------+
| Cisco JVDI client                           |  63.2M | Included         |
+---------------------------------------------+--------+------------------+
| PrinterLogic                                |  38.0M | Not included     |
+---------------------------------------------+--------+------------------+
| Biosec BS Login                             |  10.0M | Not included     |
+---------------------------------------------+--------+------------------+
| Login VSI Login Enterprise                  |  28.8M | Not included     |
+---------------------------------------------+--------+------------------+
| Stratusphere UX CID Key software            |   5.5M | Not included     |
+---------------------------------------------+--------+------------------+
| Elastic Filebeat                            |  36.0M | Not included     |
+---------------------------------------------+--------+------------------+
| AVD                                         |  41.8M | Included         |
+---------------------------------------------+--------+------------------+
| Local Browser (Chromium)                    |  95.0M | Not included     |
+---------------------------------------------+--------+------------------+
| Amazon WorkSpaces Client                    |  32.5M | Included         |
+---------------------------------------------+--------+------------------+
| deskMate Client                             |   5.8M | Included         |
+---------------------------------------------+--------+------------------+
| Cisco Webex VDI                             | 104.5M | Not included     |
+---------------------------------------------+--------+------------------+
| Cisco Webex Meetings VDI                    | 193.8M | Not included     |
+---------------------------------------------+--------+------------------+
| Zoom Media Plugin                           | 161.8M | Not included     |
+---------------------------------------------+--------+------------------+
| DriveLock                                   |  13.0M | Included         |
+---------------------------------------------+--------+------------------+
| SpeechWrite Client                          | 256.0K | Included         |
+---------------------------------------------+--------+------------------+
| IGEL Agent for Imprivata                    | 768.0K | Included         |
+---------------------------------------------+--------+------------------+
| LRS Output Management                       | 256.0K | Included         |
+---------------------------------------------+--------+------------------+
| Fluendo Browser Codec Plugins               |  10.5M | Included         |
+---------------------------------------------+--------+------------------+
| HP Factory deployment documentation         |  88.5M | Included         |
+---------------------------------------------+--------+------------------+
| BIOS Tools                                  |   2.0M | Included         |
+---------------------------------------------+--------+------------------+
| HP Anyware Client                           |  18.5M | Included         |
+---------------------------------------------+--------+------------------+
| 90meter Smart Card Support                  | 256.0K | Included         |
+---------------------------------------------+--------+------------------+
| Limited Support Features                    | 256.0K | Not included     |
| Scanner support / SANE (Limited support)    |        |                  |
| VPN OpenConnect (Limited support)           |        |                  |
| Virtualbox (Limited support)                |        |                  |
| Virtual Background for Webcam (Limited IGEL |        |                  |
| Support)                                    |        |                  |
| Mobile Device Access USB (Limited support)  |        |                  |
+---------------------------------------------+--------+------------------+
| Mobile Device Access USB (Limited support)  | 256.0K | Not included     |
+---------------------------------------------+--------+------------------+
| VPN OpenConnect (Limited support)           |   1.2M | Not included     |
+---------------------------------------------+--------+------------------+
| Scanner support / SANE (Limited support)    |   9.2M | Not included     |
+---------------------------------------------+--------+------------------+
| Virtualbox (Limited support)                |  74.2M | Not included     |
+---------------------------------------------+--------+------------------+
| Virtual Background for Webcam (Limited IGEL |  47.8M | Included         |
| Support)                                    |        |                  |
+---------------------------------------------+--------+------------------+


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

* This workaround is not applicable when "Enable Secure ICA" is active for the  
  specific delivery group.
* Adding smartcard readers during running / active session does not work. The
  reader is visible, but cannot be used due to unknown reader status. Only
  relevant for CWA versions earlier than 2112.
* Browser Content Redirection (BCR) does not work if DRI3 and hardware
  accelerated H.264 deep compression codec is enabled.
* Citrix H.264 acceleration plugin does not work with **enabled** server policy
  "Optimize for 3D graphics workload" in combination with server policy "Use
  video codec compression" -> *"For the entire screen"**.
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
  The "Console Invocation" has to allow 'Native' client (auto is also possible)
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


