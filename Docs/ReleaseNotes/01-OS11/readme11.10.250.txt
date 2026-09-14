IGEL OS Creator  
===============

Firmware version 11.10.250  
Release date 2025-03-11  
Last update of this document 2025-03-11  


Supported Devices  
-------------------------------------------------------------------------------

UD2-LX 52, UD2-LX 51  
UD3-LX 60  
UD7-LX 20  

[> Supported IGEL OS 11 thirdparty devices](https://kb.igel.com/os11-supported-hardware)  


Component Versions
-------------------------------------------------------------------------------

+-------------------------------------------+----------------------------------+
| Clients                                   |                                  |
+===========================================+==================================+
| Zulu JRE                                  | 17.0.14-1                        |
+-------------------------------------------+----------------------------------+


+-------------------------------------------+----------------------------------+
| System Components                         |                                  |
+===========================================+==================================+
| OpenSSL                                   | 1.0.2n-1ubuntu5.13igel1686114423 |
+-------------------------------------------+----------------------------------+
| OpenSSL                                   | 1.1.1f-1ubuntu2.23               |
+-------------------------------------------+----------------------------------+
| OpenSSL                                   | 3.0.2-0ubuntu1.18                |
+-------------------------------------------+----------------------------------+
| Bluetooth Stack (bluez)                   | 5.79-1igel1732513543             |
+-------------------------------------------+----------------------------------+
| MESA OpenGL Stack                         | 24.2.8-1igel1736252923           |
+-------------------------------------------+----------------------------------+
| VDPAU Library Version                     | 1.5-2igel1677954724              |
+-------------------------------------------+----------------------------------+
| Graphics Driver INTEL                     | 2.99.917+git20210115-1igel1654609037 |
+-------------------------------------------+----------------------------------+
| Graphics Driver ATI/RADEON                | 22.0.0-1igel1704966675           |
+-------------------------------------------+----------------------------------+
| Graphics Driver ATI/AMDGPU                | 23.0.0-1igel1705669076           |
+-------------------------------------------+----------------------------------+
| Graphics Driver Nouveau (Nvidia Legacy)   | 1.0.17-2igel1654608979           |
+-------------------------------------------+----------------------------------+
| Graphics Driver VMware                    | 13.3.0-3igel1654607153           |
+-------------------------------------------+----------------------------------+
| Graphics Driver QXL (Spice)               | 0.1.6-1igel1687782644            |
+-------------------------------------------+----------------------------------+
| Graphics Driver FBDEV                     | 0.5.0-2igel1654609009            |
+-------------------------------------------+----------------------------------+
| Graphics Driver VESA                      | 2.6.0-1igel1704966930            |
+-------------------------------------------+----------------------------------+
| Input Driver Evdev                        | 2.11.0-1igel1738822597           |
+-------------------------------------------+----------------------------------+
| Input Driver Elographics                  | 1.4.3-1igel1678083379            |
+-------------------------------------------+----------------------------------+
| Input Driver Synaptics                    | 1.9.2-1+b1igel1683803726         |
+-------------------------------------------+----------------------------------+
| Input Driver VMMouse                      | 13.1.0-1ubuntu2igel1628499891    |
+-------------------------------------------+----------------------------------+
| Input Driver Wacom                        | 1.2.3-1igel1738566034            |
+-------------------------------------------+----------------------------------+
| Kernel                                    | 6.6.22 #mainline-lxos-g1738661271 |
+-------------------------------------------+----------------------------------+
| Xorg X11 Server                           | 21.1.15-2igel1736251484          |
+-------------------------------------------+----------------------------------+
| Lightdm Graphical Login Manager           | 1.30.0-0ubuntu5igel1685475374    |
+-------------------------------------------+----------------------------------+
| XFCE4 Window Manager                      | 4.14.5-1~18.04igel1643191202     |
+-------------------------------------------+----------------------------------+
| ISC DHCP Client                           | 4.4.1-2.3ubuntu2.4               |
+-------------------------------------------+----------------------------------+
| Python3                                   | 3.10.12                          |
+-------------------------------------------+----------------------------------+

+-------------------------------------------+----------------------------------+
| VM Guest Support Components               |                                  |
+===========================================+==================================+
| Virtualbox Guest Utils                    | 7.0.20-dfsg-1igel1726735257      |
+-------------------------------------------+----------------------------------+
| Virtualbox X11 Guest Utils                | 7.0.20-dfsg-1igel1726735257      |
+-------------------------------------------+----------------------------------+
| Open VM Tools                             | 12.3.5-3~ubuntu0.22.04.1         |
+-------------------------------------------+----------------------------------+
| Open VM Desktop Tools                     | 12.3.5-3~ubuntu0.22.04.1         |
+-------------------------------------------+----------------------------------+
| Xen Guest Utilities                       | 7.20.2-0ubuntu1~22.04.2          |
+-------------------------------------------+----------------------------------+
| Spice Vdagent                             | 0.22.1-4+b1igel1704922460        |
+-------------------------------------------+----------------------------------+
| Qemu Guest Agent                          | 9.2.0+ds-4igel1736508561         |
+-------------------------------------------+----------------------------------+


+-----------------------------+--------+------------------+
| Services                    | Size   | Reduced Firmware |
+=============================+========+==================+
| Java SE Runtime Environment |  53.2M | Included         |
+-----------------------------+--------+------------------+
| NVIDIA graphics driver      | 128.5M | Included         |
+-----------------------------+--------+------------------+




Release Notes of installable IGEL OS 11  
================================================================================

Firmware version 11.10.250  
Release date 2025-03-11  
Last update of this document 2025-03-11  


Supported Devices  
-------------------------------------------------------------------------------

UD2-LX 52, UD2-LX 51  
UD3-LX 60  
UD7-LX 20  

[> Supported IGEL OS 11 thirdparty devices](https://kb.igel.com/os11-supported-hardware)


Release Notes 11.10.250 (Based On 11.10.210)
--------------------------------------------------------------------------------


New Features
--------------------------------------------------------------------------------


### Citrix

* Integrated Citrix Workspace app 24.08.0.98
* New Features:  
* Enhanced virtual desktop screen resizing experience:

+------------+-----------------------------------------------------------------+
| Parameter  | Enhanced virtual desktop screen resizing experience             |
+------------+-----------------------------------------------------------------+
| Registry   | ica.wfclient.EnhancedResizingEnabled                            |
+------------+-----------------------------------------------------------------+
| Value      | false / true (default)                                          |
+------------+-----------------------------------------------------------------+

* Performance improvement of graphics usage by supporting OpenGL library:

+------------+-----------------------------------------------------------------+
| Parameter  | OpenGLEnabled                                                   |
+------------+-----------------------------------------------------------------+
| Registry   | ica.wfclient.OpenGLEnabled                                      |
+------------+-----------------------------------------------------------------+
| Value      | false (default) / true                                          |
+------------+-----------------------------------------------------------------+

* Performance improvement using H265 encoding (requires OpenGLEnabled=true):

+------------+-----------------------------------------------------------------+
| Parameter  | H265Enabled                                                     |
+------------+-----------------------------------------------------------------+
| Registry   | ica.wfclient.H265Enabled                                        |
+------------+-----------------------------------------------------------------+
| Value      | false (default) / true                                          |
+------------+-----------------------------------------------------------------+

* Multiple webcam resolutions support:

+------------+-----------------------------------------------------------------+
| Parameter  | HDXWebcamEnablePnp                                              |
+------------+-----------------------------------------------------------------+
| Registry   | ica.wfclient.hdxwebcamenablepnp                                 |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | true (default) / false                                          |
+------------+-----------------------------------------------------------------+

* Integrated Citrix Workspace app 24.11.0.85.  
* The default value for the parameter "ica.module.enableechocancellation" was
  set to True and thus corresponds to the Citrix default value.
* Citrix Workspace app for Linux ensures a smooth transition and prevents black
  screens and flickers when resizing or stretching your virtual desktop screen.  
  The two parameters ica.wfclient.DesktopLaunchEnhancement and
  ica.wfclient.EnhancedResizingEnabled are active by default.

+------------+-----------------------------------------------------------------+
| Parameter  | Enhanced desktop launch experience                              |
+------------+-----------------------------------------------------------------+
| Registry   | ica.wfclient.DesktopLaunchEnhancement                           |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | **true** (default)/ false                                       |
+------------+-----------------------------------------------------------------+

* Support for redirecting Human Interface Device (HID) devices from endpoint to
  Unified Communication SDK application on VDI

+------------+-----------------------------------------------------------------+
| Parameter  |    EnableHDI                                                    |
+------------+-----------------------------------------------------------------+
| Registry   | ica.teams.enablehid.enabled                                     |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | **false** (default)/ true                                       |
+------------+-----------------------------------------------------------------+

* The default value of the ica.wfclient.toolbarversion parameter has been
  changed to "New" to avoid random session interruptions when resizing the
  screen. This change will cause the newer Citrix toolbar to be used by default.  
* Support for further customization of the new connection bar and new available
  connection button

+------------+-----------------------------------------------------------------+
| Parameter  | SwitchDesktopButtonVisible                                      |
+------------+-----------------------------------------------------------------+
| Registry   | ica.wfclient.switchdesktopbuttonvisible                         |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | **true** (default)/ false                                       |
+------------+-----------------------------------------------------------------+
| Parameter  | FullscreenButtonVisible                                         |
+------------+-----------------------------------------------------------------+
| Registry   | ica.wfclient.FullscreenButtonVisible                            |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | **true** (default)/ false                                       |
+------------+-----------------------------------------------------------------+
| Parameter  | MultiMonitorSelectionEnabled                                    |
+------------+-----------------------------------------------------------------+
| Registry   | ica.wfclient.multimonitorselectionenabled                       |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | **true** (default)/ false                                       |
+------------+-----------------------------------------------------------------+

* The following 5 setlog parameters have been added.

+------------+-----------------------------------------------------------------+
| Parameter  | Google Analytics                                                |
+------------+-----------------------------------------------------------------+
| Registry   | ica.setlog.level.all_.an                                        |
+------------+-----------------------------------------------------------------+
| Parameter  | Multi Touch                                                     |
+------------+-----------------------------------------------------------------+
| Registry   | ica.setlog.level.all_.mtch                                      |
+------------+-----------------------------------------------------------------+
| Parameter  | Fido2                                                           |
+------------+-----------------------------------------------------------------+
| Registry   | ica.setlog.level.all_.fido2                                     |
+------------+-----------------------------------------------------------------+
| Parameter  | Service Continuity                                              |
+------------+-----------------------------------------------------------------+
| Registry   | ica.setlog.level.all_.svccont                                   |
+------------+-----------------------------------------------------------------+
| Parameter  | Storebrowse                                                     |
+------------+-----------------------------------------------------------------+
| Registry   | ica.setlog.level.all_.stb                                       |
+------------+-----------------------------------------------------------------+

* In this version Citrix identifies monitor 1 as 0, so the code has been
  adjusted with the following parameter to work exactly like previous workspace
  apps.

+------------+-----------------------------------------------------------------+
| Parameter  | Left Shift Monitor Number                                       |
+------------+-----------------------------------------------------------------+
| Registry   | ica.destination_window.downshiftmonitors                        |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | **true** (default)/ false                                       |
+------------+-----------------------------------------------------------------+


### AVD

* Updated AVD client to version 1.3.0

### Horizon

* Updated Horizon Client to version 2412-12437214089

### HID

* Added new registry keys to influence mouse acceleration settings:

+------------+-----------------------------------------------------------------+
| Parameter  | Use new mouse accel variant                                     |
+------------+-----------------------------------------------------------------+
| Registry   | userinterface.mouse.use_new_accel_variant                       |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | enabled / _disabled_ (default)                                  |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | Enable mouse acceleration (only for new accel variant)          |
+------------+-----------------------------------------------------------------+
| Registry   | userinterface.mouse.enable_acceleration                         |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | _enabled_ (default) / disabled                                  |
+------------+-----------------------------------------------------------------+


### CUPS Printing

* Updated Vasion Print (former PrinterLogic) Printer Installer Client to version
  25.2.0.16.
* Reset writable partition in case of IGEL OS updates but keep printer mapping.

### Cisco Webex

* Updated Cisco Webex VDI version to 44.12.1.31417

### Base system

* Support for migration to IGEL OS 12 for the trust-based license (GOV) version
  has been added.
* Updated the End User License Agreement (EULA) to the February 2025 version.

### Olympus

* Updated Olympus driver to 4.0.5 and added a new udev rule.  
* New device names mapping

+------------+-----------------------------------------------------------------+
| Old device name| New device name                                                 |
+============+=================================================================+
|   Olympus DS9000|   OM SYSTEM DS9100                                              |
+------------+-----------------------------------------------------------------+
|   Olympus RecMic II 4010p|   OM SYSTEM - RecMic II 4010n                                   |
+------------+-----------------------------------------------------------------+
|   Olympus RecMic II 4110s|   OM SYSTEM - RecMic II 4110n                                   |
+------------+-----------------------------------------------------------------+
|   Olympus RS28H|   OM SYSTEM RS28N                                               |
+------------+-----------------------------------------------------------------+
|   Olympus RS31H|    OM SYSTEM RS31N                                              |
+------------+-----------------------------------------------------------------+


### zoomvdi

* Updated Zoom Media Plugins for VDI to version 6.2.10.25600.

### Fabulatech

* Updated FabulaTech USB to version 6.2.1.8.  
* Updated FabulaTech Plugins to version 4.1.0.3.


Security Fixes
--------------------------------------------------------------------------------


### Chromium

* Fixed Chromium security issues CVE-2024-10488, CVE-2024-10487, CVE-2024-10231,
  CVE-2024-10230, CVE-2024-10229, CVE-2024-9966, CVE-2024-9965, CVE-2024-9964,
  CVE-2024-9963, CVE-2024-9962, CVE-2024-9961, CVE-2024-9960, CVE-2024-9959,
  CVE-2024-9958, CVE-2024-9957, CVE-2024-9956, CVE-2024-9955, CVE-2024-9954,
  CVE-2024-9603, CVE-2024-9602, CVE-2024-9370, CVE-2024-9369, CVE-2024-9123,
  CVE-2024-9122, CVE-2024-9121, CVE-2024-9120, CVE-2024-8909, CVE-2024-8908,
  CVE-2024-8907, CVE-2024-8906, CVE-2024-8905, CVE-2024-8904, CVE-2024-8639,
  CVE-2024-8638, CVE-2024-8637, CVE-2024-8636 and CVE-2024-7025.  
* Fixed Chromium security issues CVE-2024-8362, CVE-2024-7970, CVE-2024-8198,
  CVE-2024-8194, CVE-2024-8193, CVE-2024-8035, CVE-2024-8034, CVE-2024-8033,
  CVE-2024-7981, CVE-2024-7980, CVE-2024-7979, CVE-2024-7978, CVE-2024-7977,
  CVE-2024-7976, CVE-2024-7975, CVE-2024-7974, CVE-2024-7973, CVE-2024-7972,
  CVE-2024-7971, CVE-2024-7969, CVE-2024-7968, CVE-2024-7967, CVE-2024-7966,
  CVE-2024-7965 and CVE-2024-7964.
* Fixed chromium security issues CVE-2025-0451, CVE-2025-0445, CVE-2025-0444,
  CVE-2025-0762, CVE-2025-0612, CVE-2025-0611, CVE-2025-0448, CVE-2025-0447,
  CVE-2025-0446, CVE-2025-0443, CVE-2025-0442, CVE-2025-0441, CVE-2025-0440,
  CVE-2025-0439, CVE-2025-0438, CVE-2025-0437, CVE-2025-0436, CVE-2025-0435,
  CVE-2025-0434,  CVE-2025-0291, CVE-2024-12695, CVE-2024-12694, CVE-2024-12693,
  CVE-2024-12692, CVE-2024-12382, CVE-2024-12381, CVE-2024-12053,
  CVE-2024-11395, CVE-2024-11117, CVE-2024-11116, CVE-2024-11115,
  CVE-2024-11114, CVE-2024-11113, CVE-2024-11112, CVE-2024-11111,
  CVE-2024-11110, CVE-2024-10827 and CVE-2024-10826.  
* Updated Chromium browser to version 133.0.6943.53.

### Firefox

* Updated Firefox ESR to version 115.20  
    - Fix for mfsa2025-08, also known as CVE-2025-1009, CVE-2025-1010,
      CVE-2025-1012 and CVE-2025-1016.  
    - Fix for mfsa2025-03, also known as CVE-2025-0238 and CVE-2025-0242.  
    - Fix for mfsa2024-65, also known as CVE-2024-11691 and CVE-2024-11694.  
    - Fix for mfsa2024-57, also known as CVE-2024-10458, CVE-2024-10459 and
      CVE-2024-10463.


### Base system

* Fixed bind9 security issues CVE-2024-4076, CVE-2024-1975, CVE-2024-1737,
  CVE-2024-0760, CVE-2023-5679, CVE-2023-5517, CVE-2023-50868, CVE-2023-50387,
  CVE-2023-4408, CVE-2023-4236 and CVE-2023-3341.  
* Fixed python3.10 security issues CVE-2024-8088, CVE-2024-7592, CVE-2024-6923,
  CVE-2024-6232, CVE-2023-27043, CVE-2024-0450 and CVE-2023-6597.  
* Fixed openssl security issue CVE-2022-40735.  
* Fixed wget security issue CVE-2024-38428.  
* Fixed aom security issue CVE-2024-5171.  
* Fixed cups security issues CVE-2024-47175 and CVE-2024-35235.  
* Fixed krb5 security issues CVE-2024-37371 and CVE-2024-37370.  
* Fixed openvpn security issues CVE-2024-5594 and CVE-2024-28882.  
* Fixed wpa security issues CVE-2024-5290 and CVE-2023-52160.  
* Fixed ghostscript security issues CVE-2024-29511, CVE-2024-29509,
  CVE-2024-29508 and CVE-2024-29506.  
* Fixed zulu17-ca security issues CVE-2024-21131, CVE-2024-21138,
  CVE-2024-21140, CVE-2024-21145 and CVE-2024-21147.  
* Fixed gtk+2.0 security issue CVE-2024-6655.  
* Fixed gtk+3.0 security issue CVE-2024-6655.  
* Fixed openvpn security issue CVE-2024-5594.  
* Fixed qtbase-opensource-src security issue CVE-2024-39936.  
* Fixed python-zipp security issue CVE-2024-5569.  
* Fixed poppler security issue CVE-2024-6239.  
* Fixed openssl1.1 security issues CVE-2024-5535, CVE-2024-4741 and
  CVE-2024-2511.  
* Fixed openssh security issue CVE-2024-39894.  
* Fixed python3.10 security issues CVE-2024-4032 and CVE-2024-0397.  
* Fixed openssl security issues CVE-2024-6119, CVE-2024-5535, CVE-2024-4741,
  CVE-2024-4603 and CVE-2024-2511.  
* Fixed mysql-8.0 security issues CVE-2024-21185, CVE-2024-21179,
  CVE-2024-21177, CVE-2024-21173, CVE-2024-21171, CVE-2024-21165,
  CVE-2024-21163, CVE-2024-21162, CVE-2024-21142, CVE-2024-21134,
  CVE-2024-21130, CVE-2024-21129, CVE-2024-21127, CVE-2024-21125 and
  CVE-2024-20996.  
* Fixed gnome-shell security issue CVE-2024-36472.  
* Fixed orc security issue CVE-2024-40897.  
* Fixed postgresql-14 security issue CVE-2024-7348.  
* Fixed bubblewrap security issue CVE-2024-42472.  
* Fixed curl security issues CVE-2024-8096, CVE-2024-7264, CVE-2024-6874 and
  CVE-2024-6197.  
* Fixed vim security issues CVE-2024-43802, CVE-2024-43374 and CVE-2024-41957.  
* Fixed webkit2gtk security issues CVE-2024-44187, CVE-2024-40866,
  CVE-2024-27851, CVE-2024-27838, CVE-2024-27833, CVE-2024-27820,
  CVE-2024-27808, CVE-2024-23271, CVE-2024-4558, CVE-2024-40794, CVE-2024-40789,
  CVE-2024-40785, CVE-2024-40782, CVE-2024-40780, CVE-2024-40779, CVE-2024-40776
  and CVE-2024-27834.  
* Fixed ffmpeg security issues CVE-2024-7272 and CVE-2024-7055.  
* Fixed expat security issues CVE-2024-50602, CVE-2024-45492, CVE-2024-45491 and
  CVE-2024-45490.  
* Fixed tiff security issue CVE-2024-7006.  
* Fixed setuptools security issue CVE-2024-6345.  
* Fixed apparmor security issue CVE-2016-1585.  
* Fixed libvirt security issue CVE-2024-8235.  
* Fixed qemu security issues CVE-2024-8612, CVE-2024-4467, CVE-2024-7409 and
  CVE-2024-6505.  
* Fixed cups-filters security issues CVE-2024-47176 and CVE-2024-47076.  
* Fixed nano security issue CVE-2024-5742.  
* Fixed zulu17-ca security issues CVE-2023-42950, CVE-2024-25062,
  CVE-2024-21235, CVE-2024-21217, CVE-2024-21210 and CVE-2024-21208.  
* Fixed libheif security issues CVE-2024-25269, CVE-2023-49464, CVE-2023-49463,
  CVE-2023-49462, CVE-2023-49460 and CVE-2023-0996.  
* Fixed libvpx6 security issue CVE-2024-5197.  
* Fixed xorg-server security issue CVE-2024-9632.  
* Fixed python-urllib3 security issue CVE-2024-37891.
* Fixed libarchive security issue CVE-2024-20696.  
* Fixed curl security issues CVE-2024-9681 and CVE-2024-11053.  
* Fixed mpg123 security issue CVE-2024-10573.  
* Fixed libgd2 security issue CVE-2021-40812.  
* Fixed glib2.0 security issue CVE-2024-52533.  
* Fixed ghostscript security issues CVE-2024-46956, CVE-2024-46955,
  CVE-2024-46953, CVE-2024-46952 and CVE-2024-46951.  
* Fixed python3.10 security issue CVE-2024-9287.  
* Fixed mysql-8.0 security issues CVE-2025-21559, CVE-2025-21555,
  CVE-2025-21546, CVE-2025-21540, CVE-2025-21529, CVE-2025-21523,
  CVE-2025-21522, CVE-2025-21519, CVE-2025-21505, CVE-2025-21503,
  CVE-2025-21501, CVE-2025-21500, CVE-2025-21497, CVE-2025-21491,
  CVE-2025-21490, CVE-2024-21241, CVE-2024-21239, CVE-2024-21237,
  CVE-2024-21236, CVE-2024-21231, CVE-2024-21230, CVE-2024-21219,
  CVE-2024-21213, CVE-2024-21212, CVE-2024-21201, CVE-2024-21199,
  CVE-2024-21198, CVE-2024-21197, CVE-2024-21196, CVE-2024-21194 and
  CVE-2024-21193.  
* Fixed libsoup2.4 security issues CVE-2024-52532, CVE-2024-52531 and
  CVE-2024-52530.  
* Fixed vim security issues CVE-2025-22134 and CVE-2024-47814.  
* Fixed ngtcp2 security issue CVE-2024-52811.  
* Fixed webkit2gtk security issues CVE-2024-54534, CVE-2024-54508,
  CVE-2024-54505, CVE-2024-54502, CVE-2024-54479, CVE-2024-44309 and
  CVE-2024-44308.  
* Fixed iperf3 security issue CVE-2024-53580.  
* Fixed libsndfile security issues CVE-2024-50612 and CVE-2022-33065.  
* Fixed qemu security issue CVE-2023-2861.  
* Fixed opensc security issues CVE-2024-8443, CVE-2024-45620, CVE-2024-45619,
  CVE-2024-45618, CVE-2024-45617, CVE-2024-45616 and CVE-2024-45615.  
* Fixed postgresql-14 security issues CVE-2024-10979, CVE-2024-10978,
  CVE-2024-10977 and CVE-2024-10976.  
* Fixed poppler security issue CVE-2024-56378.  
* Fixed rsync security issues CVE-2024-12747, CVE-2024-12088, CVE-2024-12087,
  CVE-2024-12086, CVE-2024-12085 and CVE-2024-12084.  
* Fixed python3.10 security issue CVE-2024-11168.  
* Fixed zulu17-ca security issue CVE-2025-21502.  
* Fixed openjpeg2 security issues CVE-2024-56827, CVE-2024-56826, CVE-2023-39327
  and CVE-2021-3575.  
* Fixed bind9 security issues CVE-2024-12705 and CVE-2024-11187.  
* Fixed harfbuzz security issue CVE-2023-25193.  
* Fixed glibc security issue CVE-2025-0395.
* Set nologin for system users tcpdump and unscd.
* Fixed webkit2gtk security issues CVE-2025-24162, CVE-2025-24158,
  CVE-2025-24150, CVE-2025-24143, CVE-2024-54658, CVE-2024-54543 and
  CVE-2024-27856.


Resolved Issues
--------------------------------------------------------------------------------


### Citrix

* Fixed ica.module.EnableVolumeListener has an effect on the EnableAudioListener
  of the module.ini file.
* Fixed mapping of  hotkey 'Ctrl + Alt + End' to 'Ctrl + Alt + Del',
  configurable via IGEL Setup > Sessions > Citrix > Citrix Global > Keyboard >
  'Mapping Ctrl + Alt + End to Ctrl + Alt + Del for Citrix sessions'.
* Fixed password change within Citrix Workspace App with German user interface
  language.
* Option to disable Citrix connection dialogue
  (ica.pnlogin.suppressconnectiondialog) is fixed.
* Citrix: Configuration now works if no Citrix session is configured at all to
  enable a proper environment for browser sessions.
* In Citrix Workspace app 24.11, BCR cache is cleared after user
  disconnects/signout from the VDA.
* Enhanced Kerberos/AD and Last User/-Domain/Autologin for Citrix Cloud
  Services.

### AVD

* Integrated new RdClientSDK to fix issues when connecting to host pools that
  use private endpoint.

### RDP/IGEL RDP Client 2

* Fixed serial port redirection not working for COM10 and above.

### Remote Desktop (RDP3)

* Fixed RD Web Access autostart not working when using client version RDP3.

### RD Web Access

* Fixed disabling Verify Certificates not working for RD Web Access.

### Horizon

* Fixed log collection.
* Fixed a bug in the Horizon login dialog for next-gen sessions where the user
  name couldn't be changed.

### Network

* Fixed Ethernet hotplug issue with the Lenovo USB-C Dock Type 40A9.
* Fixed sporadic no-link messages related to a deactivated Ethernet interface.
* ACME client:  
    - Fixed CA certificate permission issue.  
    - Fixed potential inconsistency after change of settings.

* Fixed issue with e1000e network card not working with powersave settings.  
* Added new registry key to blacklist drivers for powersave settings:

+------------+-----------------------------------------------------------------+
|Parameter   |`List of drivers seperated by space which have issues with powersave settings.` |
+------------+-----------------------------------------------------------------+
|Registry    |`system.powersave.powertop_drivers_blacklist`                    |
+------------+-----------------------------------------------------------------+
|Type        |string                                                           |
+------------+-----------------------------------------------------------------+
|Value       |empty **Default**                                                |
+------------+-----------------------------------------------------------------+


### IGEL Agent for Imprivata

* Adjustments have been made to the new integrated Omnissa Horizon 2412 client.

### Smartcard

* Fixed smart card resource manager pcsc-lite to make smart cards work with
  certain applications inside AVD, Remote Desktop and Windows 365 sessions.

### HID

* Fixed touchscreen calibration not working.
* Fixed auto-suspend of HID devices after reboot.
* Fixed touchscreen right click by using touchegg gesture recognition for two
  finger tap. Further gestures are not supported.  
  Added registry key to enable touchegg multitouch gesture support:

+------------+-----------------------------------------------------------------+
| Parameter  | Use touchegg for multitouch gestures handling.                  |
+------------+-----------------------------------------------------------------+
| Registry   | userinterface.touchscreen.touchegg                              |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | enabled / _disabled_ (default)                                  |
+------------+-----------------------------------------------------------------+


### CUPS Printing

* Fixed printing on DYMO LabelWriter 450.
* Fixed CUPS printing service not starting on boot.
* Added generic IPP Everywhere for driverless printing.

### Cisco Webex

* Fixed Cisco Webex VDI not correctly applying for AVD sessions.

### Base system

* Backported a kernel patch for devices with the Intel Goldmont
  microarchitecture, which is used for low-power Atom, Celeron and Pentium
  branded processors.  
    - This fixes a potential freeze during the OSC installation process.  
    - Additionally, this fixes an issue where affected devices were not shutting
      down correctly.

* Added new parameter to configure default for 'Connect after reboot':

+------------+-----------------------------------------------------------------+
| Parameter  | `Connect after reboot`                                          |
+------------+-----------------------------------------------------------------+
| Registry   | `devices.bluetooth.pair_on_reboot`                              |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | **enabled**  (default) / disabled                               |
+------------+-----------------------------------------------------------------+

* Fixed not functional proxy if system-wide proxy was configured.
* Fixed displaying of custom boot splash on AMD platforms.
* Changed configuration of webcam priority. V4L Name is used for identifying the
  webcam. If only one webcam is present, no entry is needed. If multiple webcams
  are present without set priority, the first one is used.
* ## Added parameters in registry

+------------+-----------------------------------------------------------------+
| Parameter  | Camera name                                                     |
+------------+-----------------------------------------------------------------+
| Registry   | multimedia.webcam.camera%.name                                  |
+------------+-----------------------------------------------------------------+
| Type       | string                                                          |
+------------+-----------------------------------------------------------------+
| Value      | camera _Default_                                                |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | priority                                                        |
+------------+-----------------------------------------------------------------+
| Registry   | multimedia.webcam.camera%.priority                              |
+------------+-----------------------------------------------------------------+
| Type       | integer                                                         |
+------------+-----------------------------------------------------------------+
| Value      | 0 _Default_                                                     |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | V4L2 name                                                       |
+------------+-----------------------------------------------------------------+
| Registry   | multimedia.webcam.camera%.v4lname                               |
+------------+-----------------------------------------------------------------+
| Type       | string                                                          |
+------------+-----------------------------------------------------------------+
| Value      | v4l2-string _Default_                                           |
+------------+-----------------------------------------------------------------+

* Lower number means higher priority.
* ## Obsolete Registry Parameters

+------------+-----------------------------------------------------------------+
| Parameter  | Select how the webcam to use should be choosen.                 |
+------------+-----------------------------------------------------------------+
| Registry   | multimedia.webcam.virtual_background.choose_webcam_by           |
+------------+-----------------------------------------------------------------+
| Range      | [Use first webcam][Choose by name]                              |
|            | [Choose by vendor_id:product_id][Choose by number]              |
|            | [Choose by devicename][Choose by priority]                      |
+------------+-----------------------------------------------------------------+
| Value      | _Use first webcam_                                              |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | Select webcam by number (only valid if choose by number is used) |
+------------+-----------------------------------------------------------------+
| Registry   | multimedia.webcam.virtual_background.webcam_number              |
+------------+-----------------------------------------------------------------+
| Type       | integer                                                         |
+------------+-----------------------------------------------------------------+
| Value      | 1 _Default_                                                     |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | Select webcam by name (only valid if choose by name is used)    |
+------------+-----------------------------------------------------------------+
| Registry   | multimedia.webcam.virtual_background.webcam_name                |
+------------+-----------------------------------------------------------------+
| Type       | string                                                          |
+------------+-----------------------------------------------------------------+
| Value      | empty _Default_                                                 |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | Select webcam by vendor_id:product_id (only valid if choose by vendor_id:product_id is used) |
+------------+-----------------------------------------------------------------+
| Registry   | multimedia.webcam.virtual_background.webcam_vendor_product      |
+------------+-----------------------------------------------------------------+
| Type       | string                                                          |
+------------+-----------------------------------------------------------------+
| Value      | empty _Default_                                                 |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | Select webcam by devicename for example /dev/video0 or video0 (only valid if choose by devicename is used) |
+------------+-----------------------------------------------------------------+
| Registry   | multimedia.webcam.virtual_background.webcam_device              |
+------------+-----------------------------------------------------------------+
| Type       | string                                                          |
+------------+-----------------------------------------------------------------+
| Value      | empty _Default_                                                 |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | Select webcam by priority list for example dev=video0;name=HD_Webcam_C270 (only valid if choose by priority is used)}} |
+------------+-----------------------------------------------------------------+
| Registry   | multimedia.webcam.virtual_background.webcam_priority            |
+------------+-----------------------------------------------------------------+
| Type       | string                                                          |
+------------+-----------------------------------------------------------------+
| Value      | empty _Default_                                                 |
+------------+-----------------------------------------------------------------+


### Firmware update

* Fixed FTP the server configuration to properly reflect the configured maximum
  number of connections. Please note that there's a hard limit of 100 concurrent
  connections in the FTP server.
* Fixed migration dbus timeout on slower devices if migration prepare is needed.

### X11 system

* Fixed a bug that reset the display configuration to default on reboot.

### Audio

* LG 24CN65x series audio fix for speaker and headphones.
* Added registry key to ignore decibel information given by the ALSA driver
  (useful if that information is wrong):

+------------+-----------------------------------------------------------------+
| Parameter  | `Ignore dB`                                                     |
+------------+-----------------------------------------------------------------+
| Registry   | `multimedia.pulseaudio.daemon.ignore-db`                        |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | enabled / **disabled** (default)                                |
+------------+-----------------------------------------------------------------+

* Fixed internal microphone on Fujitsu Lifebook E5412.

### Multimedia

* Fixed window distortions with video playback on Intel Meteor Lake chipsets.

### Hardware

* Fixed ignition off on ADS-TEC VMT-9010.
* Fixed Wi-Fi on Lenovo Ideapad devices. The last ON/OFF state of the Wi-Fi is
  restored on each boot or reboot.
* Disabled system suspend on HP t240 as it is not supported.

### Remote Management

* Fixed unreliable ICG status icon.
* Suppress confusing log messages while checking for upgrade readiness.
* Improved fallback switch to ICG in case of UMS is preferred over ICG.


Component Versions
-------------------------------------------------------------------------------

+-------------------------------------------+----------------------------------+
| Clients                                   |                                  |
+===========================================+==================================+
| Amazon WorkSpaces Client                  | 4.1.0                            |
+-------------------------------------------+----------------------------------+
| Chromium                                  | 133.0.6943.53-1igel1738850419    |
+-------------------------------------------+----------------------------------+
| Cisco JVDI Client                         | 15.0.0                           |
+-------------------------------------------+----------------------------------+
| Cisco Webex VDI plugin                    | 44.12.1.31417                    |
+-------------------------------------------+----------------------------------+
| Cisco Webex Meetings VDI plugin           | 43.6.8.4                         |
+-------------------------------------------+----------------------------------+
| Cisco Webex Meetings VDI plugin           | 44.10.1.3                        |
+-------------------------------------------+----------------------------------+
| Cisco Webex Meetings VDI plugin           | 44.6.5.1                         |
+-------------------------------------------+----------------------------------+
| Zoom Media Plugin                         | 5.17.13.25060                    |
+-------------------------------------------+----------------------------------+
| Zoom Media Plugin                         | 6.1.12.25370                     |
+-------------------------------------------+----------------------------------+
| Zoom Media Plugin                         | 6.2.10.25600                     |
+-------------------------------------------+----------------------------------+
| Citrix EPA Client                         | 24.10.1                          |
+-------------------------------------------+----------------------------------+
| Citrix HDX Realtime Media Engine          | 2.9.600                          |
+-------------------------------------------+----------------------------------+
| Citrix Secure Access Client               | 24.10.1                          |
+-------------------------------------------+----------------------------------+
| Citrix Workspace App                      | 20.10.0.6                        |
+-------------------------------------------+----------------------------------+
| Citrix Workspace App                      | 24.08.0.98                       |
+-------------------------------------------+----------------------------------+
| Citrix Workspace App                      | 24.11.0.85                       |
+-------------------------------------------+----------------------------------+
| deviceTRUST Citrix Channel                | 23.1.200                         |
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
| EPOS connect                              | 7.7.0.44352                      |
+-------------------------------------------+----------------------------------+
| Ericom PowerTerm                          | 14.0.3.71814                     |
+-------------------------------------------+----------------------------------+
| Evidian AuthMgr                           | 1.5.8825                         |
+-------------------------------------------+----------------------------------+
| Evince PDF Viewer                         | 42.3-0ubuntu3.1                  |
+-------------------------------------------+----------------------------------+
| FabulaTech Plugins                        | 4.1.0.3                          |
+-------------------------------------------+----------------------------------+
| FabulaTech USB for Remote Desktop         | 6.2.1.8                          |
+-------------------------------------------+----------------------------------+
| FabulaTech Scanner for Remote Desktop     | 3.6.1.3                          |
+-------------------------------------------+----------------------------------+
| FabulaTech Webcam for Remote Desktop      | 2.8.11                           |
+-------------------------------------------+----------------------------------+
| Firefox                                   | 115.20.0                         |
+-------------------------------------------+----------------------------------+
| IBM i Access Client Solutions             | 1.1.9.2                          |
+-------------------------------------------+----------------------------------+
| IGEL RDP Client                           | 2.2igel1730799204                |
+-------------------------------------------+----------------------------------+
| IGEL AVD Client                           | 1.3.0igel1738058087              |
+-------------------------------------------+----------------------------------+
| deviceTRUST RDP Channel                   | 23.1.200                         |
+-------------------------------------------+----------------------------------+
| Imprivata OneSign ProveID Embedded        | onesign-generic-bootstrap-loader_23.2.0.711883_amd64 |
+-------------------------------------------+----------------------------------+
| IGEL Agent for Imprivata                  | 0.6.2igel1739194615              |
+-------------------------------------------+----------------------------------+
| Lakeside SysTrack Channel                 | 9.0                              |
+-------------------------------------------+----------------------------------+
| Login VSI Enterprise                      | 4.8.6                            |
+-------------------------------------------+----------------------------------+
| NCP Secure Enterprise Client              | 6.00_rev29368                    |
+-------------------------------------------+----------------------------------+
| NX Client                                 | 7.8.2-4igel1685535669            |
+-------------------------------------------+----------------------------------+
| Open VPN                                  | 2.6.12-1igel1721712256           |
+-------------------------------------------+----------------------------------+
| Zulu JRE                                  | 17.0.14-1                        |
+-------------------------------------------+----------------------------------+
| Parallels Client                          | 19.2.0.23906                     |
+-------------------------------------------+----------------------------------+
| Spice GTK (Red Hat Virtualization)        | 0.42-2+b1igel1709635434          |
+-------------------------------------------+----------------------------------+
| Remote Viewer (Red Hat Virtualization)    | 11.0-3igel1704876668             |
+-------------------------------------------+----------------------------------+
| Usbredir (Red Hat Virtualization)         | 0.15.0-1igel1738736251           |
+-------------------------------------------+----------------------------------+
| SpeechWrite                               | 1.0                              |
+-------------------------------------------+----------------------------------+
| Stratusphere UX Connector ID Key software | 6.6.2-3                          |
+-------------------------------------------+----------------------------------+
| Systancia AppliDis                        | 6.1.4-17                         |
+-------------------------------------------+----------------------------------+
| HP Anyware PCoIP Software Client          | 23.08.1-22.04                    |
+-------------------------------------------+----------------------------------+
| ThinLinc Client                           | 4.16.0-3389                      |
+-------------------------------------------+----------------------------------+
| ThinPrint Client                          | 7-7.6.126                        |
+-------------------------------------------+----------------------------------+
| Parole Media Player                       | 4.16.0-3igel1686304269           |
+-------------------------------------------+----------------------------------+
| VNC Viewer                                | 1.14.1+dfsg-1igel1732532698      |
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
| Nuance Audio Extensions for dictation     | B308                             |
+-------------------------------------------+----------------------------------+
| Olympus driver for dictation              | 4.0.5                            |
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
| StepOver TCP Client                       | 2.4.3                            |
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
| PKCS#11 Library Thales SafeNet            | 10.8.1050                        |
+-------------------------------------------+----------------------------------+
| PKCS#11 Library OpenSC                    | 0.26.0-1igel1736250160           |
+-------------------------------------------+----------------------------------+
| PKCS#11 Library Pointsharp NetID Enterprise | 6.9.1.17                         |
+-------------------------------------------+----------------------------------+
| PKCS#11 Library Pointsharp NetID Client   | 1.1.4.38                         |
+-------------------------------------------+----------------------------------+
| PKCS#11 Library 90meter                   | 3.0.0.45                         |
+-------------------------------------------+----------------------------------+
| Reader Driver ACS CCID                    | 1.1.11-1igel1715329126           |
+-------------------------------------------+----------------------------------+
| Reader Driver HID Global Omnikey          | 4.3.3                            |
+-------------------------------------------+----------------------------------+
| Reader Driver Identive CCID               | 5.0.35                           |
+-------------------------------------------+----------------------------------+
| Reader Driver Identive eHealth200         | 1.0.5                            |
+-------------------------------------------+----------------------------------+
| Reader Driver Identive SCRKBC             | 5.0.24                           |
+-------------------------------------------+----------------------------------+
| Reader Driver MUSCLE CCID                 | 1.6.1-2igel1730368961            |
+-------------------------------------------+----------------------------------+
| Reader Driver REINER SCT cyberJack        | 3.99.5final.sp17-0.1igel1727417566 |
+-------------------------------------------+----------------------------------+
| Resource Manager PC/SC Lite               | 2.3.1-1igel1736249599            |
+-------------------------------------------+----------------------------------+
| Cherry USB2LAN Proxy                      | 3.2.0.3                          |
+-------------------------------------------+----------------------------------+


+-------------------------------------------+----------------------------------+
| System Components                         |                                  |
+===========================================+==================================+
| OpenSSL                                   | 1.0.2n-1ubuntu5.13igel1686114423 |
+-------------------------------------------+----------------------------------+
| OpenSSL                                   | 1.1.1f-1ubuntu2.23               |
+-------------------------------------------+----------------------------------+
| OpenSSL                                   | 3.0.2-0ubuntu1.18                |
+-------------------------------------------+----------------------------------+
| OpenSSH Client                            | 9.9p1-3igel1730280218            |
+-------------------------------------------+----------------------------------+
| OpenSSH Server                            | 9.9p1-3igel1730280218            |
+-------------------------------------------+----------------------------------+
| Bluetooth Stack (bluez)                   | 5.79-1igel1732513543             |
+-------------------------------------------+----------------------------------+
| MESA OpenGL Stack                         | 24.2.8-1igel1736252923           |
+-------------------------------------------+----------------------------------+
| VDPAU Library Version                     | 1.5-2igel1677954724              |
+-------------------------------------------+----------------------------------+
| Graphics Driver INTEL                     | 2.99.917+git20210115-1igel1654609037 |
+-------------------------------------------+----------------------------------+
| Graphics Driver ATI/RADEON                | 22.0.0-1igel1704966675           |
+-------------------------------------------+----------------------------------+
| Graphics Driver ATI/AMDGPU                | 23.0.0-1igel1705669076           |
+-------------------------------------------+----------------------------------+
| Graphics Driver Nouveau (Nvidia Legacy)   | 1.0.17-2igel1654608979           |
+-------------------------------------------+----------------------------------+
| Graphics Driver VMware                    | 13.3.0-3igel1654607153           |
+-------------------------------------------+----------------------------------+
| Graphics Driver QXL (Spice)               | 0.1.6-1igel1687782644            |
+-------------------------------------------+----------------------------------+
| Graphics Driver FBDEV                     | 0.5.0-2igel1654609009            |
+-------------------------------------------+----------------------------------+
| Graphics Driver VESA                      | 2.6.0-1igel1704966930            |
+-------------------------------------------+----------------------------------+
| Input Driver Evdev                        | 2.11.0-1igel1738822597           |
+-------------------------------------------+----------------------------------+
| Input Driver Elographics                  | 1.4.3-1igel1678083379            |
+-------------------------------------------+----------------------------------+
| Input Driver eGalax                       | 2.5.8825                         |
+-------------------------------------------+----------------------------------+
| Input Driver Synaptics                    | 1.9.2-1+b1igel1683803726         |
+-------------------------------------------+----------------------------------+
| Input Driver VMMouse                      | 13.1.0-1ubuntu2igel1628499891    |
+-------------------------------------------+----------------------------------+
| Input Driver Wacom                        | 1.2.3-1igel1738566034            |
+-------------------------------------------+----------------------------------+
| Input Driver ELO Multitouch               | 4.3.0.0                          |
+-------------------------------------------+----------------------------------+
| Input Driver ELO Singletouch              | 5.2                              |
+-------------------------------------------+----------------------------------+
| Kernel                                    | 6.6.22 #mainline-lxos-g1738661271 |
+-------------------------------------------+----------------------------------+
| Xorg X11 Server                           | 21.1.15-2igel1736251484          |
+-------------------------------------------+----------------------------------+
| Xorg Xephyr                               | 21.1.15-2igel1736251484          |
+-------------------------------------------+----------------------------------+
| CUPS Printing Daemon                      | 2.4.10-2igel1727672599           |
+-------------------------------------------+----------------------------------+
| PrinterLogic                              | 25.2.0.16                        |
+-------------------------------------------+----------------------------------+
| Lightdm Graphical Login Manager           | 1.30.0-0ubuntu5igel1685475374    |
+-------------------------------------------+----------------------------------+
| XFCE4 Window Manager                      | 4.14.5-1~18.04igel1643191202     |
+-------------------------------------------+----------------------------------+
| ISC DHCP Client                           | 4.4.1-2.3ubuntu2.4               |
+-------------------------------------------+----------------------------------+
| NetworkManager                            | 1.42.4-1igel1692869696           |
+-------------------------------------------+----------------------------------+
| ModemManager                              | 1.22.0-3igel1705908135           |
+-------------------------------------------+----------------------------------+
| GStreamer 1.x                             | 1.24.12-1igel1738564007          |
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
| WebKit2Gtk                                | 2.46.6-1~deb12u1igel1739423750   |
+-------------------------------------------+----------------------------------+
| Python3                                   | 3.10.12                          |
+-------------------------------------------+----------------------------------+

+-------------------------------------------+----------------------------------+
| VM Guest Support Components               |                                  |
+===========================================+==================================+
| Virtualbox Guest Utils                    | 7.0.20-dfsg-1igel1726735257      |
+-------------------------------------------+----------------------------------+
| Virtualbox X11 Guest Utils                | 7.0.20-dfsg-1igel1726735257      |
+-------------------------------------------+----------------------------------+
| Open VM Tools                             | 12.3.5-3~ubuntu0.22.04.1         |
+-------------------------------------------+----------------------------------+
| Open VM Desktop Tools                     | 12.3.5-3~ubuntu0.22.04.1         |
+-------------------------------------------+----------------------------------+
| Xen Guest Utilities                       | 7.20.2-0ubuntu1~22.04.2          |
+-------------------------------------------+----------------------------------+
| Spice Vdagent                             | 0.22.1-4+b1igel1704922460        |
+-------------------------------------------+----------------------------------+
| Qemu Guest Agent                          | 9.2.0+ds-4igel1736508561         |
+-------------------------------------------+----------------------------------+

+-------------------------------------------+----------------------------------+
| Features with Limited IGEL Support        |                                  |
+===========================================+==================================+
| Mobile Device Access USB (MTP)            | 1.1.22-1igel1736514321           |
+-------------------------------------------+----------------------------------+
| Mobile Device Access USB (imobile)        | 1.3.0-7.1igel1704836660          |
+-------------------------------------------+----------------------------------+
| Mobile Device Access USB (gphoto)         | 2.5.31-2.1igel1709726214         |
+-------------------------------------------+----------------------------------+
| VPN OpenConnect                           | 9.12-3igel1732526151             |
+-------------------------------------------+----------------------------------+
| Scanner support                           | 1.1.1-5                          |
+-------------------------------------------+----------------------------------+
| VirtualBox VM within IGEL OS              | 7.0.20-dfsg-1igel1726735257      |
+-------------------------------------------+----------------------------------+
| Virtual Background for Webcam             |                                  |
+-------------------------------------------+----------------------------------+


+---------------------------------------------+--------+------------------+
| Services                                    | Size   | Reduced Firmware |
+=============================================+========+==================+
| Asian Language Support                      |  21.8M | Included         |
+---------------------------------------------+--------+------------------+
| Java SE Runtime Environment                 |  53.2M | Included         |
+---------------------------------------------+--------+------------------+
| Citrix Workspace app                        | 711.0M | Included         |
| Citrix Appliance                            |        |                  |
| Citrix StoreFront                           |        |                  |
+---------------------------------------------+--------+------------------+
| Ericom PowerTerm InterConnect               |  10.0M | Included         |
+---------------------------------------------+--------+------------------+
| Media Player                                | 256.0K | Included         |
+---------------------------------------------+--------+------------------+
| Local Browser (Firefox)                     |  86.2M | Included         |
| Citrix Appliance                            |        |                  |
+---------------------------------------------+--------+------------------+
| RDP                                         |   4.8M | Included         |
| Omnissa Horizon                             |        |                  |
+---------------------------------------------+--------+------------------+
| Cendio ThinLinc                             |  10.8M | Included         |
+---------------------------------------------+--------+------------------+
| Printing (Internet printing protocol CUPS)  |  18.5M | Included         |
+---------------------------------------------+--------+------------------+
| NoMachine NX                                |  26.0M | Included         |
+---------------------------------------------+--------+------------------+
| Omnissa Horizon                             | 213.5M | Included         |
+---------------------------------------------+--------+------------------+
| Voice over IP (Ekiga)                       |   6.0M | Included         |
+---------------------------------------------+--------+------------------+
| Citrix Appliance                            | 768.0K | Included         |
+---------------------------------------------+--------+------------------+
| NCP Enterprise VPN Client                   |  11.5M | Not included     |
+---------------------------------------------+--------+------------------+
| Fluendo GStreamer Codec Plugins             |   3.0M | Included         |
+---------------------------------------------+--------+------------------+
| IBM i Access Client Solutions               | 134.8M | Not included     |
+---------------------------------------------+--------+------------------+
| Red Hat Enterprise Virtualization           |   2.8M | Included         |
+---------------------------------------------+--------+------------------+
| Parallels Client                            |   5.8M | Included         |
+---------------------------------------------+--------+------------------+
| NVIDIA graphics driver                      | 129.2M | Not included     |
+---------------------------------------------+--------+------------------+
| Imprivata Appliance                         |  32.5M | Included         |
+---------------------------------------------+--------+------------------+
| AppliDis                                    | 256.0K | Included         |
+---------------------------------------------+--------+------------------+
| Evidian AuthMgr                             |   2.8M | Included         |
+---------------------------------------------+--------+------------------+
| Hardware Video Acceleration                 |  11.0M | Included         |
+---------------------------------------------+--------+------------------+
| Extra Font Package                          |   1.0M | Included         |
+---------------------------------------------+--------+------------------+
| Fluendo GStreamer AAC Decoder               | 768.0K | Included         |
+---------------------------------------------+--------+------------------+
| x32 Compatibility Support                   |   4.2M | Included         |
+---------------------------------------------+--------+------------------+
| Cisco JVDI client                           |  61.2M | Included         |
+---------------------------------------------+--------+------------------+
| PrinterLogic                                |  47.2M | Not included     |
+---------------------------------------------+--------+------------------+
| Login VSI Login Enterprise                  |  28.0M | Not included     |
+---------------------------------------------+--------+------------------+
| Stratusphere UX CID Key software            |   5.2M | Not included     |
+---------------------------------------------+--------+------------------+
| Elastic Filebeat                            |  35.2M | Not included     |
+---------------------------------------------+--------+------------------+
| AVD                                         |  48.5M | Included         |
+---------------------------------------------+--------+------------------+
| Local Browser (Chromium)                    | 114.8M | Not included     |
+---------------------------------------------+--------+------------------+
| Amazon WorkSpaces Client                    |  32.2M | Included         |
+---------------------------------------------+--------+------------------+
| deskMate Client                             |   5.5M | Included         |
+---------------------------------------------+--------+------------------+
| Cisco Webex VDI                             | 103.2M | Not included     |
+---------------------------------------------+--------+------------------+
| Cisco Webex Meetings VDI                    | 176.8M | Not included     |
+---------------------------------------------+--------+------------------+
| Zoom Media Plugin                           | 201.5M | Not included     |
+---------------------------------------------+--------+------------------+
| DriveLock                                   |  12.2M | Included         |
+---------------------------------------------+--------+------------------+
| SpeechWrite Client                          | 256.0K | Included         |
+---------------------------------------------+--------+------------------+
| IGEL Agent for Imprivata                    | 768.0K | Included         |
+---------------------------------------------+--------+------------------+
| LRS Output Management                       | 256.0K | Included         |
+---------------------------------------------+--------+------------------+
| Fluendo Browser Codec Plugins               |   9.0M | Included         |
+---------------------------------------------+--------+------------------+
| HP Factory deployment documentation         |  88.0M | Included         |
+---------------------------------------------+--------+------------------+
| BIOS Tools                                  |   2.0M | Included         |
+---------------------------------------------+--------+------------------+
| HP Anyware Client                           |  34.5M | Included         |
+---------------------------------------------+--------+------------------+
| 90meter Smart Card Support                  | 512.0K | Included         |
+---------------------------------------------+--------+------------------+
| Virtual Background for Webcam (Limited IGEL | 256.0K | Not included     |
| Support)                                    |        |                  |
| VPN OpenConnect (Limited support)           |        |                  |
| Scanner support / SANE (Limited support)    |        |                  |
| Limited Support Features                    |        |                  |
| Mobile Device Access USB (Limited support)  |        |                  |
| Virtualbox (Limited support)                |        |                  |
+---------------------------------------------+--------+------------------+
| Mobile Device Access USB (Limited support)  | 256.0K | Not included     |
+---------------------------------------------+--------+------------------+
| VPN OpenConnect (Limited support)           |   1.0M | Not included     |
+---------------------------------------------+--------+------------------+
| Scanner support / SANE (Limited support)    |   7.8M | Not included     |
+---------------------------------------------+--------+------------------+
| Virtualbox (Limited support)                |  73.5M | Not included     |
+---------------------------------------------+--------+------------------+
| Virtual Background for Webcam (Limited IGEL |  45.5M | Included         |
| Support)                                    |        |                  |
+---------------------------------------------+--------+------------------+


Known Issues
--------------------------------------------------------------------------------


### Citrix

* Keyboard sync mode selection once/dynamic/off results in unexpected behavior.
* Citrix Cloud login with Citrix Workspace app 20.10 not possible
* Citrix StoreFront login to the cloud stores with Password authentication type
  may not work due to the n-factor authentication enforced by Microsoft. Switch
  to Citrix login type as a workaround.
* If the user logs out via the Self-service drop down menu, the user data is not
  deleted correctly by Citrix. As a result, a re-login can be performed without
  new authentication. To remove all user credentials the self-service window
  should always be closed when logging off.
* Citrix proxy connections can fail if they are set up in an environment that
  only allows external connections through a proxy and restricts DNS queries.
* With the new Citrix toolbar, desktops may unexpectedly switch from windowed
  mode to full-screen mode when a monitor was suspended. As a workaround, you
  can revert to the previous version of the toolbar by setting the
  ica.wfclient.toolbarversion parameter to "Old".
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
* ZoomVDI version 5.16 or newer is no longer supported with Citrix Workspace app
  20.10
* Browser Content Redirection (BCR) may not work with Citrix workspace app 23.11
  and current Chrome versions.
* If Self-Service is closed when the credential window is active, it may happen
  that the session cannot be restarted. A reboot is necessary.

### OSC Installer

* OSC not deployable with IGEL Deployment Appliance: Version 11.3 or later is
  required for deploying IGEL OS 11.06. and following.

### AVD

* When closing the AVD client while audio input (microphone redirection) is in
  use, the client might crash. This will be fixed in future versions.
* Webcam redirection support is preliminary / experimental and may not work with
  all webcams yet.
* AVD is not running on devices that don't support SSE4.1 at least. Use older
  IGEL OS firmware versions like 11.09.xxx or older!
* H.264 hardware decoding for MS-Teams optimization is currently limited to non-
  AMD devices due to stability issues on AMD devices.

### Remote Desktop (RDP3)

* RDP3 is not running on devices that don't support SSE4.1 at least. Use the
  legacy RDP client instead.

### RD Web Access

* Client is not running on devices that don't support SSE4.1 at least. Use
  RdWebAccess with the legacy RDP client instead.

### Horizon

* Horizon session uses the configured system proxy, even if "Direct connection
  to the Internet" is set for the session
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

### Network

* Wakeup from system suspend fails on DELL Latitude 5510

### IGEL Agent for Imprivata

* Filter horizon apps on chooser does not work, apps will show in any case. The
  recommendation is to set "iia.hide_horizon_apps_on_chooser" to "False"

### Cisco JVDI Client

* Citrix Workspace App 2010 may cause problems with Cisco JVDI. Newer ZoomVDI
  versions and App Protection are no longer supported with CWA 2010.

### Base system

* After updating the BIOS on the HP mt645 G7 or HP mt645 G8, the device shuts
  down instead of rebooting.
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

* A firmware update started on 11.10.100 can sporadically block, so that the
  device must be rebooted manually. The update continues without problem after
  reboot.
* On devices with 4 GB flash storage or smaller it could happen that there is
  not enough space for updating all features. In this case, a corresponding
  error message occurs. Please visit https://kb.igel.com/igelos-11.09/en/error-
  not-enough-space-on-local-drive-when-updating-to-igel-os-11-08-or-
  higher-101059051.html  for a possible solution and additional information.

### Appliance Mode

* Appliance mode RHEV/Spice: spice-xpi firefox plugin is no longer supported.
  The "Console Invocation" has to allow 'Native' client (auto is also possible)
  and should be started in fullscreen to prevent any opening windows.
* Browser Appliance mode can fail when the Web URL contains special control
  characters like ampersand (& character).  
  Workaround: Add quotes at the beginning and the end of an affected URL. E.g.:  
  'https://www.google.com/search?q=aSearchTerm&source=lnms&tbm=isch'

### Audio

* UD3-M340C: Sound preferences are showing Headphone & Microphone, although not
  connected.
* Microphone (TRRS headset) is broken on LG 27CN650

### Multimedia

* Multimedia redirection with GStreamer could fail when using Nouveau GPU
  driver.

### Hardware

* Some HP devices will shut down instead of restarting during the BIOS update
  procedure. After manual boot of the devices, it may take up to three minutes
  before anything is displayed on the screen (the only indicator is the power
  LED). Wake on LAN (e.g. via UMS) does not seem to work in this state, either.  
  The BIOS is still updated successfully. This is currently known for HP mt645
  G7 and mt645 G8.
* Some newer Delock 62599 active DisplayPort to DVI (4k) adapters only work on
  INTEL-based devices.
* Wake up from suspend via UMS does not work on HP mt645 devices. Workaround:
  Disable system suspend and use shutdown instead.
* Built-in fingerprint sensor is not supported on HP mt440 G3 and mt645 G7/G8.
* MAC-Address Passthrough not supported on Lenovo USB-C Hybrid Docking Station.
* Wake-on-Lan via docking stations is not supported.
* In some rare cases it is possible that connecting or booting Lenovo USB-C
  Hybrid Docking station over USB-C results in non working / faulty display
  output.  
** It may help to (re-)connect via USB-A. If this is the case, USB-C should be
  also functional then.
* Display configuration of displays connected to HP G5 Docking Station may fail
  with HP t655.


Release Notes 11.10.210 (Based On 11.10.150)
--------------------------------------------------------------------------------


New Features
--------------------------------------------------------------------------------


### Citrix

* Updated Citrix Workspace App to version 2405.  
  Available Citrix Workspace Apps in this release: 2405 (default), 2402, and
  2010
* Changed:  
* The default value of the parameter ica.authman.kiosksfuienhanced has been
  changed to true and thus corresponds to the value of Citrix.
* Added:  
* [Technical Preview] Provision to manage multiple proxy servers  
  You can use multiple proxy servers that allow the HDX sessions to select
  appropriate proxy servers for accessing specific resources.

+------------+-----------------------------------------------------------------+
| Parameter  | ProxyAutoConfigURL                                              |
+------------+-----------------------------------------------------------------+
| Registry   | ica.allregions.proxyautoconfigurl                               |
+------------+-----------------------------------------------------------------+
| Type       | string                                                          |
+------------+-----------------------------------------------------------------+
| Value      | ""                                                              |
+------------+-----------------------------------------------------------------+

  > Extend parameter range ica.allregions.proxytype with "Script".

* [Technical Preview] Multiple webcam resolutions support  
  Webcam streaming supports all webcam resolutions that are available on the
  client side.

+------------+-----------------------------------------------------------------+
| Parameter  | HDXWebcamEnablePnp                                              |
+------------+-----------------------------------------------------------------+
| Registry   | ica.wfclient.hdxwebcamenablepnp                                 |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | enabled / **disabled** (default)                                |
+------------+-----------------------------------------------------------------+


### Citrix NSGClient

* Updated Citrix EPA Client to version 24.10.1

### RD Web Access

* Added IGEL RDP3-based RD Web Access incl. support of seamless app(s).

### VMware Horizon

* Updated Horizon Client to version 2406
* Added support for Horizon next-gen (v2) API  
  If server URL of Horizon session matches the host name pattern defined in
  vmware.view.v2_host, next-gen API will be used for this session.

+------------+-----------------------------------------------------------------+
| Parameter  | Next-gen host name pattern                                      |
+------------+-----------------------------------------------------------------+
| Registry   | vmware.view.v2_host                                             |
+------------+-----------------------------------------------------------------+
| Type       | string                                                          |
+------------+-----------------------------------------------------------------+
| Value      | .workspaceoneaccess.com¼.workspaceair.com¼                      |
+------------+-----------------------------------------------------------------+
|            | .vmwareidentity.eu¼.vmwareidentity.de¼                          |
+------------+-----------------------------------------------------------------+
|            | .vmwareidentity.co.uk¼.vmwareidentity.com.au¼                   |
+------------+-----------------------------------------------------------------+
|            | .vmwareidentity.com¼.vmwareidentity.ca¼                         |
+------------+-----------------------------------------------------------------+
|            | .vmwareidentity.asia¼.vidmpreview.com _Default_                 |
+------------+-----------------------------------------------------------------+


### Network

* Added ACME client - for usage of HTTP-01 challenges
* Registry keys:
* This determines whether the feature is enabled as a whole:

+------------+-----------------------------------------------------------------+
| Parameter  | Manage certificates with ACME                                   |
+------------+-----------------------------------------------------------------+
| Registry   | network.acmeclient.enable                                       |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | enabled / _disabled_ (default)                                  |
+------------+-----------------------------------------------------------------+

* The rest are members of instances of network.acmeclient.cert%. Instance 0 is
  available from the start.
* This is the name of the subdirectory of /wfs/acme_certificates/ where data for
  the respective instance is stored - only letters, digits, underscores, dashes
  and dots are allowed:

+------------+-----------------------------------------------------------------+
| Parameter  | Directory                                                       |
+------------+-----------------------------------------------------------------+
| Registry   | network.acmeclient.cert%.directory                              |
+------------+-----------------------------------------------------------------+
| Type       | string                                                          |
+------------+-----------------------------------------------------------------+
| Value      | default _Default_                                               |
+------------+-----------------------------------------------------------------+

* The following are names (space-separated) for which a certificate shall be
  requested. In the case of success each will appear as subject alt name, the
  first one also as the common name (This is true at least with the Smallstep CA
  with default settings). %H will be replaced by `hostname -f`, %h by `hostname
  -s`.

+------------+-----------------------------------------------------------------+
| Parameter  | Names                                                           |
+------------+-----------------------------------------------------------------+
| Registry   | network.acmeclient.cert%.names                                  |
+------------+-----------------------------------------------------------------+
| Type       | string                                                          |
+------------+-----------------------------------------------------------------+
| Value      | %H _Default_                                                    |
+------------+-----------------------------------------------------------------+

* This is the ACME server URL (something like https://my-
  stepca.example.com/acme/acme/directory):

+------------+-----------------------------------------------------------------+
| Parameter  | ACME server URL                                                 |
+------------+-----------------------------------------------------------------+
| Registry   | network.acmeclient.cert%.serverurl                              |
+------------+-----------------------------------------------------------------+
| Type       | string                                                          |
+------------+-----------------------------------------------------------------+
| Value      | empty _Default_                                                 |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | Account key length (bits)                                       |
+------------+-----------------------------------------------------------------+
| Registry   | network.acmeclient.cert%.accountkeylength                       |
+------------+-----------------------------------------------------------------+
| Range      | [1024][2048][4096]                                              |
+------------+-----------------------------------------------------------------+
| Value      | _4096_                                                          |
+------------+-----------------------------------------------------------------+

* This is for verifying the ACME servers certificate (installing any such
  certificate on the system is beyond the scope of the ACME client):

+------------+-----------------------------------------------------------------+
| Parameter  | CA Bundle                                                       |
+------------+-----------------------------------------------------------------+
| Registry   | network.acmeclient.cert%.cabundle                               |
+------------+-----------------------------------------------------------------+
| Type       | string                                                          |
+------------+-----------------------------------------------------------------+
| Value      | empty _Default_                                                 |
+------------+-----------------------------------------------------------------+

* This may be necessary for creating an account on the ACME server:

+------------+-----------------------------------------------------------------+
| Parameter  | Email address                                                   |
+------------+-----------------------------------------------------------------+
| Registry   | network.acmeclient.cert%.email                                  |
+------------+-----------------------------------------------------------------+
| Type       | string                                                          |
+------------+-----------------------------------------------------------------+
| Value      | empty _Default_                                                 |
+------------+-----------------------------------------------------------------+

* The following is the length of the client key for which a certificate will be
  requested. Those with ecc-prefix mean ellipic curve keys, the remaining ones
  RSA keys.

+------------+-----------------------------------------------------------------+
| Parameter  | Key length (bits)                                               |
+------------+-----------------------------------------------------------------+
| Registry   | network.acmeclient.cert%.keylength                              |
+------------+-----------------------------------------------------------------+
| Range      | [1024][2048][4096][8192][ec-256][ec-384][ec-512]                |
+------------+-----------------------------------------------------------------+
| Value      | _4096_                                                          |
+------------+-----------------------------------------------------------------+

* This is the number of days between expiry checks:

+------------+-----------------------------------------------------------------+
| Parameter  | Certificate expiry check interval (days)                        |
+------------+-----------------------------------------------------------------+
| Registry   | network.acmeclient.cert%.checkinterval                          |
+------------+-----------------------------------------------------------------+
| Type       | integer                                                         |
+------------+-----------------------------------------------------------------+
| Value      | 1 _Default_                                                     |
+------------+-----------------------------------------------------------------+

* This is the period before the certificates' expiry in which renewal attempts
  are performed:

+------------+-----------------------------------------------------------------+
| Parameter  | Certificate renewal period (days)                               |
+------------+-----------------------------------------------------------------+
| Registry   | network.acmeclient.cert%.renewalperiod                          |
+------------+-----------------------------------------------------------------+
| Type       | integer                                                         |
+------------+-----------------------------------------------------------------+
| Value      | 30 _Default_                                                    |
+------------+-----------------------------------------------------------------+

* This is the debug level for acme.sh:

+------------+-----------------------------------------------------------------+
| Parameter  | Debug level                                                     |
+------------+-----------------------------------------------------------------+
| Registry   | network.acmeclient.cert%.debuglevel                             |
+------------+-----------------------------------------------------------------+
| Range      | [0][1][2][3]                                                    |
+------------+-----------------------------------------------------------------+
| Value      | _0_                                                             |
+------------+-----------------------------------------------------------------+

* The resulting client.cert and client.key can be used for EAP/TLS and
  EAP/PEAP/TLS via Ethernet and WLAN.  
  Example:  
  Assume the above is configured with directory="default" and EAP/TLS is wanted.  
  On the respective setup panel the following should be configured then:  
  EAP Type: TLS  
  Validate Server Certificate/CA Root Certificate: for verifying the RADIUS
  server's certificate, a separate topic  
  Manage certificates with SCEP (NDES): no  
  Client Certificate: /wfs/acme_certificates/default/client.cert  
  Private Key:  /wfs/acme_certificates/default/client.key  
  Identity: <empty>, will be automatically derived from the client certificate's
  subject  
  Private Key Password: <empty>
* Added Wake on LAN support via USB-C-to-LAN adapters  
* Activated by enabling any of the Wake on LAN settings of LAN Interfaces  
* Only Wake on LAN from Suspend is supported
* Updated Lenovo FCC Unlock Tool to version 2.4

### IGEL Agent for Imprivata

* Updated iia to 0.6.2igel1728370169 (content of IAFI 1.1.0).

### Imprivata

* Updated Imprivata bootstrap loader to fix CVE-2022-37454.
* Updated PIE bootstrap loader to 23.2.0.711883

### HID

* Added new registry keys to influence mouse acceleration settings:

+------------+-----------------------------------------------------------------+
| Parameter  | Use new mouse accel variant                                     |
+------------+-----------------------------------------------------------------+
| Registry   | userinterface.mouse.use_new_accel_variant                       |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | enabled / _disabled_ (default)                                  |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | Enable mouse acceleration (only for new accel variant)          |
+------------+-----------------------------------------------------------------+
| Registry   | userinterface.mouse.enable_acceleration                         |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | _enabled_ (default) / disabled                                  |
+------------+-----------------------------------------------------------------+


### Cisco JVDI Client

* Updated Cisco JVDI to version 15.0.0

### Cisco Webex

* Updated Webex VDI to version 44.8.1.30603  
  Added support for AVD  
  Fixed two critical issues (Crash, Audio for Webex Calling)
* Updated Webex Meetings VDI to version 44.6.5.1, available versions: 44.6.5.1,
  43.6.8.4 and 42.10.8.14.

### Base system

* Removed support for BioSec BS Login Hand Vein Sensor due to technical reasons
  (necessary removal of QT4).
* Updated grub bootloader to 2.12 version.
* Updated StepOver Client to version 2.4.3

### Firmware update

* Added progress notification shown during migration from OS 11 to OS 12.

### zoomvdi

* Updated Zoom VDI Client to version 6.1.12. Available versions in this release:
  6.1.12.25370, 5.17.13.25060 and 5.17.6.24660.

### Hardware

* Improved hardware detection of supported LG devices.
* Validated support for Intel i226, 2.5Gbps ethernet card (copper and fiber) for
  HP t755 devices.  
  Validated support for Allied Telesis 2914SP Gbps PCIe network adapter with SFP
  Port for HP t755 devices.

### TC Setup (Java)

* Upgraded TC Setup to version 12.6.1  
* Added deviceTRUST and Cisco Webex VDI options to Sessions > AVD > AVD Sessions
  > AVD Session > Plugins page.

### Remote Management

* Improved migration from OS 11 to OS 12.  
  Upgrade of the remote management protocols is invoked as a separate step
  returning a specific reason in case of failure.

### Fabulatech

* Updated Fabulatech USB redirection to version 6.2.0.9  
* Added interfaces parameter to configure Fabulatech USB redirection to redirect
  certain interfaces only. The value is a space separated list of interface
  indices. The interfaces parameter is available in IGEL registry. After
  creation of device rule with VID and PID for the related device, the IGEL
  registry under rdp.usbredirection.devicepolicy.product_rule0.interfaces must
  be used to configure the interface indices to redirect. Leave interfaces empty
  to redirect the whole device.

+------------+-----------------------------------------------------------------+
| Registry   | `rdp.usbredirection.devicepolicy.product_rule%.interfaces`      |
+------------+-----------------------------------------------------------------+
| Value      | "" (default) / space separated list of interface indices to redirect, ie. "2 3" |
+------------+-----------------------------------------------------------------+


Security Fixes
--------------------------------------------------------------------------------


### Chromium

* Updated Chromium browser to current mainline version 130.0.6723.91.  
* Fixed Chromium security issues CVE-2024-10488, CVE-2024-10487, CVE-2024-10231,
  CVE-2024-10230, CVE-2024-10229, CVE-2024-9966, CVE-2024-9965, CVE-2024-9964,
  CVE-2024-9963, CVE-2024-9962, CVE-2024-9961, CVE-2024-9960, CVE-2024-9959,
  CVE-2024-9958, CVE-2024-9957, CVE-2024-9956, CVE-2024-9955, CVE-2024-9954,
  CVE-2024-9603, CVE-2024-9602, CVE-2024-9370, CVE-2024-9369, CVE-2024-9123,
  CVE-2024-9122, CVE-2024-9121, CVE-2024-9120, CVE-2024-8909, CVE-2024-8908,
  CVE-2024-8907, CVE-2024-8906, CVE-2024-8905, CVE-2024-8904, CVE-2024-8639,
  CVE-2024-8638, CVE-2024-8637, CVE-2024-8636 and CVE-2024-7025.  
* Fixed Chromium security issues CVE-2024-8362, CVE-2024-7970, CVE-2024-8198,
  CVE-2024-8194, CVE-2024-8193, CVE-2024-8035, CVE-2024-8034, CVE-2024-8033,
  CVE-2024-7981, CVE-2024-7980, CVE-2024-7979, CVE-2024-7978, CVE-2024-7977,
  CVE-2024-7976, CVE-2024-7975, CVE-2024-7974, CVE-2024-7973, CVE-2024-7972,
  CVE-2024-7971, CVE-2024-7969, CVE-2024-7968, CVE-2024-7967, CVE-2024-7966,
  CVE-2024-7965 and CVE-2024-7964.

### Firefox

* Updated Mozilla Firefox to version 115.16.1 ESR  
* Fixes for mfsa2024-30, also known as:  
  CVE-2024-7652, CVE-2024-6600, CVE-2024-6601, CVE-2024-6602,  
  CVE-2024-6603, CVE-2024-6604.  
* Fixes for mfsa2024-34, also known as:  
  CVE-2024-7519, CVE-2024-7521, CVE-2024-7522, CVE-2024-7524,  
  CVE-2024-7525, CVE-2024-7526, CVE-2024-7527, CVE-2024-7529,  
  CVE-2024-7531.  
* Fixes for mfsa2024-41, also known as:  
  CVE-2024-8381, CVE-2024-8382, CVE-2024-8383, CVE-2024-8384.  
* Fixes for mfsa2024-48, also known as:  
  CVE-2024-9392, CVE-2024-9393, CVE-2024-9394, CVE-2024-9401.  
* Fixes for mfsa2024-51, also known as:  
  CVE-2024-9680.

### Imprivata

* Updated Imprivata bootstrap loader to fix CVE-2022-37454.

### Base system

* Fixed bind9 security issues CVE-2024-4076, CVE-2024-1975, CVE-2024-1737,
  CVE-2024-0760, CVE-2023-5679, CVE-2023-5517, CVE-2023-50868, CVE-2023-50387,
  CVE-2023-4408, CVE-2023-4236 and CVE-2023-3341.  
* Fixed python3.10 security issues CVE-2024-8088, CVE-2024-7592, CVE-2024-6923,
  CVE-2024-6232, CVE-2023-27043, CVE-2024-0450 and CVE-2023-6597.  
* Fixed openssl security issue CVE-2022-40735.  
* Fixed wget security issue CVE-2024-38428.  
* Fixed aom security issue CVE-2024-5171.  
* Fixed cups security issues CVE-2024-47175 and CVE-2024-35235.  
* Fixed krb5 security issues CVE-2024-37371 and CVE-2024-37370.  
* Fixed openvpn security issues CVE-2024-5594 and CVE-2024-28882.  
* Fixed wpa security issues CVE-2024-5290 and CVE-2023-52160.  
* Fixed ghostscript security issues CVE-2024-29511, CVE-2024-29509,
  CVE-2024-29508 and CVE-2024-29506.  
* Fixed zulu17-ca security issues CVE-2024-21131, CVE-2024-21138,
  CVE-2024-21140, CVE-2024-21145 and CVE-2024-21147.  
* Fixed gtk+2.0 security issue CVE-2024-6655.  
* Fixed gtk+3.0 security issue CVE-2024-6655.  
* Fixed openvpn security issue CVE-2024-5594.  
* Fixed qtbase-opensource-src security issue CVE-2024-39936.  
* Fixed python-zipp security issue CVE-2024-5569.  
* Fixed poppler security issue CVE-2024-6239.  
* Fixed openssl1.1 security issues CVE-2024-5535, CVE-2024-4741 and
  CVE-2024-2511.  
* Fixed openssh security issue CVE-2024-39894.  
* Fixed python3.10 security issues CVE-2024-4032 and CVE-2024-0397.  
* Fixed openssl security issues CVE-2024-6119, CVE-2024-5535, CVE-2024-4741,
  CVE-2024-4603 and CVE-2024-2511.  
* Fixed mysql-8.0 security issues CVE-2024-21185, CVE-2024-21179,
  CVE-2024-21177, CVE-2024-21173, CVE-2024-21171, CVE-2024-21165,
  CVE-2024-21163, CVE-2024-21162, CVE-2024-21142, CVE-2024-21134,
  CVE-2024-21130, CVE-2024-21129, CVE-2024-21127, CVE-2024-21125 and
  CVE-2024-20996.  
* Fixed gnome-shell security issue CVE-2024-36472.  
* Fixed orc security issue CVE-2024-40897.  
* Fixed postgresql-14 security issue CVE-2024-7348.  
* Fixed bubblewrap security issue CVE-2024-42472.  
* Fixed curl security issues CVE-2024-8096, CVE-2024-7264, CVE-2024-6874 and
  CVE-2024-6197.  
* Fixed vim security issues CVE-2024-43802, CVE-2024-43374 and CVE-2024-41957.  
* Fixed webkit2gtk security issues CVE-2024-44187, CVE-2024-40866,
  CVE-2024-27851, CVE-2024-27838, CVE-2024-27833, CVE-2024-27820,
  CVE-2024-27808, CVE-2024-23271, CVE-2024-4558, CVE-2024-40794, CVE-2024-40789,
  CVE-2024-40785, CVE-2024-40782, CVE-2024-40780, CVE-2024-40779, CVE-2024-40776
  and CVE-2024-27834.  
* Fixed ffmpeg security issues CVE-2024-7272 and CVE-2024-7055.  
* Fixed expat security issues CVE-2024-50602, CVE-2024-45492, CVE-2024-45491 and
  CVE-2024-45490.  
* Fixed tiff security issue CVE-2024-7006.  
* Fixed setuptools security issue CVE-2024-6345.  
* Fixed apparmor security issue CVE-2016-1585.  
* Fixed libvirt security issue CVE-2024-8235.  
* Fixed qemu security issues CVE-2024-8612, CVE-2024-4467, CVE-2024-7409 and
  CVE-2024-6505.  
* Fixed cups-filters security issues CVE-2024-47176 and CVE-2024-47076.  
* Fixed nano security issue CVE-2024-5742.  
* Fixed zulu17-ca security issues CVE-2023-42950, CVE-2024-25062,
  CVE-2024-21235, CVE-2024-21217, CVE-2024-21210 and CVE-2024-21208.  
* Fixed libheif security issues CVE-2024-25269, CVE-2023-49464, CVE-2023-49463,
  CVE-2023-49462, CVE-2023-49460 and CVE-2023-0996.  
* Fixed libvpx6 security issue CVE-2024-5197.  
* Fixed xorg-server security issue CVE-2024-9632.  
* Fixed python-urllib3 security issue CVE-2024-37891.


Resolved Issues
--------------------------------------------------------------------------------


### Citrix

* Fixed ica.module.EnableVolumeListener has an effect at EnableAudioListener of
  file module.ini
* Fixed: Citrix processes does not run if no sessions are configured. The
  processes are restarted with changed configuration.

### AVD

* Fixed PAUSE and Ctrl+PAUSE=BREAK keys to work as expected
* Fixed  dynamic virtual channel initialization

### RDP/IGEL RDP Client 2

* Added parameter to disable X11 autorepeat detection and handling:

+------------+-----------------------------------------------------------------+
| Registry   | `sessions.winconnect%.option.disable-autorepeat-detection`      |
+------------+-----------------------------------------------------------------+
| Value      | enabled / **disabled**(default)                                 |
+------------+-----------------------------------------------------------------+

* This fixes barcode reader dropping inputs when scanning labels with reoccuring
  characters.
* Fixed generic USB redirection for some devices (ie. ID 046d:0825 Logitech,
  Inc. Webcam C270)
* Fixed serial port redirection not working for COM10 and above.

### RD Web Access

* Fixed RDP desktop session not working when published as a remote app.
* Fixed Remote Desktop Web Access login not working reliably.
* Fixed display filters not working for Rd Web Access.
* Fixed disabling Verify Certificates not working for RD Web Access.

### VMware Horizon

* Fixed collection of logs.
* Fixed handling of audio preferences (vmware.view.audio-out-option)

### Chromium

* Fixed custom policy URLBlocklist not working properly if file access and using
  IGEL Setup for configuration was disabled.
* Fixed system volume being automatically adjusted by Chromium Browser.

### Firefox

* Fixed on-screen keyboard auto show / hide functionality.

### Network

* Fixed SCEP: When the CA fingerprint or the CA identifier is changed, client
  certificate and client key are not discarded anymore. Only new CA and RA
  certificates will be downloaded.
* Added for SCEP: Content-Type: application/x-pki-message is sent according to
  RFC 8894 if the following option is enabled:

+------------+-----------------------------------------------------------------+
| Parameter  | Send Content-Type                                               |
+------------+-----------------------------------------------------------------+
| Registry   | network.scepclient.cert%.sscep.send_content_type                |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | enabled / _disabled_ (default)                                  |
+------------+-----------------------------------------------------------------+

* Improved shutdown time by removing loopback interface from NetworkManager's
  managed interfaces.
* Fixed sporadic no-link messages regarding a deactivated Ethernet interface

### HID

* Fixed auto-suspend of HID devices after reboot.
* Fixed touchscreen right click by using touchegg gesture recognition for two
  finger tap. Further gestures are not supported.  
  Added registry key to enable touchegg multitouch gesture support.

+------------+-----------------------------------------------------------------+
| Parameter  | Use touchegg for multitouch gestures handling.                  |
+------------+-----------------------------------------------------------------+
| Registry   | userinterface.touchscreen.touchegg                              |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | enabled / _disabled_ (default)                                  |
+------------+-----------------------------------------------------------------+


### Base system

* Fixed: Wrong assignment of socks proxy port
* Fixed issue with license is not detected on some devices.
* Fixed issue with not using 2.5 Gbit/s or 5 Gbit/s if it would be possible.
* Fixed not functional proxy if system-wide proxy was configured.
* Fixed: Taskbar items blinking several times.
* Removed QT4 libraries from firmware.
* Changed configuration of webcam priority. V4L Name is used for identifying the
  webcam. If only one webcam is present, no entry is needed. If multiple webcams
  are present without set priority, the first one is used.
* ## Added parameters in registry

+------------+-----------------------------------------------------------------+
| Parameter  | Camera name                                                     |
+------------+-----------------------------------------------------------------+
| Registry   | multimedia.webcam.camera%.name                                  |
+------------+-----------------------------------------------------------------+
| Type       | string                                                          |
+------------+-----------------------------------------------------------------+
| Value      | camera _Default_                                                |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | priority                                                        |
+------------+-----------------------------------------------------------------+
| Registry   | multimedia.webcam.camera%.priority                              |
+------------+-----------------------------------------------------------------+
| Type       | integer                                                         |
+------------+-----------------------------------------------------------------+
| Value      | 0 _Default_                                                     |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | V4L2 name                                                       |
+------------+-----------------------------------------------------------------+
| Registry   | multimedia.webcam.camera%.v4lname                               |
+------------+-----------------------------------------------------------------+
| Type       | string                                                          |
+------------+-----------------------------------------------------------------+
| Value      | v4l2-string _Default_                                           |
+------------+-----------------------------------------------------------------+

* Lower number means higher priority.
* ## Obsolete Registry Parameters

+------------+-----------------------------------------------------------------+
| Parameter  | Select how the webcam to use should be choosen.                 |
+------------+-----------------------------------------------------------------+
| Registry   | multimedia.webcam.virtual_background.choose_webcam_by           |
+------------+-----------------------------------------------------------------+
| Range      | [Use first webcam][Choose by name]                              |
|            | [Choose by vendor_id:product_id][Choose by number]              |
|            | [Choose by devicename][Choose by priority]                      |
+------------+-----------------------------------------------------------------+
| Value      | _Use first webcam_                                              |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | Select webcam by number (only valid if choose by number is used) |
+------------+-----------------------------------------------------------------+
| Registry   | multimedia.webcam.virtual_background.webcam_number              |
+------------+-----------------------------------------------------------------+
| Type       | integer                                                         |
+------------+-----------------------------------------------------------------+
| Value      | 1 _Default_                                                     |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | Select webcam by name (only valid if choose by name is used)    |
+------------+-----------------------------------------------------------------+
| Registry   | multimedia.webcam.virtual_background.webcam_name                |
+------------+-----------------------------------------------------------------+
| Type       | string                                                          |
+------------+-----------------------------------------------------------------+
| Value      | empty _Default_                                                 |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | Select webcam by vendor_id:product_id (only valid if choose by vendor_id:product_id is used) |
+------------+-----------------------------------------------------------------+
| Registry   | multimedia.webcam.virtual_background.webcam_vendor_product      |
+------------+-----------------------------------------------------------------+
| Type       | string                                                          |
+------------+-----------------------------------------------------------------+
| Value      | empty _Default_                                                 |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | Select webcam by devicename for example /dev/video0 or video0 (only valid if choose by devicename is used) |
+------------+-----------------------------------------------------------------+
| Registry   | multimedia.webcam.virtual_background.webcam_device              |
+------------+-----------------------------------------------------------------+
| Type       | string                                                          |
+------------+-----------------------------------------------------------------+
| Value      | empty _Default_                                                 |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | Select webcam by priority list for example dev=video0;name=HD_Webcam_C270 (only valid if choose by priority is used)}} |
+------------+-----------------------------------------------------------------+
| Registry   | multimedia.webcam.virtual_background.webcam_priority            |
+------------+-----------------------------------------------------------------+
| Type       | string                                                          |
+------------+-----------------------------------------------------------------+
| Value      | empty _Default_                                                 |
+------------+-----------------------------------------------------------------+


### Firmware update

* Fixed disk size detection of 8 GB flash sizes for OS 12 migration. With this
  fix migration works on UD Pockets again.
* Fixed OS11 to OS12 migration issue due to repartition not always working with
  non GPT partition tables.
* Fixed FTP server configuration to properly reflect the configured maxim number
  of connections. Please note that there's a hard limit of 100 concurrent
  connections in the FTP server.
* Fixed migration dbus timeout on slower devices if migration prepare is needed.

### X11 system

* Fixed primary monitor configuration with new Display switcher implementation.
  The panel appears on the proper monitor again.

### Audio

* Fixed USB headset support on LG CQ600i
* Added parameter to set output level of a headphone in ALSA to maximum at every
  start.

+------------+-----------------------------------------------------------------+
| Parameter  | Set headphone in alsa to maximum                                |
+------------+-----------------------------------------------------------------+
| Registry   | multimedia.alsa.headphone_max_volume                            |
+------------+-----------------------------------------------------------------+
| Range      | [auto][true][false]                                             |
+------------+-----------------------------------------------------------------+
| Value      | _auto_                                                          |
+------------+-----------------------------------------------------------------+


### Hardware

* Fixed issue with Intel and additional graphic cards:  
* All graphic cards are now detected properly,  
* All screens attached to all graphic cards are active.
* Fixed WiFi on Lenovo Ideapad devices. The last ON/OFF state of the WiFi is
  restored on each boot or reboot.
* Changed: Disabled suspend on HP t240.

### Remote Management

* Fixed rmagent device registration.
* Added setup parameter to set connect timeout

+------------+-----------------------------------------------------------------+
| IGEL Setup | system > remotemanager                                          |
+============+=================================================================+
| Parameter  | `IGEL Remote Management Connect Timeout`                        |
+------------+-----------------------------------------------------------------+
| Registry   | `system.remotemanager.connect_timeout`                          |
+------------+-----------------------------------------------------------------+
| Type       | integer                                                         |
+------------+-----------------------------------------------------------------+
| Value      | timeout in sec / **45** (default)                               |
+------------+-----------------------------------------------------------------+


Release Notes 11.10.150 (Based On 11.10.100)
--------------------------------------------------------------------------------


New Features
--------------------------------------------------------------------------------


### AVD

* Updated IGEL AVD to version 1.2.0
* Based on the latest RdClientSDK from Microsoft
* UI update for AVD sessions
* Added UDP shortpath

+------------+-----------------------------------------------------------------+
| Registry   | `sessions.wvd%.options.udp-short-path`                          |
+------------+-----------------------------------------------------------------+
| Value      | **enabled** (default) / disabled                                |
+------------+-----------------------------------------------------------------+

* Added smartcard support

+------------+-----------------------------------------------------------------+
| Registry   | `sessions.wvd%.options.enable-smartcard`                        |
+------------+-----------------------------------------------------------------+
| Value      | enabled / **disabled** (default)                                |
+------------+-----------------------------------------------------------------+

* Added network status

+------------+-----------------------------------------------------------------+
| Registry   | `sessions.wvd%.options.network-status-in-toolbar`               |
+------------+-----------------------------------------------------------------+
| Value      | **enabled** (default) / disabled                                |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Registry   | `sessions.wvd%.options.network-status-on-startpage`             |
+------------+-----------------------------------------------------------------+
| Value      | **enabled** (default) / disabled                                |
+------------+-----------------------------------------------------------------+

* Added battery status (if battery exists)

+------------+-----------------------------------------------------------------+
| Registry   | `sessions.wvd%.options.battery-status-in-toolbar`               |
+------------+-----------------------------------------------------------------+
| Value      | **enabled** (default) / disabled                                |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Registry   | `sessions.wvd%.options.battery-status-on-startpage`             |
+------------+-----------------------------------------------------------------+
| Value      | **enabled** (default) / disabled                                |
+------------+-----------------------------------------------------------------+

* Added hidden login

+------------+-----------------------------------------------------------------+
| Registry   | `sessions.wvd%.options.hidden-login`                            |
+------------+-----------------------------------------------------------------+
| Value      | enabled / **disabled** (default)                                |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Registry   | `sessions.wvd%.options.hidden-login-timeout`                    |
+------------+-----------------------------------------------------------------+
| Value      | **5000** (default)                                              |
+------------+-----------------------------------------------------------------+

* Added preliminary / experimental webcam redirection

+------------+-----------------------------------------------------------------+
| Registry   | `sessions.wvd%.options.enable-webcam-redirection`               |
+------------+-----------------------------------------------------------------+
| Value      | enabled / **disabled** (default)                                |
+------------+-----------------------------------------------------------------+

* Added FPS (frames per second) indicator

+------------+-----------------------------------------------------------------+
| Registry   | `sessions.wvd%.options.show-fps`                                |
+------------+-----------------------------------------------------------------+
| Value      | enabled / **disabled** (default)                                |
+------------+-----------------------------------------------------------------+


### VMware Horizon

* Updated VMware Horizon Client to version 2312.1-8.12.1-23543969.

### IGEL Agent for Imprivata

- Added teardown screensaver on badge event  
    - Added showing computername in lockscreen's upper right corner  
    - Added  support for cookieinsert method for Citrix virtual server on
      NetScaler.


+------------+-----------------------------------------------------------------+
| Parameter  | `NetScalerÿCOOKIEINSERT`                                        |
+------------+-----------------------------------------------------------------+
| Registry   | `iia.cookieinsert`                                              |
+------------+-----------------------------------------------------------------+
| Type       | string                                                          |
+------------+-----------------------------------------------------------------+
| Value      | ""(default)                                                     |
+------------+-----------------------------------------------------------------+

- Fixed Device Control Button's visibility not in sync with Computer Policy

### Smartcard

* Updated Pointsharp Net iD Client to version 1.1.4.38. Detailed release notes
  via https://docs.pointsharp.com/net-id-client/latest/nic-release-
  notes/nic-114-release-notes.html  
* Net iD user service now is configurable and disabled by default - set / enable
  via following registry parameter:

+------------+-----------------------------------------------------------------+
| Parameter  | Net iD Client user service                                      |
+------------+-----------------------------------------------------------------+
| Registry   | scard.pkcs11.netid-client.userservice                           |
+------------+-----------------------------------------------------------------+
| Value      | false (default) / true                                          |
+------------+-----------------------------------------------------------------+

* Fixed AD/Kerberos login with username and password when login with Net iD
  Client smartcard is active. For this, Net iD SessionToken was disabled by
  default. It can be enabled via the following registry parameter:

+------------+-----------------------------------------------------------------+
| Parameter  | SessionToken                                                    |
+------------+-----------------------------------------------------------------+
| Registry   | scard.pkcs11.netid-client.sessiontoken                          |
+------------+-----------------------------------------------------------------+
| Value      | false (default) / true                                          |
+------------+-----------------------------------------------------------------+


### Cisco Webex

* Updated Cisco Webex VDI to version 44.4.0.29960

### Base system

* Added HP BIOS tools to update the BIOS version, BIOS settings and BIOS
  password on supported HP mobile devices HP Pro mt440 G3, HP Elite mt645 G7 and
  HP Elite mt645 G8. IGEL supports the BIOS update mechanism only - all BIOS
  updates are performed / executed at own risk!
* Added option to set hardware clock. The default, Auto, will look for Windows
  partitions and, if present, assume that Windows is installed and the real time
  clock is set to local time.

+------------+-----------------------------------------------------------------+
| Parameter  | `HW clock timezone`                                             |
+------------+-----------------------------------------------------------------+
| Registry   | `system.time.hwclock_timezone`                                  |
+------------+-----------------------------------------------------------------+
| Range      | [Auto (default)] [UTC] [localtime]                              |
+------------+-----------------------------------------------------------------+


### X11 system

* Added alternative Display Switcher implementation to solve issues with
  multiscreen setups on docking stations. This alternative implementation must
  be enabled by following parameter:

+------------+-----------------------------------------------------------------+
| Parameter  |  `Use new user_display_xrandr`                                  |
+------------+-----------------------------------------------------------------+
| Registry   |  `x.new_user_display_xrandr`                                    |
+------------+-----------------------------------------------------------------+
| Value      | enabled / **disabled** (default)                                |
+------------+-----------------------------------------------------------------+

* The alternative implementation is only used if "Smart display configuration"
  parameter is enabled:

+------------+-----------------------------------------------------------------+
| IGEL Setup |  `Accessories / Display Switch / Options`                       |
+------------+-----------------------------------------------------------------+
| Parameter  |  `Smart display configuration`                                  |
+------------+-----------------------------------------------------------------+
| Registry   |  `x.auto_associate`                                             |
+------------+-----------------------------------------------------------------+
| Value      | **enabled** (default)  / disabled                               |
+------------+-----------------------------------------------------------------+

* This implementation can not yet be used in multi GPU scenarios.

### IgelDesktop

* Replaced IGEL company logo with new design in wallpaper and Setup Assistant.
* Replaced IGEL company logo with new design in screensaver.

### Audio

* Added parameter to enable or disable audio overamplification:

+------------+-----------------------------------------------------------------+
| Parameter  | `Output overamplification`                                      |
+------------+-----------------------------------------------------------------+
| Registry   | `userinterface.sound.overamplification`                         |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | _enabled_ (default) / disabled                                  |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | `Input overamplification`                                       |
+------------+-----------------------------------------------------------------+
| Registry   | `userinterface.sound.input_overamplification`                   |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | _enabled_ (default) / disabled                                  |
+------------+-----------------------------------------------------------------+


### Evidian

* Updated Evidian's rsUserAuth to version 1.5.8825.  
    - Added RFIDeas PC/SC Mixed-Mode.  
      Set "RFIDMixMode=on" in rsUserAuth.ini configuration file and handle
      RFIDeas badges as PC/SC one.  
    - Added support for Read-only protection on the domain field.   
      Set "GreyOutDomainField=on" in rsUserAuth.ini configuration file to set
      Domain field uneditable.  
    - Fixed welcome screen not properly displayed with different DPI Settings.
      Homogenization of the entire interface.


### Hardware

* IGEL UD7 H850C (UD7-LX 10, UD7-LX 11): Removed hardware support.
* Added support for Intel EC1000R network device.
* Added hardware support for HP Elite mt645 G8 Mobile Thin Client.
* Added hardware support for Lenovo Thinkpad L14 Intel Gen 5.
* Updated fwupd to version 1.9.19  
* Updated IGEL LVFS bios tools to allow controlling CapsuleOnDisk updates via
  the new parameter: fwtools.bios-tools.disable_capsule_on_disk (default: true)
* Improved hardware detection of supported LG devices.
* Added support for Quectel CAT16 WW SKU - EM160R-GL Gen2 and Quectel CAT 6 WW
  SKU - EM061K-GL on Lenovo ThinkPad L14 Intel Gen5

### Fabulatech

* Updated FabulaTech plugins to version 4.0.0.2
* Updated FabulaTech Scanner for Remote Desktop to version 3.6.1.3
* Updated FabulaTech USB for Remote Desktop to version 6.2.0.0


Security Fixes
--------------------------------------------------------------------------------


### Chromium

* Fixed Chromium security issues CVE-2024-6103, CVE-2024-6102, CVE-2024-6101,
  CVE-2024-6100, CVE-2024-5847, CVE-2024-5846, CVE-2024-5845, CVE-2024-5844,
  CVE-2024-5843, CVE-2024-5842, CVE-2024-5841, CVE-2024-5840, CVE-2024-5839,
  CVE-2024-5838, CVE-2024-5837, CVE-2024-5836, CVE-2024-5835, CVE-2024-5834,
  CVE-2024-5833, CVE-2024-5832, CVE-2024-5831, CVE-2024-5830, CVE-2024-5499,
  CVE-2024-5498, CVE-2024-5497, CVE-2024-5496, CVE-2024-5495, CVE-2024-5494,
  CVE-2024-5493, CVE-2024-5274, CVE-2024-5160, CVE-2024-5159, CVE-2024-5158,
  CVE-2024-5157, CVE-2024-4950, CVE-2024-4949, CVE-2024-4948, CVE-2024-4947,
  CVE-2024-4761, CVE-2024-4671, CVE-2024-4559, CVE-2024-4558, CVE-2024-4368 and
  CVE-2024-4331.
* Updated Chromium browser to version 126.0.6478.114.

### Firefox

* Updated Mozilla Firefox to version 115.12 ESR  
* Fixes for mfsa2024-26, also known as:  
  CVE-2024-5702, CVE-2024-5688, CVE-2024-5690, CVE-2024-5691,  
  CVE-2024-5693, CVE-2024-5696, CVE-2024-5700.  
* Fixes for mfsa2024-22, also known as:  
  CVE-2024-4367, CVE-2024-4767, CVE-2024-4768, CVE-2024-4769,  
  CVE-2024-4770, CVE-2024-4777.  
* Fixes for mfsa2024-19, also known as:  
  CVE-2024-3852, CVE-2024-3854, CVE-2024-3857, CVE-2024-2609,  
  CVE-2024-3859, CVE-2024-3861, CVE-2024-3302, CVE-2024-3864.

### Base system

* Fixed glibc security issues CVE-2024-33602, CVE-2024-33601, CVE-2024-33600,
  CVE-2024-33599 and CVE-2024-2961.  
* Fixed gnutls28 security issues CVE-2024-28835 and CVE-2024-28834.  
* Fixed nghttp2 security issue CVE-2024-28182.  
* Fixed pillow security issue CVE-2024-28219.  
* Fixed less security issue CVE-2024-32487.  
* Fixed tpm2-tss security issue CVE-2024-29040.  
* Fixed libvirt security issues CVE-2024-4418 and CVE-2024-2494.  
* Fixed qemu security issues CVE-2024-3567, CVE-2024-3447, CVE-2024-3446,
  CVE-2024-26328 and CVE-2024-26327.  
* Fixed tpm2-tools security issues CVE-2024-29039 and CVE-2024-29038.  
* Fixed xorg-server security issues CVE-2024-31083, CVE-2024-31082,
  CVE-2024-31081 and CVE-2024-31080.  
* Fixed glib2.0 security issue CVE-2024-34397.  
* Fixed zulu17-ca security issues CVE-2024-21012, CVE-2023-41993,
  CVE-2024-21011, CVE-2024-21005, CVE-2024-21004, CVE-2024-21003,
  CVE-2024-21002, CVE-2024-21094 and CVE-2024-21068.  
* Fixed webkit2gtk security issues CVE-2024-27834, CVE-2024-23284,
  CVE-2024-23280, CVE-2024-23263, CVE-2024-23254, CVE-2024-23252,
  CVE-2023-42956, CVE-2023-42950 and CVE-2023-42843.  
* Fixed python-idna security issue CVE-2024-3651.  
* Fixed libxml2 security issue CVE-2024-34459.  
* Fixed postgresql-14 security issue CVE-2024-4317.  
* Fixed iperf3 security issue CVE-2024-26306.  
* Fixed libarchive security issue CVE-2024-26256.  
* Fixed aom security issue CVE-2024-5171.  
* Fixed gdk-pixbuf security issue CVE-2022-48622.  
* Fixed giflib security issues CVE-2022-28506 and CVE-2021-40633.  
* Fixed tiff security issue CVE-2023-3164.  
* Fixed cups security issue CVE-2024-35235.  
* Fixed mysql-8.0 security issues CVE-2024-21102, CVE-2024-21096,
  CVE-2024-21087, CVE-2024-21069, CVE-2024-21062, CVE-2024-21060,
  CVE-2024-21054, CVE-2024-21047, CVE-2024-21013, CVE-2024-21009,
  CVE-2024-21008, CVE-2024-21000, CVE-2024-20998 and CVE-2024-20994.  
* Fixed libndp security issue CVE-2024-5564.  
* Fixed ntfs-3g security issue CVE-2023-52890.  
* Fixed ffmpeg security issues CVE-2023-50010, CVE-2023-51793, CVE-2023-51794,
  CVE-2023-51795, CVE-2023-51798 and CVE-2024-31585.  
* Fixed ghostscript security issues CVE-2024-33871, CVE-2024-33870,
  CVE-2024-33869, CVE-2024-29510 and CVE-2023-52722.
* Fixed privilege escalation in network management.
* Fixed openssh security issue CVE-2024-6387.


Resolved Issues
--------------------------------------------------------------------------------


### Citrix

* Fixed not working HDX webcam redirection for Citrix 2203 and later.
* Fixed Browser Content Redirection.

### AVD

* Fixed AVD session when driven from IGEL Imprivata Agent

### RDP/IGEL RDP Client 2

* Fixed RDP Session dropping characters when input occurs too fast.

### RD Web Access

* Fixed Passthrough and Kerberos Authentication for RD Web Access.
* Added block for keyboard shortcuts containing windows key for RD Web Access
  apps. Can be disabled in IGEL Setup

+------------+-----------------------------------------------------------------+
| Registry   | `rdp.rd_web_access.suppress-windows-key-shortcuts`              |
+------------+-----------------------------------------------------------------+
| Value      |  **enabled** (default) / disabled                               |
+------------+-----------------------------------------------------------------+

* Fixed RD Web Access failing with Error 400 by providing a new RD Web Tool. A
  switch back to the old tool is possible via IGEL Setup Registry:

+------------+-----------------------------------------------------------------+
| Registry   | `rdp.rd_web_access.options.legacy_rdweb`                        |
+------------+-----------------------------------------------------------------+
| Value      | enabled / **disabled** (default)                                |
+------------+-----------------------------------------------------------------+


### Chromium

* Fixed still being able to download files if file access was disabled - occured
  in combination with empty download directory.

### Network

* On devices that support mobile broadband and eSim an automatic switch to the
  physical sim slot is now performed if eSim has no profile assigned

### Base system

* Fixed Post Session Command 'Shutdown'.
* Fixed wrong assignment of socks proxy port

### Hardware

* Fixed missing firmware file for Intel 9462NGW Wi-Fi.
* Fixed LVFS BIOS update on Lenovo ThinkCentre M70q Gen3.
* Fixed microphone mute function key on HP mt645 G8.

### Remote Management

* Fixed resource leak in ICG reconnect mechanism.
* Fixed: All connections / device connectors are used during OS 12 migration
  now.
* Fixed ICG reconnecting - now it reliably invokes a reconnect whenever a device
  is not connected to configured ICG server.
* Fixed UMS registering via UMS registration tool in IGEL OS - if device is
  registered to root directory in UMS.


Release Notes 11.10.100
--------------------------------------------------------------------------------


New Features
--------------------------------------------------------------------------------


### Citrix

* Updated Citrix Workspace App to version 2402.  
  Available Citrix Workspace Apps in this release: 2402 (default), 2311 and 2010
* New features:  
* Synchronize multiple keyboards at session start. All available keyboards on
  client are synchronized with VDA after the session starts in full-screen mode.

+------------+-----------------------------------------------------------------+
|Parameter   |`Synchronize multiple keyboards at session start`                |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.wfclient.SyncKbdLayoutList`                                 |
+------------+-----------------------------------------------------------------+
|Value       | false (default) /  true                                         |
+------------+-----------------------------------------------------------------+

* Support for Audio volume synchronization. Synchronize audio volume between the
  VDA and connected audio devices.

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

* Customize toolbar [Technical Preview]. From this version onwards, it is
  possible to activate or deactivate each button individually instead of the
  entire toolbar.

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


### Firefox

* Fixed lock of browser in kiosk mode, when URL or navigation bar are blocked:  
  Firefox asks the user using a dialog to query for permissions of the current
  website for location access, microphone and camera use, notifications and
  auto-play of media streams.  
  In recent Firefox versions this locks the browser in case the URL-input or
  even the whole navigation bar are not shown.
* To prevent, following policies / parameters are added:
* If permissions are needed, these must be granted for the specific websites in
  advance. Note that wild-cards in the URLs cannot be used.  
  These websites, depending on the type of permission, must be added here:  
  browserglobal.app.permissions.microphone.allowed%.origin  
  browserglobal.app.permissions.webcam.allowed%.origin  
  browserglobal.app.permissions.location.allowed%.origin  
  browserglobal.app.permissions.notification.allowed%.origin  
  browserglobal.app.permissions.autoplay.allowed%.origin

+------------+-----------------------------------------------------------------+
| Parameter  | {{Website with microphone access}}                              |
+------------+-----------------------------------------------------------------+
| Registry   | {{browserglobal.app.permissions.microphone.allowed%.origin}}    |
+------------+-----------------------------------------------------------------+
| Type       | string                                                          |
+------------+-----------------------------------------------------------------+
| Value      | empty _Default_                                                 |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | {{Website without microphone access}}                           |
+------------+-----------------------------------------------------------------+
| Registry   | {{browserglobal.app.permissions.microphone.blocked%.origin}}    |
+------------+-----------------------------------------------------------------+
| Type       | string                                                          |
+------------+-----------------------------------------------------------------+
| Value      | empty _Default_                                                 |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | {{Block new requests for microphone access}}                    |
+------------+-----------------------------------------------------------------+
| Registry   | {{browserglobal.app.permissions.microphone.blocknew}}           |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | enabled / _disabled_ (default)                                  |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | {{Microphone access settings locked}}                           |
+------------+-----------------------------------------------------------------+
| Registry   | {{browserglobal.app.permissions.microphone.locked}}             |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | enabled / _disabled_ (default)                                  |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | {{Website with webcam access}}                                  |
+------------+-----------------------------------------------------------------+
| Registry   | {{browserglobal.app.permissions.camera.allowed%.origin}}        |
+------------+-----------------------------------------------------------------+
| Type       | string                                                          |
+------------+-----------------------------------------------------------------+
| Value      | empty _Default_                                                 |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | {{Website without webcam access}}                               |
+------------+-----------------------------------------------------------------+
| Registry   | {{browserglobal.app.permissions.camera.blocked%.origin}}        |
+------------+-----------------------------------------------------------------+
| Type       | string                                                          |
+------------+-----------------------------------------------------------------+
| Value      | empty _Default_                                                 |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | {{Block new requests for webcam access}}                        |
+------------+-----------------------------------------------------------------+
| Registry   | {{browserglobal.app.permissions.camera.blocknew}}               |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | enabled / _disabled_ (default)                                  |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | {{Webcam access settings locked}}                               |
+------------+-----------------------------------------------------------------+
| Registry   | {{browserglobal.app.permissions.camera.locked}}                 |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | enabled / _disabled_ (default)                                  |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | {{Allow Website to send notifications}}                         |
+------------+-----------------------------------------------------------------+
| Registry   | {{browserglobal.app.permissions.notification.allowed%.origin}}  |
+------------+-----------------------------------------------------------------+
| Type       | string                                                          |
+------------+-----------------------------------------------------------------+
| Value      | empty _Default_                                                 |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | {{Deny Website to send notifications}}                          |
+------------+-----------------------------------------------------------------+
| Registry   | {{browserglobal.app.permissions.notification.blocked%.origin}}  |
+------------+-----------------------------------------------------------------+
| Type       | string                                                          |
+------------+-----------------------------------------------------------------+
| Value      | empty _Default_                                                 |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | {{Block new notification requests}}                             |
+------------+-----------------------------------------------------------------+
| Registry   | {{browserglobal.app.permissions.notification.blocknew}}         |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | enabled / _disabled_ (default)                                  |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | {{Notification settings locked}}                                |
+------------+-----------------------------------------------------------------+
| Registry   | {{browserglobal.app.permissions.notification.locked}}           |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | enabled / _disabled_ (default)                                  |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | {{Allow autoplay on Website}}                                   |
+------------+-----------------------------------------------------------------+
| Registry   | {{browserglobal.app.permissions.autoplay.allowed%.origin}}      |
+------------+-----------------------------------------------------------------+
| Type       | string                                                          |
+------------+-----------------------------------------------------------------+
| Value      | empty _Default_                                                 |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | {{Block autoplay on Website}}                                   |
+------------+-----------------------------------------------------------------+
| Registry   | {{browserglobal.app.permissions.autoplay.blocked%.origin}}      |
+------------+-----------------------------------------------------------------+
| Type       | string                                                          |
+------------+-----------------------------------------------------------------+
| Value      | empty _Default_                                                 |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | {{Autoplay Default}}                                            |
+------------+-----------------------------------------------------------------+
| Registry   | {{browserglobal.app.permissions.autoplay.default}}              |
+------------+-----------------------------------------------------------------+
| Range      | [Allow Audio and Video][Block Audio][Block Audio and Video]     |
+------------+-----------------------------------------------------------------+
| Value      | _Block Audio_                                                   |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | {{Autoplay settings locked}}                                    |
+------------+-----------------------------------------------------------------+
| Registry   | {{browserglobal.app.permissions.autoplay.locked}}               |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | enabled / _disabled_ (default)                                  |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | {{Website with location access}}                                |
+------------+-----------------------------------------------------------------+
| Registry   | {{browserglobal.app.permissions.location.allowed%.origin}}      |
+------------+-----------------------------------------------------------------+
| Type       | string                                                          |
+------------+-----------------------------------------------------------------+
| Value      | empty _Default_                                                 |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | {{Website without location access}}                             |
+------------+-----------------------------------------------------------------+
| Registry   | {{browserglobal.app.permissions.location.blocked%.origin}}      |
+------------+-----------------------------------------------------------------+
| Type       | string                                                          |
+------------+-----------------------------------------------------------------+
| Value      | empty _Default_                                                 |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | {{Block new location requests }}                                |
+------------+-----------------------------------------------------------------+
| Registry   | {{browserglobal.app.permissions.location.blocknew}}             |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | enabled / _disabled_ (default)                                  |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | {{Location settings locked}}                                    |
+------------+-----------------------------------------------------------------+
| Registry   | {{browserglobal.app.permissions.location.locked}}               |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | enabled / _disabled_ (default)                                  |
+------------+-----------------------------------------------------------------+


### IGEL Agent for Imprivata

* Updated IGEL Agent for Imprivata to version 1.0.0.
* Added Features:  
* Changed FUS (Fast User Switching) to be a standalone IGEL Session.  
* Removed 'rfideas-only barrier' for virtual channel.  
* Changed running text to show only the username.  
* Improved logging.  
* Introduced new parameter to insert command to execute on FUS user switch or
  logout:

+------------+-----------------------------------------------------------------+
| Registry   | `iia.fus_user_change_cmd`                                       |
+------------+-----------------------------------------------------------------+
| Type       | string                                                          |
+------------+-----------------------------------------------------------------+
| Value      | "" (default)                                                    |
+------------+-----------------------------------------------------------------+

* Introduced new reg key to configure the LockScreen shortcut:

+------------+-----------------------------------------------------------------+
| Registry   | `iia.lockscreen_shortcut`                                       |
+------------+-----------------------------------------------------------------+
| Type       | string                                                          |
+------------+-----------------------------------------------------------------+
| Value      | ""(default)                                                     |
+------------+-----------------------------------------------------------------+

*


Security Fixes
--------------------------------------------------------------------------------


### Chromium

* Updated Chromium browser to version 124.0.6367.78. (ISN 2024-11)

### Base system

* Fixed aom security issues CVE-2021-30475, CVE-2021-30474, CVE-2021-30473,
  CVE-2020-36135, CVE-2020-36133, CVE-2020-36131 and CVE-2020-36130.  
* Fixed openssl security issues CVE-2024-0727, CVE-2023-5678, CVE-2023-3817 and
  CVE-2023-3446.  
* Fixed zlib security issues CVE-2022-37434 and CVE-2018-25032.  
* Fixed pipewire security issue CVE-2022-4964.  
* Fixed libuv1 security issue CVE-2024-24806.  
* Fixed libwebp security issue CVE-2023-4863.  
* Fixed iwd security issue CVE-2024-28084.  
* Fixed qemu security issue CVE-2023-6683.  
* Fixed opensc security issues CVE-2024-1454 and CVE-2023-5992.  
* Fixed libde265 security issues CVE-2023-49468, CVE-2023-49467, CVE-2023-49465,
  CVE-2023-47471, CVE-2023-43887, CVE-2023-27103, CVE-2023-27102,
  CVE-2023-25221, CVE-2023-24758, CVE-2023-24757, CVE-2023-24756,
  CVE-2023-24755, CVE-2023-24754, CVE-2023-24752, CVE-2023-24751,
  CVE-2022-47665, CVE-2022-43250, CVE-2022-43249, CVE-2022-43245 and
  CVE-2022-43244.  
* Fixed postgresql-14 security issue CVE-2024-0985.  
* Fixed tiff security issues CVE-2023-6277, CVE-2023-6228 and CVE-2023-52356.  
* Fixed dnsmasq security issues CVE-2023-50868 and CVE-2023-50387.  
* Fixed python-cryptography security issue CVE-2023-50782.  
* Fixed less security issue CVE-2022-48624.  
* Fixed expat security issue CVE-2024-28757.  
* Fixed libxml2 security issue CVE-2024-25062.  
* Fixed texlive-bin security issues CVE-2024-25262 and CVE-2023-32668.  
* Fixed vim security issues CVE-2024-22667 and CVE-2023-2426.  
* Fixed unixodbc security issue CVE-2024-1013.  
* Fixed bash security issue CVE-2022-3715.  
* Fixed util-linux security issue CVE-2024-28085.  
* Fixed curl security issues CVE-2024-2398 and CVE-2024-2004.  
* Fixed libvirt security issue CVE-2024-1441.
* Updated intel-microcode to version 20240312.
* Removed custom command selection from application start dialog of file manager
  to prevent execution of arbitrary commands by user. (ISN 2024-09)
* Fixed a privilege escalation issue in the starter license. Acknowledgements to
  Zack Didcott for responsible disclosure. (ISN-2014-12)


Resolved Issues:  
* Fixed display of German Umlauts (non-ascii chars).  
* Fixed password change after 2nd factor is submitted.

### Base system

* Changed initial default device name and hostname of UD Pockets to  
  "UDP<Unit ID>". Systems already in use will only be affected after reset to
  factory defaults.
* Updated OpenVPN client to version 2.6.9.  
* Updated GStreamer to version 1.24.1.  
* Updated Virtualbox guest tools to version 7.0.14.
* Updated MESA OpenGL Stack to version 24.0.4  
* Updated ATI/RADEON Graphics Driver to version 22.0.0  
* Updated NVIDIA Graphics Driver to version 525.147.05  
* Updated VESA Graphics Driver to version 2.6.0  
* Updated ModemManager to version 1.22.0.
* Updated kernel to version 6.6.22.

Resolved Issues
--------------------------------------------------------------------------------


### Citrix

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

* After connecting to Citrix VDA, support for multiple audio devices sometimes
  may not work. This problem has been fixed.
* New parameter since CWAL-2402: Availability of Credential Insertion SDK for
  cloud stores (see: https://docs.citrix.com/en-us/citrix-workspace-app-for-
  linux/sdk-and-api.html)

+------------+-----------------------------------------------------------------+
|Parameter   |`CredentialInsertionEnabled`                                     |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.authman.CredentialInsertionEnabled`                         |
+------------+-----------------------------------------------------------------+
|Value       | false (default) /  true                                         |
+------------+-----------------------------------------------------------------+

* Changed / corrected parameter name from KioskFUIEnhanced to KioskSFUIEnhanced

+------------+-----------------------------------------------------------------+
|Parameter   |`KioskSFUIEnhanced`                                              |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.authman.KioskSFUIEnhanced`                                  |
+------------+-----------------------------------------------------------------+
|Type        |bool                                                             |
+------------+-----------------------------------------------------------------+
|Value       |enabled / **disabled** (default)                                 |
+------------+-----------------------------------------------------------------+

* Added parameter ica.authman.longLivedTokenSupport. Previously the value was
  set to constant "false", now it is possible to set / configure. "true" enables
  re-login with Selfservice.

+------------+-----------------------------------------------------------------+
|Parameter   |`longLivedTokenSupport`                                          |
+------------+-----------------------------------------------------------------+
|Registry    |`ica.authman.longLivedTokenSupport`                              |
+------------+-----------------------------------------------------------------+
|Value       | false (default) /  true                                         |
+------------+-----------------------------------------------------------------+


### RD Web Access

* Fixed RD Web Access failing with Error 400 by providing a new RD Web Tool. A
  switch back to the old tool is possible via IGEL Setup Registry:

+------------+-----------------------------------------------------------------+
| Registry   | `rdp.rd_web_access.options.legacy_rdweb`                        |
+------------+-----------------------------------------------------------------+
| Value      | enabled / **disabled** (default)                                |
+------------+-----------------------------------------------------------------+


### Chromium

* Fixed blocking file access was not working if URLBlocklist was defined as
  custom policy.
* Fixed RDP sessions did not properly start from Chromium Browser.

### Firefox

* Fixed automatic restart of Firefox sessions.
* Fixed microphone pop-up.

### Network

* Added configuration for PKCS#7 encryption and signature algorithms (see sscep
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

* Fixed sporadic network connection problems on Lenovo L14/L15 Gen4 AMD if
  ethernet cable is un- and re-plugged.

### Open VPN

* Added configuration to enable legacy cryptographic algorithms for openssl.

+------------+-----------------------------------------------------------------+
| Parameter  | `Enable legacy cryptographic algorithms`                        |
+------------+-----------------------------------------------------------------+
| Registry   | `system.openssl.legacy-cryptographic-algorithms`                |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | **disabled** (default) / enabled                                |
+------------+-----------------------------------------------------------------+


### OpenConnect VPN

* Removed dependency on ipsec-tools

### HID

* Fixed touchpad activation/deactivation via hotkey.

### CUPS Printing

* Fixed PrinterLogic startup.

### Base system

* Fixed OS12 migration issues.

### X11 system

* Fixed crash with HP t655 and two monitors connected to G5 docking station.
* Added registry key to change the connector order of intel GPUs. Newer kernels
  changed the order, this can be used to revert it to former state.

+------------+-----------------------------------------------------------------+
| Parameter  | {{Reverse the connector enumeration.}}                          |
+------------+-----------------------------------------------------------------+
| Registry   | {{x.drivers.intel.reverse_connector_enumeration}}               |
+------------+-----------------------------------------------------------------+
| Range      | [Default][No][Yes]                                              |
+------------+-----------------------------------------------------------------+
| Value      | _Default_                                                       |
+------------+-----------------------------------------------------------------+


### Audio

* Fixed audio on HP t240: Removed internal speaker and microphone devices as not
  supported. Fixed hotplug of external headsets.
* Added new entry in registry to prevent automatic switching of bluetooth
  profile.

+------------+-----------------------------------------------------------------+
| Parameter  | {{Set pulseaudio auto switching headset to A2DP}}               |
+------------+-----------------------------------------------------------------+
| Registry   | {{multimedia.pulseaudio.daemon.module-bluetooth-autoswitch-to-a2dp}} |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | _enabled_ (default) / disabled                                  |
+------------+-----------------------------------------------------------------+

* Changed: On first boot (after installation) all devices are set to 50% volume.
* Fixed headset at LG CK500

### Licensing

* Fixed IGEL license detection on hardware where network interface
  initialization takes more time.

### Hardware

* Fixed missing firmware file for intel 9462ngw WiFi.
* Added hardware recognition to include LG 24CN670IK6N for fixing related audio
  issues.
