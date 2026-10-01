IGEL OS 11  
==========

Firmware version 11.11.150  
Release date 2026-05-13  
Last update of this document 2026-05-13  


Supported Devices  
-------------------------------------------------------------------------------

UD2-LX 52, UD2-LX 51  
UD3-LX 60  
UD7-LX 20  

[> Supported IGEL OS 11 thirdparty devices](https://kb.igel.com/os11-supported-hardware)


Release Notes 11.11.150 (Based On 11.11.100)
--------------------------------------------------------------------------------


New Features
--------------------------------------------------------------------------------


### Citrix

* Updated Citrix Workspace App to version 2508.10  
* Available Citrix Workspace Apps in this release: 2508.10 (default), and
  20.10.0

### AVD

* Updated AVD client to version 1.3.7.

### RD Web Access

* Added IGEL RDP3-based RD Web Access incl. support of seamless app(s).

### Horizon

* Updated Horizon client to version 2512.1.

### Cisco Webex

* Updated Cisco Webex VDI to version 46.2.1.34187.
* Updated Cisco Webex Meetings VDI to version 45.6.2.7. The available versions
  are: 45.6.2.7 (default), 45.2.1.2 and 44.10.1.3.

### Base system

* Added a dual-signed shim bootloader (Microsoft 2011 and 2023) to ensure Secure
  Boot compatibility on both legacy and newer systems as the 2011 certificates
  start expiring in June 2026.

### Migration

* Added support for OS 11 to OS 12 migration with Distributed Peer Update auto-
  discovery. Available parameters:

+------------+-----------------------------------------------------------------+
| Parameter  | `Specifies the network port utilized by the igel-discovery daemon for communication` |
+------------+-----------------------------------------------------------------+
| Registry   | `update.discovery.port`                                         |
+------------+-----------------------------------------------------------------+
| Type       | string                                                          |
+------------+-----------------------------------------------------------------+
| Value      | `22336` (default)                                               |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | `Specifies the network port for downloading from buddy server`  |
+------------+-----------------------------------------------------------------+
| Registry   | `update.discovery.download_server_port`                         |
+------------+-----------------------------------------------------------------+
| Type       | string                                                          |
+------------+-----------------------------------------------------------------+
| Value      | `22335` (default)                                               |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | `Enable automatic peer discovery for distributed update services` |
+------------+-----------------------------------------------------------------+
| Registry   | `update.discovery.enabled`                                      |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | **enabled** (default) / disabled                                |
+------------+-----------------------------------------------------------------+


### Multimedia

* Added FFMPEG-based multimedia codecs, replacing the previous ones with no
  change in functionality.

### zoomvdi

* Updated Zoom VDI to version 6.6.11 (26890). The available versions are:
  6.6.11.26890 (default), 6.5.10.26710, and 6.4.11.26350.

### Evidian

* Updated Evidian rsUserAuth to version 1.5.9428.


Security Fixes
--------------------------------------------------------------------------------


### Chromium

* Fixed chromium security issues CVE-2026-7363, CVE-2026-7361, CVE-2026-7360,
  CVE-2026-7359, CVE-2026-7358, CVE-2026-7357, CVE-2026-7356, CVE-2026-7355,
  CVE-2026-7354, CVE-2026-7353, CVE-2026-7352, CVE-2026-7351, CVE-2026-7350,
  CVE-2026-7349, CVE-2026-7348, CVE-2026-7347, CVE-2026-7346, CVE-2026-7345,
  CVE-2026-7344, CVE-2026-7343, CVE-2026-7342, CVE-2026-7341, CVE-2026-7340,
  CVE-2026-7339, CVE-2026-7338, CVE-2026-7337, CVE-2026-7336, CVE-2026-7335,
  CVE-2026-7334, CVE-2026-7333, CVE-2026-6921, CVE-2026-6920, CVE-2026-6919,
  CVE-2026-6364, CVE-2026-6363, CVE-2026-6362, CVE-2026-6361, CVE-2026-6360,
  CVE-2026-6359, CVE-2026-6358, CVE-2026-6319, CVE-2026-6318, CVE-2026-6317,
  CVE-2026-6316, CVE-2026-6315, CVE-2026-6314, CVE-2026-6313, CVE-2026-6312,
  CVE-2026-6311, CVE-2026-6310, CVE-2026-6309, CVE-2026-6308, CVE-2026-6307,
  CVE-2026-6306, CVE-2026-6305, CVE-2026-6304, CVE-2026-6303, CVE-2026-6302,
  CVE-2026-6301, CVE-2026-6300, CVE-2026-6299, CVE-2026-6298, CVE-2026-6297,
  CVE-2026-6296, CVE-2026-5919, CVE-2026-5918, CVE-2026-5915, CVE-2026-5914,
  CVE-2026-5913, CVE-2026-5912, CVE-2026-5911, CVE-2026-5910, CVE-2026-5909,
  CVE-2026-5908, CVE-2026-5907, CVE-2026-5906, CVE-2026-5905, CVE-2026-5904,
  CVE-2026-5903, CVE-2026-5902, CVE-2026-5901, CVE-2026-5900, CVE-2026-5899,
  CVE-2026-5898, CVE-2026-5897, CVE-2026-5896, CVE-2026-5895, CVE-2026-5894,
  CVE-2026-5893, CVE-2026-5892, CVE-2026-5891, CVE-2026-5890, CVE-2026-5889,
  CVE-2026-5888, CVE-2026-5887, CVE-2026-5886, CVE-2026-5885, CVE-2026-5884,
  CVE-2026-5883, CVE-2026-5882, CVE-2026-5881, CVE-2026-5880, CVE-2026-5879,
  CVE-2026-5878, CVE-2026-5877, CVE-2026-5876, CVE-2026-5875, CVE-2026-5874,
  CVE-2026-5873, CVE-2026-5872, CVE-2026-5871, CVE-2026-5870, CVE-2026-5869,
  CVE-2026-5868, CVE-2026-5867, CVE-2026-5866, CVE-2026-5865, CVE-2026-5864,
  CVE-2026-5863, CVE-2026-5862, CVE-2026-5861, CVE-2026-5860, CVE-2026-5859,
  CVE-2026-5858, CVE-2026-5292, CVE-2026-5291, CVE-2026-5290, CVE-2026-5289,
  CVE-2026-5288, CVE-2026-5287, CVE-2026-5286, CVE-2026-5285, CVE-2026-5284,
  CVE-2026-5283, CVE-2026-5282, CVE-2026-5281, CVE-2026-5280, CVE-2026-5279,
  CVE-2026-5278, CVE-2026-5277, CVE-2026-5276, CVE-2026-5275, CVE-2026-5274,
  CVE-2026-5273, CVE-2026-5272, CVE-2026-4680, CVE-2026-4679, CVE-2026-4678,
  CVE-2026-4677, CVE-2026-4676, CVE-2026-4675, CVE-2026-4674, CVE-2026-4673,
  CVE-2026-4464, CVE-2026-4463, CVE-2026-4462, CVE-2026-4461, CVE-2026-4460,
  CVE-2026-4459, CVE-2026-4458, CVE-2026-4457, CVE-2026-4456, CVE-2026-4455,
  CVE-2026-4454, CVE-2026-4453, CVE-2026-4452, CVE-2026-4451, CVE-2026-4450,
  CVE-2026-4449, CVE-2026-4448, CVE-2026-4447, CVE-2026-4446, CVE-2026-4445,
  CVE-2026-4444, CVE-2026-4443, CVE-2026-4442, CVE-2026-4441, CVE-2026-4440,
  CVE-2026-4439, CVE-2026-3910, CVE-2026-3909, CVE-2026-3942, CVE-2026-3941,
  CVE-2026-3940, CVE-2026-3939, CVE-2026-3938, CVE-2026-3937, CVE-2026-3936,
  CVE-2026-3935, CVE-2026-3934, CVE-2026-3932, CVE-2026-3931, CVE-2026-3930,
  CVE-2026-3929, CVE-2026-3928, CVE-2026-3927, CVE-2026-3926, CVE-2026-3925,
  CVE-2026-3924, CVE-2026-3923, CVE-2026-3922, CVE-2026-3921, CVE-2026-3920,
  CVE-2026-3919, CVE-2026-3918, CVE-2026-3917, CVE-2026-3916, CVE-2026-3915,
  CVE-2026-3914, CVE-2026-3913, CVE-2026-3545, CVE-2026-3544, CVE-2026-3543,
  CVE-2026-3542, CVE-2026-3541, CVE-2026-3540, CVE-2026-3539, CVE-2026-3538,
  CVE-2026-3537, CVE-2026-3536, CVE-2026-3063, CVE-2026-3062, CVE-2026-3061,
  CVE-2026-2650, CVE-2026-2649, CVE-2026-2648, CVE-2026-2441, CVE-2026-2323,
  CVE-2026-2322, CVE-2026-2321, CVE-2026-2320, CVE-2026-2319, CVE-2026-2318,
  CVE-2026-2317, CVE-2026-2316, CVE-2026-2315, CVE-2026-2314, CVE-2026-2313,
  CVE-2026-1862, CVE-2026-1861, CVE-2026-1862, CVE-2026-1861, CVE-2026-1504,
  CVE-2026-1220, CVE-2026-0908, CVE-2026-0907, CVE-2026-0906, CVE-2026-0905,
  CVE-2026-0904, CVE-2026-0903, CVE-2026-0902, CVE-2026-0901, CVE-2026-0900,
  CVE-2026-0899, CVE-2026-0628, CVE-2025-14766, CVE-2025-14765, CVE-2025-14373,
  CVE-2025-14372, CVE-2025-13721, CVE-2025-13720, CVE-2025-13640,
  CVE-2025-13639, CVE-2025-13638, CVE-2025-13637, CVE-2025-13636,
  CVE-2025-13635, CVE-2025-13634, CVE-2025-13633, CVE-2025-13632, CVE-2025-13631
  and CVE-2025-13630  
* Updated Chromium to version 147.0.7727.137.

### Firefox

* Updated Firefox to version 140.10.1 esr.
* Fixes for mfsa2025-83, also known as:  
  CVE-2025-11708, CVE-2025-11709, CVE-2025-11710, CVE-2025-11711,
  CVE-2025-11712,  
  CVE-2025-11714, CVE-2025-11715.  
* Fixes for mfsa2025-88, also known as:  
  CVE-2025-13012, CVE-2025-13016, CVE-2025-13017, CVE-2025-13018,
  CVE-2025-13019,  
  CVE-2025-13013, CVE-2025-13020, CVE-2025-13014, CVE-2025-13015.  
* Fixes for mfsa2025-94, also known as:  
  CVE-2025-14321, CVE-2025-14322, CVE-2025-14323, CVE-2025-14324,
  CVE-2025-14325,  
  CVE-2025-14328, CVE-2025-14329, CVE-2025-14330, CVE-2025-14331,
  CVE-2025-14333.  
* Fixes for mfsa2026-03, also known as:  
  CVE-2026-0877, CVE-2026-0878, CVE-2026-0879, CVE-2026-0880, CVE-2026-0882,  
  CVE-2025-14327, CVE-2026-0883, CVE-2026-0884, CVE-2026-0885, CVE-2026-0886,  
  CVE-2026-0887, CVE-2026-0890, CVE-2026-0891.  
* Fixes for mfsa2026-10, also known as:  
  CVE-2026-2447  
* Fixes for mfsa2026-15, also known as:  
  CVE-2026-2757, CVE-2026-2758, CVE-2026-2759, CVE-2026-2760, CVE-2026-2761,  
  CVE-2026-2762, CVE-2026-2763, CVE-2026-2764, CVE-2026-2765, CVE-2026-2766,  
  CVE-2026-2767, CVE-2026-2768, CVE-2026-2769, CVE-2026-2770, CVE-2026-2771,  
  CVE-2026-2772, CVE-2026-2773, CVE-2026-2774, CVE-2026-2775, CVE-2026-2776,  
  CVE-2026-2777, CVE-2026-2778, CVE-2026-2779, CVE-2026-2780, CVE-2026-2781,  
  CVE-2026-2782, CVE-2026-2783, CVE-2026-2784, CVE-2026-2785, CVE-2026-2786,  
  CVE-2026-2787, CVE-2026-2788, CVE-2026-2789, CVE-2026-2790, CVE-2026-2791,  
  CVE-2026-2792, CVE-2026-2793.  
* Fixes for mfsa2026-22, also known as:  
  CVE-2026-4684, CVE-2026-4685, CVE-2026-4686, CVE-2026-4687, CVE-2026-4688,  
  CVE-2026-4689, CVE-2026-4690, CVE-2026-4691, CVE-2026-4692, CVE-2026-4693,  
  CVE-2026-4694, CVE-2026-4695, CVE-2026-4696, CVE-2026-4697, CVE-2026-4698,  
  CVE-2026-4699, CVE-2026-4700, CVE-2026-4701, CVE-2026-4702, CVE-2026-4704,  
  CVE-2026-4705, CVE-2026-4706, CVE-2026-4707, CVE-2026-4708, CVE-2026-4709,  
  CVE-2026-4710, CVE-2026-4711, CVE-2026-4712, CVE-2026-4713, CVE-2026-4714,  
  CVE-2026-4715, CVE-2026-4716, CVE-2026-4717, CVE-2025-59375, CVE-2026-4718,  
  CVE-2026-4719, CVE-2026-4720, CVE-2026-4721.  
* Fixes for mfsa2026-27 also known as:  
  CVE-2026-5732, CVE-2026-5731, CVE-2026-5734.  
* Fixes for mfsa2026-32, also known as:  
  CVE-2026-6746, CVE-2026-6747, CVE-2026-6748, CVE-2026-6749, CVE-2026-6750,  
  CVE-2026-6751, CVE-2026-6752, CVE-2026-6753, CVE-2026-6754, CVE-2026-6757,  
  CVE-2026-6759, CVE-2026-6761, CVE-2026-6762, CVE-2026-6763, CVE-2026-6764,  
  CVE-2026-6765, CVE-2026-6766, CVE-2026-6767, CVE-2026-6769, CVE-2026-6770,  
  CVE-2026-6771, CVE-2026-6772, CVE-2026-6776, CVE-2026-6785, CVE-2026-6786.  
* Fixes for mfsa2026-36, also known as:  
  CVE-2026-7320, CVE-2026-7321, CVE-2026-7322, CVE-2026-7323.

### Base system

* Fixed open-vm-tools security issue CVE-2025-41244.  
* Fixed qtdeclarative-opensource-src security issue CVE-2025-12385.  
* Fixed qt6-svg security issues CVE-2025-10729 and CVE-2025-10728.  
* Fixed openvpn security issues CVE-2025-13086 and CVE-2025-12106.  
* Fixed bind9 security issues CVE-2025-8677, CVE-2025-40780 and CVE-2025-40778.  
* Fixed glib2.0 security issues CVE-2025-7039, CVE-2025-6052, CVE-2025-3360,
  CVE-2025-14087 and CVE-2025-13601.  
* Fixed libpng1.6 security issues CVE-2025-65018, CVE-2025-64720, CVE-2025-64506
  and CVE-2025-64505.  
* Fixed samba security issues CVE-2025-9640 and CVE-2025-10230.  
* Fixed net-snmp security issue CVE-2025-68615.  
* Fixed openssl security issue CVE-2025-9230.  
* Fixed libxslt security issue CVE-2025-7424.  
* Fixed python-urllib3 security issue CVE-2025-66418.  
* Fixed gnupg2 security issue CVE-2025-68973.
* Fixed webkit2gtk security issues CVE-2025-66287, CVE-2025-43541,
  CVE-2025-43536, CVE-2025-43535, CVE-2025-43531, CVE-2025-43529,
  CVE-2025-43501, CVE-2025-43480, CVE-2025-43458, CVE-2025-43443,
  CVE-2025-43440, CVE-2025-43434, CVE-2025-43432, CVE-2025-43431,
  CVE-2025-43430, CVE-2025-43429, CVE-2025-43427, CVE-2025-43425,
  CVE-2025-43421, CVE-2025-43419, CVE-2025-43392, CVE-2025-43343,
  CVE-2025-14174, CVE-2025-13947, CVE-2025-13502 and CVE-2023-43000.
* Fixed libsoup3 security issues CVE-2025-4969, CVE-2025-4948, CVE-2025-4945,
  CVE-2025-4476, CVE-2025-32914, CVE-2025-32908, CVE-2025-32907, CVE-2024-52532
  and CVE-2024-52531.  
* Fixed libarchive security issue CVE-2025-60753.  
* Fixed cups security issues CVE-2025-61915 and CVE-2025-58436.  
* Fixed libheif security issue CVE-2025-68431.  
* Fixed llvm-toolchain-19 security issue CVE-2024-7883.  
* Fixed libsndfile security issue CVE-2025-56226.  
* Fixed libtpms security issue CVE-2026-21444.  
* Fixed libwebsockets security issues CVE-2025-11678 and CVE-2025-11677.  
* Fixed libxml2 security issues CVE-2025-9714 and CVE-2025-7425.  
* Fixed openssh security issues CVE-2026-3497, CVE-2025-61985 and
  CVE-2025-61984.  
* Fixed qemu security issues CVE-2026-3842, CVE-2026-3196, CVE-2026-3195,
  CVE-2026-2243, CVE-2026-0665, CVE-2025-14876, CVE-2026-0665, CVE-2025-12464,
  CVE-2025-11234 and CVE-2024-8354.  
* Fixed usbmuxd security issue CVE-2025-66004.  
* Fixed harfbuzz security issue CVE-2022-33068.  
* Fixed avahi security issues CVE-2025-68471, CVE-2025-68468 and CVE-2025-68276.  
* Fixed libcaca security issue CVE-2022-0856.  
* Fixed cups-filters security issues CVE-2025-64524, CVE-2025-64503 and
  CVE-2025-57812.  
* Fixed glib2.0 security issue CVE-2026-0988.  
* Fixed gnutls28 security issues CVE-2025-14831, CVE-2025-9820, CVE-2025-6395,
  CVE-2025-32990, CVE-2025-32989, CVE-2025-32988, CVE-2024-28835,
  CVE-2024-28834, CVE-2024-12243, CVE-2024-12133, CVE-2024-0567, CVE-2024-0553,
  CVE-2023-5981, CVE-2023-0361 and CVE-2022-2509.  
* Fixed gpsd security issues CVE-2025-67269 and CVE-2025-67268.  
* Fixed ghostscript security issues CVE-2025-7462, CVE-2025-59800,
  CVE-2025-59799 and CVE-2025-59798.  
* Fixed texlive-bin security issues CVE-2022-24107 and CVE-2022-24106.  
* Fixed libpng1.6 security issues CVE-2026-25646, CVE-2026-22801, CVE-2026-22695
  and CVE-2025-66293.  
* Fixed poppler security issues CVE-2025-52885 and CVE-2025-43718.  
* Fixed postgresql-14 security issues CVE-2026-2006, CVE-2026-2005,
  CVE-2026-2004, CVE-2026-2003, CVE-2025-12818 and CVE-2025-12817.  
* Fixed python3.10 security issues CVE-2026-0865, CVE-2025-15367,
  CVE-2025-15366, CVE-2026-0865, CVE-2026-0672, CVE-2025-15367, CVE-2025-15366,
  CVE-2025-15282, CVE-2025-13837, CVE-2025-12084, CVE-2025-11468, CVE-2025-8291,
  CVE-2025-6075 and CVE-2025-13836.  
* Fixed libsodium security issue CVE-2025-69277.  
* Fixed openssl security issues CVE-2026-22796, CVE-2026-22795, CVE-2026-2279,
  CVE-2025-69421, CVE-2025-69420, CVE-2025-69419, CVE-2025-69418, CVE-2025-68160
  and CVE-2025-15467.  
* Fixed libtasn1-6 security issues CVE-2025-13151 and CVE-2021-46848.  
* Fixed mysql-8.0 security issues CVE-2026-21968, CVE-2026-21964,
  CVE-2026-21948, CVE-2026-21941, CVE-2026-21937, CVE-2026-21936,
  CVE-2025-53069, CVE-2025-53062, CVE-2025-53054, CVE-2025-53053,
  CVE-2025-53045, CVE-2025-53044, CVE-2025-53042 and CVE-2025-53040.  
* Fixed python-urllib3 security issue CVE-2026-21441.  
* Fixed expat security issue CVE-2026-24515.  
* Fixed openvpn security issue CVE-2025-15497.  
* Fixed expat security issues CVE-2026-25210, CVE-2026-24515, CVE-2025-59375,
  CVE-2024-8176, CVE-2024-50602, CVE-2024-45492, CVE-2024-45491 and
  CVE-2024-45490.  
* Fixed glibc security issues CVE-2026-0915, CVE-2026-0861 and CVE-2025-15281.  
* Fixed gegl security issue CVE-2025-10921.  
* Fixed glib2.0 security issues CVE-2026-1489, CVE-2026-1485 and CVE-2026-1484.  
* Fixed djvulibre security issue CVE-2021-46312.  
* Fixed libvpx security issues CVE-2026-2447 and CVE-2026-1861.  
* Fixed protobuf security issue CVE-2026-0994.  
* Fixed nfs-utils security issue CVE-2025-12801.  
* Fixed python-cryptography security issue CVE-2026-26007.  
* Fixed libssh security issues CVE-2026-3731, CVE-2026-0968, CVE-2026-0967,
  CVE-2026-0966, CVE-2026-0965, CVE-2026-0964 and CVE-2025-14821.  
* Fixed libbpf security issue CVE-2025-29481.  
* Fixed vim security issues CVE-2026-28422, CVE-2026-28421, CVE-2026-28420,
  CVE-2026-28419, CVE-2026-28418, CVE-2026-28417, CVE-2026-26269 and
  CVE-2026-25749.  
* Fixed expat security issues CVE-2026-32778, CVE-2026-32777 and CVE-2026-32776.  
* Fixed exiv2 security issues CVE-2025-55304, CVE-2026-27631, CVE-2026-27596,
  CVE-2026-25884, CVE-2025-55304 and CVE-2025-54080.  
* Fixed gst-plugins-base1.0 security issue CVE-2026-2921.  
* Fixed webkit2gtk security issues CVE-2026-20676, CVE-2026-20652,
  CVE-2026-20644, CVE-2026-20636, CVE-2026-20635, CVE-2026-20608,
  CVE-2025-43511, CVE-2025-43457 and CVE-2025-43214.  
* Fixed gvfs security issues CVE-2026-28296 and CVE-2026-28295.  
* Fixed tiff security issues CVE-2025-61144 and CVE-2025-61143.  
* Fixed systemd security issue CVE-2026-29111.  
* Fixed bind9 security issue CVE-2026-1519.  
* Fixed opensc security issues CVE-2025-66215, CVE-2025-66038, CVE-2025-66037,
  CVE-2025-49010 and CVE-2025-13763.  
* Fixed gst-plugins-bad1.0 security issues CVE-2026-3086, CVE-2026-3084,
  CVE-2026-3082, CVE-2026-3081 and CVE-2026-2923.  
* Fixed xz-utils security issue CVE-2026-34743.  
* Fixed libvncserver security issues CVE-2026-32854 and CVE-2026-32853.  
* Fixed gst-plugins-ugly1.0 security issues CVE-2026-2922 and CVE-2026-2920.  
* Fixed gst-plugins-good1.0 security issues CVE-2026-3085 and CVE-2026-3083.
* Backported Kernel changes from 6.6.130 to fix Crackarmor security issues.
* Fixed Kernel security issue CVE-2026-31431 also known as copy fail.

### X server

* Fixed xorg-server security issues CVE-2026-34003, CVE-2026-34002,
  CVE-2026-34001, CVE-2026-34000, CVE-2026-33999, CVE-2025-62229, CVE-2025-62230
  and CVE-62231  
* Updated Xorg server to version 21.1.22.


Resolved Issues
--------------------------------------------------------------------------------


### Citrix

* Fixed an issue where keyboard shortcuts and hotkeys did not work correctly in
  Citrix sessions.

### RD Web Access

* Fixed Remote Desktop Web Access login not working reliably.

### Horizon

* Fixed remaining Horizon virtual channel path names that still referenced
  VMware instead of Omnissa.
* Fixed service gateway address used for Horizon next-gen sessions.

### Parallels Client

- Updated Parallels config tool to version 1.1.2

### Chromium

* Fixed an issue where the "Sessions > Chromium Browser > Chromium Browser
  Global > Hardware Video Acceleration" parameter was not working correctly.

### Base system

* Fixed an issue where rsyslog exited after network loss and was not restarted
  automatically.

### IgelDesktop

* Fixed an issue where adding an SSH session via Quick Settings did not
  immediately create a desktop icon. The icon is now displayed right away
  without requiring a reboot or adding an additional session.

### Window manager

* Fixed an issue where the close button in IGEL Setup Assistant did not work
  correctly.
* Fixed an issue in multi-monitor configurations where the calendar was
  displayed on the wrong monitor.

### Audio

* Fixed overly sensitive microphone input levels on the LG 24CQ651N AIO device
  by lowering the default microphone pickup volume to reduce background noise
  during virtual meetings.
* Fixed an issue on the LG CL600 where headsets connected via the audio jack
  were muted and produced no audio output.

### Multimedia

* Fixed window distortions with video playback on Intel Meteor Lake chipsets.

### Hardware

* Fixed issue with Dell Wyse 5070 devices not booting after bootcode update.


Component Versions
-------------------------------------------------------------------------------

+-------------------------------------------+----------------------------------+
| Clients                                   |                                  |
+===========================================+==================================+
| Cisco JVDI Client                         | 15.1.0                           |
+-------------------------------------------+----------------------------------+
| Cisco Webex VDI plugin                    | 46.2.1.34187                     |
+-------------------------------------------+----------------------------------+
| Cisco Webex Meetings VDI plugin           | 44.10.1.3                        |
+-------------------------------------------+----------------------------------+
| Cisco Webex Meetings VDI plugin           | 45.2.1.2                         |
+-------------------------------------------+----------------------------------+
| Cisco Webex Meetings VDI plugin           | 45.6.2.7                         |
+-------------------------------------------+----------------------------------+
| Zoom Media Plugin                         | 6.4.11.26350                     |
+-------------------------------------------+----------------------------------+
| Zoom Media Plugin                         | 6.5.10.26710                     |
+-------------------------------------------+----------------------------------+
| Zoom Media Plugin                         | 6.6.11.26890                     |
+-------------------------------------------+----------------------------------+
| Citrix EPA Client                         | 24.10.1                          |
+-------------------------------------------+----------------------------------+
| Citrix HDX Realtime Media Engine          | 2.9.600                          |
+-------------------------------------------+----------------------------------+
| Citrix Secure Access Client               | 24.10.1                          |
+-------------------------------------------+----------------------------------+
| Citrix Workspace App                      | 20.10.0.6                        |
+-------------------------------------------+----------------------------------+
| Citrix Workspace App                      | 25.08.10.111                     |
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
| Evidian AuthMgr                           | 1.5.9428                         |
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
| Firefox                                   | 140.10.1                         |
+-------------------------------------------+----------------------------------+
| IBM i Access Client Solutions             | 1.1.9.2                          |
+-------------------------------------------+----------------------------------+
| IGEL RDP Client                           | 2.2igel1763481265                |
+-------------------------------------------+----------------------------------+
| IGEL AVD Client                           | 1.3.7igel1771335369              |
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
| Open VPN                                  | 2.7.1-1igel1775113244            |
+-------------------------------------------+----------------------------------+
| Zulu JRE                                  | 17.0.16-3                        |
+-------------------------------------------+----------------------------------+
| Parallels Client                          | 19.2.0.23906                     |
+-------------------------------------------+----------------------------------+
| Spice GTK (Red Hat Virtualization)        | 0.42-4igel1758539192             |
+-------------------------------------------+----------------------------------+
| Remote Viewer (Red Hat Virtualization)    | 11.0-4+b1igel1769503331          |
+-------------------------------------------+----------------------------------+
| Usbredir (Red Hat Virtualization)         | 0.15.0-1+b1igel1769432373        |
+-------------------------------------------+----------------------------------+
| SpeechWrite                               | 1.0                              |
+-------------------------------------------+----------------------------------+
| Stratusphere UX Connector ID Key software | 6.6.2-3                          |
+-------------------------------------------+----------------------------------+
| Systancia AppliDis                        | 6.1.4-17                         |
+-------------------------------------------+----------------------------------+
| HP Anyware PCoIP Software Client          | 25.03.1-22.04                    |
+-------------------------------------------+----------------------------------+
| ThinLinc Client                           | 4.16.0-3389                      |
+-------------------------------------------+----------------------------------+
| ThinPrint Client                          | 7-7.6.126                        |
+-------------------------------------------+----------------------------------+
| Parole Media Player                       | 4.16.0-3igel1686304269           |
+-------------------------------------------+----------------------------------+
| VNC Viewer                                | 1.15.0+dfsg-2+b1igel1769493139   |
+-------------------------------------------+----------------------------------+
| Omnissa Horizon client                    | 2512.1-22261155021               |
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
| PKCS#11 Library cryptovision sc/interface | 8.2.3                            |
+-------------------------------------------+----------------------------------+
| PKCS#11 Library Thales SafeNet            | 10.8.1050                        |
+-------------------------------------------+----------------------------------+
| PKCS#11 Library OpenSC                    | 0.27.1-1igel1775018710           |
+-------------------------------------------+----------------------------------+
| PKCS#11 Library Pointsharp NetID Enterprise | 6.9.1.17                         |
+-------------------------------------------+----------------------------------+
| PKCS#11 Library Pointsharp NetID Client   | 1.1.4.38                         |
+-------------------------------------------+----------------------------------+
| PKCS#11 Library 90meter                   | 3.0.0.45                         |
+-------------------------------------------+----------------------------------+
| Reader Driver ACS CCID                    | 1.1.13-1igel1763367444           |
+-------------------------------------------+----------------------------------+
| Reader Driver HID Global Omnikey          | 4.3.3                            |
+-------------------------------------------+----------------------------------+
| Reader Driver Identive CCID               | 5.0.35                           |
+-------------------------------------------+----------------------------------+
| Reader Driver Identive eHealth200         | 1.0.5                            |
+-------------------------------------------+----------------------------------+
| Reader Driver Identive SCRKBC             | 5.0.24                           |
+-------------------------------------------+----------------------------------+
| Reader Driver MUSCLE CCID                 | 1.7.1-1igel1770292224            |
+-------------------------------------------+----------------------------------+
| Reader Driver REINER SCT cyberJack        | 3.99.5final.sp17-0.1igel1727417566 |
+-------------------------------------------+----------------------------------+
| Resource Manager PC/SC Lite               | 2.4.1-1igel1768470891            |
+-------------------------------------------+----------------------------------+
| Cherry USB2LAN Proxy                      | 3.2.0.3                          |
+-------------------------------------------+----------------------------------+


+-------------------------------------------+----------------------------------+
| System Components                         |                                  |
+===========================================+==================================+
| OpenSSL                                   | 1.0.2n-1ubuntu5.13igel1686114423 |
+-------------------------------------------+----------------------------------+
| OpenSSL                                   | 1.1.1f-1ubuntu2.24               |
+-------------------------------------------+----------------------------------+
| OpenSSL                                   | 3.0.2-0ubuntu1.21                |
+-------------------------------------------+----------------------------------+
| OpenSSH Client                            | 10.2p1-6igel1774846278           |
+-------------------------------------------+----------------------------------+
| OpenSSH Server                            | 10.2p1-6igel1774846278           |
+-------------------------------------------+----------------------------------+
| Bluetooth Stack (bluez)                   | 5.85-4igel1774334157             |
+-------------------------------------------+----------------------------------+
| MESA OpenGL Stack                         | 25.0.7-2igel1750243685           |
+-------------------------------------------+----------------------------------+
| VDPAU Library Version                     | 1.5-4igel1769509444              |
+-------------------------------------------+----------------------------------+
| Graphics Driver INTEL                     | 2.99.917+git20210115-1igel1654609037 |
+-------------------------------------------+----------------------------------+
| Graphics Driver ATI/RADEON                | 22.0.0-1igel1704966675           |
+-------------------------------------------+----------------------------------+
| Graphics Driver ATI/AMDGPU                | 25.0.0-1igel1763123370           |
+-------------------------------------------+----------------------------------+
| Graphics Driver Nouveau (Nvidia Legacy)   | 1.0.18-1igel1739362211           |
+-------------------------------------------+----------------------------------+
| Graphics Driver VMware                    | 13.3.0-3igel1654607153           |
+-------------------------------------------+----------------------------------+
| Graphics Driver QXL (Spice)               | 0.1.6-1.1igel1742818532          |
+-------------------------------------------+----------------------------------+
| Graphics Driver FBDEV                     | 0.5.0-2igel1654609009            |
+-------------------------------------------+----------------------------------+
| Graphics Driver VESA                      | 2.6.0-2igel1739365508            |
+-------------------------------------------+----------------------------------+
| Input Driver Evdev                        | 2.11.0-1igel1738822597           |
+-------------------------------------------+----------------------------------+
| Input Driver Elographics                  | 1.4.4-1igel1746697619            |
+-------------------------------------------+----------------------------------+
| Input Driver eGalax                       | 2.5.8825                         |
+-------------------------------------------+----------------------------------+
| Input Driver Synaptics                    | 1.9.2-1+b2igel1742818828         |
+-------------------------------------------+----------------------------------+
| Input Driver VMMouse                      | 13.1.0-1ubuntu2igel1628499891    |
+-------------------------------------------+----------------------------------+
| Input Driver Wacom                        | 1.2.4-1igel1768468422            |
+-------------------------------------------+----------------------------------+
| Input Driver ELO Multitouch               | 4.3.0.0                          |
+-------------------------------------------+----------------------------------+
| Input Driver ELO Singletouch              | 5.2                              |
+-------------------------------------------+----------------------------------+
| Kernel                                    | 6.6.108 #mainline-lxos-g1778216282 |
+-------------------------------------------+----------------------------------+
| Xorg X11 Server                           | 21.1.22-1igel1776231630          |
+-------------------------------------------+----------------------------------+
| Xorg Xephyr                               | 21.1.22-1igel1776231630          |
+-------------------------------------------+----------------------------------+
| CUPS Printing Daemon                      | 2.4.16-1igel1769415060           |
+-------------------------------------------+----------------------------------+
| PrinterLogic                              | 25.2.0.16                        |
+-------------------------------------------+----------------------------------+
| Lightdm Graphical Login Manager           | 1.30.0-0ubuntu5igel1685475374    |
+-------------------------------------------+----------------------------------+
| XFCE4 Window Manager                      | 4.14.5-1~18.04igel1643191202     |
+-------------------------------------------+----------------------------------+
| ISC DHCP Client                           | 4.4.1-2.3ubuntu2.4               |
+-------------------------------------------+----------------------------------+
| NetworkManager                            | 1.42.4-1+deb12u1igel1748245408   |
+-------------------------------------------+----------------------------------+
| ModemManager                              | 1.24.2-2igel1763114076           |
+-------------------------------------------+----------------------------------+
| GStreamer 1.x                             | 1.26.10-1+1igel1773902091        |
+-------------------------------------------+----------------------------------+
| WebKit2Gtk                                | 2.50.6-1~deb12u1igel1774332330   |
+-------------------------------------------+----------------------------------+
| Python3                                   | 3.10.12                          |
+-------------------------------------------+----------------------------------+

+-------------------------------------------+----------------------------------+
| VM Guest Support Components               |                                  |
+===========================================+==================================+
| Virtualbox Guest Utils                    | 7.2.6-dfsg-3.2igel1774846199     |
+-------------------------------------------+----------------------------------+
| Virtualbox X11 Guest Utils                | 7.2.6-dfsg-3.2igel1774846199     |
+-------------------------------------------+----------------------------------+
| Open VM Tools                             | 12.3.5-3~ubuntu0.22.04.3         |
+-------------------------------------------+----------------------------------+
| Open VM Desktop Tools                     | 12.3.5-3~ubuntu0.22.04.3         |
+-------------------------------------------+----------------------------------+
| Xen Guest Utilities                       | 7.20.2-0ubuntu1~22.04.2          |
+-------------------------------------------+----------------------------------+
| Spice Vdagent                             | 0.23.0-1+b1igel1769493482        |
+-------------------------------------------+----------------------------------+
| Qemu Guest Agent                          | 10.2.2+ds-1igel1773995569        |
+-------------------------------------------+----------------------------------+

+-------------------------------------------+----------------------------------+
| Features with Limited IGEL Support        |                                  |
+===========================================+==================================+
| Mobile Device Access USB (MTP)            | 1.1.23-1igel1775019114           |
+-------------------------------------------+----------------------------------+
| Mobile Device Access USB (imobile)        | no                               |
+-------------------------------------------+----------------------------------+
| Mobile Device Access USB (gphoto)         | 2.5.33-1igel1769504436           |
+-------------------------------------------+----------------------------------+
| VPN OpenConnect                           | 9.12-3.3igel1770034650           |
+-------------------------------------------+----------------------------------+
| Scanner support                           | 1.1.1-5                          |
+-------------------------------------------+----------------------------------+
| VirtualBox VM within IGEL OS              | 7.2.6-dfsg-3.2igel1774846199     |
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
| Citrix Workspace app                        | 563.5M | Included         |
| Citrix StoreFront                           |        |                  |
| Citrix Appliance                            |        |                  |
+---------------------------------------------+--------+------------------+
| Ericom PowerTerm InterConnect               |  10.0M | Included         |
+---------------------------------------------+--------+------------------+
| Media Player                                | 256.0K | Included         |
+---------------------------------------------+--------+------------------+
| Local Browser (Firefox)                     | 100.5M | Included         |
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
| Omnissa Horizon                             | 182.8M | Included         |
+---------------------------------------------+--------+------------------+
| Voice over IP (Ekiga)                       |   6.0M | Included         |
+---------------------------------------------+--------+------------------+
| Citrix Appliance                            | 768.0K | Included         |
+---------------------------------------------+--------+------------------+
| NCP Enterprise VPN Client                   |  11.5M | Not included     |
+---------------------------------------------+--------+------------------+
| Libav Video Codecs                          |   5.0M | Included         |
+---------------------------------------------+--------+------------------+
| IBM i Access Client Solutions               | 134.8M | Not included     |
+---------------------------------------------+--------+------------------+
| Red Hat Enterprise Virtualization           |   2.8M | Included         |
+---------------------------------------------+--------+------------------+
| Parallels Client                            |   5.8M | Included         |
+---------------------------------------------+--------+------------------+
| NVIDIA graphics driver                      | 124.2M | Not included     |
+---------------------------------------------+--------+------------------+
| Imprivata Appliance                         |  32.5M | Included         |
+---------------------------------------------+--------+------------------+
| AppliDis                                    | 256.0K | Included         |
+---------------------------------------------+--------+------------------+
| Evidian AuthMgr                             |   2.8M | Included         |
+---------------------------------------------+--------+------------------+
| Hardware Video Acceleration                 |  11.5M | Included         |
+---------------------------------------------+--------+------------------+
| Extra Font Package                          |   1.0M | Included         |
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
| AVD                                         |  50.5M | Included         |
+---------------------------------------------+--------+------------------+
| Local Browser (Chromium)                    | 128.8M | Not included     |
+---------------------------------------------+--------+------------------+
| Amazon WorkSpaces Client                    |  25.2M | Included         |
+---------------------------------------------+--------+------------------+
| deskMate Client                             |   5.5M | Included         |
+---------------------------------------------+--------+------------------+
| Cisco Webex VDI                             | 109.8M | Not included     |
+---------------------------------------------+--------+------------------+
| Cisco Webex Meetings VDI                    | 127.0M | Not included     |
+---------------------------------------------+--------+------------------+
| Zoom Media Plugin                           | 298.8M | Not included     |
+---------------------------------------------+--------+------------------+
| DriveLock                                   |  12.2M | Included         |
+---------------------------------------------+--------+------------------+
| SpeechWrite Client                          | 256.0K | Included         |
+---------------------------------------------+--------+------------------+
| IGEL Agent for Imprivata                    | 768.0K | Included         |
+---------------------------------------------+--------+------------------+
| LRS Output Management                       | 256.0K | Included         |
+---------------------------------------------+--------+------------------+
| HP Factory deployment documentation         |  88.0M | Included         |
+---------------------------------------------+--------+------------------+
| BIOS Tools                                  |   2.0M | Included         |
+---------------------------------------------+--------+------------------+
| HP Anyware Client                           |  51.8M | Included         |
+---------------------------------------------+--------+------------------+
| 90meter Smart Card Support                  | 512.0K | Included         |
+---------------------------------------------+--------+------------------+
| Virtual Background for Webcam (Limited IGEL | 256.0K | Not included     |
| Support)                                    |        |                  |
| VPN OpenConnect (Limited support)           |        |                  |
| Virtualbox (Limited support)                |        |                  |
| Scanner support / SANE (Limited support)    |        |                  |
| Mobile Device Access USB (Limited support)  |        |                  |
| Limited Support Features                    |        |                  |
+---------------------------------------------+--------+------------------+
| Mobile Device Access USB (Limited support)  | 256.0K | Not included     |
+---------------------------------------------+--------+------------------+
| VPN OpenConnect (Limited support)           |   1.0M | Not included     |
+---------------------------------------------+--------+------------------+
| Scanner support / SANE (Limited support)    |   8.0M | Not included     |
+---------------------------------------------+--------+------------------+
| Virtualbox (Limited support)                |  83.8M | Not included     |
+---------------------------------------------+--------+------------------+
| Virtual Background for Webcam (Limited IGEL |  45.5M | Included         |
| Support)                                    |        |                  |
+---------------------------------------------+--------+------------------+


Known Issues
--------------------------------------------------------------------------------


### Citrix

* Keyboard sync mode selection once/dynamic/off results in unexpected behavior.
* Citrix Cloud login with Citrix Workspace app 20.10 not possible.
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
  redirection-broken-with-google-chrome-browser-version-105-or-higher.
* White / green fragments may appear during desktop launch if JPEG graphical
  codec is used.
* MS Teams calls may stop if blurred background is enabled. This affects Citrix
  Workspace App 2305 and later.
* ZoomVDI version 5.16 or newer is no longer supported with Citrix Workspace app
  20.10.
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
* AVD is not running on devices that don't support SSE4.1 at least. Use an older
  IGEL OS firmware version, such as 11.09.xxx or earlier.
* H.264 hardware decoding for MS-Teams optimization is currently limited to non-
  AMD devices due to stability issues on AMD devices.

### RDP/IGEL RDP Client 2

* In some cases RDP sesssions only show a purple screen or wrong colors when
  using a Radeon 600M to 800M series GPU. As a workaround disable Hardware
  accelerated codecs AVC420/AVC444 (H264) or try using the RDP3 session.

### Remote Desktop (RDP3)

* RDP3 is not running on devices that don't support SSE4.1 at least. Use the
  legacy RDP client instead.

### RD Web Access

* Client is not running on devices that don't support SSE4.1 at least. Use
  RdWebAccess with the legacy RDP client instead.

### Horizon

* Horizon session uses the configured system proxy, even if "Direct connection
  to the Internet" is set for the session.
* Copying text from Horizon Blast sessions is not possible.
* The on-screen keyboard in Horizon appliance mode does not work correctly with
  local logon.  
  It is necessary to switch off local logon and enable the following two keys
  via IGEL registry:  
  userinterface.softkeyboard.autoshow  
  userinterface.softkeyboard.autohide
* With usage of PCoIP protocol, the virtual channel provided by Horizon used for
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

* Parallels Client may fail to connect to newer server versions when it is
  configured via IGEL Setup.
* Attached storage devices appear as network drives in the remote session.  
* USB device redirection is considered as experimental for the Parallels client
  for Linux.

### Chromium

* Hardware accelerated video decoding is currently not supported.

### Firefox

* With enabled Citrix Browser Content Redirection, Firefox has no H.264 and AAC
  multimedia codec support. Means, when codec support is needed in Firefox, BCR
  needs to be disabled. Citrix Browser Content Redirection is disabled by
  default.

### Network

* Wakeup from system suspend fails on DELL Latitude 5510.

### IGEL Agent for Imprivata

* Filter Horizon apps on chooser does not work, apps will show in any case. The
  recommendation is to set "iia.hide_horizon_apps_on_chooser" to "False".

### Smartcard

* Smartcard: OpenSC 0.26.0 update causes issues with smartcard detection
  (PIV/CAC)

### Cisco JVDI Client

* Citrix Workspace App 2010 may cause problems with Cisco JVDI. Newer ZoomVDI
  versions and App Protection are no longer supported with CWA 2010.

### Base system

* After updating the BIOS on the HP mt645 G7 or HP mt645 G8, the device shuts
  down instead of rebooting.
* A member of the proxy bypass list ("No proxy for") that starts with a dot
  automatically gets an asterisk prepended, e.g. .example.com -> *.example.com.
  An odd side effect is that even if the setting was done in the local setup the
  field later cannot be changed anymore there. It can be unlocked with these
  commands in a local terminal as root:  
  setparam network.proxy.settings.sys_no_proxies_on "<final proxy bypass list
  with e.g. **.example.com instead of .example.com>"; resetuservalue
  network.proxy.settings.sys_no_proxies_on.
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
  (e.g. if the monitor has a width of 1920, the offset should be set to 1920).

### Migration

* Before migrating from IGEL OS 11 to IGEL OS 12, check the documented start and
  target version requirements, as specific version combinations are subject to
  migration limitations.  
  https://kb.igel.com/migration-to-igel-os-12/current/upgrading-migration-from-
  igel-os-11-to-igel-os-12#Required-IGEL-OS-Start-and-Target-Versions

### Firmware update

* A firmware update started on 11.10.100 can sporadically block, so that the
  device must be rebooted manually. The update continues without problem after
  reboot.
* On devices with 4 GB flash storage or smaller it could happen that there is
  not enough space for updating all features. In this case, a corresponding
  error message occurs. Please visit https://kb.igel.com/igelos-11.09/en/error-
  not-enough-space-on-local-drive-when-updating-to-igel-os-11-08-or-
  higher-101059051.html for a possible solution and additional information.

### Appliance Mode

* Appliance mode RHEV/Spice: spice-xpi firefox plugin is no longer supported.
  The "Console Invocation" has to allow 'Native' client (auto is also possible)
  and should be started in fullscreen to prevent any opening windows.
* Browser Appliance mode can fail when the Web URL contains special control
  characters like ampersand (& character).  
  Workaround: Add quotes at the beginning and the end of an affected URL. E.g.:  
  'https://www.google.com/search?q=aSearchTerm&source=lnms&tbm=isch'.

### VNC Viewer

* When attempting to connect to a remote session using VNC Viewer the
  application becomes unresponsive if the connection cannot be established.

### Audio

* UD3-M340C: Sound preferences are showing Headphone & Microphone, although not
  connected.
* Microphone (TRRS headset) is broken on LG 27CN650.

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
* Printing on native parallel port broken on HP t730 devices.
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

### Fabulatech

* Fabulatech device redirection does not work with Omnissa Horizon on Windows 11
  when the selected protocol is Horizon Blast. Redirection currently works only
  with PCoIP.


Release Notes 11.11.100
--------------------------------------------------------------------------------


New Features
--------------------------------------------------------------------------------


### Citrix

* Updated Citrix Workspace App to version 2505.  
  Available workspace apps in this release: 25.05.0.44 (default), and 20.10.0.6
* The on-screen keyboard has been enhanced to improve multi-touch performance.
  Users can now use the digital on-screen keyboard on their devices without
  needing an external physical keyboard.

+------------+-----------------------------------------------------------------+
| Parameter  | Enhancement for multi-touch on-screen keyboard                  |
+------------+-----------------------------------------------------------------+
| Registry   | ica.wfclient.enhanceoskformt                                    |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | **true** (default)/ false                                       |
+------------+-----------------------------------------------------------------+

* Audio Quality Enhancer (v2) has been added for Adaptive Audio. This feature
  significantly improves audio quality, especially in scenarios with packet loss
  or network disruptions.

+------------+-----------------------------------------------------------------+
| Parameter  | Audio Quality Enhancer to improve audio performance             |
+------------+-----------------------------------------------------------------+
| Registry   | ica.module.enablenetstat                                        |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | **false** (default)/ true                                       |
+------------+-----------------------------------------------------------------+

* The deviceTRUST virtual channel is now integrated directly into Citrix
  Workspace app 25.03 and later. To use it, enable the registry key
  "ica.module.virtualchannel.ctxdt.enable." Additionally, an alternative
  deviceTRUST Client Extension "ica.module.virtualchannel.devicetrust.enable" is
  still available, giving two activation options for Workspace app 25.03 and
  later. If both keys are enabled, the existing extension continues to work
  alongside the new integrated virtual channel. For deviceTRUST in workspace app
  2411 or earlier versions, enable
  "ica.module.virtualchannel.devicetrust.enable".

+------------+-----------------------------------------------------------------+
| Parameter  | deviceTRUST channel for CWA 2503 and later                      |
+------------+-----------------------------------------------------------------+
| Registry   | ica.module.virtualchannel.ctxdt.enable                          |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | **false** (default)/ true                                       |
+------------+-----------------------------------------------------------------+


### AVD

* Updated AVD to version 1.3.5.  
* MS-Teams optimization improvements  
* Stability fixes
* Added H264 decoding preview for AVD Sessions.

+------------+-----------------------------------------------------------------+
| Registry   | `sessions.wvd%.options.enable-h264-hardware-acceleration`       |
+------------+-----------------------------------------------------------------+
| Value      | **enabled** (default) / disabled                                |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Registry   | `sessions.wvd%.options.h264-hardware-acceleration-level`        |
+------------+-----------------------------------------------------------------+
| Value      | [AVC420][**AVC444**(default)]                                   |
+------------+-----------------------------------------------------------------+


### Horizon

* Updated Omnissa Horizon client version to 25.06

### Amazon Workspace Client

* Updated Amazon WorkSpaces client to version 2024.7

### HP Anyware

* Updated HP Anyware to version 25.03.2.

### Network

* Added asix_thirdparty driver to enable support for certain USB fiber Ethernet
  adapters.  
* Added new registry key:

+------------+-----------------------------------------------------------------+
| Parameter  | `Use thirdparty asix kernel module.`                            |
+------------+-----------------------------------------------------------------+
| Registry   | `network.drivers.asix.prefer_thirdparty`                        |
+------------+-----------------------------------------------------------------+
| Range      | [Auto][Yes][No]                                                 |
+------------+-----------------------------------------------------------------+
| Value      | **Auto**                                                        |
+------------+-----------------------------------------------------------------+


### WiFi

* Added newer Realtek Wi-Fi drivers to the system and made them configurable  
* Added Realtek WiFi drivers for 8852bu and 8852cu devices.  
* Added registry keys to select / configure the driver to use::

+------------+-----------------------------------------------------------------+
|Parameter   |`Use 8812au driver instead of rtw_8812au for WLAN.`              |
+------------+-----------------------------------------------------------------+
|Registry    |`network.drivers.realtek.use_8812au`                             |
+------------+-----------------------------------------------------------------+
|Range       | [Auto][Yes][No]                                                 |
+------------+-----------------------------------------------------------------+
|Value       |**Auto**                                                         |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
|Parameter   |`Use 8814au driver instead of rtw_8814au for WLAN.`              |
+------------+-----------------------------------------------------------------+
|Registry    |`network.drivers.realtek.use_8814au`                             |
+------------+-----------------------------------------------------------------+
|Range       | [Auto][Yes][No]                                                 |
+------------+-----------------------------------------------------------------+
|Value       |**Auto**                                                         |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
|Parameter   |`Use 8821au driver instead of rtw_8821au for WLAN.`              |
+------------+-----------------------------------------------------------------+
|Registry    |`network.drivers.realtek.use_8821au`                             |
+------------+-----------------------------------------------------------------+
|Range       | [Auto][Yes][No]                                                 |
+------------+-----------------------------------------------------------------+
|Value       |**Auto**                                                         |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
|Parameter   |`Use 8821ce driver instead of rtw_8821ce for WLAN.`              |
+------------+-----------------------------------------------------------------+
|Registry    |`network.drivers.realtek.use_8821ce`                             |
+------------+-----------------------------------------------------------------+
|Range       | [Auto][Yes][No]                                                 |
+------------+-----------------------------------------------------------------+
|Value       |**Auto**                                                         |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
|Parameter   |`Use 8821cu driver instead of rtw_8821cu for WLAN.`              |
+------------+-----------------------------------------------------------------+
|Registry    |`network.drivers.realtek.use_8821cu`                             |
+------------+-----------------------------------------------------------------+
|Range       | [Auto][Yes][No]                                                 |
+------------+-----------------------------------------------------------------+
|Value       |**Auto**                                                         |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
|Parameter   |`Use 8852bu driver instead of rtw_8852bu for WLAN.`              |
+------------+-----------------------------------------------------------------+
|Registry    |`network.drivers.realtek.use_8852bu`                             |
+------------+-----------------------------------------------------------------+
|Range       | [Auto][Yes][No]                                                 |
+------------+-----------------------------------------------------------------+
|Value       |**Auto**                                                         |
+------------+-----------------------------------------------------------------+


### Smartcard

* Updated Cryptovision SCinterface smartcard middleware to version 8.2.3.775.

### HID

* Changed the default Xorg mouse driver to libinput, which provides better
  compatibility with newer Chromium versions.

+------------+-----------------------------------------------------------------+
| Parameter  | {{Xorg driver to use.}}                                         |
+------------+-----------------------------------------------------------------+
| Registry   | {{userinterface.mouse.driver}}                                  |
+------------+-----------------------------------------------------------------+
| Range      | [Evdev][Libinput]                                               |
+------------+-----------------------------------------------------------------+
| Value      | _Libinput_                                                      |
+------------+-----------------------------------------------------------------+


### CUPS Printing

* Updated Vasion Print (former PrinterLogic) Printer Installer Client to version
  25.2.0.16.
* IGEL OS updates now reset the writable partition but retain existing printer
  mappings.

### Cisco JVDI Client

* Updated Cisco JVDI to version 15.1.0

### Cisco Webex

* Updated Cisco Webex VDI version to 45.6.1.32593
* Updated Webex Meetings VDI to version 45.2.1.2  
* Available Webex Meetings VDI versions in this release: 45.2.1.2 (default),
  44.10.1.3, and 44.6.5.1

### Base system

* Updated kernel to version 6.6.108.
* Added downgrade limit - The IGEL OS11 can no longer be downgraded to versions
  older than 11.10.410. This restriction applies to IGEL UD Pocket devices and
  endpoints with Secure Boot enabled. In such cases, downgrade attempts to
  versions prior to 11.10.410 will be refused to maintain system integrity and
  boot security.
* Added migration restriction - The OS11 can no longer be migrated to versions
  older than 12.7.0. This restriction applies to IGEL UD Pocket devices and
  endpoints with Secure Boot enabled. In such cases, migration attempts to
  versions prior to 12.7.0 will be refused to maintain system integrity and boot
  security.
* Updated boot chain with  
* New SHIM 15.8, signed by Microsoft  
* New GRUB 2.12

### Migration

* Added support for Distributed App Repositories to enable OS 12 migration.
* Added registry keys for distributed App repositories:

+------------+-----------------------------------------------------------------+
| Parameter  | `Priority`                                                      |
+------------+-----------------------------------------------------------------+
| Registry   | `update.external_binary_source%.priority`                       |
+------------+-----------------------------------------------------------------+
| Type       | string                                                          |
+------------+-----------------------------------------------------------------+
| Value      | 100 _Default_                                                   |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | `Repository URL`                                                |
+------------+-----------------------------------------------------------------+
| Registry   | `update.external_binary_source%.url`                            |
+------------+-----------------------------------------------------------------+
| Type       | string                                                          |
+------------+-----------------------------------------------------------------+
| Value      | empty _Default_                                                 |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | `Certificate`                                                   |
+------------+-----------------------------------------------------------------+
| Registry   | `update.external_binary_source%.certificate`                    |
+------------+-----------------------------------------------------------------+
| Type       | string                                                          |
+------------+-----------------------------------------------------------------+
| Value      | empty _Default_                                                 |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | `Username`                                                      |
+------------+-----------------------------------------------------------------+
| Registry   | `update.external_binary_source%.username`                       |
+------------+-----------------------------------------------------------------+
| Type       | string                                                          |
+------------+-----------------------------------------------------------------+
| Value      | empty _Default_                                                 |
+------------+-----------------------------------------------------------------+

+------------+-----------------------------------------------------------------+
| Parameter  | `Password`                                                      |
+------------+-----------------------------------------------------------------+
| Registry   | `update.external_binary_source%.crypt_password`                 |
+------------+-----------------------------------------------------------------+
| Type       | string                                                          |
+------------+-----------------------------------------------------------------+
| Value      | empty _Default_                                                 |
+------------+-----------------------------------------------------------------+


### Driver

* Updated NVIDIA driver from version 535 to 550.

### zoomvdi

* Updated Zoom VDI to version 6.5.10.26710  
* Available Zoom VDI versions in this release: 6.5.10.26710 (default),
  6.4.10.26150, and  6.2.10.25600


Security Fixes
--------------------------------------------------------------------------------


### Chromium

* Fixed chromium security issues  CVE-2025-10892, CVE-2025-10891,
  CVE-2025-10890, CVE-2025-10585, CVE-2025-10502, CVE-2025-10501,
  CVE-2025-10500, CVE-2025-10201, CVE-2025-10200, CVE-2025-9864, CVE-2025-9865,
  CVE-2025-9866, CVE-2025-9867, CVE-2025-9478, CVE-2025-9132, CVE-2025-8901,
  CVE-2025-8882, CVE-2025-8881, CVE-2025-8880, CVE-2025-8879, CVE-2025-8583,
  CVE-2025-8582, CVE-2025-8581, CVE-2025-8580, CVE-2025-8579, CVE-2025-8578,
  CVE-2025-8577, CVE-2025-8576, CVE-2025-8292, CVE-2025-8011, CVE-2025-8010,
  CVE-2025-7657, CVE-2025-7656, CVE-2025-6558, CVE-2025-7657, CVE-2025-7656,
  CVE-2025-6558, CVE-2025-6554, CVE-2025-6557, CVE-2025-6556, CVE-2025-6555,
  CVE-2025-6192, CVE-2025-6191, CVE-2025-5959, CVE-2025-5958, CVE-2025-5419,
  CVE-2025-5283, CVE-2025-5281, CVE-2025-5280, CVE-2025-5068, CVE-2025-5067,
  CVE-2025-5066, CVE-2025-5065, CVE-2025-5064, CVE-2025-5063, CVE-2025-4664,
  CVE-2025-4609, CVE-2025-4372, CVE-2025-4096, CVE-2025-4052, CVE-2025-4051,
  CVE-2025-4050, CVE-2025-3620, CVE-2025-3619, CVE-2025-3074, CVE-2025-3073,
  CVE-2025-3072, CVE-2025-3071, CVE-2025-3070, CVE-2025-3069, CVE-2025-3068,
  CVE-2025-3067, CVE-2025-3066, CVE-2025-24201, CVE-2025-2137, CVE-2025-2136,
  CVE-2025-2135, CVE-2025-1923, CVE-2025-1922, CVE-2025-1921, CVE-2025-1920,
  CVE-2025-1919, CVE-2025-1918, CVE-2025-1917, CVE-2025-1916, CVE-2025-1915,
  CVE-2025-1914, CVE-2025-1426, CVE-2025-1006, CVE-2025-0999, CVE-2025-0998,
  CVE-2025-0997, CVE-2025-0996 and CVE-2025-0995.
* Fixed chromium security issues CVE-2025-10585, CVE-2025-10502, CVE-2025-10501,
  CVE-2025-10500, CVE-2025-9867, CVE-2025-9866, CVE-2025-9865, CVE-2025-9864,
  CVE-2025-10201 and CVE-2025-10200.
**Fixed chromium security issues CVE-2025-13224, CVE-2025-13223, CVE-2025-13042,
  CVE-2025-12729, CVE-2025-12728, CVE-2025-12727, CVE-2025-12726,
  CVE-2025-12725, CVE-2025-12447, CVE-2025-12446, CVE-2025-12445,
  CVE-2025-12444, CVE-2025-12443, CVE-2025-12441, CVE-2025-12440,
  CVE-2025-12439, CVE-2025-12438, CVE-2025-12437, CVE-2025-12436,
  CVE-2025-12435, CVE-2025-12434, CVE-2025-12433, CVE-2025-12432,
  CVE-2025-12431, CVE-2025-12430, CVE-2025-12429, CVE-2025-12428,
  CVE-2025-12036, CVE-2025-11756, CVE-2025-11460, CVE-2025-11458,
  CVE-2025-11219, CVE-2025-11216, CVE-2025-11215, CVE-2025-11213,
  CVE-2025-11212, CVE-2025-11211, CVE-2025-11210, CVE-2025-11209,
  CVE-2025-11208, CVE-2025-11207, CVE-2025-11206 and CVE-2025-11205.  
* Fixed chromium security issues CVE-2025-9867, CVE-2025-9866, CVE-2025-9865,
  CVE-2025-9864, CVE-2025-10201 and CVE-2025-10200.  
* Updated Chromium Browser to version 142.0.7444.175.

### Firefox

* Updated Firefox to version 140.3.1.  
    - Fixes for mfsa2025-75, also known as: CVE-2025-10527, CVE-2025-10528,
      CVE-2025-10529, CVE-2025-10532, CVE-2025-10533, CVE-2025-10536,
      CVE-2025-10537.  
    - Fixes for mfsa2025-15, also known as CVE-2024-43097, CVE-2025-1930,
      CVE-2025-1931, CVE-2025-1933 and CVE-2025-1937.  
    - Fixes for mfsa2025-21, also known as CVE-2025-3028.  
    - Fixes for mfsa2025-30, also known as CVE-2025-2817, CVE-2025-4082,
      CVE-2025-4083 and CVE-2025-4084.  
    - Fixes for mfsa2025-38, also known as CVE-2025-4918 and CVE-2025-4919.  
    - Fixes for mfsa2025-43, also known as CVE-2025-5263, CVE-2025-5264,
      CVE-2025-5265 and MFSA-TMP-2025-0001.  
    - Fixes for CVE-2025-9179, CVE-2025-9180 and CVE-2025-9185.


### Network

* Fixed ppp security issue CVE-2024-58250.

### WiFi

* Fixed a critical issue in the regulatory domain configuration, preventing
  potential privilege escalation and incorrect log entries.

### Base system

* Fixed webkit2gtk security issues CVE-2025-24162, CVE-2025-24158,
  CVE-2025-24150, CVE-2025-24143, CVE-2024-54658, CVE-2024-54543 and
  CVE-2024-27856.
* Fixed openssl security issues CVE-2024-9143 and CVE-2024-13176.  
* Fixed vim security issue CVE-2025-24014.  
* Fixed xorg-server security issues CVE-2025-49176, CVE-2025-49180,
  CVE-2025-49179, CVE-2025-49178, CVE-2025-49177, CVE-2025-49176 and
  CVE-2025-49175, CVE-2022-49737, CVE-2025-26601, CVE-2025-26600,
  CVE-2025-26599, CVE-2025-26598, CVE-2025-26597, CVE-2025-26596, CVE-2025-26595
  and CVE-2025-26594.  
* Fixed libcap2 security issue CVE-2025-1390.  
* Fixed gnutls28 security issue CVE-2024-12243.  
* Fixed postgresql-14 security issues CVE-2025-8715, CVE-2025-8714,
  CVE-2025-8713, CVE-2017-7484, CVE-2012-0868, CVE-2025-4207 and CVE-2025-1094.  
* Fixed python3.10 security issues CVE-2025-8194, CVE-2025-6069, CVE-2025-4516,
  CVE-2025-1795, CVE-2025-0938.  
* Fixed openssl security issues CVE-2024-9143 and CVE-2024-13176.  
* Fixed libtasn1-6 security issue CVE-2024-12133.  
* Fixed pam-pkcs11 security issues CVE-2025-24531 and CVE-2025-24032.  
* Fixed openssh security issues CVE-2025-26466 and CVE-2025-26465.  
* Fixed expat security issues CVE-2025-59375, CVE-2024-8176, CVE-2024-50602,
  CVE-2024-45492, CVE-2024-45491 and CVE-2024-45490.  
* Fixed krb5 security issue CVE-2025-24528.  
* Fixed freetype security issue CVE-2025-27363.  
* Fixed libxslt security issues CVE-2023-40403, CVE-2025-24855 and
  CVE-2024-55549.  
* Fixed ghostscript security issues CVE-2025-48708, CVE-2025-27836,
  CVE-2025-27835, CVE-2025-27834, CVE-2025-27832, CVE-2025-27831 and
  CVE-2025-27830.  
* Fixed libxml2 security issues CVE-2025-32415, CVE-2025-32414, CVE-2024-25062,
  CVE-2023-45322, CVE-2023-39615, CVE-2025-27113, CVE-2025-24928,
  CVE-2024-56171, CVE-2024-34459 and CVE-2022-49043.  
* Fixed aom security issue CVE-2024-5171.  
* Fixed vim security issue CVE-2025-26603.  
* Fixed xz-utils security issue CVE-2025-31115.  
* Fixed openvpn security issue CVE-2025-2704.  
* Fixed poppler security issues CVE-2025-52886, CVE-2025-50420, CVE-2025-43903,
  CVE-2025-32365 and CVE-2025-32364.  
* Fixed gnupg2 security issue CVE-2025-30258.  
* Fixed libsoup2.4 security issues CVE-2025-4969, CVE-2025-4948, CVE-2025-4945,
  CVE-2025-32907, CVE-2025-4476, CVE-2025-32053, CVE-2025-32052, CVE-2025-32050
  and CVE-2025-2784.  
* Fixed webkit2gtk security issues CVE-2025-43368, CVE-2025-43356,
  CVE-2025-43342, CVE-2025-43272, CVE-2025-6558, CVE-2025-43265, CVE-2025-43240,
  CVE-2025-43228, CVE-2025-43227, CVE-2025-43216, CVE-2025-43212,
  CVE-2025-43211, CVE-2025-31278, CVE-2025-31273, CVE-2025-24189,
  CVE-2025-31257, CVE-2025-31215, CVE-2025-31206, CVE-2025-31205,
  CVE-2025-31204, CVE-2025-24223, CVE-2023-42970, CVE-2023-42875,
  CVE-2024-44192, CVE-2024-54467, CVE-2025-24201, CVE-2024-54551,
  CVE-2025-24208, CVE-2025-24209, CVE-2025-24213, CVE-2025-24216, CVE-2025-24264
  and CVE-2025-30427.  
* Fixed openssh security issue CVE-2025-32728.  
* Fixed qt6-base security issues CVE-2025-5992, CVE-2025-5455 and CVE-2025-3512.  
* Fixed perl security issues CVE-2024-56406 and CVE-2025-40909.  
* Fixed protobuf security issues  CVE-2025-4565 andCVE-2024-7254.  
* Fixed zulu17-ca security issues CVE-2025-50059, CVE-2025-30754,
  CVE-2025-27113, CVE-2025-24855, CVE-2025-50106, CVE-2025-30749,
  CVE-2025-21587, CVE-2025-30698, CVE-2025-30691, CVE-2024-47606 and
  CVE-2024-54534.  
* Fixed util-linux security issue CVE-2024-28085.  
* Fixed libarchive security issues CVE-2025-5917, CVE-2025-5916, CVE-2025-5915,
  CVE-2025-5914 and CVE-2025-1632.  
* Fixed mysql-8.0 security issues CVE-2025-53023, CVE-2025-50104,
  CVE-2025-50102, CVE-2025-50101, CVE-2025-50100, CVE-2025-50099,
  CVE-2025-50098, CVE-2025-50097, CVE-2025-50096, CVE-2025-50094,
  CVE-2025-50093, CVE-2025-50092, CVE-2025-50091, CVE-2025-50087,
  CVE-2025-50086, CVE-2025-50085, CVE-2025-50084, CVE-2025-50083,
  CVE-2025-50082, CVE-2025-50081, CVE-2025-50080, CVE-2025-50079,
  CVE-2025-50078, CVE-2025-50077, CVE-2025-30722, CVE-2025-30721,
  CVE-2025-30715, CVE-2025-30705, CVE-2025-30704, CVE-2025-30703,
  CVE-2025-30699, CVE-2025-30696, CVE-2025-30695, CVE-2025-30693,
  CVE-2025-30689, CVE-2025-30688, CVE-2025-30687, CVE-2025-30685,
  CVE-2025-30684, CVE-2025-30683, CVE-2025-30682, CVE-2025-30681,
  CVE-2025-21585, CVE-2025-21584, CVE-2025-21581, CVE-2025-21580,
  CVE-2025-21579, CVE-2025-21577, CVE-2025-21575 and CVE-2025-21574.  
* Fixed libsoup2.4 security issues CVE-2025-46421, CVE-2025-46420,
  CVE-2025-32914, CVE-2025-32913, CVE-2025-32912, CVE-2025-32911,
  CVE-2025-32910, CVE-2025-32909 and CVE-2025-32906.  
* Fixed libraw security issues CVE-2025-43964, CVE-2025-43963, CVE-2025-43962
  and CVE-2025-43961.  
* Fixed libbpf security issue CVE-2025-29481.  
* Fixed libsoup3 security issues CVE-2025-32911, CVE-2025-46421, CVE-2025-46420,
  CVE-2025-32913, CVE-2025-32912, CVE-2025-32911, CVE-2025-32910,
  CVE-2025-32909, CVE-2025-32906, CVE-2025-32053, CVE-2025-32052,
  CVE-2025-32051, CVE-2025-32050, CVE-2025-2784, CVE-2024-52532, CVE-2024-52531
  and CVE-2024-52530.  
* Fixed open-vm-tools security issue CVE-2025-22247.  
* Fixed virtualbox security issues CVE-2025-30725, CVE-2025-30719,
  CVE-2025-30712, CVE-2025-21571, CVE-2025-21533, CVE-2024-21273,
  CVE-2024-21263, CVE-2024-21259, CVE-2024-21253 and CVE-2024-21248.  
* Fixed sqlite3 security issues CVE-2025-6965 and CVE-2025-29088.  
* Fixed network-manager security issue CVE-2024-6501.  
* Fixed glib2.0 security issue CVE-2025-4373.  
* Fixed net-tools security issue CVE-2025-46836.  
* Fixed setuptools security issue CVE-2025-47273.  
* Fixed systemd security issue CVE-2025-4598.  
* Fixed pam security issues CVE-2025-6020 and CVE-2024-22365.  
* Fixed requests security issue CVE-2024-47081.  
* Fixed libblockdev security issue CVE-2025-6019.  
* Fixed libtpms security issue CVE-2025-49133.  
* Fixed python-urllib3 security issue CVE-2025-50181.  
* Fixed qtbase-opensource-src security issue CVE-2025-5455.  
* Fixed libssh security issues CVE-2025-8277, CVE-2025-8114, CVE-2025-5987,
  CVE-2025-5449, CVE-2025-5372, CVE-2025-5351, CVE-2025-5318, CVE-2025-4878 and
  CVE-2025-4877.  
* Fixed sudo security issue CVE-2025-32462.  
* Fixed djvulibre security issue CVE-2025-53367.  
* Fixed gnutls28 security issues CVE-2025-6395, CVE-2025-32990, CVE-2025-32989
  and CVE-2025-32988.  
* Fixed iperf3 security issues CVE-2025-54350 and CVE-2025-54349.  
* Fixed qemu security issues CVE-2025-8860, CVE-2025-54567 and CVE-2025-54566.  
* Fixed gdk-pixbuf security issues CVE-2025-7345 and CVE-2025-6199.  
* Fixed gcc-12 security issue CVE-2023-4039.  
* Fixed tiff security issues CVE-2025-8851, CVE-2025-8534 and CVE-2025-8176.  
* Fixed iputils security issues CVE-2025-48964 and CVE-2025-47268.  
* Fixed jq security issues CVE-2025-48060 and CVE-2024-23337.  
* Fixed curl security issue CVE-2025-5399.  
* Fixed ffmpeg security issues CVE-2025-22919, CVE-2025-0518, CVE-2024-35368,
  CVE-2024-35367, CVE-2024-31582, CVE-2023-6605, CVE-2023-6604, CVE-2023-6602,
  CVE-2023-50008, CVE-2023-50007 and CVE-2023-49502.  
* Fixed libxml2 security issues CVE-2025-49796, CVE-2025-49794, CVE-2025-6170,
  CVE-2025-6021 and CVE-2025-7425.  
* Fixed cjson security issues CVE-2024-31755, CVE-2023-50472, CVE-2023-50471 and
  CVE-2023-26819.  
* Fixed openjpeg2 security issue CVE-2025-50952.  
* Fixed wpa security issue CVE-2022-37660.  
* Fixed cups security issues CVE-2025-58364 and CVE-2025-58060.  
* Fixed bind9 security issues CVE-2024-12705 and CVE-2024-11187.  
* Fixed glibc security issue CVE-2025-8058.  
* Fixed expat security issues CVE-2025-59375 and CVE-2024-8176.
* Fixed glibc security issue CVE-2025-4802.
* Fixed ISN 2025-24: Command Execution in IGEL OS.
* Fixed tiff security issues CVE-2025-9900, CVE-2025-9165 and CVE-2025-8961.
* Fixed webkit2gtk security issue CVE-2025-43343.
* Fixed Kernel CVE-2024-5030.


Resolved Issues
--------------------------------------------------------------------------------


### Citrix

* Fixed mapping of  hotkey 'Ctrl + Alt + End' to 'Ctrl + Alt + Del',
  configurable via IGEL Setup > Sessions > Citrix > Citrix Global > Keyboard >
  'Mapping Ctrl + Alt + End to Ctrl + Alt + Del for Citrix sessions'.
* Fixed option to disable Citrix connection dialog:
  ica.pnlogin.suppressconnectiondialog
* Removed registry key "ica.teams.remoteaudionotifications.enabled" because of
  duplicating behavior
* Enhanced Kerberos/AD and Last User/-Domain/Autologin for Citrix Cloud
  Services.
* Fixed a crash in Citrix sessions that could occur when switching from full-
  screen to windowed mode while hardware-accelerated H.264 decoding is enabled.
* The issue where it was not possible to connect to Citrix from a closed proxy
  network has been fixed. The proxy configuration in 'Session > Citrix > Citrix
  Global > Firewall' no longer works, please adjust the values of the following
  registry keys instead. These configurations are necessary for Citrix, even if
  the proxy is configured system-wide.
* To configure a proxy to launch a desktop via the SOCKS protocol  
  System > Registry > ica > allregions > proxytype = Socks  
  System > Registry > ica > allregions > proxyhost = <IP>:<PORT>
* To configure a proxy to launch a desktop via the secure (Https) protocol,
  proceed as follows  
  System > Registry > ica > allregions > proxytype = Secure  
  System > Registry > ica > allregions > proxyhost = <IP>:<PORT>  
  System > Registry > ica > allregions > hdxoverudp = Off
* For the automatic proxy configuration  
  System > Registry > ica > allregions > proxytype = Script  
  System > Registry > ica > allregions > proxyautoconfigurl = file://file-path,
  https://serverfilepath, or http://server/filepath  
  System > Registry > ica > allregions > hdxoverudp = Off
* Resolved an issue where Citrix USB redirection could fail when launching a
  session directly from the browser without a preconfigured StoreFront or Self-
  Service session.
* Citrix App Protected resources can be launched from the browser without the
  need for a pre-configured store in the setup. A system restart is required
  after activating/deactivating this feature.
* Updated the libsoup library to version libsoup-3.0.so.0.6.0 to resolve
  segmentation faults (crashes) occurring during Microsoft Teams calls.
* The keyboard no longer freezes when using Dell HR024 headsets.

### RDP/IGEL RDP Client 2

* Fixed RDP session instability when unsing 5 or more monitors.

### Remote Desktop (RDP3)

* Fixed RD Web Access autostart not working when using client version RDP3.

### Horizon

* Fixed Browser content redirection for Omnissa Horizon client versions 24.12
  and higher
* Fixed post session command in Omnissa Horizon client 24.12 and higher
* Fixed Teams optimization in Omnissa Horizon client
* Changed remaining Horizon virtual channel path names, replacing VMware
  references with Omnissa.

### Parallels Client

* Resolved an issue where the Post-Session Command could trigger prematurely,
  particularly when used with the Parallels Client

### HP Anyware

* Removed not supported languages

### Chromium

* Fixed an issue where downloading email attachments (for example, from
  Outlook/Office) could fail when the download dialog was enabled.

### Network

* Fixed MAC address passthrough parameter
  network.interfaces.ethernet.device%.mac_source: Before taking the MAC address
  from another network interface and disabling it, a check is now performed if
  the interface is enabled in the IGEL Setup which is to receive the MAC
  address. If the interface is not enabled, the mapping will fail with a syslog
  entry: "failed: DEV is not enabled".  
  Additionally, interface table numbering was fixed, making it possible now to
  take MAC address from interface 1 (previously failing with "ODEV not present"
  message)

### Smartcard

* Fixed Firefox not starting when smartcard is inserted.
* Fixed personalization of IGEL Smartcard. For security reasons, the
  personalization has to be enabled before smartcards can be written. Note that
  this setting will weaken the protection against users accessing setup
  parameters. The parameter enabling the personalization is:

+------------+-----------------------------------------------------------------+
|Parameter   |`Enable IGEL smartcard personalization (weakens security!)`      |
+------------+-----------------------------------------------------------------+
|Registry    |`scard.scardd.enable_personalization`                            |
+------------+-----------------------------------------------------------------+
|Value       |`**false** (default)/true`                                       |
+------------+-----------------------------------------------------------------+

* Fixed smartcard redirection in AVD and Remote Desktop (RDP3) sessions.

### Cisco JVDI Client

* Fixed Cisco JVDI plugin path for Omnissa Horizon client.

### Base system

* Fixed mounting internal mass storage of Olympus DS-9500
* Fixed issue with e1000e not working on Dell Optiplex 7000 device.
* Fixed an issue which caused the migration from OS11 to OS12 to fail if the
  OS12 system partition is larger than 1GB. So far, no OS12 system partition
  falls into this category but future versions of OS12 may be affected.

### Logging

* Fixed remote logging feature.

### Firmware update

* Fixed an OS 11 to OS 12 migration issue where repartitioning could fail on
  systems using non-GPT partition tables.

### X11 system

* Changed the default behavior for dual-GPU systems so that the modesetting
  driver is no longer used by default for AMDGPU devices  
* Added registry key to switch back to old behaviour if needed.

+------------+-----------------------------------------------------------------+
| Parameter  | `Use generic modesetting driver for AMDGPU in Dual GPU cases.`  |
+------------+-----------------------------------------------------------------+
| Registry   | `x.drivers.amdgpu.use_modesetting_for_dual_gpu`                 |
+------------+-----------------------------------------------------------------+
| Type       | bool                                                            |
+------------+-----------------------------------------------------------------+
| Value      | enabled / _disabled_ (default)                                  |
+------------+-----------------------------------------------------------------+


### Audio

* Fixed audio support for LG CQ600 series.
* Fixed internal microphone on Lenovo L15 AMD Gen4
* Fixed audio support for LG 24CQ651N: The internal mic boosting has been
  disabled in order to fix the over-sensitivity problem. However, in the UI tool
  it will still show up as ~30% volume.
* Fixed internal microphone on Fujitsu Lifebook E5412.

### Multimedia

* Force using playbin3 instead of playbin in parole (media player)

### Remote Management

* Fixed limit of the remote management terminal key used in the upgrade process
  - now it is possible to use terminal key up to 64 bytes.

