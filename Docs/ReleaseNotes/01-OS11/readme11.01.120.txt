
IGEL OS(RPI4)  
=============

Firmware version 11.01.120  
Release date 2021-07-14  
Last update of this document 2021-07-14  


Supported Devices  
-------------------------------------------------------------------------------

UC3-RPI4 NComputing RX420/RX440  


Component Versions
-------------------------------------------------------------------------------

+-------------------------------------------+----------------------------------+
| Clients                                   |                                  |
+===========================================+==================================+
| Chromium (experimental)                   | 86.0.4240.197-rpt1               |
+-------------------------------------------+----------------------------------+
| Citrix Workspace App                      | 20.06.0.15                       |
+-------------------------------------------+----------------------------------+
| Citrix Workspace App                      | 20.10.0.6                        |
+-------------------------------------------+----------------------------------+
| Citrix Workspace App                      | 21.04.0.11                       |
+-------------------------------------------+----------------------------------+
| Citrix Workspace Hub                      | 19.11.100.297                    |
+-------------------------------------------+----------------------------------+
| Open VPN                                  | 2.4.4-2ubuntu1.3                 |
+-------------------------------------------+----------------------------------+
| Zulu JRE                                  | 8.48.0.51-2                      |
+-------------------------------------------+----------------------------------+

+-------------------------------------------+----------------------------------+
| Dictation                                 |                                  |
+===========================================+==================================+
| Philips Speech driver                     | 12.9.2                           |
+-------------------------------------------+----------------------------------+


+-------------------------------------------+----------------------------------+
| Smartcard                                 |                                  |
+===========================================+==================================+
| PKCS#11 Library OpenSC                    | 0.20.0-3igel37                   |
+-------------------------------------------+----------------------------------+
| Reader Driver ACS CCID                    | 1.1.6-1igel2                     |
+-------------------------------------------+----------------------------------+
| Reader Driver MUSCLE CCID                 | 1.4.31-1igel10                   |
+-------------------------------------------+----------------------------------+
| Reader Driver REINER SCT cyberJack        | 3.99.5final.sp13igel15           |
+-------------------------------------------+----------------------------------+
| Resource Manager PC/SC Lite               | 1.8.26-3igel14                   |
+-------------------------------------------+----------------------------------+


+-------------------------------------------+----------------------------------+
| System Components                         |                                  |
+===========================================+==================================+
| OpenSSL                                   | 1.0.2n-1ubuntu5.4                |
+-------------------------------------------+----------------------------------+
| OpenSSL                                   | 1.1.1-1ubuntu2.1~18.04.6         |
+-------------------------------------------+----------------------------------+
| OpenSSH Client                            | 7.6p1-4ubuntu0.3                 |
+-------------------------------------------+----------------------------------+
| OpenSSH Server                            | 7.6p1-4ubuntu0.3                 |
+-------------------------------------------+----------------------------------+
| Bluetooth Stack (bluez)                   | 5.52-1igel6                      |
+-------------------------------------------+----------------------------------+
| MESA OpenGL Stack                         | 20.2.3-1igel128                  |
+-------------------------------------------+----------------------------------+
| MESA OpenGL Stack                         | 20.2.3-1igel128                  |
+-------------------------------------------+----------------------------------+
| VDPAU Library Version                     | 1.4-1igel1003                    |
+-------------------------------------------+----------------------------------+
| Graphics Driver FBDEV                     | 0.5.0-1igel1012                  |
+-------------------------------------------+----------------------------------+
| Graphics Driver VESA                      | 2.4.0-1igel1010                  |
+-------------------------------------------+----------------------------------+
| Input Driver Evdev                        | 2.10.6-1igel1011                 |
+-------------------------------------------+----------------------------------+
| Input Driver Synaptics                    | 1.9.1-1ubuntu1igel1009           |
+-------------------------------------------+----------------------------------+
| Input Driver Wacom                        | 0.36.1-0ubuntu2igel1017          |
+-------------------------------------------+----------------------------------+
| Kernel                                    | Linux version 5.9.3-v8~IGEL #1   |
+-------------------------------------------+----------------------------------+
| Xorg X11 Server                           | 1.20.8-2igel1055                 |
+-------------------------------------------+----------------------------------+
| CUPS Printing Daemon                      | 2.2.7-1ubuntu2.8igel32           |
+-------------------------------------------+----------------------------------+
| Lightdm Graphical Login Manager           | 1.26.0-0ubuntu1igel12            |
+-------------------------------------------+----------------------------------+
| XFCE4 Window Manager                      | 4.14.2-1~18.04igel1595331607     |
+-------------------------------------------+----------------------------------+
| ISC DHCP Client                           | 4.3.5-3ubuntu7.1                 |
+-------------------------------------------+----------------------------------+
| NetworkManager                            | 1.18.0-1ubuntu5igel92            |
+-------------------------------------------+----------------------------------+
| ModemManager                              | 1.10.0-1~ubuntu18.04.2           |
+-------------------------------------------+----------------------------------+
| GStreamer 1.x                             | 1.18.1-1igel272                  |
+-------------------------------------------+----------------------------------+
| WebKit2Gtk                                | 2.28.4-0ubuntu0.18.04.1          |
+-------------------------------------------+----------------------------------+
| Python2                                   | 2.7.17                           |
+-------------------------------------------+----------------------------------+
| Python3                                   | 3.6.9                            |
+-------------------------------------------+----------------------------------+

+-------------------------------------------+----------------------------------+
| Features with Limited IGEL Support        |                                  |
+===========================================+==================================+
| Mobile Device Access USB (MTP)            | 1.1.17-3igel5                    |
+-------------------------------------------+----------------------------------+
| Mobile Device Access USB (imobile)        | 1.2.1~git20191129.9f79242-1+b1igel8 |
+-------------------------------------------+----------------------------------+
| Mobile Device Access USB (gphoto)         | 2.5.25-3igel5                    |
+-------------------------------------------+----------------------------------+


+--------------------------------------------------------------------------------+
| Service Partitions       | Size   | Services                                   |
+================================================================================+
| Java SE Runtime          | 129.5M | Java SE Runtime Environment                |
| Environment              |        |                                            |
+--------------------------------------------------------------------------------+
| Citrix ICA               |  89.2M | Citrix Workspace app                       |
|                          |        | Citrix StoreFront                          |
|                          |        | Citrix Workspace Hub                       |
+--------------------------------------------------------------------------------+
| Internet Printing        |  21.8M | Printing (Internet printing protocol CUPS) |
| Protocol (CUPS)          |        |                                            |
+--------------------------------------------------------------------------------+
| Multimedia Codecs        |   2.8M | Multimedia Codecs                          |
+--------------------------------------------------------------------------------+
| Hardware Video           | 256.0K | Hardware Video Acceleration                |
| Acceleration             |        |                                            |
+--------------------------------------------------------------------------------+
| Extra Fonts              |   1.0M | Extra Font Package                         |
+--------------------------------------------------------------------------------+
| Local browser (Chromium) | 127.5M | Local Browser (Chromium)                   |
+--------------------------------------------------------------------------------+
| Limited Support Features | 256.0K | Mobile Device Access USB (Limited support) |
|                          |        | Limited Support Features                   |
+--------------------------------------------------------------------------------+
| Mobile Device Access USB | 512.0K | Mobile Device Access USB (Limited support) |
+--------------------------------------------------------------------------------+

Release Notes 11.01.120 (Based On 11.01.111)
--------------------------------------------------------------------------------


Security Fixes
--------------------------------------------------------------------------------


### Base system

* Fixed user logoff when device is switched into system suspend.

Known Issues
--------------------------------------------------------------------------------


### Citrix

* Adding smart card readers while the session is ongoing does not work. The
  reader is visible, but cannot be used due to permanently unknown reader
  status.
* Citrix Workspace Hub CitrixCasting is limited to 1920x1200 FullHD resolution.
* Limitations while running Citrix sessions with hardware accelerated H.264
  codec:  
* Notifications are not visible.  
* UMS enhanced messages are not visible.  
* In-Session or Citrix toolbar is not visible.  
* Window switching between local windows is not possible.  
* The maximum supported resolution is 2 x 1920x1200 FullHD. There are display
  corruptions with higher resolutions.  
* Rotated screens are not supported.  
* Seamless Windows are not supported.  
* The Citrix session is not visible via Shadowing.
* Workaround: Disable hardware accelerated H.264 codec:

+------------+-----------------------------------------------------------------+
|IGEL Setup  |Sessions > Citrix > Citrix Global > Codec                        |
+------------+-----------------------------------------------------------------+
|Parameter   |`Accelerated H.264 Deep Compression Codec`                       |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.hw-accelerated-h264-codec`                                  |
+------------+-----------------------------------------------------------------+
|Value       |**enabled** (default) / disabled                                 |
+------------+-----------------------------------------------------------------+

* Citrix Kerberos passthrough authentication is not supported.

### Network

* Wake on Lan is currently not supported on this platform.

### Base system

* Custom bootsplash configuration is not supported.

### X11 system

* It is not possible to hotplug monitors while system is running. Monitors must
  be already connected before turning on the device.

New Features
--------------------------------------------------------------------------------


### Citrix

* Integrated **Citrix Workspace app 21.04**. Available versions: 20.06, 20.10,
  21.04 (default)
* Improvements:  
* Faster startup of ctxusbd  
* More options with ctxlogd (ica.logging.setlog.level.**)  
* Paste screencopy into Citrix session
* New registry keys:  
* Added a registry key for enabling screen pinning or multi monitor support with
  native Workspace app.

+------------+-----------------------------------------------------------------+
|Parameter   |`Enhanced experience for Multi-monitor scenario`                 |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.authman.screenpinenabled`                                   |
+------------+-----------------------------------------------------------------+
|Value       |**on**ÿ(default)/off                                             |
+------------+-----------------------------------------------------------------+

* Added a registry key to enable DNS cache.

+------------+-----------------------------------------------------------------+
|Parameter   |`Enable DNS Cache`                                               |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.authman.dnscacheenabled`                                    |
+------------+-----------------------------------------------------------------+
|Value       |**off**ÿ(default)/on                                             |
+------------+-----------------------------------------------------------------+

* Fixed Issue: mic and webcam devices can be redirected using Browser Content
  Redirection.

+------------+-----------------------------------------------------------------+
|Parameter   |`Enables mic and webcam redirection using BCR`                   |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.allregions.cefenablemediadevices`                           |
+------------+-----------------------------------------------------------------+
|Value       | [Factory default is "**"] [False][True]                         |
+------------+-----------------------------------------------------------------+


Resolved Issues
--------------------------------------------------------------------------------


### Citrix

* Fixed Connection Center showing wrong entries.
* The NSAP virtual channel is loaded correctly and works as expected.

### Base system

* Fixed post session commands.

### Remote Management

* Bug fix related to viewing asset information on UMS.  
  
  Please note the Asset Inventory Tracker requires a valid license from the IGEL
  Enterprise Management Pack (EMP). For more information please check the IGEL
  Knowledge Base page:  
  
  https://kb.igel.com/endpointmgmt-6.07/en/view-asset-information-43107128.html


Release Notes 11.01.111 (Based On 11.01.110)
--------------------------------------------------------------------------------


Known Issues
--------------------------------------------------------------------------------


### Citrix

* Adding smart card readers while the session is ongoing does not work. The
  reader is visible, but cannot be used due to permanently unknown reader
  status.
* Citrix Workspace Hub CitrixCasting is limited to 1920x1200 FullHD resolution.
* Limitations while running Citrix sessions with hardware accelerated H.264
  codec:  
* Notifications are not visible.  
* UMS enhanced messages are not visible.  
* In-Session or Citrix toolbar is not visible.  
* Window switching between local windows is not possible.  
* The maximum supported resolution is 2 x 1920x1200 FullHD. There are display
  corruptions with higher resolutions.  
* Rotated screens are not supported.  
* The Citrix session is not visible via Shadowing.
* Workaround: Disable hardware accelerated H.264 codec:

+------------+-----------------------------------------------------------------+
| IGEL Setup | Sessions > Citrix > Citrix Global > Codec                       |
+------------+-----------------------------------------------------------------+
| Parameter  | `Accelerated H.264 Deep Compression Codec`                      |
+------------+-----------------------------------------------------------------+
| Registry   | `ica.hw-accelerated-h264-codec`                                 |
+------------+-----------------------------------------------------------------+
| Value      | **enabled** (default) / disabled                                |
+------------+-----------------------------------------------------------------+

* Citrix Kerberos passthrough authentication is not supported.

### Network

* Wake on Lan is currently not supported on this platform.

### Base system

* Custom bootsplash configuration is not supported.
* Post session commands are not supported in this release.

### X11 system

* It is not possible to hotplug monitors while system is running. Monitors must
  be already connected before turning on the device.

New Features
--------------------------------------------------------------------------------


### Chromium

* Added "Block third party cookies" as parameter in the registry.

### Base system

* Added support for the NComputing RX440(IGEL) device.

### Driver

* Added Philips Speech driver 12.9.2 for dictation via Citrix.

+------------+-----------------------------------------------------------------+
|Setup       |`Sessions>Citrix>Citrix Global>Mapping>Device Support            |
+------------+-----------------------------------------------------------------+
|Parameter   |`Philips speech channel for dictation`                           |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.module.virtualdriver.philipsspeech.enable`                  |
+------------+-----------------------------------------------------------------+
|Value       |**false** (default) / true                                       |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
|Setup       |`Sessions>Citrix>Citrix Global>Mapping>Device Support            |
+------------+-----------------------------------------------------------------+
|Parameter   |`DPM server drive`                                               |
+------------+-----------------------------------------------------------------+
|Registry    |`devices.philipsspeech.dpm_drive`                                |
+------------+-----------------------------------------------------------------+
|Value       |**P** (default)                                                  |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
|Setup       |`Sessions>Citrix>Citrix Global>Mapping>Device Support            |
+------------+-----------------------------------------------------------------+
|Parameter   |`SpeechAir server drive`                                         |
+------------+-----------------------------------------------------------------+
|Registry    |`devices.philipsspeech.speechair_drive`                          |
+------------+-----------------------------------------------------------------+
|Value       |**S** (default)                                                  |
+------------+-----------------------------------------------------------------+


Resolved Issues
--------------------------------------------------------------------------------


### Chromium

* Fixed a bug where browser certificates were lost after reboot if UMS was not
  reachable
* Fixed bug where chromium browser was not clearing browsing history properly.
* Fixed a bug for Chromium settings where parent settings did not influence the
  child settings

### Misc

* Fixed a bug in system messages where lines were cut off


Release Notes 11.01.110 (Based On 11.01.100)
--------------------------------------------------------------------------------


Known Issues
--------------------------------------------------------------------------------


### Citrix

* Adding smartcard readers during session does not work. The
  reader is visible, but cannot be used due to permanently unknown reader
  status.
* Kerberos passthrough authentication is not supported.
* Citrix Workspace Hub CitrixCasting is limited to 1920x1200 FullHD resolution.
* Limitations while running Citrix sessions with enabled hardware acceleration (H.264):  
   * Notifications are not visible.  
   * UMS enhanced messages are not visible.  
   * In-Session or Citrix toolbar is not visible.  
   * Toggle between local windows is not possible.  
   * The maximum supported resolution is 2 x 1920x1200 FullHD. There are display
     corruptions with higher resolutions.  
   * Rotated screens are not supported.  
   * The Citrix session is not visible via Shadowing.
* Workaround: Disable hardware accelerated H.264 codec:

+------------+-----------------------------------------------------------------+
| IGEL Setup | Sessions > Citrix > Citrix Global > Codec                       |
+------------+-----------------------------------------------------------------+
| Parameter  | `Accelerated H.264 Deep Compression Codec`                      |
+------------+-----------------------------------------------------------------+
| Registry   | `ica.hw-accelerated-h264-codec`                                 |
+------------+-----------------------------------------------------------------+
| Value      | **enabled** (default) / disabled                                |
+------------+-----------------------------------------------------------------+


### Base system

* Custom bootsplash configuration is not supported.

### X11 system

* It is not possible to hotplug monitors while system is running. Monitors must
  be already connected when boot.

### Network

* Wake on Lan is currently not supported on this platform.

New Features
--------------------------------------------------------------------------------

* Added support for Rasperry Pi revision 1.4
* Reworked naming for audio outputs


---


Release Notes 11.01.100


Known Issues
--------------------------------------------------------------------------------


### Hardware

* Raspberry PI Board Revision 1.4 is not supported. The device does not boot
  anymore - fixed with 11.01.110.


New Features
--------------------------------------------------------------------------------


### Citrix

* Integrated Citrix Workspace Hub 19.11 and WSH Chrome 0.0.3
* Added option to enable Workspace Hub

+------------+-----------------------------------------------------------------+
| IGEL Setup | Sessions > Citrix > Citrix Workspace Hub > Options              |
+------------+-----------------------------------------------------------------+
|Parameter   |`Citrix Workspace Hub (Beta)`                                    |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.workspacehub.enable`                                        |
+------------+-----------------------------------------------------------------+
|Value       |**disabled** (default)/ enabled                                  |
+------------+-----------------------------------------------------------------+

* Added a "friendly name" configuration for the Workspace Hub device. The empty
  string as a default will be replaced by the hostname of the device:

+------------+-----------------------------------------------------------------+
|Parameter   |`Friendly name for Workspace Hub device`                         |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.workspacehub.friendlyname`                                  |
+------------+-----------------------------------------------------------------+
|Value       | (empty string, default)                                         |
+------------+-----------------------------------------------------------------+

* Added autostart of WSH Chrome Launcher. If enabled using TC Setup
  Workspace Hub is also activated.

+------------+-----------------------------------------------------------------+
| IGEL Setup | Sessions > Citrix > Citrix Workspace Hub > Options              |
+------------+-----------------------------------------------------------------+
|Parameter   |`Autostart Citrix Workspace Hub Launcher`                        |
+------------+-----------------------------------------------------------------+
|Registry    |`sessions.workspacehub0.autostart`                               |
+------------+-----------------------------------------------------------------+
|Value       |**disabled** (default)/ enabled                                  |
+------------+-----------------------------------------------------------------+

* Added default launcher page URL:

+------------+-----------------------------------------------------------------+
| IGEL Setup | Sessions > Citrix > Citrix Workspace Hub > Options              |
+------------+-----------------------------------------------------------------+
|Parameter   |`URL for default launcher page`                                  |
+------------+-----------------------------------------------------------------+
|Registry    |`sessions.workspacehub0.launcher.page1.url`                      |
+------------+-----------------------------------------------------------------+
|Value       |**Default launcher page** (default)/"https://myworkprod0.cloud.com"/"https://www.igel.com"/"Enter url here..." |
+------------+-----------------------------------------------------------------+

* Added flag to activate a QR code at the launcher page/s:

+------------+-----------------------------------------------------------------+
| IGEL Setup | Sessions > Citrix > Citrix Workspace Hub > Options              |
+------------+-----------------------------------------------------------------+
|Parameter   |`Display QR code`                                                |
+------------+-----------------------------------------------------------------+
|Registry    |`sessions.workspacehub0.launcher.page1.qrcode`                   |
+------------+-----------------------------------------------------------------+
|Value       |**enabled** (default)/disabled                                   |
+------------+-----------------------------------------------------------------+

* Added hint to size the QR code:

+------------+-----------------------------------------------------------------+
| IGEL Setup | Sessions > Citrix > Citrix Workspace Hub > Options              |
+------------+-----------------------------------------------------------------+
|Parameter   |`QR code size`                                                   |
+------------+-----------------------------------------------------------------+
|Registry    |`sessions.workspacehub0.launcher.page1.qrcodesize`               |
+------------+-----------------------------------------------------------------+
|Value       |small/**medium** (default)/large                                 |
+------------+-----------------------------------------------------------------+

* Added hint to position the QR code

+------------+-----------------------------------------------------------------+
| IGEL Setup | Sessions > Citrix > Citrix Workspace Hub > Options              |
+------------+-----------------------------------------------------------------+
|Parameter   |`QR code position`                                               |
+------------+-----------------------------------------------------------------+
|Registry    |`sessions.workspacehub0.launcher.page1.qrcodeposition`           |
+------------+-----------------------------------------------------------------+
|Value       |top left/top right/bottom left/bottom right/**center** (default) |
+------------+-----------------------------------------------------------------+

* Added URL for a second launcher page:

+------------+-----------------------------------------------------------------+
| IGEL Setup | Sessions > Citrix > Citrix Workspace Hub > Options              |
+------------+-----------------------------------------------------------------+
|Parameter   |`URL for a second launcher page`                                 |
+------------+-----------------------------------------------------------------+
|Registry    |`sessions.workspacehub0.launcher.page2.url`                      |
+------------+-----------------------------------------------------------------+
|Value       |**Disabled** (default)/Default launcher page/"https://myworkprod0.cloud.com"/"https://www.igel.com"/"Enter url here..." |
+------------+-----------------------------------------------------------------+

* Added URL for a third launcher page:

+------------+-----------------------------------------------------------------+
| IGEL Setup | Sessions > Citrix > Citrix Workspace Hub > Options              |
+------------+-----------------------------------------------------------------+
|Parameter   |`URL for a third launcher page`                                  |
+------------+-----------------------------------------------------------------+
|Registry    |`sessions.workspacehub0.launcher.page3.url`                      |
+------------+-----------------------------------------------------------------+
|Value       |**Disabled** (default)/Default launcher page/"https://myworkprod0.cloud.com"/"https://www.igel.com"/"Enter url here..." |
+------------+-----------------------------------------------------------------+

* Integrated Citrix Workspace app 20.10  
  The performance of the Citrix Workspace app was improved and a more detailed
  logging was implemented.  
* New Feature added wth this release: multiple audio devices could be mapped
  inside the sessions.

+------------+-----------------------------------------------------------------+
|Parameter   |`Multiple Audio Device support`                                  |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.module.vdcamversion4support`                                |
+------------+-----------------------------------------------------------------+
|Value       |**disabled** (default)/ enabled                                  |
+------------+-----------------------------------------------------------------+

* Integrated centralized Citrix logging in IGEL OS, so only one parameter
  is needed to activate logging.

+------------+-----------------------------------------------------------------+
|Parameter   |`Enable logging for Citrix sessions`                             |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.logging.debug`                                              |
+------------+-----------------------------------------------------------------+
|Value       |**off** (default)/on                                             |
+------------+-----------------------------------------------------------------+

* Since Workspace app 20.09 the tool setlog is used to configure the logging.
  For this purpose parameters are provided in the registry ica.logging.setlog,
  but usually nothing needs to be changed.
* Added automatic configuration of the Citrix webcam redirection in ICA
  sessions.

+------------+-----------------------------------------------------------------+
| IGEL Setup |  Sessions > Citrix > Citrix Global > HDX Multimedia             |
+------------+-----------------------------------------------------------------+
|Parameter   |`Automatic HDX webcam configuration`                             |
+------------+-----------------------------------------------------------------+
| Registry   | `ica.igel_hdxwebcam.enabled`                                    |
+------------+-----------------------------------------------------------------+
| Value      | disabled / **enabled** (default)                                |
+------------+-----------------------------------------------------------------+
|Parameter   |`Resolution grade`                                               |
+------------+-----------------------------------------------------------------+
| Registry   | `ica.igel_hdxwebcam.quality`                                    |
+------------+-----------------------------------------------------------------+
| Range      | [Very low][Low][**Normal**(default)] [High][Very high][Best]    |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
|Parameter   |`Minimal frame rate`                                             |
+------------+-----------------------------------------------------------------+
| Registry   | `ica.igel_hdxwebcam.framerate`                                  |
+------------+-----------------------------------------------------------------+
| Value      | 20                                                              |
+------------+-----------------------------------------------------------------+

* Added configuration for h264 encoding in the Citrix webcam redirection

+------------+-----------------------------------------------------------------+
|Parameter   |`HDX Webcam H264 encoding`                                       |
+------------+-----------------------------------------------------------------+
| Registry   | `ica.wfclient.hdxh264inputenabled`                              |
+------------+-----------------------------------------------------------------+
| Value      | **disabled** (default) / enabled                                |
+------------+-----------------------------------------------------------------+

* Added configuration for native h264 encoding provided by webcam and used in
  the Citrix webcam redirection. This parameter requires the
  ica.wfclient.hdxh264inputenabled to be set to true.

+------------+-----------------------------------------------------------------+
|Parameter   |`HDX Webcam H264 native`                                         |
+------------+-----------------------------------------------------------------+
| Registry   | `ica.wfclient.hdxh264enablenative`                              |
+------------+-----------------------------------------------------------------+
| Value      | **disabled** (default) / enabled                                |
+------------+-----------------------------------------------------------------+


### Chromium

* Updated Chromium to version 86.0.4240.197-rpt1. Hardware accelerated video
  decoding is disabled by default now.

### Firmware update

* Added support for the IGEL automatic update service.

+------------+-----------------------------------------------------------------+
| Registry   | `update.service.enable`                                         |
+------------+-----------------------------------------------------------------+
| Value      | **enabled** (default) / disabled                                |
+------------+-----------------------------------------------------------------+

### Boot

* Boot mode selection during power on:  
   * Hold power button for 'Emergency boot (setup only)'  
   * Press hotkey 'Ctrl + Space' for 'Reset to defaults'  
   * Press hotkey 'Ctrl + V' for 'Verbose boot'


Resolved Issues
--------------------------------------------------------------------------------


### Citrix

* On Citrix Sessions with H.264 HW-Acceleration (default)
  TransparentKeypassThrough=Remote at AllRegions.ini is enabled to ensure all window
  manager keypress events are directed to the Citrix session.
* Added new parameter AckDelayThresh: Max time (in milliseconds) between sending
  "resource free" message if any resources free. Default=350

+------------+-----------------------------------------------------------------+
|Parameter   |`AckDelayThresh`                                                 |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.module.AckDelayThresh`                                      |
+------------+-----------------------------------------------------------------+
|Type        |Integer                                                          |
+------------+-----------------------------------------------------------------+
|Value       |**350** (default)                                                |
+------------+-----------------------------------------------------------------+

* Added new parameter AudioBufferSizeMilliseconds: Audio buffer size, in ms.
  Default=200 ms

+------------+-----------------------------------------------------------------+
|Parameter   |`AudioBufferSizeMilliseconds`                                    |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.module.AudioBufferSizeMilliseconds`                         |
+------------+-----------------------------------------------------------------+
|Type        |Integer                                                          |
+------------+-----------------------------------------------------------------+
|Value       |**200** (default)                                                |
+------------+-----------------------------------------------------------------+

* Added new parameter AudioLatencyControlEnabled: Enables latency control.
  Default=False

+------------+-----------------------------------------------------------------+
|Parameter   |`AudioLatencyControlEnabled`                                     |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.module.AudioLatencyControlEnabled`                          |
+------------+-----------------------------------------------------------------+
|Type        |Boolean                                                          |
+------------+-----------------------------------------------------------------+
|Value       |**false** (default)/true                                         |
+------------+-----------------------------------------------------------------+

* Added new parameter AudioMaxLatency: Sets the maximum latency (in ms) before
  trying to discard audio data. Default=300 ms

+------------+-----------------------------------------------------------------+
|Parameter   |`AudioMaxLatency`                                                |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.module.AudioMaxLatency`                                     |
+------------+-----------------------------------------------------------------+
|Type        |Integer                                                          |
+------------+-----------------------------------------------------------------+
|Value       |**300** (default)                                                |
+------------+-----------------------------------------------------------------+

* Added new parameter AudioLatencyCorrectionInterval: Defines how often to
  correct the latency (in ms). Default=300 ms

+------------+-----------------------------------------------------------------+
|Parameter   |`AudioLatencyCorrectionInterval`                                 |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.module.AudioLatencyCorrectionInterval`                      |
+------------+-----------------------------------------------------------------+
|Type        |Integer                                                          |
+------------+-----------------------------------------------------------------+
|Value       |**300** (default)                                                |
+------------+-----------------------------------------------------------------+

* Added new parameter AudioTempLatencyBoost: Sets the higher latency band (in
  ms) above the lower PlaybackDelayThresh band. Default=300 ms

+------------+-----------------------------------------------------------------+
|Parameter   |`AudioTempLatencyBoost`                                          |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.module.AudioTempLatencyBoost`                               |
+------------+-----------------------------------------------------------------+
|Type        |Integer                                                          |
+------------+-----------------------------------------------------------------+
|Value       |**300** (default)                                                |
+------------+-----------------------------------------------------------------+

* Added new parameter CommandAckThresh: Number of free client command buffers
  causing a "resource free" message to be sent to the server. Default=10

+------------+-----------------------------------------------------------------+
|Parameter   |`CommandAckThresh`                                               |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.module.CommandAckThresh`                                    |
+------------+-----------------------------------------------------------------+
|Type        |Integer                                                          |
+------------+-----------------------------------------------------------------+
|Value       |**10** (default)                                                 |
+------------+-----------------------------------------------------------------+

* Added new parameter DataAckThresh: Number of free client data buffers causing
  a "resource free" message to be sent to the server. Default=10

+------------+-----------------------------------------------------------------+
|Parameter   |`DataAckThresh`                                                  |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.module.DataAckThresh`                                       |
+------------+-----------------------------------------------------------------+
|Type        |Integer                                                          |
+------------+-----------------------------------------------------------------+
|Value       |**10** (default)                                                 |
+------------+-----------------------------------------------------------------+

* Added new parameter MaxDataBufferSize: Maximum size of each data buffer.
  Default=2048 bytes

+------------+-----------------------------------------------------------------+
|Parameter   |`MaxDataBufferSize`                                              |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.module.MaxDataBufferSize`                                   |
+------------+-----------------------------------------------------------------+
|Type        |Integer                                                          |
+------------+-----------------------------------------------------------------+
|Value       |**2048** (default)                                               |
+------------+-----------------------------------------------------------------+

* Added new parameter NumCommandBuffers: Number of client buffers to use for
  audio commands. Default=64

+------------+-----------------------------------------------------------------+
|Parameter   |`NumCommandBuffers`                                              |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.module.NumCommandBuffers`                                   |
+------------+-----------------------------------------------------------------+
|Type        |Integer                                                          |
+------------+-----------------------------------------------------------------+
|Value       |**64** (default)                                                 |
+------------+-----------------------------------------------------------------+

* Added new parameter PlaybackDelayThresh: Delay (in ms) between being asked to
  start audio playback and actually starting audio playback in order to build up
  a backlog of sound. Default=150

+------------+-----------------------------------------------------------------+
|Parameter   |`PlaybackDelayThresh`                                            |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.module.PlaybackDelayThresh`                                 |
+------------+-----------------------------------------------------------------+
|Type        |Integer                                                          |
+------------+-----------------------------------------------------------------+
|Value       |**150** (default)                                                |
+------------+-----------------------------------------------------------------+