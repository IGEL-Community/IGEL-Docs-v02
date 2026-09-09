IGEL OS(RPI4)  
=============

Firmware version 11.02.110  
Release date 2022-10-07  
Last update of this document 2022-10-06  


Supported Devices  
-------------------------------------------------------------------------------

UC3-RPI4 NComputing RX420/RX440


Release Notes 11.02.110 (Based On 11.02.100)
--------------------------------------------------------------------------------


Security Fixes
--------------------------------------------------------------------------------


### Base system

* Fixed curl security issue CVE-2022-35252.


Resolved Issues
--------------------------------------------------------------------------------


### Base system

* Fixed issue with update fails if bandwidth to update server is low.


Component Versions
-------------------------------------------------------------------------------

+-------------------------------------------+----------------------------------+
| Clients                                   |                                  |
+===========================================+==================================+
| Chromium                                  | 104.0.5112.101-igel1660893911    |
+-------------------------------------------+----------------------------------+
| Citrix Workspace App                      | 20.06.0.15                       |
+-------------------------------------------+----------------------------------+
| Citrix Workspace App                      | 20.10.0.6                        |
+-------------------------------------------+----------------------------------+
| Citrix Workspace App                      | 21.04.0.11                       |
+-------------------------------------------+----------------------------------+
| Citrix Workspace Hub                      | 19.11.100.297                    |
+-------------------------------------------+----------------------------------+
| Open VPN                                  | 2.4.4-2ubuntu1.7                 |
+-------------------------------------------+----------------------------------+
| Zulu JRE                                  | 8.0.345-1                        |
+-------------------------------------------+----------------------------------+

+-------------------------------------------+----------------------------------+
| Dictation                                 |                                  |
+===========================================+==================================+
| Philips Speech driver                     | 12.9.2                           |
+-------------------------------------------+----------------------------------+

+-------------------------------------------+----------------------------------+
| Smartcard                                 |                                  |
+===========================================+==================================+
| PKCS#11 Library OpenSC                    | 0.20.0-4igel38                   |
+-------------------------------------------+----------------------------------+
| Reader Driver ACS CCID                    | 1.1.6-1igel2                     |
+-------------------------------------------+----------------------------------+
| Reader Driver MUSCLE CCID                 | 1.4.31-1igel10                   |
+-------------------------------------------+----------------------------------+
| Reader Driver REINER SCT cyberJack        | 3.99.5final.sp13igel15           |
+-------------------------------------------+----------------------------------+
| Resource Manager PC/SC Lite               | 1.9.8-1igel1655196158            |
+-------------------------------------------+----------------------------------+


+-------------------------------------------+----------------------------------+
| System Components                         |                                  |
+===========================================+==================================+
| OpenSSL                                   | 1.0.2n-1ubuntu5.10               |
+-------------------------------------------+----------------------------------+
| OpenSSL                                   | 1.1.1-1ubuntu2.1~18.04.20        |
+-------------------------------------------+----------------------------------+
| OpenSSH Client                            | 9.0p1-1igel1650701678            |
+-------------------------------------------+----------------------------------+
| OpenSSH Server                            | 9.0p1-1igel1650701678            |
+-------------------------------------------+----------------------------------+
| Bluetooth Stack (bluez)                   | 5.64-0igel1647863644             |
+-------------------------------------------+----------------------------------+
| MESA OpenGL Stack                         | 22.1.5-1igel1659869061           |
+-------------------------------------------+----------------------------------+
| VDPAU Library Version                     | 1.5-1igel1646992192              |
+-------------------------------------------+----------------------------------+
| Graphics Driver FBDEV                     | 0.5.0-2igel1644486279            |
+-------------------------------------------+----------------------------------+
| Graphics Driver VESA                      | 2.5.0-1+b1igel1647004096         |
+-------------------------------------------+----------------------------------+
| Input Driver Evdev                        | 2.10.6-2+b1igel1647004239        |
+-------------------------------------------+----------------------------------+
| Input Driver Synaptics                    | 1.9.1-2+b1igel1647004160         |
+-------------------------------------------+----------------------------------+
| Input Driver Wacom                        | 0.36.1-0ubuntu2igel1017          |
+-------------------------------------------+----------------------------------+
| Kernel                                    | Linux version 5.15.56 #1         |
+-------------------------------------------+----------------------------------+
| Xorg X11 Server                           | 21.1.3igel1652689124             |
+-------------------------------------------+----------------------------------+
| CUPS Printing Daemon                      | 2.2.7-1ubuntu2.9igel1654064309   |
+-------------------------------------------+----------------------------------+
| Lightdm Graphical Login Manager           | 1.26.0-0ubuntu1igel1650560118    |
+-------------------------------------------+----------------------------------+
| XFCE4 Window Manager                      | 4.14.5-1~18.04igel1643191202     |
+-------------------------------------------+----------------------------------+
| ISC DHCP Client                           | 4.3.5-3ubuntu7.3                 |
+-------------------------------------------+----------------------------------+
| NetworkManager                            | 1.32.12-0ubuntu1igel1641211455   |
+-------------------------------------------+----------------------------------+
| ModemManager                              | 1.10.0-1~ubuntu18.04.2           |
+-------------------------------------------+----------------------------------+
| GStreamer 1.x                             | 1.20.3-2igel1655908747           |
+-------------------------------------------+----------------------------------+
| WebKit2Gtk                                | 2.36.6-1igel1660197492           |
+-------------------------------------------+----------------------------------+
| Python2                                   | 2.7.17                           |
+-------------------------------------------+----------------------------------+
| Python3                                   | 3.6.9                            |
+-------------------------------------------+----------------------------------+

+-------------------------------------------+----------------------------------+
| Features with Limited IGEL Support        |                                  |
+===========================================+==================================+
| Mobile Device Access USB (MTP)            | 1.1.20-1igel1660111560           |
+-------------------------------------------+----------------------------------+
| Mobile Device Access USB (imobile)        | 1.3.0-6+b1igel1649775315         |
+-------------------------------------------+----------------------------------+
| Mobile Device Access USB (gphoto)         | 2.5.29-1igel1653377622           |
+-------------------------------------------+----------------------------------+


+--------------------------+--------+--------------------------------------------+
| Service Partitions       | Size   | Services                                   |
+==========================+========+============================================+
| Java SE Runtime          |  47.2M | Java SE Runtime Environment                |
| Environment              |        |                                            |
+--------------------------+--------+--------------------------------------------+
| Citrix ICA               |  89.2M | Citrix Workspace app                       |
|                          |        | Citrix StoreFront                          |
|                          |        | Citrix Workspace Hub                       |
+--------------------------+--------+--------------------------------------------+
| Internet Printing        |  21.8M | Printing (Internet printing protocol CUPS) |
| Protocol (CUPS)          |        |                                            |
+--------------------------+--------+--------------------------------------------+
| Multimedia Codecs        |   3.0M | Multimedia Codecs                          |
+--------------------------+--------+--------------------------------------------+
| Hardware Video           | 256.0K | Hardware Video Acceleration                |
| Acceleration             |        |                                            |
+--------------------------+--------+--------------------------------------------+
| Extra Fonts              |   1.0M | Extra Font Package                         |
+--------------------------+--------+--------------------------------------------+
| Local browser (Chromium) |  98.0M | Local Browser (Chromium)                   |
+--------------------------+--------+--------------------------------------------+
| Limited Support Features | 256.0K | Limited Support Features                   |
|                          |        | Mobile Device Access USB (Limited support) |
+--------------------------+--------+--------------------------------------------+
| Mobile Device Access USB | 512.0K | Mobile Device Access USB (Limited support) |
+--------------------------+--------+--------------------------------------------+


Release Notes 11.02.100
--------------------------------------------------------------------------------


New Features
--------------------------------------------------------------------------------


### Chromium

* Added "Block third-party cookies" as a parameter in the registry.

+------------+-----------------------------------------------------------------+
| IGEL Setup | Sessions > Chromium Browser > Chromium Browser Global > Privacy |
+============+=================================================================+
| Parameter  | `Block third party cookies`                                     |
+------------+-----------------------------------------------------------------+
| Registry   | `chromiumglobal.app.block_third_party_cookies`                  |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | **enabled** (default) / disabled                                |
+------------+-----------------------------------------------------------------+


### Network

* Updated NetworkManager to version 1.32.12

### Smartcard

* Updated Resource Manager PC/SC Lite to version 1.9.8-1igel1655196158

### Base system

* Added support for custom bootsplash configurable at IGEL Setup > System >
  Firmware Customization > Corporate Design > Custom Bootsplash.
* Post-session command: Added multi-session support. It is now possible to
  define additional Session types which will all be covered by the post-session
  command mechanism.
* Updated kernel to version 5.15.56.
* Added ZRAM swap.
* Updated IGEL EULA to version of 1st July 2022.
* Changed Auto Update feature configuration at registry update.service.**  
  The Auto Update feature is enabled by default, when the device is evaluated
  and has no IGEL Workspace license installed.

+------------+-----------------------------------------------------------------+
|Parameter   |`Enable automatic update service`                                |
+------------+-----------------------------------------------------------------+
|Registry    |`update.service.enable`                                          |
+------------+-----------------------------------------------------------------+
|Range       | [ **During evaluation only (default)* ][ On ][ Off ]            |
+------------+-----------------------------------------------------------------+

* Updated OpenSSH to version 9.0p1-1  
* Updated Bluetooth Stack (bluez) to version 5.64-0  
* Updated Mesa OpenGL to version 22.1.5  
* Updated XFCE4 Window Manager to version 4.14.5  
* Updated WebKit2Gtk to version 2.36.6-1  
* Updated Zulu JRE to version 8.0.345-1  
* Updated Mobile Device Access libraries: libmtp9 to version 1.1.20-1,
  libimobiledevice6 to version 1.3.0-6 and libgphoto2 to version 2.5.29

### X server

* Updated X server to version 21.1.3

### Audio

* Updated sound preferences dialog to current version.

### Multimedia

* Updated omxplayer to version 20190723+gitf543a0d-1+bullseye
* Updated ffmpeg multimedia library to version 4.3.4-0+deb11u1+rpt3.
* Updated GStreamer 1.x to version 1.20.3

### TC Setup (Java)

* Updated TC Setup to version 6.10.3.


Security Fixes
--------------------------------------------------------------------------------


### Chromium

* Fixed chromium-browser security issues CVE-2022-2296, CVE-2022-2295,
  CVE-2022-2294, CVE-2022-2165, CVE-2022-2164, CVE-2022-2163, CVE-2022-2162,
  CVE-2022-2161, CVE-2022-2160, CVE-2022-2158, CVE-2022-2157, CVE-2022-2156,
  CVE-2022-2011, CVE-2022-2010, CVE-2022-2008, CVE-2022-2007, CVE-2022-2011,
  CVE-2022-2010, CVE-2022-2008, CVE-2022-2007, CVE-2022-1876, CVE-2022-1875,
  CVE-2022-1874, CVE-2022-1873, CVE-2022-1872, CVE-2022-1871, CVE-2022-1870,
  CVE-2022-1869, CVE-2022-1868, CVE-2022-1867, CVE-2022-1866, CVE-2022-1865,
  CVE-2022-1864, CVE-2022-1863, CVE-2022-1862, CVE-2022-1861, CVE-2022-1860,
  CVE-2022-1859, CVE-2022-1858, CVE-2022-1857, CVE-2022-1856, CVE-2022-1855,
  CVE-2022-1854, CVE-2022-1853, CVE-2022-1641, CVE-2022-1640, CVE-2022-1639,
  CVE-2022-1638, CVE-2022-1637, CVE-2022-1636, CVE-2022-1635, CVE-2022-1634,
  CVE-2022-1633, CVE-2022-1501, CVE-2022-1500, CVE-2022-1499, CVE-2022-1498,
  CVE-2022-1497, CVE-2022-1496, CVE-2022-1495, CVE-2022-1494, CVE-2022-1493,
  CVE-2022-1492, CVE-2022-1491, CVE-2022-1490, CVE-2022-1489, CVE-2022-1488,
  CVE-2022-1487, CVE-2022-1486, CVE-2022-1485, CVE-2022-1484, CVE-2022-1483,
  CVE-2022-1482, CVE-2022-1481, CVE-2022-1480, CVE-2022-1479, CVE-2022-1478,
  CVE-2022-1477, CVE-2022-1364, CVE-2022-1314, CVE-2022-1313, CVE-2022-1312,
  CVE-2022-1311, CVE-2022-1310, CVE-2022-1309, CVE-2022-1308, CVE-2022-1307,
  CVE-2022-1306, CVE-2022-1305, CVE-2022-1232, CVE-2022-1146, CVE-2022-1145,
  CVE-2022-1144, CVE-2022-1143, CVE-2022-1142, CVE-2022-1141, CVE-2022-1139,
  CVE-2022-1138, CVE-2022-1137, CVE-2022-1136, CVE-2022-1135, CVE-2022-1134,
  CVE-2022-1133, CVE-2022-1132, CVE-2022-1131, CVE-2022-1130, CVE-2022-1129,
  CVE-2022-1128, CVE-2022-1127, CVE-2022-1125, CVE-2022-1096, CVE-2022-0980,
  CVE-2022-0979, CVE-2022-0978, CVE-2022-0977, CVE-2022-0976, CVE-2022-0975,
  CVE-2022-0974, CVE-2022-0973, CVE-2022-0972, CVE-2022-0971, CVE-2022-0809,
  CVE-2022-0808, CVE-2022-0807, CVE-2022-0806, CVE-2022-0805, CVE-2022-0804,
  CVE-2022-0803, CVE-2022-0802, CVE-2022-0801, CVE-2022-0800, CVE-2022-0799,
  CVE-2022-0798, CVE-2022-0797, CVE-2022-0796, CVE-2022-0795, CVE-2022-0794,
  CVE-2022-0793, CVE-2022-0792, CVE-2022-0791, CVE-2022-0790, CVE-2022-0789,
  CVE-2022-0610, CVE-2022-0609, CVE-2022-0608, CVE-2022-0607, CVE-2022-0606,
  CVE-2022-0605, CVE-2022-0604, CVE-2022-0603, CVE-2022-0470, CVE-2022-0469,
  CVE-2022-0468, CVE-2022-0467, CVE-2022-0466, CVE-2022-0465, CVE-2022-0464,
  CVE-2022-0463, CVE-2022-0462, CVE-2022-0461, CVE-2022-0460, CVE-2022-0459,
  CVE-2022-0458, CVE-2022-0457, CVE-2022-0456, CVE-2022-0455, CVE-2022-0454,
  CVE-2022-0453, CVE-2022-0452, CVE-2022-0311, CVE-2022-0310, CVE-2022-0309,
  CVE-2022-0308, CVE-2022-0307, CVE-2022-0306, CVE-2022-0305, CVE-2022-0304,
  CVE-2022-0303, CVE-2022-0302, CVE-2022-0301, CVE-2022-0300, CVE-2022-0298,
  CVE-2022-0297, CVE-2022-0296, CVE-2022-0295, CVE-2022-0294, CVE-2022-0293,
  CVE-2022-0292, CVE-2022-0291, CVE-2022-0290, CVE-2022-0289, CVE-2022-0120,
  CVE-2022-0118, CVE-2022-0117, CVE-2022-0116, CVE-2022-0115, CVE-2022-0114,
  CVE-2022-0113, CVE-2022-0112, CVE-2022-0111, CVE-2022-0110, CVE-2022-0109,
  CVE-2022-0108, CVE-2022-0107, CVE-2022-0106, CVE-2022-0105, CVE-2022-0104,
  CVE-2022-0103, CVE-2022-0102, CVE-2022-0101, CVE-2022-0100, CVE-2022-0099,
  CVE-2022-0098, CVE-2022-0097, CVE-2022-0096, CVE-2021-4102, CVE-2021-4101,
  CVE-2021-4100, CVE-2021-4099, CVE-2021-4098, CVE-2021-4068, CVE-2021-4067,
  CVE-2021-4066, CVE-2021-4065, CVE-2021-4064, CVE-2021-4063, CVE-2021-4062,
  CVE-2021-4061, CVE-2021-4059, CVE-2021-4058, CVE-2021-4057, CVE-2021-4056,
  CVE-2021-4055, CVE-2021-4054, CVE-2021-4053, CVE-2021-4052, CVE-2021-38022,
  CVE-2021-38021, CVE-2021-38020, CVE-2021-38019, CVE-2021-38018,
  CVE-2021-38017, CVE-2021-38016, CVE-2021-38015, CVE-2021-38014,
  CVE-2021-38013, CVE-2021-38012, CVE-2021-38011, CVE-2021-38010,
  CVE-2021-38009, CVE-2021-38008, CVE-2021-38007, CVE-2021-38006,
  CVE-2021-38005, CVE-2021-38003, CVE-2021-38002, CVE-2021-38001,
  CVE-2021-38000, CVE-2021-37999, CVE-2021-37998, CVE-2021-37997,
  CVE-2021-37996, CVE-2021-37995, CVE-2021-37994, CVE-2021-37993,
  CVE-2021-37992, CVE-2021-37991, CVE-2021-37990, CVE-2021-37989,
  CVE-2021-37988, CVE-2021-37987, CVE-2021-37986, CVE-2021-37985,
  CVE-2021-37984, CVE-2021-37983, CVE-2021-37982, CVE-2021-37981,
  CVE-2021-37980, CVE-2021-37979, CVE-2021-37978, CVE-2021-37977,
  CVE-2021-37976, CVE-2021-37975, CVE-2021-37974, CVE-2021-37973,
  CVE-2021-37972, CVE-2021-37971, CVE-2021-37970, CVE-2021-37969,
  CVE-2021-37968, CVE-2021-37967, CVE-2021-37966, CVE-2021-37965,
  CVE-2021-37964, CVE-2021-37963, CVE-2021-37962, CVE-2021-37961,
  CVE-2021-37960, CVE-2021-37959, CVE-2021-37958, CVE-2021-37957,
  CVE-2021-37956, CVE-2021-30633, CVE-2021-30632, CVE-2021-30631,
  CVE-2021-30630, CVE-2021-30629, CVE-2021-30628, CVE-2021-30627,
  CVE-2021-30626, CVE-2021-30625, CVE-2021-30624, CVE-2021-30623,
  CVE-2021-30622, CVE-2021-30621, CVE-2021-30620, CVE-2021-30619,
  CVE-2021-30618, CVE-2021-30617, CVE-2021-30616, CVE-2021-30615,
  CVE-2021-30614, CVE-2021-30613, CVE-2021-30612, CVE-2021-30611,
  CVE-2021-30610, CVE-2021-30609, CVE-2021-30608, CVE-2021-30607,
  CVE-2021-30606, CVE-2021-30604, CVE-2021-30603, CVE-2021-30602,
  CVE-2021-30601, CVE-2021-30600, CVE-2021-30599, CVE-2021-30598,
  CVE-2021-30597, CVE-2021-30596, CVE-2021-30594, CVE-2021-30593,
  CVE-2021-30592, CVE-2021-30591, CVE-2021-30590, CVE-2021-30589,
  CVE-2021-30588, CVE-2021-30587, CVE-2021-30586, CVE-2021-30585,
  CVE-2021-30584, CVE-2021-30583, CVE-2021-30582, CVE-2021-30581,
  CVE-2021-30580, CVE-2021-30579, CVE-2021-30578, CVE-2021-30577,
  CVE-2021-30576, CVE-2021-30575, CVE-2021-30574, CVE-2021-30573,
  CVE-2021-30572, CVE-2021-30571, CVE-2021-30569, CVE-2021-30568,
  CVE-2021-30567, CVE-2021-30566, CVE-2021-30565, CVE-2021-30564,
  CVE-2021-30563, CVE-2021-30562, CVE-2021-30561, CVE-2021-30560,
  CVE-2021-30559, CVE-2021-30557, CVE-2021-30556, CVE-2021-30555,
  CVE-2021-30554, CVE-2021-30553, CVE-2021-30552, CVE-2021-30551,
  CVE-2021-30550, CVE-2021-30549, CVE-2021-30548, CVE-2021-30547,
  CVE-2021-30546, CVE-2021-30545, CVE-2021-30544, CVE-2021-30541,
  CVE-2021-30540, CVE-2021-30539, CVE-2021-30538, CVE-2021-30537,
  CVE-2021-30536, CVE-2021-30535, CVE-2021-30534, CVE-2021-30533,
  CVE-2021-30532, CVE-2021-30531, CVE-2021-30530, CVE-2021-30529,
  CVE-2021-30528, CVE-2021-30527, CVE-2021-30526, CVE-2021-30525,
  CVE-2021-30524, CVE-2021-30523, CVE-2021-30522, CVE-2021-30521,
  CVE-2021-30520, CVE-2021-30519, CVE-2021-30518, CVE-2021-30517,
  CVE-2021-30516, CVE-2021-30515, CVE-2021-30514, CVE-2021-30513,
  CVE-2021-30512, CVE-2021-30511, CVE-2021-30510, CVE-2021-30509,
  CVE-2021-30508, CVE-2021-30507, CVE-2021-30506, CVE-2021-21233,
  CVE-2021-21232, CVE-2021-21231, CVE-2021-21230, CVE-2021-21229,
  CVE-2021-21228, CVE-2021-21227, CVE-2021-21226, CVE-2021-21225,
  CVE-2021-21224, CVE-2021-21223, CVE-2021-21222, CVE-2021-21221,
  CVE-2021-21220, CVE-2021-21219, CVE-2021-21218, CVE-2021-21217,
  CVE-2021-21216, CVE-2021-21215, CVE-2021-21214, CVE-2021-21213,
  CVE-2021-21212, CVE-2021-21211, CVE-2021-21210, CVE-2021-21209,
  CVE-2021-21208, CVE-2021-21207, CVE-2021-21206, CVE-2021-21205,
  CVE-2021-21204, CVE-2021-21203, CVE-2021-21202, CVE-2021-21201,
  CVE-2021-21199, CVE-2021-21198, CVE-2021-21197, CVE-2021-21196,
  CVE-2021-21195, CVE-2021-21194, CVE-2021-21193, CVE-2021-21192,
  CVE-2021-21191, CVE-2021-21190, CVE-2021-21189, CVE-2021-21188,
  CVE-2021-21187, CVE-2021-21186, CVE-2021-21185, CVE-2021-21184,
  CVE-2021-21183, CVE-2021-21182, CVE-2021-21181, CVE-2021-21180,
  CVE-2021-21179, CVE-2021-21178, CVE-2021-21177, CVE-2021-21176,
  CVE-2021-21175, CVE-2021-21174, CVE-2021-21173, CVE-2021-21172,
  CVE-2021-21171, CVE-2021-21170, CVE-2021-21169, CVE-2021-21168,
  CVE-2021-21167, CVE-2021-21166, CVE-2021-21165, CVE-2021-21164,
  CVE-2021-21163, CVE-2021-21162, CVE-2021-21161, CVE-2021-21160,
  CVE-2021-21159, CVE-2021-21157, CVE-2021-21156, CVE-2021-21155,
  CVE-2021-21154, CVE-2021-21153, CVE-2021-21152, CVE-2021-21151,
  CVE-2021-21150, CVE-2021-21149, CVE-2021-21148, CVE-2021-21147,
  CVE-2021-21146, CVE-2021-21145, CVE-2021-21144, CVE-2021-21143,
  CVE-2021-21142, CVE-2021-21141, CVE-2021-21140, CVE-2021-21139,
  CVE-2021-21138, CVE-2021-21137, CVE-2021-21136, CVE-2021-21135,
  CVE-2021-21134, CVE-2021-21133, CVE-2021-21132, CVE-2021-21131,
  CVE-2021-21130, CVE-2021-21129, CVE-2021-21128, CVE-2021-21127,
  CVE-2021-21126, CVE-2021-21125, CVE-2021-21124, CVE-2021-21123,
  CVE-2021-21122, CVE-2021-21121, CVE-2021-21120, CVE-2021-21119,
  CVE-2021-21118, CVE-2021-21117, CVE-2021-21116, CVE-2021-21115,
  CVE-2021-21114, CVE-2021-21113, CVE-2021-21112, CVE-2021-21111,
  CVE-2021-21110, CVE-2021-21109, CVE-2021-21108, CVE-2021-21107,
  CVE-2021-21106, CVE-2020-27844, CVE-2020-16044, CVE-2020-16043,
  CVE-2020-16036, CVE-2020-16035, CVE-2020-16034, CVE-2020-16033,
  CVE-2020-16032, CVE-2020-16031, CVE-2020-16030, CVE-2020-16029,
  CVE-2020-16028, CVE-2020-16027, CVE-2020-16026, CVE-2020-16025,
  CVE-2020-16024, CVE-2020-16023, CVE-2020-16022, CVE-2020-16021,
  CVE-2020-16020, CVE-2020-16019, CVE-2020-16018, CVE-2020-16017,
  CVE-2020-16015, CVE-2020-16014, CVE-2020-16013, CVE-2020-16012, CVE-2020-15995
  and CVE-2019-8075.
* Fixed chromium-browser security issues CVE-2022-2852, CVE-2022-2854,
  CVE-2022-2855, CVE-2022-2857, CVE-2022-2858, CVE-2022-2853, CVE-2022-2856,
  CVE-2022-2859, CVE-2022-2860, CVE-2022-2861, CVE-2022-2624, CVE-2022-2623,
  CVE-2022-2622, CVE-2022-2621, CVE-2022-2620, CVE-2022-2619, CVE-2022-2618,
  CVE-2022-2617, CVE-2022-2616, CVE-2022-2615, CVE-2022-2614, CVE-2022-2613,
  CVE-2022-2612, CVE-2022-2611, CVE-2022-2610, CVE-2022-2609, CVE-2022-2608,
  CVE-2022-2607, CVE-2022-2606, CVE-2022-2605, CVE-2022-2604, CVE-2022-2603,
  CVE-2022-2481, CVE-2022-2480, CVE-2022-2479, CVE-2022-2478, CVE-2022-2477 and
  CVE-2022-2163.  
* Updated Chromium browser to version 104.0.5112.101

### Base system

* Fixed dbus security issues CVE-2020-12049 and CVE-2020-35512.  
* Fixed nss security issues CVE-2022-34480, CVE-2022-22747, CVE-2020-25648,
  CVE-2021-43527, CVE-2020-12403.  
* Fixed shadow security issue CVE-2018-7169.  
* Fixed policykit-1 security issue CVE-2021-4034.  
* Fixed vim security issues CVE-2021-4069, CVE-2021-4019, CVE-2021-3984,
  CVE-2021-3928, CVE-2021-3927, CVE-2021-3903, CVE-2021-3796, CVE-2021-3778 and
  CVE-2019-20807.  
* Fixed glib-networking security issue CVE-2020-13645.  
* Fixed aspell security issue CVE-2019-25051.  
* Fixed avahi security issue CVE-2021-3468.  
* Fixed bind9 security issues CVE-2021-25220, CVE-2021-25219, CVE-2021-25216,
  CVE-2021-25215, CVE-2021-25214, CVE-2020-8625, CVE-2020-8624, CVE-2020-8623,
  CVE-2020-8622, CVE-2020-8617 and CVE-2020-8616.  
* Fixed brotli security issue CVE-2020-8927.  
* Fixed libcaca security issues CVE-2021-3410, CVE-2021-30499 and
  CVE-2021-30498.  
* Fixed libexif security issues CVE-2020-13114, CVE-2020-13113, CVE-2020-13112,
  CVE-2020-0452, CVE-2020-0198, CVE-2020-0182 and CVE-2020-0093.  
* Fixed expat security issues CVE-2022-25315, CVE-2022-25314, CVE-2022-25313,
  CVE-2022-25236, CVE-2022-25235, CVE-2022-23990, CVE-2022-23852,
  CVE-2022-22827, CVE-2022-22826, CVE-2022-22825, CVE-2022-22824,
  CVE-2022-22823, CVE-2022-22822, CVE-2021-46143 and CVE-2021-45960.  
* Fixed freetype security issues CVE-2022-31782, CVE-2022-27406, CVE-2022-27405,
  CVE-2022-27404 and CVE-2020-15999.  
* Fixed libgd2 security issues CVE-2021-40145, CVE-2021-38115 and CVE-2017-6363.  
* Fixed glib2.0 security issue CVE-2021-3800.  
* Fixed ghostscript security issues CVE-2021-45949, CVE-2021-45944,
  CVE-2020-8112, CVE-2020-6851, CVE-2020-27845, CVE-2020-27843, CVE-2020-27842,
  CVE-2020-27841, CVE-2020-27824, CVE-2020-27814 and CVE-2018-5727.  
* Fixed krb5 security issue CVE-2020-28196.  
* Fixed nettle security issues CVE-2021-3580, CVE-2021-20305 and CVE-2018-16869.  
* Fixed icu security issue CVE-2020-21913.  
* Fixed webkit2gtk security issues CVE-2022-32816, CVE-2022-32792,
  CVE-2022-26710, CVE-2022-2294, CVE-2022-22677, CVE-2022-22662, CVE-2022-30294,
  CVE-2022-30293, CVE-2022-26719, CVE-2022-26717, CVE-2022-26716,
  CVE-2022-26709, CVE-2022-26700, CVE-2022-22620, CVE-2022-22592,
  CVE-2022-22590, CVE-2022-22589, CVE-2021-45483, CVE-2021-45482,
  CVE-2021-45481, CVE-2021-30984, CVE-2021-30954, CVE-2021-30953,
  CVE-2021-30952, CVE-2021-30951, CVE-2021-30936, CVE-2021-30934,
  CVE-2021-30897, CVE-2021-30890, CVE-2021-30889, CVE-2021-30888,
  CVE-2021-30887, CVE-2021-30884, CVE-2021-30836, CVE-2021-30823,
  CVE-2021-30818, CVE-2021-30809, CVE-2021-30858, CVE-2021-30799,
  CVE-2021-30797, CVE-2021-30795, CVE-2021-30758, CVE-2021-30749,
  CVE-2021-30744, CVE-2021-30734, CVE-2021-30720, CVE-2021-30689,
  CVE-2021-30665, CVE-2021-30663, CVE-2021-21779, CVE-2021-21775, CVE-2021-1871,
  CVE-2021-1870, CVE-2021-1844, CVE-2021-1801, CVE-2021-1799, CVE-2021-1789,
  CVE-2021-1788, CVE-2021-1765, CVE-2020-9983, CVE-2020-9952, CVE-2020-9951,
  CVE-2020-9948, CVE-2020-29623, CVE-2020-27918, CVE-2020-13753, CVE-2020-13558.  
* Fixed json-c security issue CVE-2020-12762.  
* Fixed bash security issue CVE-2019-18276.  
* Fixed openldap security issues CVE-2022-29155, CVE-2021-27212, CVE-2020-36230,
  CVE-2020-36229, CVE-2020-36228, CVE-2020-36227, CVE-2020-36226,
  CVE-2020-36225, CVE-2020-36224, CVE-2020-36223, CVE-2020-36222 and
  CVE-2020-36221.  
* Fixed ldb security issues CVE-2021-20277 and CVE-2020-27840.  
* Fixed ldns security issues CVE-2020-19861 and CVE-2020-19860.  
* Fixed lz4 security issue CVE-2021-3520.  
* Fixed p11-kit security issues CVE-2020-29363, CVE-2020-29362 and
  CVE-2020-29361.  
* Fixed perl security issues CVE-2020-12723, CVE-2020-10878 and CVE-2020-10543.  
* Fixed poppler security issues CVE-2020-27778, CVE-2019-9959, CVE-2019-10871
  and CVE-2018-21009.  
* Fixed libproxy security issues CVE-2020-26154 and CVE-2020-25219.  
* Fixed python2.7 security issues CVE-2015-20107, CVE-2022-0391, CVE-2021-4189,
  CVE-2021-3177, CVE-2020-26116, CVE-2019-9674, CVE-2019-20907 and
  CVE-2019-17514.  
* Fixed python3.6 security issues CVE-2015-20107, CVE-2022-0391, CVE-2021-4189,
  CVE-2021-3737, CVE-2021-3733, CVE-2021-3426, CVE-2021-3177, CVE-2020-27619,
  CVE-2020-26116, CVE-2020-14422, CVE-2019-9674, CVE-2019-20907 and
  CVE-2019-17514.  
* Fixed qpdf security issues CVE-2021-36978 and CVE-2018-18020.  
* Fixed qtbase-opensource-src security issues CVE-2021-38593 and CVE-2020-17507.  
* Fixed qtsvg-opensource-src security issues CVE-2021-45930, CVE-2021-3481 and
  CVE-2018-19869.  
* Fixed librsvg security issue CVE-2019-20446.  
* Fixed cyrus-sasl2 security issue CVE-2022-24407.  
* Fixed samba security issues CVE-2021-44142, CVE-2021-3671, CVE-2021-20254,
  CVE-2020-25722, CVE-2020-25717, CVE-2020-14383, CVE-2020-14323, CVE-2020-14318
  and CVE-2016-2124.  
* Fixed speex security issue CVE-2020-23903.  
* Fixed sqlite3 security issues CVE-2021-36690, CVE-2020-13632, CVE-2020-13630,
  CVE-2020-13434 and CVE-2018-8740.  
* Fixed libssh security issue CVE-2020-16135.  
* Fixed openssl1.0 security issues CVE-2022-2068, CVE-2022-1292, CVE-2022-0778,
  CVE-2021-3712, CVE-2021-23841, CVE-2021-23840 and CVE-2020-1971.  
* Fixed openssl security issues  CVE-2022-2097, CVE-2022-2068, CVE-2022-1292,
  CVE-2022-0778, CVE-2021-3712, CVE-2021-3711, CVE-2021-3449, CVE-2021-23841,
  CVE-2021-23840 and CVE-2020-1971.  
* Fixed tiff security issues CVE-2022-0891, CVE-2022-0865, CVE-2022-0562,
  CVE-2022-0561, CVE-2020-35522, CVE-2020-35524 and CVE-2020-35523.  
* Fixed libwebp security issues CVE-2020-36332, CVE-2020-36331, CVE-2020-36330,
  CVE-2020-36329, CVE-2020-36328, CVE-2018-25014, CVE-2018-25013,
  CVE-2018-25012, CVE-2018-25011, CVE-2018-25010 and CVE-2018-25009.  
* Fixed libx11 security issues CVE-2021-31535, CVE-2020-14363 and
  CVE-2020-14344.  
* Fixed zlib security issues  CVE-2022-37434 and CVE-2018-25032.  
* Fixed dnsmasq security issues CVE-2021-3448, CVE-2020-25687, CVE-2020-25686,
  CVE-2020-25685, CVE-2020-25684, CVE-2020-25683, CVE-2020-25682, CVE-2020-25681
  and CVE-2019-14834.  
* Fixed iproute2 security issue CVE-2019-20795.  
* Fixed isc-dhcp security issue CVE-2021-25217.  
* Fixed ntp security issue CVE-2019-8936.  
* Fixed openvpn security issues CVE-2022-0547, CVE-2020-15078 and
  CVE-2020-11810.  
* Fixed python-cryptography security issue CVE-2020-25659.  
* Fixed lxml security issues CVE-2021-43818, CVE-2021-28957 and CVE-2020-27783.  
* Fixed paramiko security issue CVE-2022-24302.  
* Fixed pillow security issues CVE-2022-22817, CVE-2022-22816, CVE-2022-22815,
  CVE-2021-34552, CVE-2021-28678, CVE-2021-28677, CVE-2021-28676,
  CVE-2021-28675, CVE-2021-27923, CVE-2021-27922, CVE-2021-27921, CVE-2021-2792,
  CVE-2021-25293, CVE-2021-25292, CVE-2021-25290, CVE-2021-25288,
  CVE-2021-25287, CVE-2021-23437, CVE-2020-35655 and CVE-2020-35653.  
* Fixed busybox security issues CVE-2021-42386, CVE-2021-42385, CVE-2021-42384,
  CVE-2021-42382, CVE-2021-42381, CVE-2021-42380, CVE-2021-42379,
  CVE-2021-42378, CVE-2021-42374, CVE-2021-423, CVE-2021-28831 and
  CVE-2018-1000500.  
* Fixed util-linux security issue CVE-2018-7738.  
* Fixed tar security issues CVE-2021-20193, CVE-2019-9923 and CVE-2018-20482.  
* Fixed blueman security issue CVE-2020-15238.  
* Fixed bluez security issues CVE-2021-41229, CVE-2020-0556 and
  CVE-2017-1000250.  
* Fixed systemd security issues CVE-2021-3997, CVE-2021-33910 and
  CVE-2020-13529.  
* Fixed util-linux security issues CVE-2021-3996, CVE-2021-3995 and
  CVE-2018-7738.  
* Fixed udisks2 security issue CVE-2018-17336.  
* Fixed heimdal security issue CVE-2021-3671.  
* Fixed curl security issues  CVE-2022-30115, CVE-2022-27782, CVE-2022-27781,
  CVE-2022-27780, CVE-2022-27779, CVE-2022-27778, CVE-2022-27776,
  CVE-2022-27775, CVE-2022-27774, CVE-2022-22576, CVE-2021-22947,
  CVE-2021-22946, CVE-2021-22945, CVE-2021-22924, CVE-2021-22901,
  CVE-2021-22898, CVE-2021-22897, CVE-2021-22890, CVE-2021-22876, CVE-2020-8286,
  CVE-2020-8285, CVE-2020-8284, CVE-2020-8231, CVE-2020-8177 and CVE-2020-8169.  
* Fixed libgcrypt20 security issues CVE-2021-40528, CVE-2021-33560 and
  CVE-2019-13627.  
* Fixed pulseaudio security issue CVE-2020-16123.  
* Fixed libsdl2 security issue CVE-2019-13616.  
* Fixed libsndfile security issue CVE-2021-3246.  
* Fixed libssh2 security issue CVE-2019-17498.  
* Fixed libvncserver security issues CVE-2020-14405, CVE-2020-14404,
  CVE-2020-14403, CVE-2020-14402, CVE-2020-14401, CVE-2020-14400,
  CVE-2020-14399, CVE-2020-14398, CVE-2020-14397, CVE-2020-14396,
  CVE-2019-20840, CVE-2019-20839, CVE-2019-15690, CVE-2019-15681, CVE-2018-7225,
  CVE-2018-6307, CVE-2018-21247, CVE-2018-20750, CVE-2018-20749, CVE-2018-20748,
  CVE-2018-20024, CVE-2018-20023, CVE-2018-20022, CVE-2018-20021,
  CVE-2018-20020, CVE-2018-20019, CVE-2018-15127 and CVE-2018-15126.  
* Fixed wpa security issues CVE-2021-0326 and CVE-2020-12695.  
* Fixed ntfs-3g security issues VE-2022-30789, CVE-2022-30788, CVE-2022-30787,
  CVE-2022-30786, CVE-2022-30785, CVE-2022-30784, CVE-2022-30783,
  CVE-2021-46790, CVE-2021-39263, CVE-2021-39262, CVE-2021-39261,
  CVE-2021-39260, CVE-2021-39259, CVE-2021-39258, CVE-2021-39257,
  CVE-2021-39256, CVE-2021-39255, CVE-2021-39254, CVE-2021-39253,
  CVE-2021-39252, CVE-2021-39251, CVE-2021-35269, CVE-2021-35268,
  CVE-2021-35267, CVE-2021-35266, CVE-2021-33289, CVE-2021-33287, CVE-2021-33286
  and CVE-2021-33285.  
* Fixed unzip security issues CVE-2022-0530, CVE-2022-0529 and CVE-2019-13232.  
* Fixed libx11 security issues CVE-2021-31535, CVE-2020-14344, CVE-2018-14600,
  CVE-2018-14599 and CVE-2018-14598.  
* Fixed x11vnc security issue CVE-2020-29074.  
* Fixed xorg-server security issues CVE-2021-4011, CVE-2021-4010, CVE-2021-4009,
  CVE-2021-4008 and CVE-2021-3472.  
* Fixed xterm security issue CVE-2021-27135.  
* Fixed elfutils security issues CVE-2019-7665, CVE-2019-7664, CVE-2019-7150,
  CVE-2019-7149, CVE-2019-7148, CVE-2019-7146, CVE-2018-18521, CVE-2018-18520,
  CVE-2018-18310, CVE-2018-16403, CVE-2018-16402 and CVE-2018-16062.  
* Fixed fribidi security issues CVE-2022-25310, CVE-2022-25309 and
  CVE-2022-25308.  
* Fixed xz-utils security issue CVE-2022-1271.  
* Fixed openssh security issues CVE-2021-41617, CVE-2021-28041, CVE-2019-6111,
  CVE-2019-6109, CVE-2018-20685 and CVE-2018-15473.  
* Fixed tcpdump security issues CVE-2020-8037 and CVE-2018-16301.  
* Fixed gettext security issue CVE-2018-18751.  
* Fixed gzip security issue CVE-2022-1271.  
* Fixed gst-plugins-good1.0 security issues CVE-2021-3498 and CVE-2021-3497.  
* Fixed openjpeg2 security issues CVE-2018-6616, CVE-2018-5785, CVE-2018-5727,
  CVE-2018-21010, CVE-2018-20847, CVE-2018-18088, CVE-2018-14423 and
  CVE-2017-17480.  
* Fixed nfs-utils security issue CVE-2019-3689.  
* Fixed expat security issues CVE-2022-25315, CVE-2022-25314, CVE-2022-25313,
  CVE-2022-25236, CVE-2022-25235, CVE-2022-23990, CVE-2022-23852,
  CVE-2022-22827, CVE-2022-22826, CVE-2022-22825, CVE-2022-22824,
  CVE-2022-22823, CVE-2022-22822, CVE-2021-46143, CVE-2021-45960,
  CVE-2019-15903, CVE-2018-20843 and CVE-2013-0340.  
* Fixed flac security issues CVE-2021-0561, CVE-2020-0499 and CVE-2017-6888.  
* Fixed taglib security issue CVE-2018-11439.  
* Fixed libvorbis security issues CVE-2018-5146, CVE-2018-10393, CVE-2018-10392,
  CVE-2017-14633, CVE-2017-14632 and CVE-2017-14160.  
* Fixed wavpack security issues CVE-2021-44269, CVE-2020-35738, CVE-2019-11498,
  CVE-2019-1010319, CVE-2019-1010317, CVE-2018-7254, CVE-2018-7253,
  CVE-2018-6767, CVE-2018-19841, CVE-2018-19840, CVE-2018-10540, CVE-2018-10539,
  CVE-2018-10538, CVE-2018-10537 and CVE-2018-10536.  
* Fixed libxml2 security issues CVE-2022-29824, CVE-2022-23308, CVE-2021-3541,
  CVE-2021-3537, CVE-2021-3518, CVE-2021-3517, CVE-2021-3516, CVE-2020-7595,
  CVE-2020-24977, CVE-2019-20388, CVE-2019-19956, CVE-2018-9251, CVE-2018-14567,
  CVE-2018-14404, CVE-2017-18258, CVE-2017-16932, CVE-2016-9318 and
  CVE-2017-8872.  
* Fixed cifs-utils security issues CVE-2022-29869, CVE-2022-27239,
  CVE-2021-20208 and CVE-2020-14342.  
* Fixed libinput security issue CVE-2020-1215.  
* Fixed network-manager security issue CVE-2021-20297.  
* Fixed ghostscript security issue CVE-2019-25059.  
* Fixed libsdl1.2 security issue CVE-2021-33657.  
* Fixed libsepol security issues CVE-2021-36087, CVE-2021-36086, CVE-2021-36085
  and CVE-2021-36084.  
* Fixed dnsmasq security issue CVE-2022-0934.  
* Fixed pcre3 security issues CVE-2020-14155 and CVE-2019-20838.  
* Fixed cups security issues CVE-2022-26691, CVE-2020-10001 and CVE-2019-8842.  
* Fixed libtirpc security issue CVE-2021-46828.  
* Fixed gnutls28 security issues CVE-2022-2509 and CVE-2021-4209.  
* Fixed net-snmp security issues CVE-2022-24810, CVE-2022-24809, CVE-2022-24808,
  CVE-2022-24807, CVE-2022-24806, CVE-2022-24805 and CVE-2022-248.  
* Fixed zulu8-ca security issues CVE-2022-34169, CVE-2022-25647, CVE-2022-21541
  and CVE-2022-21540.


Resolved Issues
--------------------------------------------------------------------------------


### Citrix

* Improved dialog for Citrix farm selection.
* Fixed Connection Center showing wrong entries.
* Improved Workspace Hub session startup
* The NSAP virtual channel is loaded correctly and works as expected.

### Chromium

* Fixed a bug where browser certificates were lost after reboot if UMS was not
  reachable
* Removed parameter "On startup->Continue where you left off" for chromium
  sessions
* Fixed bug where chromium browser was not clearing browsing history properly.
* Fixed a bug for Chromium settings where parent settings did not influence the
  child settings
* Removed option On Startup->"Continue where you left off" for chromium
  sessions, this feature only works globally
* 'Automatic browser restart on exit' no longer needs a reboot to be deactivated

### Base system

* Fixed issue with time is not set before starter license is issued if NTP time
  server was configured in Setup Assistant.

### Window manager

* Desktop Icon Font Color will now be previewed correctly in the setup.

### Misc

* Fixed a bug in system messages where lines were cut off

