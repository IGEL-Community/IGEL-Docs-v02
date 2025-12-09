# IGEL News: Builds OS 12

**NOTE:**

----

## 2025-12-09 - [12.7.4](https://app.igel.com/base_system/12.7.4)

```
The new BUILD 12.7.4 for IGEL Workspace is ready.

These are the release notes published with that release:

Component Versions
-------------------------------------------------------------------------------

| Components                                |                                  |
|-------------------------------------------|----------------------------------|
| MESA OpenGL Stack                         | 25.0.3-1igel1744090649           |
| VDPAU Library Version                     | 1.5-2                            |
| Graphics Driver INTEL                     | 2.99.917+git20210115-1igel1654609037     |
| Graphics Driver ATI/RADEON                | 22.0.0-1igel1704966675           |
| Graphics Driver ATI/AMDGPU                | 23.0.0-1igel1705669076           |
| Graphics Driver Nouveau (Nvidia Legacy)   | 1.0.18-1igel1739362211           |
| Graphics Driver VMware                    | 13.3.0-3igel1713934792           |
| Graphics Driver QXL (Spice)               | 0.1.6-1igel1687782644            |
| Graphics Driver FBDEV                     | 0.5.0-2igel1654609009            |
| Graphics Driver VESA                      | 2.6.0-2igel1739365508            |
| Input Driver Evdev                        | 2.11.0-1igel1738822597           |
| Input Driver Elographics                  | 1.4.3-1igel1678083379            |
| Input Driver Synaptics                    | 1.9.2-1+b1igel1683803726         |
| Input Driver VMMouse                      | 13.1.0-1ubuntu2igel1628499891    |
| Input Driver Wacom                        | 1.2.3-1igel1738566034            |
| Kernel                                    | 6.12.20 #mainline-lxos12-g1762770033     |
| Xorg X11 Server                           | 21.1.20-1igel1761803077          |
| Lightdm Graphical Login Manager           | 1.26.0-8igel1756470008           |
| XFCE4 Window Manager                      | 4.14.5-1~18.04igel1643191202     |
| ISC DHCP Client                           | 4.4.3-P1-2                       |
| ModemManager                              | 1.22.0-3+b2igel1731393568        |
| WebKit2Gtk                                | 2.50.1-1~deb12u1igel1761716819   |
| Python3                                   | 3.11.2                           |
| Virtualbox Guest Utils                    | 7.1.10-dfsg-1igel1749619644      |
| Virtualbox X11 Guest Utils                | 7.1.10-dfsg-1igel1749619644      |
| Open VM Tools                             | 12.2.0-1+deb12u3                 |
| Open VM Desktop Tools                     | 12.2.0-1+deb12u3                 |


Release Notes of installable IGEL OS 12 base system
================================================================================

# Changes since: 12.7.3

## New Features

- Added: In the Config Dialog / IGEL Setup, slider parameters now show display names instead of numeric values for special cases.

- **App Management**

	- Added: Automatic discovery for Distributed Peer Updates -  IGEL OS devices in the same subnet now automatically collaborate to reduce downloads from the UMS or the App Portal.
		- When a device needs to install a specific app/version, it first attempts to retrieve it from a peer device.
		- If the app/version is not yet available from one of the peers, it will be downloaded by one of the devices while the other devices wait for the operation to complete. The other devices will then coordinate and install via distributed peer update.
		- If only a single device requests an app/version, behavior remains unchanged: the device downloads directly from UMS or the App Portal.
	- To enable distributed peer updates:
		- Turn on System > Update > Distributed Peer Update Server
		- Turn on System > Update > IGEL Discovery

- **Network**

	- Added a configuration option for disabling the igel-dconf-monitor.
```
|  Parameter  |  Registry   |  Type       |  Value      |
| ------ | ------ | ------ | ------ |
|  `Disable dconf monitor (admin and debug use only)`  |  `network.proxy.settings.sys_proxy_dconf_disable`  |  bool  |  enabled / *disabled* (default)  |

```
- **Hardware**

	- Added support for LG gram Book 15UT50T Mobile Thin Client.
	- Added support for Lenovo 13w 2-in-1 Gen 3.
	  - Added support for F1-F11 function keys.
	    - F1: mute audio.
	    - F2/F3: increase/decrease audio.
	    - F4: mute microphone.
	    - F5/F6: decrease/increase brightness.
	    - F7: display configuration; open IGEL display configuration.
	    - F8: airplane mode.
	    - F9: open settings; open IGEL setup.
	    - F10: lock screen; screen is locked if local user password is set.
	    - F11: switch windows; cycle between open windows if 'Switch focus to next window' hotkey is enabled (by default). Otherwise, don't do anything.
	- Added support for Lenovo 500w 2-in-1 Gen 5.
	  - Added support for F1-F11 function keys.
	    - F1: mute audio.
	    - F2/F3: increase/decrease audio.
	    - F4: mute microphone.
	    - F5/F6: decrease/increase brightness.
	    - F7: display configuration; open IGEL display configuration.
	    - F8: airplane mode.
	    - F9: open settings; open IGEL setup.
	    - F10: lock screen; screen is locked if local user password is set.
	    - F11: switch windows; cycle between open windows if 'Switch focus to next window' hotkey is enabled (by default). Otherwise, don't do anything.
	- Added support for  Lenovo ThinkPad L16 Gen 2 (Intel).
	- Added special function key support for Lenovo L16 Gen2 (Intel).
	    - F1: Volume mute
	    - F2: Volume down
	    - F3: Volume up
	    - F4: Microphone mute
	    - F5: Brightness down
	    - F6: Brightness up
	    - F7: Display configuration
	    - F8: Mode (power)
	    - F9: Screenshot (+CTRL)
	    - F10: Snipping tool (+CTRL)
	    - F12: Jump to browser URL (+CTRL)
	- Added support for Lenovo ThinkPad T14 Gen 6 (AMD).
	  - Added special function key support for Lenovo T14 Gen6 (AMD).
	    - F1: Volume mute
	    - F2: Volume down
	    - F3: Volume up
	    - F4: Microphone mute
	    - F5: Brightness down
	    - F6: Brightness up
	    - F7: Display configuration
	    - F8: Mode (power)
	    - F9: Screenshot (+CTRL)
	    - F10: Snipping tool (+CTRL)
	    - F12: Jump to browser URL (+CTRL)

- **Remote Management**

	- Added new DHCP options for igelrmserver-port, igelrmserver-auth and igelrmserver-ca-hash.
	- Changed: Certificates in DER format are now also removed when they are no longer assigned via UMS.
	- Fixed: Excluding of parameters while applying remote settings.

- **App Bios Hp**

	- Updated hpuefi kernel module to version 3.25, used by HP Bios Tools App.

- **IGEL Desktop**

	- Added: Accessibility option to increase the mouse pointer size.
		- Path: IGEL Setup -> User Interface -> Accessibility -> Mouse Pointer Size

- **Mobile Broadband**

	- Added WWAN FCC unlocking support with the Quectel EM061K-GL WWAN module on the following devices: Lenovo ThinkPad T14 Gen 5 Intel/AMD, Lenovo ThinkPad L13 2-in-1 Gen 6, Lenovo ThinkPad L13 Gen 6, Lenovo ThinkPad L16 Gen 2 Intel/AMD and Lenovo ThinkPad L14 Gen 6 Intel/AMD.
	- Added WWAN FCC unlocking support for the Quectel EM160R-GL WWAN module on the following devices: Lenovo ThinkPad L14 Gen 6 Intel/AMD.
	- Added SAR configuration support for the Quectel EM061K-GL WWAN module on the following devices: Lenovo ThinkPad L13 Gen 6 Intel/AMD.

## Security Fixe>s

- Fixed webkit2gtk security issue CVE-2025-43343.
- Fixed wpewebkit security issues CVE-2025-6558, CVE-2025-43265, CVE-2025-43240, CVE-2025-43228, CVE-2025-43227, CVE-2025-43216, CVE-2025-43212, CVE-2025-43211, CVE-2025-31278, CVE-2025-31273 and CVE-2025-24189.
- Fixed libwebsockets security issues CVE-2025-11678 and CVE-2025-11677.
- Fixed openssh security issues CVE-2025-61985 and CVE-2025-61984.
- Fixed bind9 security issues CVE-2025-8677, CVE-2025-40780 and CVE-2025-40778.
- Fixed ghostscript security issues CVE-2025-7462, CVE-2025-59799 and CVE-2025-59798.
- Fixed tiff security issue CVE-2025-9900.
- Fixed xorg-server security issues CVE-2025-62231, CVE-2025-62230 and CVE-2025-62229.

## Resolved Issues

- Fixed: Sporadic panel / Start Menu crashes when logging in.
- Fixed: Issue where not all resolutions worked with HP G series devices and some HDMI monitors. (Set following registry key x.drivers.intel.use_sriov_version and reboot for the fix to take effect).
  - Added registry key to switch to newer intel GPU driver.
```

|  Parameter  |  Registry   |  Type       |  Value      |
| ------ | ------ | ------ | ------ |
|  `Switch to out of tree i915 sriov driver.`  |  `x.drivers.intel.use_sriov_version`  |  bool  |  enabled / *disabled* (default)  |

```
- **Network**

	- Removed all Wake On LAN option except for "Wake on magic packet" from IGEL Setup page `Network > LAN Interfaces > Interface % > Wake on LAN`.
	- The removed settings can still be configured via the registry:
```

| | | | | |
| ----- | ---- | ---- | ---- | ---- |
|  network.interfaces.ethernet.device%.wol.wake_arp  |  network.interfaces.ethernet.device%.wol.wake_bcast  |  network.interfaces.ethernet.device%.wol.wake_mcast  |  network.interfaces.ethernet.device%.wol.wake_phy  |  network.interfaces.ethernet.device%.wol.wake_ucast  |

```
- **WiFi**

	- Fixed WiFi support for some devices by adding missing INTEL/iwlwifi driver firmware files.
- **Smartcard**
	- Fixed OpenSC detection of certain PIV smart cards.

- **Audio**

	- Fixed double microphone entries in audio tray for Dell Optiplex 3000 hardware.
	- Updated KB article about default audio device configuration:  https://kb.igel.com/en/igel-os-base-system/current/audio-in-igel-os-12
	  - With this new parameter the last default audio device is restored after reboot:
```

|  Parameter  |  Registry   |  Type       |  Value      |
| ------ | ------ | ------ | ------ |
|  `Force default audio device after reboot`  |  `multimedia.force_default_after_reboot`  |  bool  |  enabled / *disabled* (default)  |

```
- **Remote Management**

	- Fixed: Hardware address (MAC) detection. Network interfaces without a hardware device are now excluded when determining the active MAC address.
	- Fixed removal of apps installed by UMS. The uninstall action is now invoked when no apps are assigned to the device anymore.
	- Fixed automatic triggering of reconfiguration actions. Reconfiguration is now triggered even if the "apply settings" dialog closes due to a timeout.
	- Fixed access OpenSSL trust store for user applications.
	- Fixed file transfer of files beginning with //.

- **Licensing**

	- Fixed license for hardware based audio and video codecs to remain after expiration of the subscription.

- **Mobile Broadband**

	- Fixed WWAN FCC unlocking support on Lenovo ThinkPad T14 Gen 5 (Type 21MD) laptops using the Quectel EM061K-GL WWAN module.
	- Fixed WWAN FCC unlocking support for the Quectel EM061K-GL WWAN module for the additional devices: Lenovo ThinkPad T14 Gen 5 (Intel/AMD( and Lenovo ThinkPad L13 Gen 5 (Intel).

## Known Issues

- In very rare cases all apps are lost after an update. Should this be the case, an error message is shown "Opening system App Journal failed." - if the device is manged, the apps will be reinstalled after a reboot.
- Increased writeable cache partition size (by default). First boot with 12.4.x and newer may take more time (once) when updating from a 12.2.x or older base system app.
- Automatic proxy configuration: PAC file URL does not support https scheme.
- When TPM PCR+PIN device encryption is enabled, an additional PIN entry is required the first time a new base system release is booted.

- **App Management**

	- Downgrades to versions prior to 12.7.0 are possible - despite the implemented downgrade limit - via the Local App Portal or using igelpkgctl through local terminal. In UMS-managed environments, disabling the Local App Portal is recommended to ensure version control. If the older shim bootloader signature (in 12.6.1 PR1 or earlier) is revoked and Secure Boot is enabled, the device may become unbootable. Verify boot compatibility before downgrading.

- **Chromium**

	- Downgrading base system to earlier versions may result in reset of the Chromium profile partition.

- **Network**

	- In some cases, network is not working in combination of Lenovo K14 Gen1 (AMD) and Lenovo Universal Dock. There is a kernel bugreport open but no proper fix so far.
	- Device configured as Wake on LAN proxy can be shut down by the user or admin
	- Proxy passthrough authentication together with AD auto logon does work despite of shown error message during logon.

- **WiFi**

	- WiFi chipset BE200 does not work reliable in WiFi 7 networks.

- **HID**

	- Some touchpads are recognized as touchpad and mouse. This results in showing possible user settings for both variants.

- **Setup Assistant**

	- Timezone auto-detection is currently not functional (due to discontinued location service). The timezone must be set manually (as interims / alternative solution).

- **Audio**

	- Headset mic via jack is not working on LG 27CN650 and LG 34CN650.
	- Audio devices may not be available in audio tray app. Workaround: Enable Pulseaudio backend by registry key:
```

|  Parameter  |  Registry   |  Range      |  Value      |
| ------ | ------ | ------ | ------ |
|  `Audiobackend`  |  `multimedia.audiobackend`  |  [pipewire][pulseaudio]  |  *pipewire*  |

```
	- The Audio Tray App may incorrectly display a plugged-in Audio-Jack-Headset as Built-in Audio / HDMI / DiplayPort instead of the correct headset name. Audio and Microphone functionality would still work correctly.

- **Multimedia**

	- Lenovo L13 Gen5 and L14 Gen5  Intel video codec errors (graphic glitches during accelerated video playback)

- **Hardware**

	- Wake on LAN is not functional on Lenovo K14 Gen1
	- Built-in fingerprint sensor is not supported on HP mt440 G3 and mt645 G7/G8.
	- If using 6 x 4K@60Hz monitors on HP t755/t740 with the additional graphic card, one or two of the monitors may stay black after coming back from DPMS off state.
	  This is caused by using the additional graphic card as pComponent Versions
```

-----

## 2025-10-28 - [12.7.3](https://app.igel.com/base_system/12.7.3)

```
The new BUILD 12.7.3 for IGEL Workspace is ready.

These are the release notes published with that release:

Component Versions

-------------------------------------------------------------------------------
| Components                                |                                  |
|-------------------------------------------|----------------------------------|
| MESA OpenGL Stack                         | 25.0.3-1igel1744090649           |
| VDPAU Library Version                     | 1.5-2                            |
| Graphics Driver INTEL                     | 2.99.917+git20210115-1igel1654609037     |
| Graphics Driver ATI/RADEON                | 22.0.0-1igel1704966675           |
| Graphics Driver ATI/AMDGPU                | 23.0.0-1igel1705669076           |
| Graphics Driver Nouveau (Nvidia Legacy)   | 1.0.18-1igel1739362211           |
| Graphics Driver VMware                    | 13.3.0-3igel1713934792           |
| Graphics Driver QXL (Spice)               | 0.1.6-1igel1687782644            |
| Graphics Driver FBDEV                     | 0.5.0-2igel1654609009            |
| Graphics Driver VESA                      | 2.6.0-2igel1739365508            |
| Input Driver Evdev                        | 2.11.0-1igel1738822597           |
| Input Driver Elographics                  | 1.4.3-1igel1678083379            |
| Input Driver Synaptics                    | 1.9.2-1+b1igel1683803726         |
| Input Driver VMMouse                      | 13.1.0-1ubuntu2igel1628499891    |
| Input Driver Wacom                        | 1.2.3-1igel1738566034            |
| Kernel                                    | 6.12.20 #mainline-lxos12-g1760430111     |
| Xorg X11 Server                           | 21.1.16-1.3igel1750654224        |
| Lightdm Graphical Login Manager           | 1.26.0-8igel1756470008           |
| XFCE4 Window Manager                      | 4.14.5-1~18.04igel1643191202     |
| ISC DHCP Client                           | 4.4.3-P1-2                       |
| ModemManager                              | 1.22.0-3+b2igel1731393568        |
| WebKit2Gtk                                | 2.48.7-1igel1758790938           |
| Python3                                   | 3.11.2                           |
| Virtualbox Guest Utils                    | 7.1.10-dfsg-1igel1749619644      |
| Virtualbox X11 Guest Utils                | 7.1.10-dfsg-1igel1749619644      |
| Open VM Tools                             | 12.2.0-1+deb12u3                 |
| Open VM Desktop Tools                     | 12.2.0-1+deb12u3                 |


Release Notes of installable IGEL OS 12 base system
================================================================================

# Changes since: 12.7.2

## New Features

- Added: Enabled BTF (BPF Type Format) in the kernel to provide additional type information for security software.
- Added: In Setup Assistant, users can now enter an optional structure tag before onboarding with their email address.

- **Hardware**

	- Added hardware support for Lenovo ThinkStation P3 Ultra SFF Gen2.
	- Added hardware support for LG Gram 14Z(D)90RU
	- Added special function key support for LG Gram 14Z(D)90RU:
	    - Fn+F2: Brightness down
	    - Fn+F3: Brightness up
	    - Fn+F5: Touchpadd on/off
	    - Fn+F6: Airplane mode on/off
	    - Fn+F7: Display configuration
	    - Fn+F8: Keyboard backlight
	    - Fn+F9: Reader mode
	    - Fn+F10: Volume off
	    - Fn+F11: Volume down
	    - Fn+F12: Volume up
	- Added support for newer Intel GPUs with the XE driver.
	Added registry key for XE DRM Intel driver
```

|  Parameter  |  Registry   |  Type       |  Value      |  Range      |
| ------ | ------ | ------ | ------ | ------ |
|  `Prefer XE DRM kernel driver over i915 one.`  |  `x.drivers.intel.prefer_xe`  |  bool  |  *Auto*  |  [Auto][True][False]  |
|  `Disable the loading of the xe DRM driver.`  |  `x.drivers.intel.disable_xe`  |  bool  |  enabled / *disabled* (default)  |  |

```
	- Added hardware support for Lenovo V100q

- **IGEL Desktop**

	- Added ability to lock down the file chooser to its initial startup folder. When the registry key userinterface.gtk.filechooser.lock_to_startup_folder is enabled, users can no longer browse the filesystem using the path bar or side panel buttons in the file chooser.
```

|  Parameter       |  Registry        |  Value           |
| ------ | ------ | ------ |
|  `Access only to initial folder`  |  `userinterface.gtk.filechooser.lock_to_startup_folder`  |  enabled / **disabled** (default)   |

```
- **OSCW**

	- Added support for 802.1x network settings and certificate rollout via OSCW during conversion to IGEL OS12.

## Security Fixes

- Updated Intel Microcode to version 20250812.
- Updated AMD cpu microcode to version from July 29 2025.
- Fixed udisks2 security issue CVE-2025-8067.
- Fixed ffmpeg security issues CVE-2025-22919, CVE-2025-0518, CVE-2024-35368, CVE-2024-35367, CVE-2024-31582, CVE-2023-6605, CVE-2023-6604, CVE-2023-6602, CVE-2023-50008, CVE-2023-50007 and CVE-2023-49502.
- Fixed libxml2 security issues CVE-2025-7425, CVE-2025-6170, CVE-2025-6021, CVE-2025-49796 and CVE-2025-49794.
- Fixed libxslt security issues CVE-2025-7424 and CVE-2023-40403.
- Fixed wpa security issue CVE-2022-37660.
- Fixed glibc security issue CVE-2025-8058.
- Fixed libsoup3 security issues CVE-2025-8058, CVE-2024-52531, CVE-2024-52532, CVE-2025-32051, CVE-2025-32052, CVE-2025-32053, CVE-2025-32050, CVE-2025-2784, CVE-2025-2784, CVE-2024-52531, CVE-2024-52532, CVE-2024-52531, CVE-2024-52530, CVE-2025-32909, CVE-2025-32910, CVE-2025-32911, CVE-2025-32913, CVE-2025-46420, CVE-2025-32910, CVE-2025-32912, CVE-2025-32906 and CVE-2025-46421.
- Fixed setuptools security issue CVE-2025-47273.
- Fixed libarchive security issues CVE-2025-5917, CVE-2025-5916, CVE-2025-5915 and CVE-2025-5914.
- Fixed cjson security issues CVE-2025-57052, CVE-2023-53154 and CVE-2023-26819.
- Fixed curl security issue CVE-2023-27534.
- Fixed expat security issues CVE-2024-8176, CVE-2024-50602 and CVE-2023-52425.
- Fixed iperf3 security issues CVE-2025-54350 and CVE-2025-54349.
- Fixed jq security issue CVE-2025-48060.
- Fixed openjpeg2 security issue CVE-2025-50952.
- Fixed perl security issues CVE-2025-40909 and CVE-2023-31484.
- Fixed libsndfile security issues CVE-2024-50612 and CVE-2022-33065.
- Fixed sqlite3 security issue CVE-2025-6965.
- Fixed python-zipp security issue CVE-2024-5569.
- Fixed cups security issues CVE-2025-58364 and CVE-2025-58060.
- Fixed webkit2gtk security issues CVE-2025-6558, CVE-2025-43368, CVE-2025-43356, CVE-2025-43342, CVE-2025-43272, CVE-2025-43265, CVE-2025-43240, CVE-2025-43228, CVE-2025-43227, CVE-2025-43216, CVE-2025-43212, CVE-2025-43211, CVE-2025-31278, CVE-2025-31273, CVE-2025-31257, CVE-2025-31215, CVE-2025-31206, CVE-2025-31205, CVE-2025-31204, CVE-2025-24223, CVE-2025-24189, CVE-2023-42970 and CVE-2023-42875.
- Fixed openssl security issues CVE-2025-9232 and CVE-2025-9230.
- Fixed libarchive security issues CVE-2025-5917, CVE-2025-5916, CVE-2025-5915, CVE-2025-5914, CVE-2025-1632, CVE-2024-26256 and CVE-2024-20696.

## Resolved Issues

- Fixed ghostscript font substitution of Microsoft web fonts like Arial.
- Fixed: When the system is configured as a Wake-on-LAN proxy, shutdown, reboot, or suspend operations are now properly inhibited. A warning notification is displayed to inform users that the system must remain running permanently.
- Fixed issue where "Lid close action" = "Turn off display" causes external screen to turn off only when internal screen is disabled before lid is closed
- The shortcut key combinations CTRL + ALT + Numpad (+) and CTRL + ALT + Numpad (−) are now correctly recognized within Remote Desktop sessions.
- Fixed: Damapp.
- Automatic proxy configuration: PAC file URL does not support https scheme.
- When TPM PCged filesystem after power loss.

- **WiFi**

	- Fixed connection issues with mt7925e Wi-Fi driver.

- **Shadowing/VNC**

	- Fixed mouse cursor handling with Shadowing/VNC:
	- Added `Cursor Options` parameter:
	 - Fixed-arrow: The viewer always sees a fixed arrow, regardless of the client’s cursor.
	 - Dynamic: The cursor shape changes dynamically; the viewer sees client's cursor shapes.
	 - Dynamic + Fixed-arrow: The viewer sees both, the fixed arrow and the client's cursor.
```

|  Parameter  |  Registry   |  Range      |  Value      |
| ------ | ------ | ------ | ------ |
|  `Cursor Options`  |  `network.vncserver.cursor_mode`  |  [Fixed-arrow (Default)][Dynamic][Dynamic+Fixed-arrow]  |  *Fixed-arrow (Default)*  |

```
- **Audio**

	- Fixed: Audio speaker behavior on Lenovo M75q Gen 5 (AMD) when a jack was inserted. Both devices can now be selected and are working correctly.
	- Fixed: Volume set by UMS was only applied after a reboot; it now correctly takes effect whenever a new device is connected.

- **Hardware**

	- Added registry key to encapsulate the fix for "keyboard input loss in screen lock after monitor changes, such as when adding or removing a docking station".
```

|  Registry    |  Range       |
| ------ | ------ |
|  `x.xserver0.quirks.hotplug_lockscreen`  |  [ *default* ][always][never]                        |

```
	- Fixed device type for Lenovo V100q in "About" page.

- **Remote Management**

	- Fixed CIC profiles using custom data partition.
	- Fixed exceeded string limit of the error string in the apps status disturbing the UMS communication.
	- Fixed visibility of user notifications — messages and dialogs related to remote management now appear on the lock screen.
	- Fixed app.

- Automatic proxy configuration: PAC file URL does not support https scheme.
- When TPM PC possible failure of the remote management while interacting with the IGEL apps management.

- **IGEL Desktop**

	- Fixed wrong reset of mirror mode to custom mode in display tray app.
	- Fixed: Keyboard input loss in screen lock after monitor changes, such as when adding or removing a docking station.
	- Fixed long (5 min) boot time when local Window Manager is disabled.
```

|  Parameter  |  Registry  |  Type  |  Value  |
| ------ | ------ | ------ | ------ |
|  `Local Windows Manager for this Display`  |  `windowmanager.wm0.enabled`  |  bool  |  *enabled* (default) / disabled  |

```
- **Virtualization**

	- Fixed IGEL OS running as a virtual machine on a SINA Workstation S:
		- Added detection method to identify SINA WS host from IGEL OS.
		- Removed the VBoxClient clipboard and drag&drop services.
		- Added VBoxClient vmsvga support.
	- Revised VirtualBox service detection

## Known Issues

- In very rare cases all apps are lost after an update. Should this be the case, an error message is shown "Opening system App Journal failed." - if the device is manged, the apps will be reinstalled after a reboot.
- Increased writeable cache partition size (by default). First boot with 12.4.x and newer may take more time (once) when updating from a 12.2.x or older base system app.
- Automatic proxy configuration: PAC file URL does not support https scheme.
- When TPM PCR+PIN device encryption is enabled, an additional PIN entry is required the first time a new base system release is booted.

- **App Management**

	- Downgrades to versions prior to 12.7.0 are possible - despite the implemented downgrade limit - via the Local App Portal or using igelpkgctl through local terminal. In UMS-managed environments, disabling the Local App Portal is recommended to ensure version control. If the older shim bootloader signature (in 12.6.1 PR1 or earlier) is revoked and Secure Boot is enabled, the device may become unbootable. Verify boot compatibility before downgrading.

- **Chromium**

	- Downgrading base system to earlier versions may result in reset of the Chromium profile partition.

- **Network**

	- In some cases, network is not working in combination of Lenovo K14 Gen1 (AMD) and Lenovo Universal Dock. There is a kernel bugreport open but no proper fix so far.
	- Device configured as Wake on LAN proxy can be shut down by the user or admin
	- Proxy passthrough authentication together with AD auto logon does work despite of shown error message during logon.

- **WiFi**

	- WiFi chipset BE200 does not work reliable in WiFi 7 networks.

- **HID**

	- Some touchpads are recognized as touchpad and mouse. This results in showing possible user settings for both variants.

- **Setup Assistant**

	- Timezone auto-detection is currently not functional (due to discontinued location service). The timezone must be set manually (as interims / alternative solution).

- **Audio**

	- Headset mic via jack is not working on LG 27CN650 and LG 34CN650.
	- Audio devices may not be available in audio tray app. Workaround: Enable Pulseaudio backend by registry key:
```

|  Parameter  |  Registry   |  Range      |  Value      |
| ------ | ------ | ------ | ------ |
|  `Audiobackend`  |  `multimedia.audiobackend`  |  [pipewire][pulseaudio]  |  *pipewire*  |

```
	- The Audio Tray App may incorrectly display a plugged-in Audio-Jack-Headset as Built-in Audio / HDMI / DiplayPort instead of the correct headset name. Audio and Microphone functionality would still work correctly.

- **Multimedia**

	- Lenovo L13 Gen5 and L14 Gen5  Intel video codec errors (graphic glitches during accelerated video playback)

- **Hardware**

	- Wake on LAN is not functional on Lenovo K14 Gen1
	- Built-in fingerprint sensor is not supported on HP mt440 G3 and mt645 G7/G8.
	- If using 6 x 4K@60Hz monitors on HP t755/t740 with the additional graphic card, one or two of the monitors may stay black after coming back from DPMS off state.
	  This is caused by using the additional graphic card as primary, which only has 512MB VRAM (the VRAM is not sufficient in this configuration). Possible solution: Increasing the VRAM size of the iGPU to 2048MiB in BIOS (maybe 1024MiB may also work) and activate IGEL registry key `x.drivers.swap_card0_with_card1` so the iGPU will become the Primary GPU. Connector names will be changed with that!
	- Wake up from suspend via UMS does not work on HP mt645 G7 devices. Workaround: Disable system suspend and use shutdown instead.
	- Rotation of displays connected to the Lenovo ThinkPad USB-C Hybrid Dock may fail.
	- Display configuration of displays connected to HP G5 Docking Station may fail on HP t655. Furthermore displays connected to HP G5 Docking Station may not work anymore after system suspend and resume independent from the used hardware.
	- On Lenovo ThinkPad L13 Intel Gen5, the functions keys Ctrl+Fn+F9, Ctrl+Fn+F10 and Ctrl+Fn+F11 are not mapped.
	- On Lenovo ThinkPad models equipped with AMD graphics, when connected to a USB-C Universal Dock driving multiple 4K displays via DisplayPort, system boot or reboot may result in incomplete display initialization. In these cases, one or more external displays may remain black while others function normally. Disconnecting and reconnecting the dock restores full multi-display functionality.
	- When using an HP G5 Dock, disconnecting and reconnecting the dock may cause display configurations (such as display order, resolution, and orientation) to be lost. After reconnection, displays may revert to default settings, requiring manual reconfiguration. For some devices, this issue can be mitigated by setting the registry key `x.xserver0.quirks.dp_mst_hotplug` to “Never.”

- **Dual Boot BC/DR (IGEL OS)**

	- The IGEL Dual Boot menu sometimes does not accurately reflect the presence of a UD-Pocket:
	  - If the "fast boot" BIOS option is turned on for HP devices, the state won't be updated between reboots. Turning off "fast boot" provides accurate detection.
	  - The boot loader doesn't currently detect UD Pockets on Lenovo devices. Using the Lenovo boot menu (F12) allows booting from UD Pockets directly but the "fast boot" BIOS option also interfere with the detection of USB boot devices.

- **IGEL Desktop**

	- On-screen keyboard sporadically crashes when typing.
	- If two monitors are configured in a vertical layout (one above the other), and those monitors are configured with "auto-detect" resolution, saving leads to a wrong layout order.
	- There are some UI elements that are not yet translated in all available user interface languages.
	- In very rare cases, the Start menu or panel may not be visible after boot. A reboot will restore visibility in such cases.

- **Licensing**

	- Manual deployment of add-on licenses for IGEL Agent for Imprivata licenses (via UMS) is only possible after finished installation of IGEL Agent for Imprivata app on device.
	- Endpoints that have a Starter License but no Workspace Edition license will not receive device settings or app management from UMS if add-on licenses are installed.
	Workaround: Either remove the add-on licenses or assign a valid Workspace Edition (or Workspace Edition Demo) license.

- **Mobile Broadband**

	- F11 flight mode function key does not switch off mobile broadband on HP Elite mt645 G7. (Deactivate mobile broadband in Network / Mobile Broadband settings)
```

----

## 2025-09-29 - [12.7.2](https://app.igel.com/base_system/12.7.2)

```
The new BUILD 12.7.2 for IGEL Workspace is ready.

These are the release notes published with that release:

Component Versions
```

-------------------------------------------------------------------------------

| Components                                |                                  |
|-------------------------------------------|----------------------------------|
| MESA OpenGL Stack                         | 25.0.3-1igel1744090649           |
| VDPAU Library Version                     | 1.5-2                            |
| Graphics Driver INTEL                     | 2.99.917+git20210115-1igel1654609037     |
| Graphics Driver ATI/RADEON                | 22.0.0-1igel1704966675           |
| Graphics Driver ATI/AMDGPU                | 23.0.0-1igel1705669076           |
| Graphics Driver Nouveau (Nvidia Legacy)   | 1.0.18-1igel1739362211           |
| Graphics Driver VMware                    | 13.3.0-3igel1713934792           |
| Graphics Driver QXL (Spice)               | 0.1.6-1igel1687782644            |
| Graphics Driver FBDEV                     | 0.5.0-2igel1654609009            |
| Graphics Driver VESA                      | 2.6.0-2igel1739365508            |
| Input Driver Evdev                        | 2.11.0-1igel1738822597           |
| Input Driver Elographics                  | 1.4.3-1igel1678083379            |
| Input Driver Synaptics                    | 1.9.2-1+b1igel1683803726         |
| Input Driver VMMouse                      | 13.1.0-1ubuntu2igel1628499891    |
| Input Driver Wacom                        | 1.2.3-1igel1738566034            |
| Kernel                                    | 6.12.20 #mainline-lxos12-g1750914629     |
| Xorg X11 Server                           | 21.1.16-1.3igel1750654224        |
| Lightdm Graphical Login Manager           | 1.26.0-8igel1756470008           |
| XFCE4 Window Manager                      | 4.14.5-1~18.04igel1643191202     |
| ISC DHCP Client                           | 4.4.3-P1-2                       |
| ModemManager                              | 1.22.0-3+b2igel1731393568        |
| WebKit2Gtk                                | 2.46.6-1~deb12u1igel1739436979   |
| Python3                                   | 3.11.2                           |
| Virtualbox Guest Utils                    | 7.1.10-dfsg-1igel1749619644      |
| Virtualbox X11 Guest Utils                | 7.1.10-dfsg-1igel1749619644      |
| Open VM Tools                             | 12.2.0-1+deb12u3                 |
| Open VM Desktop Tools                     | 12.2.0-1+deb12u3                 |

```

Release Notes of installable IGEL OS 12 base system
================================================================================

# Changes since: 12.7.1

## New Features

- Implemented EU directive ErP Lot 6((EU) 2023/826): Added default power-management settings and a warning about increased energy consumption.
```

|  Parameter  |  Registry   |  Range      |  Value      |
| ------ | ------ | ------ | ------ |
|  `System suspend on inactivity (battery mode)`  |  `system.power_management.system_standby.dc`  |  [After 1 min][After 2 mins][After 3 mins][After 5 mins][After 10 mins][After 15 mins][After 20 mins][After 25 mins][After 30 mins][After 45 mins][After 1 hour][After 2 hours][After 3 hours][After 4 hours][After 5 hours][After 6 hours][After 7 hours][After 8 hours][After 9 hours][After 10 hours][After 11 hours][After 12 hours][After 13 hours][After 14 hours][After 15 hours][After 16 hours][After 17 hours][After 18 hours][After 19 hours][After 20 hours][After 21 hours][After 22 hours][After 23 hours][After 24 hours][Never][Default]  |  *Default*  |
|  `System suspend/shutdown on inactivity`  |  `system.power_management.system_standby.ac`  |  [After 1 min][After 2 mins][After 3 mins][After 5 mins][After 10 mins][After 15 mins][After 20 mins][After 25 mins][After 30 mins][After 45 mins][After 1 hour][After 2 hours][After 3 hours][After 4 hours][After 5 hours][After 6 hours][After 7 hours][After 8 hours][After 9 hours][After 10 hours][After 11 hours][After 12 hours][After 13 hours][After 14 hours][After 15 hours][After 16 hours][After 17 hours][After 18 hours][After 19 hours][After 20 hours][After 21 hours][After 22 hours][After 23 hours][After 24 hours][Never][Default]  |  *Default*  |

```
- For new installations and factory preloads, “Default” sets suspend/shutdown to 20 minutes of inactivity.
	 - Added a warning about increased energy consumption if system.power_management.system_standby.ac is not between 1 minute and 20 minutes.

- **Network**

	- Added support for permanently storing 802.1X authentication usernames and passwords in the IGEL keyring when credentials are left empty in Setup.
```

|  Parameter  |  Registry   |  Range      |  Value      |
| ------ | ------ | ------ | ------ |
|  `Allow Saving Credentials`  |  `network.interfaces.ethernet.device%.ieee8021x.allow_saving_credentials`  |  [never][permanent]  |  *never*  |
|  `Allow Saving Credentials`  |  `network.interfaces.wirelesslan.device0.alt_ssid%.wpa.allow_saving_credentials`  |  [never][permanent]  |  *never*  |

```

- **Multimedia**

	- Added FFMPEG-based multimedia codecs, replacing the previous ones with no change in functionality.
	- Added GStreamer tools:
	  - gst-play-1.0
	  - gst-discoverer-1.0

- **Remote Management**

	- Added support for the `UMS-as-CA-Proxy` feature enabling TLS certificate enrollment via UMS from an external CA instance. Certificates are configured in the IGEL Setup at `Security > Certificates`.
```

|  Parameter   |  Registry    |  Type        |  Value       |  Parameter  |  Registry  |  Type  |  Value  |
| ------ | ------ | ------ | ------ | ------ | ------ | ------ | ------ |
|  `Friendly Name`        |  `system.security.certs.cert%.friendly_name`              |  string                            |  *`Device certificate`*  |  `Show notifications to the user`  |  `system.security.certs.show_user_notifications`  |  bool  |  true  |

```
	- Added new DHCP options for igelrmserver-port, igelrmserver-auth and igelrmserver-ca-hash.
	- Added a parameter for dumping of settings data into the debugging protocol dump.
```

|  Parameter       |  Registry        |  Value           |
| ------ | ------ | ------ |
|  `include vlist in protocol dump`  |  `debug.remotemanager.dump_vlist`                  |  enabled / **disabled** (default)    |

```
	- Added a downgrade lock of the base_system to a version older than 12.7.2 if the device lacks a valid Workspace Edition license.
- **Dual Boot BC/DR (IGEL OS)**
	- Added initial IGEL OS Dual Boot support, for BC/DR use cases.

- **IGEL Desktop**

	- Added tray icon support for OpenConnect VPN App.
	- Added support for display profiles. Different configurations of a monitor are stored / retrieved when used in different environments.

## Security Fixes

- Fixed atop security issue CVE-2025-31160.
- Fixed shadow security issues CVE-2023-4641 and CVE-2023-29383.
- Fixed open-vm-tools security issue CVE-2025-22247.
- Fixed systemd security issue CVE-2025-4598.
- Fixed network-manager security issue CVE-2024-6501.
- Fixed virtualbox security issues CVE-2025-30725, CVE-2025-30719, CVE-2025-30712, CVE-2025-21571, CVE-2025-21533, CVE-2024-21273, CVE-2024-21263, CVE-2024-21259, CVE-2024-21253 and CVE-2024-21248.
- Fixed openssh security issue CVE-2025-32728.
- Fixed openvpn security issue CVE-2025-2704.
- Fixed xorg-server security issues CVE-2025-49180, CVE-2025-49179, CVE-2025-49178, CVE-2025-49177, CVE-2025-49176, CVE-2025-49175 and CVE-2022-49737.
- Fixed gdk-pixbuf security issue CVE-2025-6199.
- Fixed gcc-12 security issue CVE-2023-4039.
- Fixed abseil security issue CVE-2025-0838.
- Fixed libavif security issues CVE-2025-48175 and CVE-2025-48174.
- Fixed libblockdev security issue CVE-2025-6019.
- Fixed libcap2 security issue CVE-2025-1390.
- Fixed ghostscript security issues CVE-2025-27836, CVE-2025-27835, CVE-2025-27834, CVE-2025-27833, CVE-2025-27832, CVE-2025-27831 and CVE-2025-27830.
- Fixed xz-utils security issue CVE-2025-31115.
- Fixed perl security issue CVE-2024-56406.
- Fixed poppler security issues CVE-2025-32365, CVE-2025-32364, CVE-2024-56378 and CVE-2023-34872.
- Fixed python3.11 security issues CVE-2025-1795 and CVE-2025-0938.
- Fixed openssl security issue CVE-2024-13176.
- Fixed libxslt security issues CVE-2025-24855 and CVE-2024-55549.
- Fixed net-tools security issue CVE-2025-46836.
- Fixed icu security issue CVE-2025-5222.
- Fixed libxml2 security issues CVE-2025-32415, CVE-2025-32414, CVE-2025-27113, CVE-2025-24928, CVE-2024-56171, CVE-2024-34459, CVE-2024-25062, CVE-2023-45322, CVE-2023-39615 and CVE-2022-49043.
- Fixed qtbase-opensource-src security issue CVE-2025-5455.
- Fixed jpeg-xl security issues CVE-2024-11498, CVE-2024-11403, CVE-2023-35790 and CVE-2023-0645.
- Fixed gst-plugins-bad1.0 security issue CVE-2025-6663.
- Fixed lock screen behavior that exposed the desktop during display/resolution changes and system events (shutdown, reboot, suspend, logoff) when initiated from the lock screen.

## Resolved Issues

- Improved mouse acceleration configuration
```

|  Parameter  |  Registry   |  Type       |  Value      |
| ------ | ------ | ------ | ------ |
|  `Enable mouse acceleration (only for new accel variant)`  |  `userinterface.mouse.enable_acceleration`  |  bool  |  *enabled* (default) / disabled  |
|  `Use new mouse accel variant`  |  `userinterface.mouse.use_new_accel_variant`  |  bool  |  enabled / *disabled* (default)  |

```
- Fixed an issue where users were unnecessarily prompted to enter a device encryption password.
- Fixed an issue where monitor changes, such as when adding or removing a docking station, could cause keyboard input to be lost in screen lock.
- Fixed focus behavior on the user field when AD login is configured. If the password is entered first while the user field is empty, pressing Enter now correctly shifts focus to the user field instead of starting the authentication process.
- Re-enabled log rotation

- **Smartcard**

	- Fixed memory leak in smartcard resource manager pcsc-lite.
	- Fixed handling of smartcard reader state changes in smartcard resource manager pcsc-lite.
	-Fixed smartcard reader detection in some cases.
	- Fixed smartcard redirection in IGEL Azure Virtual Desktop, IGEL Windows 365, IGEL Remote Desktop and IGEL Remote Desktop Web Access applications.

- **Audio**

	- Fixed headphone support on LG CL600 devices when a DisplayPort monitor with speakers is connected.

- **Hardware**

	- The DisplayPort Multistream (DP MST) hotplug quirk can now be disabled by the registry setting `x.xserver%.quirks.dp_mst_hotplug`
	  - Changed the default value of the registry setting, "default" is the same as "always" unless the quirk is not supported by the hardware.
```

|  Parameter  |  Registry   |  Range      |  Value      |
| ------ | ------ | ------ | ------ |
|  `Quirk to improve DP MST hotplug behaviour.`  |  `x.xserver%.quirks.dp_mst_hotplug`  |  [default][always][never]  |  *default*  |

```
	- Added optional workarounds to the DisplayPort Multistream (DP MST) hotplug quirk.
	  - These workarounds fix issues with black screens after hotplugging a display from a docking station.
	  - They can be enabled by the registry setting "x.xserver%.quirks.screen_stay_black"
	- Fixed missing WiFi firmware for HP EliteBook 6 G1i 16 and Dell Pro 16 Plus notebooks.

- **Remote Management**

	- Fixed license term handling so that the last day is now correctly included.
	- Fixed unreliability while applying remote settings.
	- Fixed aborting of a local command in case of disconnect from the UMS.
	- Fixed transferring of PKCS12 files as a "Common Certificate" or "SSL Certificate" file type.
	- Fixed UMS connection handling to be more robust when igelrmserver DNS entry is pointing to an incorrect UMS server.
	- Fixed an issue where the start button filename for CI customization could not contain spaces.
	- Fixed sync of locally made changes while registering in the UMS.
	- Fixed a sporadic unexpected stop of the remote management service during VM installation via the IGEL Managed Hypervisor App.

- **IGEL Desktop**

	- Fixed an issue where the IGEL Application Launcher and About window had a 5-second delay when the Avahi daemon (a CUPS prerequisite) was installed. The windows now load instantly.
	- Fixed display mirror group handling in the IGEL system tray.

## Known Issues

- In very rare cases all apps are lost after an update. Should this be the case, an error message is shown "Opening system App Journal failed." - if the device is manged, the apps will be reinstalled after a reboot.
- Increased writeable cache partition size (by default). First boot with 12.4.x and newer may take more time (once) when updating from a 12.2.x or older base system app.
- Automatic proxy configuration: PAC file URL does not support https scheme.
- When TPM PCR+PIN device encryption is enabled, an additional PIN entry is required the first time a new base system release is booted.
- **App Management**
	- Downgrades to versions prior to 12.7.0 are possible - despite the implemented downgrade limit - via the Local App Portal or using igelpkgctl through local terminal. In UMS-managed environments, disabling the Local App Portal is recommended to ensure version control. If the older shim bootloader signature (in 12.6.1 PR1 or earlier) is revoked and Secure Boot is enabled, the device may become unbootable. Verify boot compatibility before downgrading.

- **Chromium**

	- Downgrading base system to earlier versions may result in reset of the Chromium profile partition.

- **Network**

	- In some cases, network is not working in combination of Lenovo K14 Gen1 (AMD) and Lenovo Universal Dock. There is a kernel bugreport open but no proper fix so far.
	- Device configured as Wake on LAN proxy can be shut down by the user or admin
	- Proxy passthrough authentication together with AD auto logon does work despite of shown error message during logon.

- **WiFi**

	- WiFi chipset BE200 does not work reliable in WiFi 7 networks.

- **HID**

	- Some touchpads are recognized as touchpad and mouse. This results in showing possible user settings for both variants.
- **Setup Assistant**
	- Timezone auto-detection is currently not functional (due to discontinued location service). The timezone must be set manually (as interims / alternative solution).

- **Audio**

	- Headset mic via jack is not working on LG 27CN650 and LG 34CN650.
	- Audio devices may not be available in audio tray app. Workaround: Enable Pulseaudio backend by registry key:
```

|  Parameter  |  Registry   |  Range      |  Value      |
| ------ | ------ | ------ | ------ |
|  `Audiobackend`  |  `multimedia.audiobackend`  |  [pipewire][pulseaudio]  |  *pipewire*  |

```
	- The Audio Tray App may incorrectly display a plugged-in Audio-Jack-Headset as Built-in Audio / HDMI / DiplayPort instead of the correct headset name. Audio and Microphone functionality would still work correctly.

- **Multimedia**

	- Lenovo L13 Gen5 and L14 Gen5  Intel video codec errors (graphic glitches during accelerated video playback)

- **Hardware**

	- Wake on LAN is not functional on Lenovo K14 Gen1
	- Built-in fingerprint sensor is not supported on HP mt440 G3 and mt645 G7/G8.
	- If using 6 x 4K@60Hz monitors on HP t755/t740 with the additional graphic card, one or two of the monitors may stay black after coming back from DPMS off state.
	  This is caused by using the additional graphic card as primary, which only has 512MB VRAM (the VRAM is not sufficient in this configuration). Possible solution: Increasing the VRAM size of the iGPU to 2048MiB in BIOS (maybe 1024MiB may also work) and activate IGEL registry key `x.drivers.swap_card0_with_card1` so the iGPU will become the Primary GPU. Connector names will be changed with that!
	- Wake up from suspend via UMS does not work on HP mt645 G7 devices. Workaround: Disable system suspend and use shutdown instead.
	- Rotation of displays connected to the Lenovo ThinkPad USB-C Hybrid Dock may fail.
	- Display configuration of displays connected to HP G5 Docking Station may fail on HP t655. Furthermore displays connected to HP G5 Docking Station may not work anymore after system suspend and resume independent from the used hardware.
	- On Lenovo ThinkPad L13 Intel Gen5, the functions keys Ctrl+Fn+F9, Ctrl+Fn+F10 and Ctrl+Fn+F11 are not mapped.

- **Dual Boot BC/DR (IGEL OS)**

	- The IGEL Dual Boot menu sometimes does not accurately reflect the presence of a UD-Pocket:
	  - If the "fast boot" BIOS option is turned on for HP devices, the state won't be updated between reboots. Turning off "fast boot" provides accurate detection.
	  - The boot loader doesn't currently detect UD Pockets on Lenovo devices. Using the Lenovo boot menu (F12) allows booting from UD Pockets directly but the "fast boot" BIOS option also interfere with the detection of USB boot devices.

- **IGEL Desktop**

	- On-screen keyboard sporadically crashes when typing.
	- If two monitors are configured in a vertical layout (one above the other), and those monitors are configured with "auto-detect" resolution, saving leads to a wrong layout order.
	- There are some UI elements that are not yet translated in all available user interface languages.
	- In very rare cases, the Start menu or panel may not be visible after boot. A reboot will restore visibility in such cases.

- **Licensing**

	- Manual deployment of add-on licenses for IGEL Agent for Imprivata licenses (via UMS) is only possible after finished installation of IGEL Agent for Imprivata app on device.
	- Endpoints that have a Starter License but no Workspace Edition license will not receive device settings or app management from UMS if add-on licenses are installed.
	Workaround: Either remove the add-on licenses or assign a valid Workspace Edition (or Workspace Edition Demo) license.

- **Mobile Broadband**

	- F11 flight mode function key does not switch off mobile broadband on HP Elite mt645 G7. (Deactivate mobile broadband in Network / Mobile Broadband settings)
```

----

## 2025-07-29 - [12.7.1+1](https://app.igel.com/base_system/12.7.1+1)

```
The new BUILD 12.7.1+1 for IGEL Workspace is ready.

These are the release notes published with that release:

Component Versions
```

-------------------------------------------------------------------------------

| Components                                |                                  |
|-------------------------------------------|----------------------------------|
| MESA OpenGL Stack                         | 25.0.3-1igel1744090649           |
| VDPAU Library Version                     | 1.5-2                            |
| Graphics Driver INTEL                     | 2.99.917+git20210115-1igel1654609037     |
| Graphics Driver ATI/RADEON                | 22.0.0-1igel1704966675           |
| Graphics Driver ATI/AMDGPU                | 23.0.0-1igel1705669076           |
| Graphics Driver Nouveau (Nvidia Legacy)   | 1.0.18-1igel1739362211           |
| Graphics Driver VMware                    | 13.3.0-3igel1713934792           |
| Graphics Driver QXL (Spice)               | 0.1.6-1igel1687782644            |
| Graphics Driver FBDEV                     | 0.5.0-2igel1654609009            |
| Graphics Driver VESA                      | 2.6.0-2igel1739365508            |
| Input Driver Evdev                        | 2.11.0-1igel1738822597           |
| Input Driver Elographics                  | 1.4.3-1igel1678083379            |
| Input Driver Synaptics                    | 1.9.2-1+b1igel1683803726         |
| Input Driver VMMouse                      | 13.1.0-1ubuntu2igel1628499891    |
| Input Driver Wacom                        | 1.2.3-1igel1738566034            |
| Kernel                                    | 6.12.20 #mainline-lxos12-g1746535138     |
| Xorg X11 Server                           | 21.1.16-1igel1740721542          |
| Lightdm Graphical Login Manager           | 1.26.0-8igel1716879255           |
| XFCE4 Window Manager                      | 4.14.5-1~18.04igel1643191202     |
| ISC DHCP Client                           | 4.4.3-P1-2                       |
| ModemManager                              | 1.22.0-3+b2igel1731393568        |
| WebKit2Gtk                                | 2.46.6-1~deb12u1igel1739436979   |
| Python3                                   | 3.11.2                           |
| Virtualbox Guest Utils                    | 7.0.20-dfsg-1+b1igel1730700800   |
| Virtualbox X11 Guest Utils                | 7.0.20-dfsg-1+b1igel1730700800   |
| Open VM Tools                             | 12.2.0-1+deb12u2                 |
| Open VM Desktop Tools                     | 12.2.0-1+deb12u2                 |

```
Release Notes of installable IGEL OS 12 base system
================================================================================

# Changes since: 12.7.1

## Resolved Issues

- **Remote Management**
	- Improved detection of IGEL Managed Hypervisor in UMS.
	- Removed unsupported UMS functions related to IGEL Managed Hypervisor: wipe and re-image

## Known Issues

- In very rare cases all apps are lost afteros 12.7.2 an update. Should this be the case, an error message is shown "Opening system App Journal failed." - if the device is manged, the apps will be reinstalled after a reboot.
- Increased writeable cache partition size (by default). First boot with 12.4.x and newer may take more time (once) when updating from a 12.2.x or older base system app.
- Automatic proxy configuration: PAC file URL does not support https scheme.
- When TPM PCR+PIN device encryption is enabled, an additional PIN entry is required the first time a new base system release is booted.

- **App Management**

	- Downgrades to versions prior to 12.7.0 are possible - despite the implemented downgrade limit - via the Local App Portal or using igelpkgctl through local terminal. In UMS-managed environments, disabling the Local App Portal is recommended to ensure version control. If the older shim bootloader signature (in 12.6.1 PR1 or earlier) is revoked and Secure Boot is enabled, the device may become unbootable. Verify boot compatibility before downgrading.

- **Chromium**

	- Downgrading base system to earlier versions may result in reset of the Chromium profile partition.

- **Network**

	- In some cases, network is not working in combination of Lenovo K14 Gen1 (AMD) and Lenovo Universal Dock. There is a kernel bugreport open but no proper fix so far.
	- Device configured as Wake on LAN proxy can be shut down by the user or admin
	- Proxy passthrough authentication together with AD auto logon does work despite of shown error message during logon.

- **WiFi**

	- WiFi chipset BE200 does not work reliable in WiFi 7 networks.

- **HID**

	- Some touchpads are recognized as touchpad and mouse. This results in showing possible user settings for both variants.

- **Setup Assistant**

	- Timezone auto-detection is currently not functional (due to discontinued location service). The timezone must be set manually (as interims / alternative solution).

- **Audio**

	- Headset mic via jack is not working on LG 27CN650 and LG 34CN650.
	- Audio devices may not be available in audio tray app. Workaround: Enable Pulseaudio backend by registry key:
```

|  Parameter  |  Registry   |  Range      |  Value      |
| ------ | ------ | ------ | ------ |
|  `Audiobackend`  |  `multimedia.audiobackend`  |  [pipewire][pulseaudio]  |  *pipewire*  |

```
- **Multimedia**

	- Lenovo L13 Gen5 and L14 Gen5  Intel video codec errors (graphic glitches during accelerated video playback)

- **Hardware**

	- Wake on LAN is not functional on Lenovo K14 Gen1
	- Built-in fingerprint sensor is not supported on HP mt440 G3 and mt645 G7/G8.
	- If using 6 x 4K@60Hz monitors on HP t755/t740 with the additional graphic card, one or two of the monitors may stay black after coming back from DPMS off state.
	  This is caused by using the additional graphic card as primary, which only has 512MB VRAM (the VRAM is not sufficient in this configuration). Possible solution: Increasing the VRAM size of the iGPU to 2048MiB in BIOS (ma-------------------------------------------------------------------------------

| Components                                |                                  |
|-------------------------------------------|----------------------------------|
| MESA OpenGL Stack                         | 25.0.3-1igel1744090649           |
| VDPAU Library Version                     | 1.5-2                            |
| Graphics Driver INTEL                     | 2.99.917+git20210115-1igel1654609037     |
| Graphics Driver ATI/RADEON                | 22.0.0-1igel1704966675           |
| Graphics Driver ATI/AMDGPU                | 23.0.0-1igel1705669076           |
| Graphics Driver Nouveau (Nvidia Legacy)   | 1.0.18-1igel1739362211           |
| Graphics Driver VMware                    | 13.3.0-3igel1713934792           |
| Graphics Driver QXL (Spice)               | 0.1.6-1igel1687782644            |
| Graphics Driver FBDEV                     | 0.5.0-2igel1654609009            |
| Graphics Driver VESA                      | 2.6.0-2igel1739365508            |
| Input Driver Evdev                        | 2.11.0-1igel1738822597           |
| Input Driver Elographics                  | 1.4.3-1igel1678083379            |
| Input Driver Synaptics                    | 1.9.2-1+b1igel1683803726         |
| Input Driver VMMouse                      | 13.1.0-1ubuntu2igel1628499891    |
| Input Driver Wacom                        | 1.2.3-1igel1738566034            |
| Kernel                                    | 6.12.20 #mainline-lxos12-g1750914629     |
| Xorg X11 Server                           | 21.1.16-1.3igel1750654224        |
| Lightdm Graphical Login Manager           | 1.26.0-8igel1756470008           |
| XFCE4 Window Manager                      | 4.14.5-1~18.04igel1643191202     |
| ISC DHCP Client                           | 4.4.3-P1-2                       |
| ModemManager                              | 1.22.0-3+b2igel1731393568        |
| WebKit2Gtk                                | 2.46.6-1~deb12u1igel1739436979   |
| Python3                                   | 3.11.2                           |
| Virtualbox Guest Utils                    | 7.1.10-dfsg-1igel1749619644      |
| Virtualbox X11 Guest Utils                | 7.1.10-dfsg-1igel1749619644      |
| Open VM Tools                             | 12.2.0-1+deb12u3                 |
| Open VM Desktop Tools                     | 12.2.0-1+deb12u3                 |


Release Notes of installable IGEL OS 12 base system
================================================================================

# Changes since: 12.7.1

## New Features
- Implemented EU directive ErP Lot 6((EU) 2023/826): Added default power-management settings and a warning about increased energy consumption.
	|  Parameter  |  Registry   |  Range      |  Value      |
	| ------ | ------ | ------ | ------ |
	|  `System suspend on inactivity (battery mode)`  |  `system.power_management.system_standby.dc`  |  [After 1 min][After 2 mins][After 3 mins][After 5 mins][After 10 mins][After 15 mins][After 20 mins][After 25 mins][After 30 mins][After 45 mins][After 1 hour][After 2 hours][After 3 hours][After 4 hours][After 5 hours][After 6 hours][After 7 hours][After 8 hours][After 9 hours][After 10 hours][After 11 hours][After 12 hours][After 13 hours][After 14 hours][After 15 hours][After 16 hours][After 17 hours][After 18 hours][After 19 hours][After 20 hours][After 21 hours][After 22 hours][After 23 hours][After 24 hours][Never][Default]  |  *Default*  |
	|  `System suspend/shutdown on inactivity`  |  `system.power_management.system_standby.ac`  |  [After 1 min][After 2 mins][After 3 mins][After 5 mins][After 10 mins][After 15 mins][After 20 mins][After 25 mins][After 30 mins][After 45 mins][After 1 hour][After 2 hours][After 3 hours][After 4 hours][After 5 hours][After 6 hours][After 7 hours][After 8 hours][After 9 hours][After 10 hours][After 11 hours][After 12 hours][After 13 hours][After 14 hours][After 15 hours][After 16 hours][After 17 hours][After 18 hours][After 19 hours][After 20 hours][After 21 hours][After 22 hours][After 23 hours][After 24 hours][Never][Default]  |  *Default*  |
	 - For new installations and factory preloads, “Default” sets suspend/shutdown to 20 minutes of inactivity.
	 - Added a warning about increased energy consumption if system.power_management.system_standby.ac is not between 1 minute and 20 minutes.
- **Network**
	- Added support for permanently storing 802.1X authentication usernames and passwords in the IGEL keyring when credentials are left empty in Setup.
		|  Parameter  |  Registry   |  Range      |  Value      |
		| ------ | ------ | ------ | ------ |
		|  `Allow Saving Credentials`  |  `network.interfaces.ethernet.device%.ieee8021x.allow_saving_credentials`  |  [never][permanent]  |  *never*  |
		|  `Allow Saving Credentials`  |  `network.interfaces.wirelesslan.device0.alt_ssid%.wpa.allow_saving_credentials`  |  [never][permanent]  |  *never*  |
- **Multimedia**
	- Added FFMPEG-based multimedia codecs, replacing the previous ones with no change in functionality.
	- Added GStreamer tools:
	  - gst-play-1.0
	  - gst-discoverer-1.0
- **Remote Management**
	- Added support for the `UMS-as-CA-Proxy` feature enabling TLS certificate enrollment via UMS from an external CA instance. Certificates are configured in the IGEL Setup at `Security > Certificates`.
		|  Parameter   |  Registry    |  Type        |  Value       |  Parameter  |  Registry  |  Type  |  Value  |
		| ------ | ------ | ------ | ------ | ------ | ------ | ------ | ------ |
		|  `Friendly Name`        |  `system.security.certs.cert%.friendly_name`              |  string                            |  *`Device certificate`*  |  `Show notifications to the user`  |  `system.security.certs.show_user_notifications`  |  bool  |  true  |
	- Added new DHCP options for igelrmserver-port, igelrmserver-auth and igelrmserver-ca-hash.
	- Added a parameter for dumping of settings data into the debugging protocol dump.
		|  Parameter       |  Registry        |  Value           |
		| ------ | ------ | ------ |
		|  `include vlist in protocol dump`  |  `debug.remotemanager.dump_vlist`                  |  enabled / **disabled** (default)    |
	- Added a downgrade lock of the base_system to a version older than 12.7.2 if the device lacks a valid Workspace Edition license.
- **Dual Boot BC/DR (IGEL OS)**
	- Added initial IGEL OS Dual Boot support, for BC/DR use cases.
- **IGEL Desktop**
	- Added tray icon support for OpenConnect VPN App.
	- Added support for display profiles. Different configurations of a monitor are stored / retrieved when used in different environments.

## Security Fixes
- Fixed atop security issue CVE-2025-31160.
- Fixed shadow security issues CVE-2023-4641 and CVE-2023-29383.
- Fixed open-vm-tools security issue CVE-2025-22247.
- Fixed systemd security issue CVE-2025-4598.
- Fixed network-manager security issue CVE-2024-6501.
- Fixed virtualbox security issues CVE-2025-30725, CVE-2025-30719, CVE-2025-30712, CVE-2025-21571, CVE-2025-21533, CVE-2024-21273, CVE-2024-21263, CVE-2024-21259, CVE-2024-21253 and CVE-2024-21248.
- Fixed openssh security issue CVE-2025-32728.
- Fixed openvpn security issue CVE-2025-2704.
- Fixed xorg-server security issues CVE-2025-49180, CVE-2025-49179, CVE-2025-49178, CVE-2025-49177, CVE-2025-49176, CVE-2025-49175 and CVE-2022-49737.
- Fixed gdk-pixbuf security issue CVE-2025-6199.
- Fixed gcc-12 security issue CVE-2023-4039.
- Fixed abseil security issue CVE-2025-0838.
- Fixed libavif security issues CVE-2025-48175 and CVE-2025-48174.
- Fixed libblockdev security issue CVE-2025-6019.
- Fixed libcap2 security issue CVE-2025-1390.
- Fixed ghostscript security issues CVE-2025-27836, CVE-2025-27835, CVE-2025-27834, CVE-2025-27833, CVE-2025-27832, CVE-2025-27831 and CVE-2025-27830.
- Fixed xz-utils security issue CVE-2025-31115.
- Fixed perl security issue CVE-2024-56406.
- Fixed poppler security issues CVE-2025-32365, CVE-2025-32364, CVE-2024-56378 and CVE-2023-34872.
- Fixed python3.11 security issues CVE-2025-1795 and CVE-2025-0938.
- Fixed openssl security issue CVE-2024-13176.
- Fixed libxslt security issues CVE-2025-24855 and CVE-2024-55549.
- Fixed net-tools security issue CVE-2025-46836.
- Fixed icu security issue CVE-2025-5222.
- Fixed libxml2 security issues CVE-2025-32415, CVE-2025-32414, CVE-2025-27113, CVE-2025-24928, CVE-2024-56171, CVE-2024-34459, CVE-2024-25062, CVE-2023-45322, CVE-2023-39615 and CVE-2022-49043.
- Fixed qtbase-opensource-src security issue CVE-2025-5455.
- Fixed jpeg-xl security issues CVE-2024-11498, CVE-2024-11403, CVE-2023-35790 and CVE-2023-0645.
- Fixed gst-plugins-bad1.0 security issue CVE-2025-6663.
- Fixed lock screen behavior that exposed the desktop during display/resolution changes and system events (shutdown, reboot, suspend, logoff) when initiated from the lock screen.

## Resolved Issues
- Improved mouse acceleration configuration
	|  Parameter  |  Registry   |  Type       |  Value      |
	| ------ | ------ | ------ | ------ |
	|  `Enable mouse acceleration (only for new accel variant)`  |  `userinterface.mouse.enable_acceleration`  |  bool  |  *enabled* (default) / disabled  |
	|  `Use new mouse accel variant`  |  `userinterface.mouse.use_new_accel_variant`  |  bool  |  enabled / *disabled* (default)  |
- Fixed an issue where users were unnecessarily prompted to enter a device encryption password.
- Fixed an issue where monitor changes, such as when adding or removing a docking station, could cause keyboard input to be lost in screen lock.
- Fixed focus behavior on the user field when AD login is configured. If the password is entered first while the user field is empty, pressing Enter now correctly shifts focus to the user field instead of starting the authentication process.
- Re-enabled log rotation
- **Smartcard**
	- Fixed memory leak in smartcard resource manager pcsc-lite.
	- Fixed handling of smartcard reader state changes in smartcard resource manager pcsc-lite.
	-Fixed smartcard reader detection in some cases.
	- Fixed smartcard redirection in IGEL Azure Virtual Desktop, IGEL Windows 365, IGEL Remote Desktop and IGEL Remote Desktop Web Access applications.
- **Audio**
	- Fixed headphone support on LG CL600 devices when a DisplayPort monitor with speakers is connected.
- **Hardware**
	- The DisplayPort Multistream (DP MST) hotplug quirk can now be disabled by the registry setting `x.xserver%.quirks.dp_mst_hotplug`
	  - Changed the default value of the registry setting, "default" is the same as "always" unless the quirk is not supported by the hardware.
		|  Parameter  |  Registry   |  Range      |  Value      |
		| ------ | ------ | ------ | ------ |
		|  `Quirk to improve DP MST hotplug behaviour.`  |  `x.xserver%.quirks.dp_mst_hotplug`  |  [default][always][never]  |  *default*  |
	- Added optional workarounds to the DisplayPort Multistream (DP MST) hotplug quirk.
	  - These workarounds fix issues with black screens after hotplugging a display from a docking station.
	  - They can be enabled by the registry setting "x.xserver%.quirks.screen_stay_black"
	- Fixed missing WiFi firmware for HP EliteBook 6 G1i 16 and Dell Pro 16 Plus notebooks.
- **Remote Management**
	- Fixed license term handling so that the last day is now correctly included.
	- Fixed unreliability while applying remote settings.
	- Fixed aborting of a local command in case of disconnect from the UMS.
	- Fixed transferring of PKCS12 files as a "Common Certificate" or "SSL Certificate" file type.
	- Fixed UMS connection handling to be more robust when igelrmserver DNS entry is pointing to an incorrect UMS server.
	- Fixed an issue where the start button filename for CI customization could not contain spaces.
	- Fixed sync of locally made changes while registering in the UMS.
	- Fixed a sporadic unexpected stop of the remote management service during VM installation via the IGEL Managed Hypervisor App.
- **IGEL Desktop**
	- Fixed an issue where the IGEL Application Launcher and About window had a 5-second delay when the Avahi daemon (a CUPS prerequisite) was installed. The windows now load instantly.
	- Fixed display mirror group handling in the IGEL system tray.

## Known Issues
- In very rare cases all apps are lost after an update. Should this be the case, an error message is shown "Opening system App Journal failed." - if the device is manged, the apps will be reinstalled after a reboot.
- Increased writeable cache partition size (by default). First boot with 12.4.x and newer may take more time (once) when updating from a 12.2.x or older base system app.
- Automatic proxy configuration: PAC file URL does not support https scheme.
- When TPM PCR+PIN device encryption is enabled, an additional PIN entry is required the first time a new base system release is booted.
- **App Management**
	- Downgrades to versions prior to 12.7.0 are possible - despite the implemented downgrade limit - via the Local App Portal or using igelpkgctl through local terminal. In UMS-managed environments, disabling the Local App Portal is recommended to ensure version control. If the older shim bootloader signature (in 12.6.1 PR1 or earlier) is revoked and Secure Boot is enabled, the device may become unbootable. Verify boot compatibility before downgrading.
- **Chromium**
	- Downgrading base system to earlier versions may result in reset of the Chromium profile partition.
- **Network**
	- In some cases, network is not working in combination of Lenovo K14 Gen1 (AMD) and Lenovo Universal Dock. There is a kernel bugreport open but no proper fix so far.
	- Device configured as Wake on LAN proxy can be shut down by the user or admin
	- Proxy passthrough authentication together with AD auto logon does work despite of shown error message during logon.
- **WiFi**
	- WiFi chipset BE200 does not work reliable in WiFi 7 networks.
- **HID**
	- Some touchpads are recognized as touchpad and mouse. This results in showing possible user settings for both variants.
- **Setup Assistant**
	- Timezone auto-detection is currently not functional (due to discontinued location service). The timezone must be set manually (as interims / alternative solution).
- **Audio**
	- Headset mic via jack is not working on LG 27CN650 and LG 34CN650.
	- Audio devices may not be available in audio tray app. Workaround: Enable Pulseaudio backend by registry key:
		|  Parameter  |  Registry   |  Range      |  Value      |
		| ------ | ------ | ------ | ------ |
		|  `Audiobackend`  |  `multimedia.audiobackend`  |  [pipewire][pulseaudio]  |  *pipewire*  |
	- The Audio Tray App may incorrectly display a plugged-in Audio-Jack-Headset as Built-in Audio / HDMI / DiplayPort instead of the correct headset name. Audio and Microphone functionality would still work correctly.
- **Multimedia**
	- Lenovo L13 Gen5 and L14 Gen5  Intel video codec errors (graphic glitches during accelerated video playback)
- **Hardware**
	- Wake on LAN is not functional on Lenovo K14 Gen1
	- Built-in fingerprint sensor is not supported on HP mt440 G3 and mt645 G7/G8.
	- If using 6 x 4K@60Hz monitors on HP t755/t740 with the additional graphic card, one or two of the monitors may stay black after coming back from DPMS off state.
	  This is caused by using the additional graphic card as primary, which only has 512MB VRAM (the VRAM is not sufficient in this configuration). Possible solution: Increasing the VRAM size of the iGPU to 2048MiB in BIOS (maybe 1024MiB may also work) and activate IGEL registry key `x.drivers.swap_card0_with_card1` so the iGPU will become the Primary GPU. Connector names will be changed with that!
	- Wake up from suspend via UMS does not work on HP mt645 G7 devices. Workaround: Disable system suspend and use shutdown instead.
	- Rotation of displays connected to the Lenovo ThinkPad USB-C Hybrid Dock may fail.
	- Display configuration of displays connected to HP G5 Docking Station may fail on HP t655. Furthermore displays connected to HP G5 Docking Station may not work anymore after system suspend and resume independent from the used hardware.
	- On Lenovo ThinkPad L13 Intel Gen5, the functions keys Ctrl+Fn+F9, Ctrl+Fn+F10 and Ctrl+Fn+F11 are not mapped.
- **Dual Boot BC/DR (IGEL OS)**
	- The IGEL Dual Boot menu sometimes does not accurately reflect the presence of a UD-Pocket:
	  - If the "fast boot" BIOS option is turned on for HP devices, the state won't be updated between reboots. Turning off "fast boot" provides accurate detection.
	  - The boot loader doesn't currently detect UD Pockets on Lenovo devices. Using the Lenovo boot menu (F12) allows booting from UD Pockets directly but the "fast boot" BIOS option also interfere with the detection of USB boot devices.
- **IGEL Desktop**
	- On-screen keyboard sporadically crashes when typing.
	- If two monitors are configured in a vertical layout (one above the other), and those monitors are configured with "auto-detect" resolution, saving leads to a wrong layout order.
	- There are some UI elements that are not yet translated in all available user interface languages.
	- In very rare cases, the Start menu or panel may not be visible after boot. A reboot will restore visibility in such cases.
- **Licensing**
	- Manual deployment of add-on licenses for IGEL Agent for Imprivata licenses (via UMS) is only possible after finished installation of IGEL Agent for Imprivata app on device.
	- Endpoints that have a Starter License but no Workspace Edition license will not receive device settings or app management from UMS if add-on licenses are installed.
	Workaround: Either remove the add-on licenses or assign a valid Workspace Edition (or Workspace Edition Demo) license.
- **Mobile Broadband**
	- F11 flight mode function key does not switch off mobile broadband on HP Elite mt645 G7. (Deactivate mobile broadband in Network / Mobile Broadband settings)
ybe 1024MiB may also work) and activate IGEL registry key `x.drivers.swap_card0_with_card1` so the iGPU will become the Primary GPU. Connector names will be changed with that!
	- Wake up from suspend via UMS does not work on HP mt645 G7 devices. Workaround: Disable system suspend and use shutdown instead.
	- Rotation of displays connected to the Lenovo ThinkPad USB-C Hybrid Dock may fail.
	- Display configuration of displays connected to HP G5 Docking Station may fail on HP t655. Furthermore displays connected to HP G5 Docking Station may not work anymore after system suspend and resume independent from the used hardware.
	- On Lenovo ThinkPad L13 Intel Gen5, the functions keys Ctrl+Fn+F9, Ctrl+Fn+F10 and Ctrl+Fn+F11 are not mapped.

- **IGEL Desktop**

	- On-screen keyboard sporadically crashes when typing.
	- If two monitors are configured in a vertical layout (one above the other), and those monitors are configured with "auto-detect" resolution, saving leads to a wrong layout order.
	- There are some UI elements that are not yet translated in all available user interface languages.
	- In very rare cases, the Start menu or panel may not be visible after boot. A reboot will restore visibility in such cases.

- **Licensing**

	- Manual deployment of add-on licenses for IGEL Agent for Imprivata licenses (via UMS) is only possible after finished installation of IGEL Agent for Imprivata app on device.

- **Mobile Broadband**

	- F11 flight mode function key does not switch off mobile broadband on HP Elite mt645 G7. (Deactivate mobile broadband in Network / Mobile Broadband settings)
```

----

## 2025-06-25 - [12.7.1](https://app.igel.com/base_system/12.7.1)

```
The new BUILD 12.7.1 for IGEL Workspace is ready.

These are the release notes published with that release:

# Changes since: 12.7.0

## New Features

- Added accessiblity features.
  - Mouse control via numpad: Usage of numeric keypad to move the mouse. Press "5" on the numpad for left-clicks and "Shift+5" for right-clicks.
  - Disable repeating keys: When enabled, holding down a key will register only a single event.
  - Sticky keys: Allows modifier keys (e.g., Shift, Ctrl) and regular keys to be pressed one after another and still be recognized as a combined input.
  - Slow keys: Adds a delay before a keypress is registered. The key must be held down for a set duration to be recognized..
  - Bounce keys: Helps ignore unintentional repeated keypresses by filtering out rapid duplicates.
```

|  Parameter  |  Registry   |  Type       |  Value      |
| ------ | ------ | ------ | ------ |
|  `Mouse pointer size`  |  `windowmanager.a11y.mouse.pointersize`  |  integer  |  24 *Default*  |
|  `Use numpad to move mouse`  |  `windowmanager.a11y.keyboard.usekeyboardmouse`  |  bool  |  enabled / *disabled* (default)  |
|  `Repeat keys`  |  `windowmanager.a11y.keyboard.repeatkeys`  |  bool  |  *enabled* (default) / disabled  |
|  `Sticky keys`  |  `windowmanager.a11y.keyboard.stickykeys`  |  bool  |  enabled / *disabled* (default)  |
|  `Slow keys`  |  `windowmanager.a11y.keyboard.slowkeys`  |  bool  |  enabled / *disabled* (default)  |
|  `Slow keys input delay`  |  `windowmanager.a11y.keyboard.slowkeysinputdelay`  |  integer  |  300 *Default*  |
|  `Bounce keys`  |  `windowmanager.a11y.keyboard.bouncekeys`  |  bool  |  enabled / *disabled* (default)  |

```
- Fixed HP BIOS Tools app compatibility with kernel lockdown. This fix applies to the following HP Thin Client models:
  - HP t540 Thin Client
  - HP t640 Thin Client
  - HP Pro t550 Thin Client
  - HP Elite t655 Thin Client
  - HP t740 Thin Client
  - HP Elite t755 Thin Client

- **Network**

	- Added registry keys for verifying server certificate during 802.1x authentication. The following parameters are listed for wireless interfaces `network.interfaces.wirelesslan.device0.alt_ssid%.wpa.*`. While only wireless parameters are explicitly listed, the same functionality also applies to wired interfaces using `network.interfaces.ethernet.device%.ieee8021x.*`.
		- List of strings separated by ";" to be matched against altSubjectName of the certificate presented by the authentication server, for example DNS:server.example.com
```

|  Parameter  |  Registry  |  Type  |  Value  |
| ------ | ------ | ------ | ------ |
|  `Subject alternative matches`  |  `network.interfaces.wirelesslan.device0.alt_ssid%.wpa.altsubject_matches`  |  string  |  empty *Default*  |

```
		- List of FQDNs separated by ";" to be matched against the certificate presented by the authentication server.
```

|  Parameter  |  Registry  |  Type  |  Value  |
| ------ | ------ | ------ | ------ |
|  `Domain match`  |  `network.interfaces.wirelesslan.device0.alt_ssid%.wpa.domain_match`  |  string  |  empty *Default*  |

```
		- List of FQDN suffixes separated by ";" to be matched against dNSName elements of the certificate presented by the authentication server.
```

|  Parameter  |  Registry  |  Type  |  Value  |
| ------ | ------ | ------ | ------ |
|  `Domain suffix match`  |  `network.interfaces.wirelesslan.device0.alt_ssid%.wpa.domain_suffix_match`  |  string  |  empty *Default*  |

```
		- Substring to be matched against the subject of the certificate presented by the authentication server.
```

|  Parameter  |  Registry  |  Type  |  Value  |
| ------ | ------ | ------ | ------ |
|  `Subject match`  |  `network.interfaces.wirelesslan.device0.alt_ssid%.wpa.subject_match`  |  string  |  empty *Default*  |

```
		- List of strings separated by ";" to be matched against altSubjectName of the certificate presented by the authentication server.
```

|  Parameter  |  Registry  |  Type  |  Value  |
| ------ | ------ | ------ | ------ |
|  `Phase 2 alternative subject matches`  |  `network.interfaces.wirelesslan.device0.alt_ssid%.wpa.phase2_altsubject_matches`  |  string  |  empty *Default*  |

```
		- List of FQDNs separated by ";" to be matched against the certificate presented by the authentication server during the inner "phase 2" authentication.
```

|  Parameter  |  Registry  |  Type  |  Value  |
| ------ | ------ | ------ | ------ |
|  `Phase 2 Domain match`  |  `network.interfaces.wirelesslan.device0.alt_ssid%.wpa.phase2_domain_match`  |  string  |  empty *Default*  |

```
		- List of FQDN suffixes separated by ";" to be matched against dNSName elements of the certificate presented by the authentication server during the inner "phase 2" authentication.
```

|  Parameter  |  Registry  |  Type  |  Value  |
| ------ | ------ | ------ | ------ |
|  `Phase 2 Domain suffix match`  |  `network.interfaces.wirelesslan.device0.alt_ssid%.wpa.phase2_domain_suffix_match`  |  string  |  empty *Default*  |

```
		- Substring to be matched against the subject of the certificate presented by the authentication server during the inner "phase 2" authentication.
```

|  Parameter  |  Registry  |  Type  |  Value  |
| ------ | ------ | ------ | ------ |
|  `Phase 2 Subject match`  |  `network.interfaces.wirelesslan.device0.alt_ssid%.wpa.phase2_subject_match`  |  string  |  empty *Default*  |

```
	- SCEP: Added support for Kerberos authentication in SCEP NDES challenge password retrieval - by adjusting the following registry key. By default, NTLM is used. To enable Kerberos authentication, the following conditions must be met: Security->Active Directory/Kerberos must be enabled and potentially one of the Domain slots must be configured.
```

|  Parameter  |  Registry   |  Range      |  Value      |
| ------ | ------ | ------ | ------ |
|  `Authentication`  |  `network.scepclient.cert%.ndes.challenge_password_retrieval.auth`  |  [NTLM][Kerberos]  |  *NTLM*  |

```
	- SCEP:
		- Added UPN (Microsoft User Principal Name) to the range of values accepted by network.scepclient.cert%.subjectaltname_type. Previously, only 'DNS name as UPN (auto)' was available.
		- Added support for up to 4 additional subject alt names in the CSR. This is accomplished via the following added registry keys where N refers to a slot number in the range {1, 2, 3 ,4}. The slot is ignored if  network.scepclient.cert%.subjectaltnametype_otherN is none. Otherwise, the meaning is the same as for the traditional keys without _otherN in the name.
```

|  Parameter  |  Registry   |  Range      |  Value      |  Type       |
| ------ | ------ | ------ | ------ | ------ |
|  CommonName/SubjectAltName Suffix (+N)  |  network.scepclient.cert%.subjectaltname_otherN_suffix  |  [none][dot + DNS domain (auto)]  |  **  |  string  |
|  Type of CommonName/SubjectAltName (+N)  |  network.scepclient.cert%.subjectaltname_otherN_type  |  [None][IP address][DNS name][IP address (auto)][DNS name (auto)][Email address][DNS name as UPN (auto)][UPN]  |  None  |  |
|  CommonName/SubjectAltName (+N)  |  network.scepclient.cert%.subjectaltname_otherN  |  |  empty Default  |  string  |

```

- **WiFi**

	- Changed: WPA2 Enterprise and WPA3 Enterprise are now grouped under a single configuration option: WPA2/WPA3 Enterprise
	- Added support for WPA3 Enterprise B192 to allow connections to WPA3 Enterprise with 192-bit mode (00-0F-AC:12 cipher suite, GCMP-256 pairwise cipher and required PMF)
```

|  Parameter  |  Registry   |  Range      |  Value      |
| ------ | ------ | ------ | ------ |
|  `Network authentication`  |  `network.interfaces.wirelesslan.device0.alt_ssid%.wpa.type`  |  [WPA Personal][WPA Enterprise][WPA2 Personal][WPA2/WPA3 Enterprise][WPA3 Personal][WPA3 Enterprise B192]  |  *WPA2 Personal*  |

```

- **Driver**

	- Added asix_thirdparty driver to get some fibre USB ethernet adapter to work - this driver can be activated via the following registry key:
```

|  Parameter  |  Registry   |  Range      |  Value      |
| ------ | ------ | ------ | ------ |
|  `Use thirdparty asix kernel module.`  |  `network.drivers.asix.prefer_thirdparty`  |  [Auto][Yes][No]  |  *Auto*  |

```

- **Hardware**

	- Added hardware support for Lenovo M625q.
	- Added hardware support for Dell Optiplex 3000 with CPU “Intel® Pentium® Silver Processor N6005”.

- **Remote Management**

	- Added downgrade limit - The base_system app can no longer be downgraded to versions older than 12.7.0. This restriction applies to IGEL UD Pocket devices and endpoints with Secure Boot enabled. In such cases, downgrade attempts to versions prior to 12.7.0 will be refused to maintain system integrity and boot security.

- **IGEL Desktop**

	- Added registry parameter to enable alphanumerical sorting of desktop icons.
```

|  Parameter  |  Registry   |  Range      |  Value      |
| ------ | ------ | ------ | ------ |
|  `Sort Desktop icons`  |  `windowmanager.defaulttheme.icon_sort`  |  [Default][Alphanumeric]  |  *Default*  |

```

## Security Fixes

- Fixed ISN 2025-24: Command Execution in IGEL OS.

## Resolved Issues

- Old EFI entries referencing windows will be ignored in case the \EFI\Windows folder does no longer exist on the referenced partition.
- Fixed: Touchpad re-enabled itself despite being deactivated in the settings.
- Fixed application launcher in restart mode. It no longer starts additional instances when configuration changes occur.
- Fixed creation of /etc/machine-id, which is needed for systemd timers using FixedRandomDelay. This fix resolves an issue where custom cronJob/systemd timers triggered with identical delays accross multiple IGEL OS endpoints. Timers now behave as expected with randomized delays per device.
- Switched to standard utility xkbset for managing keyboard accessibility features.

- **CUPS Printing**

	- Fixed usage of gutenprint printer drivers by removing them from the base system. These drivers are already included in the CUPS Printing app and cannot be provided in both locations.

- **Hardware**

	- Fixed issues related to MST (Multi-Stream Transport) docking stations.
	- Fixed: Rare issue where assigning a predictable network interface name to an Ethernet interface failed due to excessive name length. As a result, the interface was not automatically configured.

- **IGEL Desktop**

	- Fixed screens stay black after hotplug of USB-C dockingstations.

## Known Issues

- In very rare cases all apps are lost after an update. Should this be the case, an error message is shown "Opening system App Journal failed." - if the device is manged, the apps will be reinstalled after a reboot.
- Increased writeable cache partition size (by default). First boot with 12.4.x and newer may take more time (once) when updating from a 12.2.x or older base system app.
- Automatic proxy configuration: PAC file URL does not support https scheme.
- When TPM PCR+PIN device encryption is enabled, an additional PIN entry is required the first time a new base system release is booted.

- **App Management**

	- Downgrades to versions prior to 12.7.0 are possible - despite the implemented downgrade limit - via the Local App Portal or using igelpkgctl through local terminal. In UMS-managed environments, disabling the Local App Portal is recommended to ensure version control. If the older shim bootloader signature (in 12.6.1 PR1 or earlier) is revoked and Secure Boot is enabled, the device may become unbootable. Verify boot compatibility before downgrading.

- **Chromium**

	- Downgrading base system to earlier versions may result in reset of the Chromium profile partition.

- **Network**

	- In some cases, network is not working in combination of Lenovo K14 Gen1 (AMD) and Lenovo Universal Dock. There is a kernel bugreport open but no proper fix so far.
	- Device configured as Wake on LAN proxy can be shut down by the user or admin
	- Proxy passthrough authentication together with AD auto logon does work despite of shown error message during logon.

- **WiFi**

	- WiFi chipset BE200 does not work reliable in WiFi 7 networks.

- **HID**

	- Some touchpads are recognized as touchpad and mouse. This results in showing possible user settings for both variants.

- **Setup Assistant**

	- Timezone auto-detection is currently not functional (due to discontinued location service). The timezone must be set manually (as interims / alternative solution).

- **Audio**

	- Headset mic via jack is not working on LG 27CN650 and LG 34CN650.
	- Audio devices may not be available in audio tray app. Workaround: Enable Pulseaudio backend by registry key:
```

|  Parameter  |  Registry   |  Range      |  Value      |
| ------ | ------ | ------ | ------ |
|  `Audiobackend`  |  `multimedia.audiobackend`  |  [pipewire][pulseaudio]  |  *pipewire*  |

```

- **Multimedia**

	- Lenovo L13 Gen5 and L14 Gen5  Intel video codec errors (graphic glitches during accelerated video playback)

- **Hardware**

	- Wake on LAN is not functional on Lenovo K14 Gen1
	- Built-in fingerprint sensor is not supported on HP mt440 G3 and mt645 G7/G8.
	- If using 6 x 4K@60Hz monitors on HP t755/t740 with the additional graphic card, one or two of the monitors may stay black after coming back from DPMS off state.
	  This is caused by using the additional graphic card as primary, which only has 512MB VRAM (the VRAM is not sufficient in this configuration). Possible solution: Increasing the VRAM size of the iGPU to 2048MiB in BIOS (maybe 1024MiB may also work) and activate IGEL registry key `x.drivers.swap_card0_with_card1` so the iGPU will become the Primary GPU. Connector names will be changed with that!
	- Wake up from suspend via UMS does not work on HP mt645 G7 devices. Workaround: Disable system suspend and use shutdown instead.
	- Rotation of displays connected to the Lenovo ThinkPad USB-C Hybrid Dock may fail.
	- Display configuration of displays connected to HP G5 Docking Station may fail on HP t655. Furthermore displays connected to HP G5 Docking Station may not work anymore after system suspend and resume independent from the used hardware.
	- On Lenovo ThinkPad L13 Intel Gen5, the functions keys Ctrl+Fn+F9, Ctrl+Fn+F10 and Ctrl+Fn+F11 are not mapped.

- **IGEL Desktop**

	- On-screen keyboard sporadically crashes when typing.
	- If two monitors are configured in a vertical layout (one above the other), and those monitors are configured with "auto-detect" resolution, saving leads to a wrong layout order.
	- There are some UI elements that are not yet translated in all available user interface languages.
	- In very rare cases, the Start menu or panel may not be visible after boot. A reboot will restore visibility in such cases.

- **Licensing**

	- Manual deployment of add-on licenses for IGEL Agent for Imprivata licenses (via UMS) is only possible after finished installation of IGEL Agent for Imprivata app on device.

- **Mobile Broadband**

	- F11 flight mode function key does not switch off mobile broadband on HP Elite mt645 G7. (Deactivate mobile broadband in Network / Mobile Broadband settings)
```

----

## 2025-06-04 - [12.7.0](https://app.igel.com/base_system/12.7.0)

```
The new BUILD 12.7.0 for IGEL Workspace is ready.

These are the release notes published with that release:

# Changes since: 12.6.0

## New Features

- Removed Evince PDF / document viewer from IGEL OS base system - which is now available as a standalone app.
- Updated boot chain with
	- New SHIM 15.8, signed by Microsoft
	- New GRUB 2.12
- Added: The new secure boot chain also includes Kernel lockdown patches, meaning that all modules must now be signed.
- Changed update parameter to enhance control over management of assigned apps.. Registry keys were kept to to maintain backward compatibility.
```

|  Parameter  |  Registry   |  Type       |  Value      |
| ------ | ------ | ------ | ------ |
|  `Show download progress notification`  |  `update.show_download_progress`  |  bool  |  *true*/false |
|  `Action on app assignment`  |  `update.autoactivate_future_config`  |  range  |  [*Download and activate*][Download][Nothing]  |
|  `Action on app activation`  |  `update.reboot_without_user_interaction`  |  range  |  [*Ask*][Reboot][Nothing]  |

```
- Changed and improved local jobs feature, formerly known as cron job (RTCwake is experimental)
```

|  Parameter  |  Registry  |  Type  |  Value  |
| ------ | ------ | ------ | ------ |
|  `If the hw supports it, if this is mark the system will boot up to trigger the action` |  `system.cron.cronjob%.wake_system_on_boot` |  bool  |  *true*/false  |
|  `Job name use for reference` |  `system.cron.cronjob%.name` |  <string>  |  <>  |
|  `Set the user that will run the systemd timer`  |  `system.cron.cronjob%.user` |  range <string>  |  [*root*][user]  |
|  `Set the type of the systemd service that will run the job` |  `system.cron.cronjob%.type` |  range <string>  |  [*custom*][update]  |
|  `Set the command that will be executed at the service timer, if update is defined, the default task of pospone update will be use` |  `system.cron.cronjob%.command` |  string  |  <>  |
|  `Set when the systemd timer needs to be execute in calendar time form. For more information https://manpages.debian.org/buster/systemd/systemd.time.7.en.html` |  `system.cron.cronjob%.calendar_time` |  string  |  <>  |
|  `Set the a random time offset if desire. If not defined it is not use` |  `system.cron.cronjob%.offset` |  string  |  <>  |

```
- Added UMS as Identity Broker for authentication. AD authentication is redirected via UMS protocol to authenticate users against Active Directory. Requires UMS 12.07.100 or later.
```

| IGEL Setup | Parameter | Registry | Value |
| ------ | ------ | ------ | ------ |
| Security>Logon>UMS as Identity Broker | `Login with UMS as Identity Broker` | auth.login.igelums | **disabled**/enabled |
| Security>Logon>UMS as Identity Broker | `Skip UMS as Identity Broker login if UMS server is unavailable` | auth.ums.skipifunavailable | **disabled**/enabled |

```
- Added support for Swedish and Portuguese user interface.
- Updated German, French, Spanish, Italian and Dutch translations.
- Added support for French, Spanish, Portuguese, Italian, Dutch and Swedish translations in Setup Assistant.
- Updated kernel to version 6.12 LTS (6.12.20).
	- The new secure boot chain also includes Kernel lockdown patches, meaning that all modules must now be signed.
	- In the future, the optional kernel modules will be integrated into the base kernel, replacing the optional-kernel-modules app.
- Removed OMX support from system (used for video encoding/decoding), as it is not longer supported with newer Mesa versions.
- Added basic support of Japanese keyboard input methods (mozc). Enable using following parameters:
```

| IGEL Setup | Parameter | Registry | Value |
| ------ | ------ | ------ | ------ |
| User Interface>Input>Keyboard>Input Methods | `Keyboard input methods (experimental)` | userinterface.keyboard.ibus.enable | **disabled**/enabled |
| User Interface>Input>Keyboard>Input Methods>Methods | `Japanese - Mozc` | userinterface.keyboard.ibus.general.preload-engine-mozc-jp | **disabled**/enabled |

```
- Updated End User License Agreement (EULA) to the February 2025 version.
- Added "No Tofu CJK" fonts supporting e.g. Japanese.
- **Network**
	- Added possibility for assigning an Ethernet device as a slave to a bridge device
```

|  Parameter  |  Registry   |  Range      |  Value      |
| ------ | ------ | ------ | ------ |
|  `Bridge`  |  `network.interfaces.ethernet.device%.bridge`  |  [] [own]  |    |

```
	  - Currently, only the "own" mode is supported. This creates a bridge with the associated Ethernet device (instance of network.interfaces.ethernet.device%) as its sole slave. Additional slave devices can be added separately.

- **WiFi**

	- Added support for WiFi module of ATrust mt183W.
	- Added newer Realtek WiFi drivers, along with corresponding configuration.
	- Added Realtek WiFi drivers for 8852bu and 8852cu devices.
	- Added new registry keys to configure used driver:
```

|  Parameter  |  Registry   |  Range      |  Value      |
| ------ | ------ | ------ | ------ |
|  `Use 8821cu driver instead of rtw_8821cu for WLAN.`  |  `network.drivers.realtek.use_8821cu`  |  [Auto][Yes][No]  |  *Auto*  |
|  `Use 8812au driver instead of rtw_8812au for WLAN.`  |  `network.drivers.realtek.use_8812au`  |  [Auto][Yes][No]  |  *Auto*  |
|  `Use 8814au driver instead of rtw_8814au for WLAN.`  |  `network.drivers.realtek.use_8814au`  |  [Auto][Yes][No]  |  *Auto*  |
|  `Use 8821au driver instead of rtw_8821au for WLAN.`  |  `network.drivers.realtek.use_8821au`  |  [Auto][Yes][No]  |  *Auto*  |
|  `Use 8821ce driver instead of rtw_8821ce for WLAN.`  |  `network.drivers.realtek.use_8821ce`  |  [Auto][Yes][No]  |  *Auto*  |

```
	- Added registry key for controlling kernel parameters arp_evict_nocarrier and ndisc_evict_nocarrier for WiFi with WPA Supplicant. The default "1" leaves the traditional behaviour unchanged, i.e. the respective tables are evicted particularly during roaming. "0" results in quicker resumption of sending packets after roaming, but it also leads to some packet loss.
```

|  Parameter  |  Registry   |  Range      |  Value      |
| ------ | ------ | ------ | ------ |
|  `ARP/NDP evict on no-carrier`  |  `network.interfaces.wirelesslan.device0.arp_ndisc_evict_nocarrier`  |  [0][1]  |  *1*  |

```
	- Added registry keys for restricting frequencies used by WPA Supplicant (see the WPA Supplicant documentation regarding the network-specific settings freq_list and scan_freq). In IGEL OS, the settings affect all configured WiFi´s - these may be useful to improve roaming behavior.
```

| Parameter | Registry | Type | Value |
| ------ | ------ | ------ | ------ |
| `List of frequencies to scan` | `network.interfaces.wirelesslan.device0.scan_freq` | string | empty *Default* |
| `List of allowed frequencies` | `network.interfaces.wirelesslan.device0.freq_list` | string | empty *Default* |

```
	- The default of the following registry keys has been changed from "Default" to "Automatic". It is still the case that "Automatic" means no restriction on the ciphers used and "Default" means CCMP for WPA2 and TKIP for (old industry-standard) WPA. With this change connecting to old access points is more likely to succeed.
	- If the previous "Default" shall be enforced, it must be done in the setup individually for the affected WiFi configurations. This applies not only to newly created configurations but also to those created earlier.
	- The OS12 setup assistant has always explicitly configured "Automatic".
```

|  Parameter  |  Registry   |  Range      |  Value      |
| ------ | ------ | ------ | ------ |
|  `Data encryption (broadcast/multicast)`  |  `network.interfaces.wirelesslan.device0.alt_ssid%.wpa.group_cipher`  |  [Default][TKIP][AES (CCMP)][AES (CCMP) + TKIP][Automatic]  |  *Automatic*  |
|  `Data encryption`  |  `network.interfaces.wirelesslan.device0.alt_ssid%.wpa.pairwise_cipher`  |  [Default][TKIP][AES (CCMP)][AES (CCMP) + TKIP][Automatic]  |  *Automatic*  |

```

- **Audio**

	- Updated audio daemon pipewire to version 1.2.7, wireplumber to version 0.5.7

- **Multimedia**

	- Updated Fluendo multimedia codecs to the following version:
	  - gst-fluendo-aacdec to version 1.0.8
	  - gst-fluendo-h264dec to version 1.0.11
	  - gst-fluendo-hwvadec to version 2.0.6

- **Hardware**

	- Added hardware support for Pepperl+Fuchs BTC24
	- Added hardware support for Pepperl+Fuchs BTC22
	- Added hardware support for the Pepperl & Fuchs dual-mode Bluetooth and WiFi module LM812.
	- Added a new hotkey for Lenovo laptops: Ctrl + Fn + ★ (F12) now launches the default web browser, or, if one is already open, moves the cursor to the address bar for instant URL entry.
	- Added hardware support for Lenovo M70q Gen 6.
	- Added support for new IGEL Business Continuity USB Boot devices - Type A (BC2-LX) and Type C (BC3-LX).
	  - Due to incompatibility a downgrade to IGEL OS base system versions before 12.6.1 PR 1 is not possible.

- **Remote Management**

	- Added support for IGEL Asset Inventory Tracking (AIT). Requires UMS 12.08.100 or later.
```

| IGEL Setup | Parameter | Registry | Type | Value |
| ------ | ------ | ------ | ------ | ------ |
| System > Remote Management > Options | `Enable IGEL Asset Inventory Tracking (AIT)` | `system.remotemanager.ait.enable`  | bool | *enabled* (default) / disabled |
| System > Remote Management > Options | `AIT events delay (secs)` | `system.remotemanager.ait.delay` | integer | 6 |

```
	- Added support for backup and restore VM command.
	- Added reporting of host's RAM and CPUs used in a virtual machine which is managed by IMH.
	- Added parameter to configure connection priority of the igelrmserver when connecting to the UMS.
```

|  IGEL Setup  |  Parameter   |  Registry    |  Type        |  Value       |
| ------ | ------ | ------ | ------ | ------ |
|  System > Remote Management > Options  |  `Use "igelrmserver" as fallback`  |  `system.remotemanager.igelrmserver.as_fallback`  |  bool  |  enabled / *disabled* (default)  |

```
	- Added option to control whether to wait for (applying) remote settings before starting sessions.
```

| IGEL Setup | Parameter | Registry | Type | Value |
| ------ | ------ | ------ | ------ | ------ |
| System > Remote Management > Options | `Delay session start at boot time in order to apply new UMS settings` | `userinterface.sessions.wait-for-ums-config` | bool | enabled / *disabled* (default) |
| System > Remote Management > Options | `Timeout` | `userinterface.sessions.wait-for-ums-config-timeout` | integer | 10 |

```
	- Adjusted display names of officially supported endpoints:
		- DELL WYSE 5070 THIN CLIENT
		- DELL OPTIPLEX 3000 THIN CLIENT
		- ELO I2
		- HP Elite mt645 G7 Mobile Thin Client
		- HP Elite t655 Thin Client
		- HP Elite mt645 G8 Mobile Thin Client
		- HP Pro mt440 G3 Mobile Thin Client
		- HP t640 Thin Client
		- HP t540 Thin Client
		- HP Pro t550 Thin Client
		- HP Elite t755 Thin Client
		- HP Elite t660 Thin Client
		- IGEL H860C
		- IGEL M350C
		- Lenovo ThinkPad L14 Gen4 (AMD)
		- Lenovo ThinkPad L14 Gen4 (Intel)
		- Lenovo ThinkPad L15 Gen4 (AMD)
		- Lenovo ThinkPad L15 Gen4 (Intel)
		- Lenovo ThinkPad L14 Gen3 (Intel)
		- Lenovo ThinkPad L14 Gen3 (AMD)
		- Lenovo K14 Gen1 (Intel)
		- Lenovo K14 Gen1 (AMD)
		- Lenovo ThinkCentre M75q Gen2
		- Lenovo ThinkCentre M70q Gen3
		- Lenovo ThinkEdge SE10
		- Lenovo ThinkCentre Neo50q Gen4
		- Lenovo ThinkStation P3 Tiny
		- Lenovo ThinkPad L13 Gen4 (Intel)
		- Lenovo ThinkPad L13 Gen4 (AMD)
		- Lenovo ThinkPad L13 Gen5 (Intel)
		- Lenovo ThinkPad L14 Gen5 (Intel)
		- Lenovo ThinkPad L14 Gen5 (AMD)
		- Lenovo ThinkPad L16 Gen1 (AMD)
		- Lenovo ThinkPad L16 Gen1 (Intel)
		- Lenovo ThinkCentre M75q Gen5
		- Lenovo ThinkCentre M70q Gen5
		- LG 34CN65x series
		- LG 24CN65x series
		- LG CQ60x series
		- LG 24CQ65x series
		- LG CL600
		- LG 34CN65x series
		- LG 24CR67x series
		- LG 27CQ65x series
		- LG 34CR65x series
		- LG gram 14ZT90R
		- LG gram 15ZT90R
		- LG gram 17ZT90R
		- SINA Workstation S
		- Pepperl+Fuchs BTC22
		- Pepperl+Fuchs BTC24
	- Added the complete data store of the remote management agent to the device logs bundle requested by the UMS.

- **IGEL Desktop**

	- Added a new generic form dialog framework. A detailed documentation (how to use) will be provided via IGEL Knowledge Base.
		 - OpenVPN authentication dialog uses now the newly designed dialog framework.
	- Added new hotkey to enable logoff with a keybinding:
```

|  Parameter  |  Registry   |  Type       |  Value  |
| ------ | ------ | ------ | ------ |
|  `key for hotkey`  |  `sessions.wmcommands16.hotkeymodifier`  |  `range`  |  `Ctrl` (default)  |
|  `enable hotkey`  |  `sessions.wmcommands16.usehotkey`  |  `bool`  |  true/*false* (default)  |
|  `key for hotkey`  |  `sessions.wmcommands16.hotkey`  |  `string`  |  "l" (default)  |

```
- **Licensing**

	- Added support for add-on license "IGEL MANAGED HYPERVISOR"

## Security Fixes

- Fixed some unencrypted legacy parameters which were used as fallback for passwords. The following parameters were removed:
	  - custom_partition.source%.password
	  - network.interfaces.wirelesslan.device0.wpa.passphrase
	  - network.interfaces.wirelesslan.device0.alt_ssid%.wpa.passphrase
- Fixed gtk+3.0 security issue CVE-2024-6655.
- Fixed ffmpeg security issues CVE-2024-7272 and CVE-2024-7055.
- Fixed opensc security issues CVE-2024-8443, CVE-2024-45620, CVE-2024-45619, CVE-2024-45618, CVE-2024-45617, CVE-2024-45616 and CVE-2024-45615.
- Fixed webkit2gtk security issues CVE-2024-54534, CVE-2024-54508, CVE-2024-54505, CVE-2024-54502, CVE-2024-54479, CVE-2024-44309 and CVE-2024-44308.
- Fixed libsoup2.4 security issues CVE-2024-52532, CVE-2024-52531 and CVE-2024-52530.
- Fixed setuptools security issue CVE-2024-6345.
- Fixed avahi security issues CVE-2023-38473, CVE-2023-38472, CVE-2023-38471, CVE-2023-38470 and CVE-2023-38469.
- Fixed glib2.0 security issue CVE-2024-52533.
- Fixed texlive-bin security issue CVE-2024-25262.
- Fixed python3.11 security issues CVE-2024-9287, CVE-2024-7592, CVE-2024-6923, CVE-2024-11168 and CVE-2023-27043.
- Fixed tiff security issues CVE-2024-7006, CVE-2023-52356, CVE-2023-3618, CVE-2023-2908, CVE-2023-26966, CVE-2023-26965 and CVE-2023-25433.
- Fixed dnsmasq security issues CVE-2023-50868, CVE-2023-50387 and CVE-2023-28450.
- Fixed qemu security issue CVE-2024-7409.
- Fixed python-urllib3 security issues CVE-2024-37891, CVE-2023-45803 and CVE-2023-43804.
- Fixed rsync security issues CVE-2024-12747, CVE-2024-12088, CVE-2024-12087, CVE-2024-12086, CVE-2024-12085 and CVE-2024-12084.
- Fixed openjpeg2 security issues CVE-2024-56827, CVE-2024-56826, CVE-2023-39327 and CVE-2021-3575.
- Fixed bind9 security issues CVE-2024-12705 and CVE-2024-11187.
- Fixed pam-pkcs11 security issues CVE-2025-24531 and CVE-2025-24032.
- Fixed libtasn1-6 security issue CVE-2024-12133.
- Fixed gnutls28 security issues CVE-2024-12243 and CVE-2024-12133.
- Fixed openssh security issues CVE-2025-26466 and CVE-2025-26465.
- Fixed openssl security issues CVE-2024-9143 and CVE-2024-13176.
- Fixed xorg-server security issues CVE-2025-26601, CVE-2025-26600, CVE-2025-26599, CVE-2025-26598, CVE-2025-26597, CVE-2025-26596, CVE-2025-26595 and CVE-2025-26594.
- Fixed vim security issues CVE-2024-47814, CVE-2024-43802, CVE-2024-22667, CVE-2023-5344, CVE-2023-4781, CVE-2023-4752, CVE-2023-4738 and CVE-2023-2610.
- Fixed glibc security issue CVE-2025-0395.
- Fixed curl security issues CVE-2025-0167, CVE-2024-9681 and CVE-2024-11053.
- Fixed wget security issue CVE-2024-38428.
- Fixed freetype security issue CVE-2025-27363.
- Fixed webkit2gtk security issues CVE-2024-44308 and CVE-2024-44309
- Fixed webkit2gtk security issues CVE-2025-24162, CVE-2025-24158, CVE-2025-24150, CVE-2025-24143, CVE-2024-54658, CVE-2024-54543, CVE-2024-54534, CVE-2024-54508, CVE-2024-54505, CVE-2024-54502, CVE-2024-54479, CVE-2024-44309, CVE-2024-44308 and CVE-2024-27856.
- Fixed glibc security issue CVE-2025-4802.
- **WiFi**
	- Fixed a critical issue in the regulatory domain configuration, preventing potential privilege escalation and incorrect log entries.

## Resolved Issues

- Fixed: Entering a wrong device encryption password does not lead to an internal error anymore.
- Fixed sporadic file loss or corruption in writable partition /wfs.
- Fixed displaying of custom boot splash on AMD platforms.
- Removed the help menu from Network Tools, as there are no help databases anyway
- Removed broken symlink /var/log/README
- Fixed Safely Remove Hardware tool
- Fixed modification time of files in writable partition /wfs after reboot.
- Fixed issues caused by large applications affecting system stability.
- Fixed an intermittent issue that occasionally disabled remote logging.
- Fixed a race condition in the notification system that caused high CPU usage.
- Fixed errors in failsafe boot.
- Fixed /wfs instabilities:
  - Fixed folder could be incorrectly replaced by a file.
  - Fixed /wfs/rfkill folder was not created properly.
- Fixed tcpdump debug option.
- Adapt logrotate.d to ownership of the files in /var/log/

- **App Management**

	- Fixed app installation with ipkg file on command line were removed after the next UMS connection.
	- Fixed EULA being prompted during multistage updates.

- **Network**

	- Fixed boot failure into desktop when no network connection is established.

- **WiFi**

	- Fixed captive portal pages that required opening a new browser window were not handled correctly.
	- Fixed not possible Wi-Fi connection after entering an incorrect password once.

- **Smartcard**

	- Fixed smartcard resource manager (pcsc-lite) to enable seamless smartcard usage in IGEL AVD, IGEL Remote Desktop, and IGEL Windows 365 sessions.
	- Fixed smartcard resource manager pcsc-lite, ensuring proper smartcard functionality with applications inside AVD, Remote Desktop, and Windows 365 sessions, particularly after reconnection.
	- Added evaluation of environment variable PCSCLITE_STATUS_CHANGE_MAX_TIMEOUT in milliseconds which limits blocking of SCardGetStatusChange in smart card resource manager pcsc-lite. This helps to speed up some particular applications, e.g. Belgian eID Viewer reading cards inside AVD, CPC, RDP and RD Web Access sessions.

- **HID**

	- Fixed sporadic keyboard input problems in local login mask.
	- Fixed usage of base keyboard layouts instead of English for keyboard input methods.
	- Fixed hotkey functionality for switching to next keyboard input method.
	- Fixed keyboard input with Japanese layout.

- **Setup Assistant**

	- Fixed wrongly calculated positioning of UI-elements on high-resolution monitors

- **Audio**

	- Added paramter to ignore any decibel information provided by the ALSA drivers in case the information is incorrect:
```

|  Parameter  |  Registry   |  Type       |  Value      |
| ------ | ------ | ------ | ------ |
|  `Ignore dB`  |  `multimedia.pulseaudio.daemon.ignore-db`  |  bool  |  enabled / *disabled* (default)  |

```
	- Improved default output device selection
	- Fixed showing non-existent internal microphone on Lenovo M75q.
	- Added a new parameter to disable node suspend in pipewire after 5 seconds:
```

|  Parameter  |  Registry   |  Type       |  Value      |
| ------ | ------ | ------ | ------ |
|  `Disable node suspend`  |  `multimedia.pipewire.wireplumber.disable-node-suspend`  |  bool  |  enabled / *disabled* (default)  |

```
	- Fixed problems applying pipewire / pulseaudio changes when admin password is set.
	- Fixed TRRS headset on LG 24CN650

- **Multimedia**

	- Fixed window distortions when playing videos on INTEL Meteor Lake chipsets in Parole Media Player.
	- Fixed memory leak when playing videos.

- **Hardware**

	- Fixed USB on Lenovo v155-15 laptop.
	- Fixed volume slider for:
		  - Poly Savi 8200
		  - Poly Savi 8400
	- The "About" page and the OSC installer show the correct device type and product id for the LG 24CN65x series.
	- The "About" page and the OSC installer show the correct device type and product id for the LG 34CN65x series.
	- Updated fwupd to version 2.0.7-1

- **Remote Management**

	- Fixed file installation - now the files are removed if the post-install action has failed.
	- Fixed retrieving name of the device hardware.
	- Fixed merging of received remote settings - now user related runtime instances of configuration templates are still remaining after merging of remote settings.
	- Fixed enumeration of BT devices which have been paired during the runtime of the IGEL OS.
	- Fixed start delay of the remote management during boot in devices with uninitialized unit id.
	- Fixed ensuring of user permissions for wallpaper files.

- **IGEL Desktop**

	- Fixed login screen and screen lock to show exactly one login mask after connecting additional monitors
	- Fixed visibility of Kerberos login extension input fields.
	- Fixed configuration of custom wallpaper on additional monitors if they must follow configuration for the first monitor.
	- Fixed position of login mask on login screen and screen lock after resume from suspend.
	- Fixed an issue where the taskbar overlapped with parts of the login screen on certain multi-monitor and multi-resolution setups.

- **Licensing**

	- Fixed licensing issue where endpoints appeared unlicensed after suspend.

- **Mobile Broadband**

	- Made disabling of LTE devices more reliable before suspending the system.

## Known Issues

- The downgrade to base system 12.00.900 or 12.00.910 is not supported.
- In very rare cases all apps are lost after an update. Should this be the case, an error message is shown "Opening system App Journal failed." - if the device is manged, the apps will be reinstalled after a reboot.
- Increased writeable cache partition size (by default). First boot with 12.4.x and newer may take more time (once) when updating from a 12.2.x or older base system app.
- Automatic proxy configuration: PAC file URL does not support https scheme.
- When TPM PCR+PIN device encryption is enabled, an additional PIN entry is required the first time a new base system release is booted.
- **App Management**
	- The "Download only" mode after app assignment via UMS, which requires a separate activation step, is not functional in this release. A fix is planned for the next base system (rolling) release.

- **Chromium**

	- Downgrading base system to earlier versions may result in reset of the Chromium profile partition.

- **Network**

	- In some cases, network is not working in combination of Lenovo K14 Gen1 (AMD) and Lenovo Universal Dock. There is a kernel bugreport open but no proper fix so far.
	- Device configured as Wake on LAN proxy can be shut down by the user or admin
	- Proxy passthrough authentication together with AD auto logon does work despite of shown error message during logon.

- **WiFi**

	- WiFi chipset BE200 does not work reliable in WiFi 7 networks.

- **HID**

	- Some touchpads are recognized as touchpad and mouse. This results in showing possible user settings for both variants.

- **Setup Assistant**

	- Timezone auto-detection is currently not functional (due to discontinued location service). The timezone must be set manually (as interims / alternative solution).

- **Audio**

	- Headset mic via jack is not working on LG 27CN650 and LG 34CN650.
	- Audio devices may not be available in audio tray app. Workaround: Enable Pulseaudio backend by registry key:
```

|  Parameter  |  Registry   |  Range      |  Value      |
| ------ | ------ | ------ | ------ |
|  `Audiobackend`  |  `multimedia.audiobackend`  |  [pipewire][pulseaudio]  |  *pipewire*  |

```
- **Multimedia**

	- Lenovo L13 Gen5 and L14 Gen5  Intel video codec errors (graphic glitches during accelerated video playback)

- **Hardware**

	- Wake on LAN is not functional on Lenovo K14 Gen1
	- Built-in fingerprint sensor is not supported on HP mt440 G3 and mt645 G7/G8.
	- If using 6 x 4K@60Hz monitors on HP t755/t740 with the additional graphic card, one or two of the monitors may stay black after coming back from DPMS off state.
	  This is caused by using the additional graphic card as primary, which only has 512MB VRAM (the VRAM is not sufficient in this configuration). Possible solution: Increasing the VRAM size of the iGPU to 2048MiB in BIOS (maybe 1024MiB may also work) and activate IGEL registry key `x.drivers.swap_card0_with_card1` so the iGPU will become the Primary GPU. Connector names will be changed with that!
	- Wake up from suspend via UMS does not work on HP mt645 G7 devices. Workaround: Disable system suspend and use shutdown instead.
	- Rotation of displays connected to the Lenovo ThinkPad USB-C Hybrid Dock may fail.
	- Display configuration of displays connected to HP G5 Docking Station may fail on HP t655. Furthermore displays connected to HP G5 Docking Station may not work anymore after system suspend and resume independent from the used hardware.
	- On Lenovo ThinkPad L13 Intel Gen5, the functions keys Ctrl+Fn+F9, Ctrl+Fn+F10 and Ctrl+Fn+F11 are not mapped.

- **App Bios Hp**

	- Due to new Secure Boot requirements (kernel lock-down enabled), the HP-BIOS-Tools app currently does not support the following HP Thin Clients:
		- HP t540 Thin Client
		- HP t640 Thin Client
		- HP Pro t550 Thin Client
		- HP Elite t655 Thin Client
		- HP t740 Thin Client
		- HP Elite t755 Thin Client

- **IGEL Desktop**

	- On-screen keyboard sporadically crashes when typing.
	- If two monitors are configured in a vertical layout (one above the other), and those monitors are configured with "auto-detect" resolution, saving leads to a wrong layout order.
	- There are some UI elements that are not yet translated in all available user interface languages.
	- In very rare cases, the Start menu or panel may not be visible after boot. A reboot will restore visibility in such cases.

- **Licensing**

	- Manual deployment of add-on licenses for IGEL Agent for Imprivata licenses (via UMS) is only possible after finished installation of IGEL Agent for Imprivata app on device.

- **Mobile Broadband**

	- F11 flight mode function key does not switch off mobile broadband on HP Elite mt645 G7. (Deactivate mobile broadband in Network / Mobile Broadband settings)
```
----

## 2025-03-25 - [12.6.1](https://app.igel.com/base_system/12.6.1)

```
The new BUILD 12.6.1 for IGEL Workspace is ready.

These are the release notes published with that release:

# Changes since: 12.6.0

## New Features

- Removed Evince PDF / document viewer from IGEL OS base system - which is now available as a standalone app.
- Updated boot chain with
	- New SHIM 15.8, signed by Microsoft
	- New GRUB 2.12
- Added: The new secure boot chain also includes Kernel lockdown patches, meaning that all modules must now be signed.
- Changed update parameter to enhance control over management of assigned apps.. Registry keys were kept to to maintain backward compatibility.
```

|  Parameter  |  Registry   |  Type       |  Value      |
| ------ | ------ | ------ | ------ |
|  `Show download progress notification`  |  `update.show_download_progress`  |  bool  |  *true*/false |
|  `Action on app assignment`  |  `update.autoactivate_future_config`  |  range  |  [*Download and activate*][Download][Nothing]  |
|  `Action on app activation`  |  `update.reboot_without_user_interaction`  |  range  |  [*Ask*][Reboot][Nothing]  |

```
- Changed and improved local jobs feature, formerly known as cron job (RTCwake is experimental)
```

|  Parameter  |  Registry  |  Type  |  Value  |
| ------ | ------ | ------ | ------ |
|  `If the hw supports it, if this is mark the system will boot up to trigger the action` |  `system.cron.cronjob%.wake_system_on_boot` |  bool  |  *true*/false  |
|  `Job name use for reference` |  `system.cron.cronjob%.name` |  <string>  |  <>  |
|  `Set the user that will run the systemd timer`  |  `system.cron.cronjob%.user` |  range <string>  |  [*root*][user]  |
|  `Set the type of the systemd service that will run the job` |  `system.cron.cronjob%.type` |  range <string>  |  [*custom*][update]  |
|  `Set the command that will be executed at the service timer, if update is defined, the default task of pospone update will be use` |  `system.cron.cronjob%.command` |  string  |  <>  |
|  `Set when the systemd timer needs to be execute in calendar time form. For more information https://manpages.debian.org/buster/systemd/systemd.time.7.en.html` |  `system.cron.cronjob%.calendar_time` |  string  |  <>  |
|  `Set the a random time offset if desire. If not defined it is not use` |  `system.cron.cronjob%.offset` |  string  |  <>  |

```
- Added UMS as Identity Broker for authentication. AD authentication is redirected via UMS protocol to authenticate users against Active Directory. Requires UMS 12.07.100 or later.
```

| IGEL Setup | Parameter | Registry | Value |
| ------ | ------ | ------ | ------ |
| Security>Logon>UMS as Identity Broker | `Login with UMS as Identity Broker` | auth.login.igelums | **disabled**/enabled |
| Security>Logon>UMS as Identity Broker | `Skip UMS as Identity Broker login if UMS server is unavailable` | auth.ums.skipifunavailable | **disabled**/enabled |

```
- Added support for Swedish and Portuguese user interface.
- Updated German, French, Spanish, Italian and Dutch translations.
- Added support for French, Spanish, Portuguese, Italian, Dutch and Swedish translations in Setup Assistant.
- Updated kernel to version 6.12 LTS (6.12.20).
	- The new secure boot chain also includes Kernel lockdown patches, meaning that all modules must now be signed.
	- In the future, the optional kernel modules will be integrated into the base kernel, replacing the optional-kernel-modules app.
- Removed OMX support from system (used for video encoding/decoding), as it is not longer supported with newer Mesa versions.
- Added basic support of Japanese keyboard input methods (mozc). Enable using following parameters:
```

| IGEL Setup | Parameter | Registry | Value |
| ------ | ------ | ------ | ------ |
| User Interface>Input>Keyboard>Input Methods | `Keyboard input methods (experimental)` | userinterface.keyboard.ibus.enable | **disabled**/enabled |
| User Interface>Input>Keyboard>Input Methods>Methods | `Japanese - Mozc` | userinterface.keyboard.ibus.general.preload-engine-mozc-jp | **disabled**/enabled |

```
- Updated End User License Agreement (EULA) to the February 2025 version.
- Added "No Tofu CJK" fonts supporting e.g. Japanese.
- **Network**
	- Added possibility for assigning an Ethernet device as a slave to a bridge device
```

|  Parameter  |  Registry   |  Range      |  Value      |
| ------ | ------ | ------ | ------ |
|  `Bridge`  |  `network.interfaces.ethernet.device%.bridge`  |  [] [own]  |    |

```
	  - Currently, only the "own" mode is supported. This creates a bridge with the associated Ethernet device (instance of network.interfaces.ethernet.device%) as its sole slave. Additional slave devices can be added separately.

- **WiFi**

	- Added support for WiFi module of ATrust mt183W.
	- Added newer Realtek WiFi drivers, along with corresponding configuration.
	- Added Realtek WiFi drivers for 8852bu and 8852cu devices.
	- Added new registry keys to configure used driver:
```

|  Parameter  |  Registry   |  Range      |  Value      |
| ------ | ------ | ------ | ------ |
|  `Use 8821cu driver instead of rtw_8821cu for WLAN.`  |  `network.drivers.realtek.use_8821cu`  |  [Auto][Yes][No]  |  *Auto*  |
|  `Use 8812au driver instead of rtw_8812au for WLAN.`  |  `network.drivers.realtek.use_8812au`  |  [Auto][Yes][No]  |  *Auto*  |
|  `Use 8814au driver instead of rtw_8814au for WLAN.`  |  `network.drivers.realtek.use_8814au`  |  [Auto][Yes][No]  |  *Auto*  |
|  `Use 8821au driver instead of rtw_8821au for WLAN.`  |  `network.drivers.realtek.use_8821au`  |  [Auto][Yes][No]  |  *Auto*  |
|  `Use 8821ce driver instead of rtw_8821ce for WLAN.`  |  `network.drivers.realtek.use_8821ce`  |  [Auto][Yes][No]  |  *Auto*  |

```
	- Added registry key for controlling kernel parameters arp_evict_nocarrier and ndisc_evict_nocarrier for WiFi with WPA Supplicant. The default "1" leaves the traditional behaviour unchanged, i.e. the respective tables are evicted particularly during roaming. "0" results in quicker resumption of sending packets after roaming, but it also leads to some packet loss.
```

|  Parameter  |  Registry   |  Range      |  Value      |
| ------ | ------ | ------ | ------ |
|  `ARP/NDP evict on no-carrier`  |  `network.interfaces.wirelesslan.device0.arp_ndisc_evict_nocarrier`  |  [0][1]  |  *1*  |

```
	- Added registry keys for restricting frequencies used by WPA Supplicant (see the WPA Supplicant documentation regarding the network-specific settings freq_list and scan_freq). In IGEL OS, the settings affect all configured WiFi´s - these may be useful to improve roaming behavior.
```

| Parameter | Registry | Type | Value |
| ------ | ------ | ------ | ------ |
| `List of frequencies to scan` | `network.interfaces.wirelesslan.device0.scan_freq` | string | empty *Default* |
| `List of allowed frequencies` | `network.interfaces.wirelesslan.device0.freq_list` | string | empty *Default* |

```
	- The default of the following registry keys has been changed from "Default" to "Automatic". It is still the case that "Automatic" means no restriction on the ciphers used and "Default" means CCMP for WPA2 and TKIP for (old industry-standard) WPA. With this change connecting to old access points is more likely to succeed.
	- If the previous "Default" shall be enforced, it must be done in the setup individually for the affected WiFi configurations. This applies not only to newly created configurations but also to those created earlier.
	- The OS12 setup assistant has always explicitly configured "Automatic".
```

|  Parameter  |  Registry   |  Range      |  Value      |
| ------ | ------ | ------ | ------ |
|  `Data encryption (broadcast/multicast)`  |  `network.interfaces.wirelesslan.device0.alt_ssid%.wpa.group_cipher`  |  [Default][TKIP][AES (CCMP)][AES (CCMP) + TKIP][Automatic]  |  *Automatic*  |
|  `Data encryption`  |  `network.interfaces.wirelesslan.device0.alt_ssid%.wpa.pairwise_cipher`  |  [Default][TKIP][AES (CCMP)][AES (CCMP) + TKIP][Automatic]  |  *Automatic*  |

```
- **Audio**

	- Updated audio daemon pipewire to version 1.2.7, wireplumber to version 0.5.7

- **Multimedia**

	- Updated Fluendo multimedia codecs to the following version:
	  - gst-fluendo-aacdec to version 1.0.8
	  - gst-fluendo-h264dec to version 1.0.11
	  - gst-fluendo-hwvadec to version 2.0.6

- **Hardware**

	- Added hardware support for Pepperl+Fuchs BTC24
	- Added hardware support for Pepperl+Fuchs BTC22
	- Added hardware support for the Pepperl & Fuchs dual-mode Bluetooth and WiFi module LM812.
	- Added a new hotkey for Lenovo laptops: Ctrl + Fn + ★ (F12) now launches the default web browser, or, if one is already open, moves the cursor to the address bar for instant URL entry.
	- Added hardware support for Lenovo M70q Gen 6.
	- Added support for new IGEL Business Continuity USB Boot devices - Type A (BC2-LX) and Type C (BC3-LX).
	  - Due to incompatibility a downgrade to IGEL OS base system versions before 12.6.1 PR 1 is not possible.

- **Remote Management**

	- Added support for IGEL Asset Inventory Tracking (AIT). Requires UMS 12.08.100 or later.
```

| IGEL Setup | Parameter | Registry | Type | Value |
| ------ | ------ | ------ | ------ | ------ |
| System > Remote Management > Options | `Enable IGEL Asset Inventory Tracking (AIT)` | `system.remotemanager.ait.enable`  | bool | *enabled* (default) / disabled |
| System > Remote Management > Options | `AIT events delay (secs)` | `system.remotemanager.ait.delay` | integer | 6 |

```
	- Added support for backup and restore VM command.
	- Added reporting of host's RAM and CPUs used in a virtual machine which is managed by IMH.
	- Added parameter to configure connection priority of the igelrmserver when connecting to the UMS.
```

|  IGEL Setup  |  Parameter   |  Registry    |  Type        |  Value       |
| ------ | ------ | ------ | ------ | ------ |
|  System > Remote Management > Options  |  `Use "igelrmserver" as fallback`  |  `system.remotemanager.igelrmserver.as_fallback`  |  bool  |  enabled / *disabled* (default)  |

```
	- Added option to control whether to wait for (applying) remote settings before starting sessions.
```

| IGEL Setup | Parameter | Registry | Type | Value |
| ------ | ------ | ------ | ------ | ------ |
| System > Remote Management > Options | `Delay session start at boot time in order to apply new UMS settings` | `userinterface.sessions.wait-for-ums-config` | bool | enabled / *disabled* (default) |
| System > Remote Management > Options | `Timeout` | `userinterface.sessions.wait-for-ums-config-timeout` | integer | 10 |

```
	- Adjusted display names of officially supported endpoints:
		- DELL WYSE 5070 THIN CLIENT
		- DELL OPTIPLEX 3000 THIN CLIENT
		- ELO I2
		- HP Elite mt645 G7 Mobile Thin Client
		- HP Elite t655 Thin Client
		- HP Elite mt645 G8 Mobile Thin Client
		- HP Pro mt440 G3 Mobile Thin Client
		- HP t640 Thin Client
		- HP t540 Thin Client
		- HP Pro t550 Thin Client
		- HP Elite t755 Thin Client
		- HP Elite t660 Thin Client
		- IGEL H860C
		- IGEL M350C
		- Lenovo ThinkPad L14 Gen4 (AMD)
		- Lenovo ThinkPad L14 Gen4 (Intel)
		- Lenovo ThinkPad L15 Gen4 (AMD)
		- Lenovo ThinkPad L15 Gen4 (Intel)
		- Lenovo ThinkPad L14 Gen3 (Intel)
		- Lenovo ThinkPad L14 Gen3 (AMD)
		- Lenovo K14 Gen1 (Intel)
		- Lenovo K14 Gen1 (AMD)
		- Lenovo ThinkCentre M75q Gen2
		- Lenovo ThinkCentre M70q Gen3
		- Lenovo ThinkEdge SE10
		- Lenovo ThinkCentre Neo50q Gen4
		- Lenovo ThinkStation P3 Tiny
		- Lenovo ThinkPad L13 Gen4 (Intel)
		- Lenovo ThinkPad L13 Gen4 (AMD)
		- Lenovo ThinkPad L13 Gen5 (Intel)
		- Lenovo ThinkPad L14 Gen5 (Intel)
		- Lenovo ThinkPad L14 Gen5 (AMD)
		- Lenovo ThinkPad L16 Gen1 (AMD)
		- Lenovo ThinkPad L16 Gen1 (Intel)
		- Lenovo ThinkCentre M75q Gen5
		- Lenovo ThinkCentre M70q Gen5
		- LG 34CN65x series
		- LG 24CN65x series
		- LG CQ60x series
		- LG 24CQ65x series
		- LG CL600
		- LG 34CN65x series
		- LG 24CR67x series
		- LG 27CQ65x series
		- LG 34CR65x series
		- LG gram 14ZT90R
		- LG gram 15ZT90R
		- LG gram 17ZT90R
		- SINA Workstation S
		- Pepperl+Fuchs BTC22
		- Pepperl+Fuchs BTC24
	- Added the complete data store of the remote management agent to the device logs bundle requested by the UMS.

- **IGEL Desktop**

	- Added a new generic form dialog framework. A detailed documentation (how to use) will be provided via IGEL Knowledge Base.
		 - OpenVPN authentication dialog uses now the newly designed dialog framework.
	- Added new hotkey to enable logoff with a keybinding:
```

|  Parameter  |  Registry   |  Type       |  Value  |
| ------ | ------ | ------ | ------ |
|  `key for hotkey`  |  `sessions.wmcommands16.hotkeymodifier`  |  `range`  |  `Ctrl` (default)  |
|  `enable hotkey`  |  `sessions.wmcommands16.usehotkey`  |  `bool`  |  true/*false* (default)  |
|  `key for hotkey`  |  `sessions.wmcommands16.hotkey`  |  `string`  |  "l" (default)  |

```
- **Licensing**

	- Added support for add-on license "IGEL MANAGED HYPERVISOR"

## Security Fixes

- Fixed some unencrypted legacy parameters which were used as fallback for passwords. The following parameters were removed:
	  - custom_partition.source%.password
	  - network.interfaces.wirelesslan.device0.wpa.passphrase
	  - network.interfaces.wirelesslan.device0.alt_ssid%.wpa.passphrase
- Fixed gtk+3.0 security issue CVE-2024-6655.
- Fixed ffmpeg security issues CVE-2024-7272 and CVE-2024-7055.
- Fixed opensc security issues CVE-2024-8443, CVE-2024-45620, CVE-2024-45619, CVE-2024-45618, CVE-2024-45617, CVE-2024-45616 and CVE-2024-45615.
- Fixed webkit2gtk security issues CVE-2024-54534, CVE-2024-54508, CVE-2024-54505, CVE-2024-54502, CVE-2024-54479, CVE-2024-44309 and CVE-2024-44308.
- Fixed libsoup2.4 security issues CVE-2024-52532, CVE-2024-52531 and CVE-2024-52530.
- Fixed setuptools security issue CVE-2024-6345.
- Fixed avahi security issues CVE-2023-38473, CVE-2023-38472, CVE-2023-38471, CVE-2023-38470 and CVE-2023-38469.
- Fixed glib2.0 security issue CVE-2024-52533.
- Fixed texlive-bin security issue CVE-2024-25262.
- Fixed python3.11 security issues CVE-2024-9287, CVE-2024-7592, CVE-2024-6923, CVE-2024-11168 and CVE-2023-27043.
- Fixed tiff security issues CVE-2024-7006, CVE-2023-52356, CVE-2023-3618, CVE-2023-2908, CVE-2023-26966, CVE-2023-26965 and CVE-2023-25433.
- Fixed dnsmasq security issues CVE-2023-50868, CVE-2023-50387 and CVE-2023-28450.
- Fixed qemu security issue CVE-2024-7409.
- Fixed python-urllib3 security issues CVE-2024-37891, CVE-2023-45803 and CVE-2023-43804.
- Fixed rsync security issues CVE-2024-12747, CVE-2024-12088, CVE-2024-12087, CVE-2024-12086, CVE-2024-12085 and CVE-2024-12084.
- Fixed openjpeg2 security issues CVE-2024-56827, CVE-2024-56826, CVE-2023-39327 and CVE-2021-3575.
- Fixed bind9 security issues CVE-2024-12705 and CVE-2024-11187.
- Fixed pam-pkcs11 security issues CVE-2025-24531 and CVE-2025-24032.
- Fixed libtasn1-6 security issue CVE-2024-12133.
- Fixed gnutls28 security issues CVE-2024-12243 and CVE-2024-12133.
- Fixed openssh security issues CVE-2025-26466 and CVE-2025-26465.
- Fixed openssl security issues CVE-2024-9143 and CVE-2024-13176.
- Fixed xorg-server security issues CVE-2025-26601, CVE-2025-26600, CVE-2025-26599, CVE-2025-26598, CVE-2025-26597, CVE-2025-26596, CVE-2025-26595 and CVE-2025-26594.
- Fixed vim security issues CVE-2024-47814, CVE-2024-43802, CVE-2024-22667, CVE-2023-5344, CVE-2023-4781, CVE-2023-4752, CVE-2023-4738 and CVE-2023-2610.
- Fixed glibc security issue CVE-2025-0395.
- Fixed curl security issues CVE-2025-0167, CVE-2024-9681 and CVE-2024-11053.
- Fixed wget security issue CVE-2024-38428.
- Fixed freetype security issue CVE-2025-27363.
- Fixed webkit2gtk security issues CVE-2024-44308 and CVE-2024-44309
- Fixed webkit2gtk security issues CVE-2025-24162, CVE-2025-24158, CVE-2025-24150, CVE-2025-24143, CVE-2024-54658, CVE-2024-54543, CVE-2024-54534, CVE-2024-54508, CVE-2024-54505, CVE-2024-54502, CVE-2024-54479, CVE-2024-44309, CVE-2024-44308 and CVE-2024-27856.
- Fixed glibc security issue CVE-2025-4802.

- **WiFi**

	- Fixed a critical issue in the regulatory domain configuration, preventing potential privilege escalation and incorrect log entries.

## Resolved Issues

- Fixed: Entering a wrong device encryption password does not lead to an internal error anymore.
- Fixed sporadic file loss or corruption in writable partition /wfs.
- Fixed displaying of custom boot splash on AMD platforms.
- Removed the help menu from Network Tools, as there are no help databases anyway
- Removed broken symlink /var/log/README
- Fixed Safely Remove Hardware tool
- Fixed modification time of files in writable partition /wfs after reboot.
- Fixed issues caused by large applications affecting system stability.
- Fixed an intermittent issue that occasionally disabled remote logging.
- Fixed a race condition in the notification system that caused high CPU usage.
- Fixed errors in failsafe boot.
- Fixed /wfs instabilities:
  - Fixed folder could be incorrectly replaced by a file.
  - Fixed /wfs/rfkill folder was not created properly.
- Fixed tcpdump debug option.
- Adapt logrotate.d to ownership of the files in /var/log/

- **App Management**

	- Fixed app installation with ipkg file on command line were removed after the next UMS connection.
	- Fixed EULA being prompted during multistage updates.

- **Network**

	- Fixed boot failure into desktop when no network connection is established.

- **WiFi**

	- Fixed captive portal pages that required opening a new browser window were not handled correctly.
	- Fixed not possible Wi-Fi connection after entering an incorrect password once.

- **Smartcard**

	- Fixed smartcard resource manager (pcsc-lite) to enable seamless smartcard usage in IGEL AVD, IGEL Remote Desktop, and IGEL Windows 365 sessions.
	- Fixed smartcard resource manager pcsc-lite, ensuring proper smartcard functionality with applications inside AVD, Remote Desktop, and Windows 365 sessions, particularly after reconnection.
	- Added evaluation of environment variable PCSCLITE_STATUS_CHANGE_MAX_TIMEOUT in milliseconds which limits blocking of SCardGetStatusChange in smart card resource manager pcsc-lite. This helps to speed up some particular applications, e.g. Belgian eID Viewer reading cards inside AVD, CPC, RDP and RD Web Access sessions.

- **HID**

	- Fixed sporadic keyboard input problems in local login mask.
	- Fixed usage of base keyboard layouts instead of English for keyboard input methods.
	- Fixed hotkey functionality for switching to next keyboard input method.
	- Fixed keyboard input with Japanese layout.

- **Setup Assistant**

	- Fixed wrongly calculated positioning of UI-elements on high-resolution monitors

- **Audio**

	- Added paramter to ignore any decibel information provided by the ALSA drivers in case the information is incorrect:
```

|  Parameter  |  Registry   |  Type       |  Value      |
| ------ | ------ | ------ | ------ |
|  `Ignore dB`  |  `multimedia.pulseaudio.daemon.ignore-db`  |  bool  |  enabled / *disabled* (default)  |

```
	- Improved default output device selection
	- Fixed showing non-existent internal microphone on Lenovo M75q.
	- Added a new parameter to disable node suspend in pipewire after 5 seconds:
```

|  Parameter  |  Registry   |  Type       |  Value      |
| ------ | ------ | ------ | ------ |
|  `Disable node suspend`  |  `multimedia.pipewire.wireplumber.disable-node-suspend`  |  bool  |  enabled / *disabled* (default)  |

```
	- Fixed problems applying pipewire / pulseaudio changes when admin password is set.
	- Fixed TRRS headset on LG 24CN650

- **Multimedia**

	- Fixed window distortions when playing videos on INTEL Meteor Lake chipsets in Parole Media Player.
	- Fixed memory leak when playing videos.

- **Hardware**

	- Fixed USB on Lenovo v155-15 laptop.
	- Fixed volume slider for:
		  - Poly Savi 8200
		  - Poly Savi 8400
	- The "About" page and the OSC installer show the correct device type and product id for the LG 24CN65x series.
	- The "About" page and the OSC installer show the correct device type and product id for the LG 34CN65x series.
	- Updated fwupd to version 2.0.7-1

- **Remote Management**

	- Fixed file installation - now the files are removed if the post-install action has failed.
	- Fixed retrieving name of the device hardware.
	- Fixed merging of received remote settings - now user related runtime instances of configuration templates are still remaining after merging of remote settings.
	- Fixed enumeration of BT devices which have been paired during the runtime of the IGEL OS.
	- Fixed start delay of the remote management during boot in devices with uninitialized unit id.
	- Fixed ensuring of user permissions for wallpaper files.

- **IGEL Desktop**

	- Fixed login screen and screen lock to show exactly one login mask after connecting additional monitors
	- Fixed visibility of Kerberos login extension input fields.
	- Fixed configuration of custom wallpaper on additional monitors if they must follow configuration for the first monitor.
	- Fixed position of login mask on login screen and screen lock after resume from suspend.
	- Fixed an issue where the taskbar overlapped with parts of the login screen on certain multi-monitor and multi-resolution setups.

- **Licensing**

	- Fixed licensing issue where endpoints appeared unlicensed after suspend.

- **Mobile Broadband**

	- Made disabling of LTE devices more reliable before suspending the system.

## Known Issues

- The downgrade to base system 12.00.900 or 12.00.910 is not supported.
- In very rare cases all apps are lost after an update. Should this be the case, an error message is shown "Opening system App Journal failed." - if the device is manged, the apps will be reinstalled after a reboot.
- Increased writeable cache partition size (by default). First boot with 12.4.x and newer may take more time (once) when updating from a 12.2.x or older base system app.
- Automatic proxy configuration: PAC file URL does not support https scheme.
- When TPM PCR+PIN device encryption is enabled, an additional PIN entry is required the first time a new base system release is booted.

- **App Management**

	- The "Download only" mode after app assignment via UMS, which requires a separate activation step, is not functional in this release. A fix is planned for the next base system (rolling) release.

- **Chromium**

	- Downgrading base system to earlier versions may result in reset of the Chromium profile partition.

- **Network**

	- In some cases, network is not working in combination of Lenovo K14 Gen1 (AMD) and Lenovo Universal Dock. There is a kernel bugreport open but no proper fix so far.
	- Device configured as Wake on LAN proxy can be shut down by the user or admin
	- Proxy passthrough authentication together with AD auto logon does work despite of shown error message during logon.

- **WiFi**

	- WiFi chipset BE200 does not work reliable in WiFi 7 networks.

- **HID**

	- Some touchpads are recognized as touchpad and mouse. This results in showing possible user settings for both variants.

- **Setup Assistant**

	- Timezone auto-detection is currently not functional (due to discontinued location service). The timezone must be set manually (as interims / alternative solution).

- **Audio**

	- Headset mic via jack is not working on LG 27CN650 and LG 34CN650.
	- Audio devices may not be available in audio tray app. Workaround: Enable Pulseaudio backend by registry key:
```

|  Parameter  |  Registry   |  Range      |  Value      |
| ------ | ------ | ------ | ------ |
|  `Audiobackend`  |  `multimedia.audiobackend`  |  [pipewire][pulseaudio]  |  *pipewire*  |

```

- **Multimedia**

	- Lenovo L13 Gen5 and L14 Gen5  Intel video codec errors (graphic glitches during accelerated video playback)

- **Hardware**

	- Wake on LAN is not functional on Lenovo K14 Gen1
	- Built-in fingerprint sensor is not supported on HP mt440 G3 and mt645 G7/G8.
	- If using 6 x 4K@60Hz monitors on HP t755/t740 with the additional graphic card, one or two of the monitors may stay black after coming back from DPMS off state.
	  This is caused by using the additional graphic card as primary, which only has 512MB VRAM (the VRAM is not sufficient in this configuration). Possible solution: Increasing the VRAM size of the iGPU to 2048MiB in BIOS (maybe 1024MiB may also work) and activate IGEL registry key `x.drivers.swap_card0_with_card1` so the iGPU will become the Primary GPU. Connector names will be changed with that!
	- Wake up from suspend via UMS does not work on HP mt645 G7 devices. Workaround: Disable system suspend and use shutdown instead.
	- Rotation of displays connected to the Lenovo ThinkPad USB-C Hybrid Dock may fail.
	- Display configuration of displays connected to HP G5 Docking Station may fail on HP t655. Furthermore displays connected to HP G5 Docking Station may not work anymore after system suspend and resume independent from the used hardware.
	- On Lenovo ThinkPad L13 Intel Gen5, the functions keys Ctrl+Fn+F9, Ctrl+Fn+F10 and Ctrl+Fn+F11 are not mapped.

- **App Bios Hp**

	- Due to new Secure Boot requirements (kernel lock-down enabled), the HP-BIOS-Tools app currently does not support the following HP Thin Clients:
		- HP t540 Thin Client
		- HP t640 Thin Client
		- HP Pro t550 Thin Client
		- HP Elite t655 Thin Client
		- HP t740 Thin Client
		- HP Elite t755 Thin Client

- **IGEL Desktop**

	- On-screen keyboard sporadically crashes when typing.
	- If two monitors are configured in a vertical layout (one above the other), and those monitors are configured with "auto-detect" resolution, saving leads to a wrong layout order.
	- There are some UI elements that are not yet translated in all available user interface languages.
	- In very rare cases, the Start menu or panel may not be visible after boot. A reboot will restore visibility in such cases.

- **Licensing**

	- Manual deployment of add-on licenses for IGEL Agent for Imprivata licenses (via UMS) is only possible after finished installation of IGEL Agent for Imprivata app on device.

- **Mobile Broadband**

	- F11 flight mode function key does not switch off mobile broadband on HP Elite mt645 G7. (Deactivate mobile broadband in Network / Mobile Broadband settings)
```

----

## 2025-03-25 - [12.6.1](https://app.igel.com/base_system/12.6.1)

```
The new BUILD 12.6.1 for IGEL Workspace is ready.

These are the release notes published with that release:

# Changes since: 12.6.0

## New Features

- Removed Evince PDF / document viewer from IGEL OS base system - which is now available as a standalone app.
- Added UMS as Identity Broker for authentication. AD authentication is redirected via UMS protocol to authenticate users against Active Directory. Requires UMS 12.07.100 or later.
```

| IGEL Setup | Parameter | Registry | Value |
| ------ | ------ | ------ | ------ |
| Security>Logon>UMS as Identity Broker | `Login with UMS as Identity Broker` | auth.login.igelums | **disabled**/enabled |
| Security>Logon>UMS as Identity Broker | `Skip UMS as Identity Broker login if UMS server is unavailable` | auth.ums.skipifunavailable | **disabled**/enabled |

```
- Added basic support of Japanese keyboard input methods (mozc). Enable using following parameters:
```

| IGEL Setup | Parameter | Registry | Value |
| ------ | ------ | ------ | ------ |
| User Interface>Input>Keyboard>Input Methods | `Keyboard input methods (experimental)` | userinterface.keyboard.ibus.enable | **disabled**/enabled |
| User Interface>Input>Keyboard>Input Methods>Methods | `Japanese - Mozc` | userinterface.keyboard.ibus.general.preload-engine-mozc-jp | **disabled**/enabled |

```
- Added "No Tofu CJK" fonts supporting e.g. Japanese.

- **Network**

	- Added possibility for assigning an Ethernet device as a slave to a bridge device
```

|  Parameter  |  Registry   |  Range      |  Value      |
| ------ | ------ | ------ | ------ |
|  `Bridge`  |  `network.interfaces.ethernet.device%.bridge`  |  [] [own]  |    |

```
	  - Currently, only the "own" mode is supported. This creates a bridge with the associated Ethernet device (instance of network.interfaces.ethernet.device%) as its sole slave. Additional slave devices can be added separately.

- **Multimedia**

	- Updated Fluendo multimedia codecs to the following version:
	  - gst-fluendo-aacdec to version 1.0.8
	  - gst-fluendo-h264dec to version 1.0.11
	  - gst-fluendo-hwvadec to version 2.0.6

- **Hardware**

	- Added hardware support for Pepperl+Fuchs BTC24
	- Added hardware support for Pepperl+Fuchs BTC22

- **Remote Management**

	- Added support for IGEL Asset Inventory Tracking (AIT). Requires UMS 12.08.100 or later.
```

| IGEL Setup | Parameter | Registry | Type | Value |
| ------ | ------ | ------ | ------ | ------ |
| System > Remote Management > Options | `Enable IGEL Asset Inventory Tracking (AIT)` | `system.remotemanager.ait.enable`  | bool | *enabled* (default) / disabled |
| System > Remote Management > Options | `AIT events delay (secs)` | `system.remotemanager.ait.delay` | integer | 6 |

```
	- Added parameter to configure connection priority of the igelrmserver when connecting to the UMS.
```

|  IGEL Setup  |  Parameter   |  Registry    |  Type        |  Value       |
| ------ | ------ | ------ | ------ | ------ |
|  System > Remote Management > Options  |  `Use "igelrmserver" as fallback`  |  `system.remotemanager.igelrmserver.as_fallback`  |  bool  |  enabled / *disabled* (default)  |

```
	- Added option to control whether to wait for (applying) remote settings before starting sessions.
```

| IGEL Setup | Parameter | Registry | Type | Value |
| ------ | ------ | ------ | ------ | ------ |
| System > Remote Management > Options | `Delay session start at boot time in order to apply new UMS settings` | `userinterface.sessions.wait-for-ums-config` | bool | enabled / *disabled* (default) |
| System > Remote Management > Options | `Timeout` | `userinterface.sessions.wait-for-ums-config-timeout` | integer | 10 |

```
	- Adjusted display names of officially supported endpoints:

		- DELL WYSE 5070 THIN CLIENT
		- DELL OPTIPLEX 3000 THIN CLIENT
		- ELO I2
		- HP Elite mt645 G7 Mobile Thin Client
		- HP Elite t655 Thin Client
		- HP Elite mt645 G8 Mobile Thin Client
		- HP Pro mt440 G3 Mobile Thin Client
		- HP t640 Thin Client
		- HP t540 Thin Client
		- HP Pro t550 Thin Client
		- HP Elite t755 Thin Client
		- HP Elite t660 Thin Client
		- IGEL H860C
		- IGEL M350C
		- Lenovo ThinkPad L14 Gen4 (AMD)
		- Lenovo ThinkPad L14 Gen4 (Intel)
		- Lenovo ThinkPad L15 Gen4 (AMD)
		- Lenovo ThinkPad L15 Gen4 (Intel)
		- Lenovo ThinkPad L14 Gen3 (Intel)
		- Lenovo ThinkPad L14 Gen3 (AMD)
		- Lenovo K14 Gen1 (Intel)
		- Lenovo K14 Gen1 (AMD)
		- Lenovo ThinkCentre M75q Gen2
		- Lenovo ThinkCentre M70q Gen3
		- Lenovo ThinkEdge SE10
		- Lenovo ThinkCentre Neo50q Gen4
		- Lenovo ThinkStation P3 Tiny
		- Lenovo ThinkPad L13 Gen4 (Intel)
		- Lenovo ThinkPad L13 Gen4 (AMD)
		- Lenovo ThinkPad L13 Gen5 (Intel)
		- Lenovo ThinkPad L14 Gen5 (Intel)
		- Lenovo ThinkPad L14 Gen5 (AMD)
		- Lenovo ThinkPad L16 Gen1 (AMD)
		- Lenovo ThinkPad L16 Gen1 (Intel)
		- Lenovo ThinkCentre M75q Gen5
		- Lenovo ThinkCentre M70q Gen5
		- LG 34CN65x series
		- LG 24CN65x series
		- LG CQ60x series
		- LG 24CQ65x series
		- LG CL600
		- LG 34CN65x series
		- LG 24CR67x series
		- LG 27CQ65x series
		- LG 34CR65x series
		- LG gram 14ZT90R
		- LG gram 15ZT90R
		- LG gram 17ZT90R
		- SINA Workstation S
		- Pepperl+Fuchs BTC22
		- Pepperl+Fuchs BTC24

- **Licensing**

	- Added support for add-on license "IGEL MANAGED HYPERVISOR"

## Security Fixes

- Set nologin for system users tcpdump and unscd.
- Fixed webkit2gtk security issues CVE-2025-24162, CVE-2025-24158, CVE-2025-24150, CVE-2025-24143, CVE-2024-54658, CVE-2024-54543, CVE-2024-54534, CVE-2024-54508, CVE-2024-54505, CVE-2024-54502, CVE-2024-54479, CVE-2024-44309, CVE-2024-44308 and CVE-2024-27856.
- Fixed pam-pkcs11 security issues CVE-2025-24531 and CVE-2025-24032.
- Fixed libsoup2.4 security issues CVE-2024-52532, CVE-2024-52531 and CVE-2024-52530.
- Fixed bind9 security issues CVE-2024-12705 and CVE-2024-11187.
- Fixed avahi security issues CVE-2023-38473, CVE-2023-38472, CVE-2023-38471, CVE-2023-38470 and CVE-2023-38469.
- Fixed glib2.0 security issue CVE-2024-52533.
- Fixed gnutls28 security issues CVE-2024-12243 and CVE-2024-12133.
- Fixed texlive-bin security issue CVE-2024-25262.
- Fixed openjpeg2 security issues CVE-2024-56827, CVE-2024-56826, CVE-2023-39327 and CVE-2021-3575.
- Fixed python3.11 security issues CVE-2024-9287, CVE-2024-7592, CVE-2024-6923, CVE-2024-11168 and CVE-2023-27043.
- Fixed libtasn1-6 security issue CVE-2024-12133.
- Fixed tiff security issues CVE-2024-7006, CVE-2023-52356, CVE-2023-3618, CVE-2023-2908, CVE-2023-26966, CVE-2023-26965 and CVE-2023-25433.
- Fixed libwebp security issue CVE-2023-4863.
- Fixed dnsmasq security issues CVE-2023-50868, CVE-2023-50387 and CVE-2023-28450.
- Fixed rsync security issues CVE-2024-12747, CVE-2024-12088, CVE-2024-12087, CVE-2024-12086, CVE-2024-12085 and CVE-2024-12084.
- Fixed qemu security issue CVE-2024-7409.
- Fixed python-urllib3 security issues CVE-2024-37891, CVE-2023-45803 and CVE-2023-43804.
- Fixed openssl security issues CVE-2024-9143 and CVE-2024-13176.
- Fixed openssh security issues CVE-2025-26466 and CVE-2025-26465.
- Fixed xorg-server security issues CVE-2025-26601, CVE-2025-26600, CVE-2025-26599, CVE-2025-26598, CVE-2025-26597, CVE-2025-26596, CVE-2025-26595 and CVE-2025-26594.
- Fixed opensc security issues CVE-2024-8443, CVE-2024-45620, CVE-2024-45619, CVE-2024-45618, CVE-2024-45617, CVE-2024-45616 and CVE-2024-45615.

## Resolved Issues

- Fixed some unencrypted legacy parameters which were used as fallback for passwords. The following parameters were removed:

custom_partition.source%.password
network.interfaces.wirelesslan.device0.wpa.passphrase
network.interfaces.wirelesslan.device0.alt_ssid%.wpa.passphrase

- Fixed sporadic file loss or corruption in writable partition /wfs.
- Fixed usage of base keyboard layouts instead of English for keyboard input methods.
- Fixed hotkey functionality for switching to next keyboard input method.
- Fixed Safely Remove Hardware tool
- Fixed modification time of files in writable partition /wfs after reboot.
- Fixed issues caused by large applications affecting system stability.

- **App Management**

	- Fixed app installation with ipkg file on command line were removed after the next UMS connection.

- **Network**

	- Fixed boot failure into desktop when no network connection is established.

- **WiFi**

	- Fixed captive portal pages that required opening a new browser window were not handled correctly.

- **Smartcard**

	- Fixed smartcard resource manager pcsc-lite, ensuring proper smartcard functionality with applications inside AVD, Remote Desktop, and Windows 365 sessions, particularly after reconnection.

- **Setup Assistant**

	- Fixed wrongly calculated positioning of UI-elements on high-resolution monitors

- **Audio**

	- Fixed showing non-existent internal microphone on Lenovo M75q.
	- Added a new parameter to disable node suspend in pipewire after 5 seconds:
```

|  Parameter  |  Registry   |  Type       |  Value      |
| ------ | ------ | ------ | ------ |
|  `Disable node suspend`  |  `multimedia.pipewire.wireplumber.disable-node-suspend`  |  bool  |  enabled / *disabled* (default)  |

```
	- Fixed problems applying pipewire / pulseaudio changes when admin password is set.

- **Multimedia**

	- Fixed window distortions when playing videos on INTEL Meteor Lake chipsets in Parole Media Player.
	- Fixed memory leak when playing videos.

- **Hardware**

	- Fixed USB on Lenovo v155-15 laptop.
	- Fixed volume slider for:
		  - Poly Savi 8200
		  - Poly Savi 8400

- **Remote Management**

	- Fixed file installation - now the files are removed if the post-install action has failed.
	- Fixed retrieving name of the device hardware.

## Known Issues

- The downgrade to base system 12.00.900 or 12.00.910 is not supported.
- In very rare cases all apps are lost after an update. Should this be the case, an error message is shown "Opening system App Journal failed." - if the device is manged, the apps will be reinstalled after a reboot.
- Increased writeable cache partition size (by default). First boot with 12.4.x and newer may take more time (once) when updating from a 12.2.x or older base system app.
- Automatic proxy configuration: PAC file URL does not support https scheme.

- **Chromium**

	- Downgrading base system to earlier versions may result in reset of the Chromium profile partition.

- **Network**

	- In some cases, network is not working in combination of Lenovo K14 Gen1 (AMD) and Lenovo Universal Dock. There is a kernel bugreport open but no proper fix so far.
	- Device configured as Wake on LAN proxy can be shut down by the user or admin
	- Proxy passthrough authentication together with AD auto logon does work despite of shown error message during logon.

- **WiFi**

	- WiFi chipset BE200 does not work reliable in WiFi 7 networks.

- **HID**

	- Some touchpads are recognized as touchpad and mouse. This results in showing possible user settings for both variants.

- **Setup Assistant**

	- Timezone auto-detection is currently not functional (due to discontinued location service). The timezone must be set manually (as interims / alternative solution).

- **Audio**

	- Headset mic via jack is not working on LG 27CN650 and LG 34CN650.

- **Multimedia**

	- Lenovo L13 Gen5 and L14 Gen5  Intel video codec errors (graphic glitches during accelerated video playback)

- **Hardware**

	- Wake on LAN is not functional on Lenovo K14 Gen1
	- Built-in fingerprint sensor is not supported on HP mt440 G3 and mt645 G7/G8.
	- If using 6 x 4K@60Hz monitors on HP t755/t740 with the additional graphic card, one or two of the monitors may stay black after coming back from DPMS off state.
	  This is caused by using the additional graphic card as primary, which only has 512MB VRAM (the VRAM is not sufficient in this configuration). Possible solution: Increasing the VRAM size of the iGPU to 2048MiB in BIOS (maybe 1024MiB may also work) and activate IGEL registry key `x.drivers.swap_card0_with_card1` so the iGPU will become the Primary GPU. Connector names will be changed with that!
	- Wake up from suspend via UMS does not work on HP mt645 G7 devices. Workaround: Disable system suspend and use shutdown instead.
	- Rotation of displays connected to the Lenovo ThinkPad USB-C Hybrid Dock may fail.
	- Display configuration of displays connected to HP G5 Docking Station may fail on HP t655. Furthermore displays connected to HP G5 Docking Station may not work anymore after system suspend and resume independent from the used hardware.
	- On Lenovo ThinkPad L13 Intel Gen5, the functions keys Ctrl+Fn+F9, Ctrl+Fn+F10 and Ctrl+Fn+F11 are not mapped.

- **IGEL Desktop**

	- On-screen keyboard sporadically crashes when typing.
	- If two monitors are configured in a vertical layout (one above the other), and those monitors are configured with "auto-detect" resolution, saving leads to a wrong layout order.

- **Licensing**

	- Manual deployment of add-on licenses for IGEL Agent for Imprivata licenses (via UMS) is only possible after finished installation of IGEL Agent for Imprivata app on device.

- **Mobile Broadband**

	- F11 flight mode function key does not switch off mobile broadband on HP Elite mt645 G7. (Deactivate mobile broadband in Network / Mobile Broadband settings)
```

----

## 2025-02-11 - [12.6.0](https://app.igel.com/base_system/12.6.0)

```
The new BUILD 12.6.0 for IGEL Workspace is ready.

These are the release notes published with that release:

# Changes since: 12.5.2

## New Features

- Added secure mini browser as default handler for URLs without installation of a full browser. This enables Zoom (local app) SSO login.
- Added fwupd in IGEL OS as base for upcoming BIOS-related apps.
- Added custom data partition (e.g. for storing images for screensaver slide show)
```

|  Parameter  |  Registry   |  Range      |  Value      |
| ------ | ------ | ------ | ------ |
|  `Custom Data Partition Size`  |  `custom_data_partition.size`  |  [(empty)][small][medium][large][(fixed size)]  |  **  |
  
```
	 - Leave empty if this partition is not desired. Apart from small, medium and large an integer may be specified, potentially with K, M or G appended to refer to the respective multiplier. Changes are effective after reboot. The mount point is /custom-data/
- Added option to perform an AD/Kerberos auto logon with predefined credentials.
```

| IGEL Setup | Parameter | Registry | Value |
| ------ | ------ | ------ | ------ |
| `Security / Logon / Active Directory/Kerberos` | `Delay between autologin attempts` | `auth.login.autologin.delay` | `5` |
| `Security / Logon / Active Directory/Kerberos` | `Automatically perform login` | `auth.login.autologin.enable` | **disabled** (default)  / enabled |
| `Security / Logon / Active Directory/Kerberos` | `Username for autologin` | `auth.login.autologin.username` | `` |

```
- Changed update parameter to enhance control over management of assigned apps.. Registry keys were kept to be backward compatible.
```

|  Parameter  |  Registry   |  Type       |  Value      |
| ------ | ------ | ------ | ------ |
|  `Show download progress notification`  |  `update.show_download_progress`  |  bool  |  *true*/false |
|  `Action on app assignment`  |  `update.autoactivate_future_config`  |  range  |  [*Download and activate*][Download][Nothing]  |
|  `Action on app activation`  |  `update.reboot_without_user_interaction`  |  range  |  [*Ask*][Reboot][Nothing]  |

```
- Changed and improved local jobs feature, formerly known as cron job (RTCwake is experimental)
```

|  Parameter  |  Registry  |  Type  |  Value  |
| ------ | ------ | ------ | ------ |
|  `If the hw supports it, if this is mark the system will boot up to trigger the action` |  `system.cron.cronjob%.wake_system_on_boot` |  bool  |  *true*/false  |
|  `Job name use for reference` |  `system.cron.cronjob%.name` |  <string>  |  <>  |
|  `Set the user that will run the systemd timer`  |  `system.cron.cronjob%.user` |  range <string>  |  [*root*][user]  |
|  `Set the type of the systemd service that will run the job` |  `system.cron.cronjob%.type` |  range <string>  |  [*custom*][update]  |
|  `Set the command that will be executed at the service timer, if update is defined, the default task of pospone update will be use` |  `system.cron.cronjob%.command` |  string  |  <>  |
|  `Set when the systemd timer needs to be execute in calendar time form. For more information https://manpages.debian.org/buster/systemd/systemd.time.7.en.html` |  `system.cron.cronjob%.calendar_time` |  string  |  <>  |
|  `Set the a random time offset if desire. If not defined it is not use` |  `system.cron.cronjob%.offset` |  string  |  <>  |

```
- Removed VNC Viewer accessory from base system. Tiger VNC Viewer is now offered as an app - as an replacement and to offer a more flexible solution for these session types.
- Updated kernel to version 6.6.60.
- Updated End User License Agreement (EULA) to the February 2025 version.

- **OSC Installer**

	- Changed: Shutdown will be triggered after successful OS installation in unattended mode. Only the PXE installer is still using a reboot action as default.
	- PXE installation is now compatible with Secure Boot.

- **App Management**

	- Changed: Dependency apps are automatically removed if corresponding dependent app(s) are removed.
	- Added support for apps created via IGEL App Creator Portal. These apps are signed by corresponding app signing certificate, issued by IGEL via App Creator Portal. In order to install an app downloaded from IGEL App Creator Portal, the following steps are necessary:
		- Import of received app signing certificate (.crt) as file in UMS using the type "App Signing Certificate"
		- Import app in UMS (as usual)
		- Assigning received certificate and app to the endpoint(s)
	- Added: Possibility to download apps from custom webserver. If any custom webserver is configured, the system will first try to download from the custom webserver. Fallback are the configured app repositories. Requires UMS 12.07.100 or later.
```

|  Parameter  |  Registry   |  Type       |  Value      |
| ------ | ------ | ------ | ------ |
|  `Password for HTTP Auth`  |  `update.external_binary_source%.password`  |  string  |    |
|  `Priority, sources with higher priority will be tried first`  |  `update.external_binary_source%.priority`  |  int  |  100 |
|  `The base URL of the source, apps must be located in a specific subfolder structure`  |  `update.external_binary_source%.url`  |  string  |    |
|  `Root CA certificate to validate the SSL connection`  |  `update.external_binary_source%.certificate`  |  string  |    |
|  `Username for HTTP Auth`  |  `update.external_binary_source%.username`  |  string  |    |

```
- **Network**

	- Added ready-made challenge password retrieval for Microsoft NDES
	  - Set the following to NDES for enabling the feature:
```

|  Parameter  |  Registry   |  Range      |  Type       |  Value      |
| ------ | ------ | ------ | ------ | ------ |
|  `Password`  |  `network.scepclient.cert%.ndes.challenge_password_retrieval.crypt_password`  |     |  string  |  empty *Default*  |
|  `Ready-made Challenge Password Command`  |  `network.scepclient.cert%.use_ready_made_challenge_password_command`  |  [none][NDES]  |  string  |  *none*   |
|  `User name`  |  `network.scepclient.cert%.ndes.challenge_password_retrieval.user`  |     |  string  |  empty *Default*  |

```
	  - If the following is not 'none', https will be used. The default "getca" means the CA certificate received in the SCEP GetCA operation. The full path to a different CA certificate may also be specified.
```

|  Parameter  |  Registry   |  Range      |  Type       |  Value      |
| ------ | ------ | ------ | ------ | ------ |
|  `Debug level`  |  `network.scepclient.cert%.ndes.challenge_password_retrieval.debuglevel`  |     |  integer  |  0 *Default*  |
|  `CA certificate`  |  `network.scepclient.cert%.ndes.challenge_password_retrieval.cacert`  |   [none (not using https)][from getca operation]   |  string  |   *from getca operation*   |

```
	  - Added configuration for PKCS#7 encryption and signature algorithms (see sscep options -E and -S)
```

|  Parameter  |  Registry   |  Range      |  Type       |  Value      |
| ------ | ------ | ------ | ------ | ------ |
|  `PKCS#7 signature algorithm`  |  `network.scepclient.cert%.signalg`  |  [automatic][md5][sha1][sha224][sha256][sha384][sha512]  |  string  |  __ (automatic)  |
|  `PKCS#7 encryption algorithm`  |  `network.scepclient.cert%.encalg`  |  [automatic][des][3des][blowfish][aes128][aes192][aes256]  |  string  |  __ (automatic)  |

```
	  - Content-Type: application/x-pki-message is sent according to RFC 8894 if the following new option is enabled:
```

|  Parameter  |  Registry   |  Range      |  Type       |  Value      |
| ------ | ------ | ------ | ------ | ------ |
|  `Send Content-Type`  |  `network.scepclient.cert%.sscep.send_content_type`  |     |  bool  |  enabled / _disabled_ (default)  |

```
	  - SCEP: When the CA fingerprint or the CA identifier is changed the client certificate and the client key are not discarded anymore. Just new CA and RA certificates will be downloaded.
	- Added registry key for ignoring hostname received via DHCP
```

|  Parameter  |  Registry   |  Type       |  Value      |
| ------ | ------ | ------ | ------ |
|  Ignore hostname received via DHCP  |  network.dns.hostname_ignore_dhcp  |  bool  |  enabled / _disabled_ (default)  |

```
	- Added MAC address passthrough among Ethernet devices. With the following registry key a LAN device can be specified from which the MAC address shall be adopted. The donor device and any conflicting receiver device will be removed (by unbinding the driver) as long as the receiving device is present.
```

| Parameter | Registry | Range | Value |
| ------ | ------ | ------ | ------ |
| `MAC address source` | `network.interfaces.ethernet.device%.mac_source` | [none][LAN][LAN2][LAN3][LAN4] | *none* |

```
	  - Example: If LAN2 and LAN3 are configurations for docking stations that shall adopt the MAC address from LAN, the following two parameters must be set to "LAN":
	    - network.interfaces.ethernet.device1.mac_source
	    - network.interfaces.ethernet.device2.mac_source
	  - Warning: Misconfiguration may result in loss of connectivity

- **WiFi**

	- Added support for WiFi module of ATrust mt183W.

- **Driver**

	- Updated Nvidia driver to version 535 (Debian Bookworm version)

- **Multimedia**

	- Added registry key to switch from fluendo to vaapi gstreamer plugin for h264 hardware acceleration.
```

|  Parameter  |  Registry   |  Type       |  Value      |
| ------ | ------ | ------ | ------ |
|  `Switch from Fluendo to VAAPI h264 hardware accelerated decoder.`  |  `multimedia.gstreamer.use_vaapi_for_h264`  |  bool  |  enabled / *disabled* (default)  |

```
	- Added VP9 and AV1 video hardware acceleration.
	- Updated Fluendo multimedia codecs to the following version:
	  - gst-fluendo-asfdemux to version 1.0.2
	  - gst-fluendo-h264dec to version 1.0.10
	  - gst-fluendo-hwvadec to version 1.0.10
	  - gst-fluendo-mp3dec to version 1.0.5
	  - gst-fluendo-mpeg4vdec to version 1.0.2
	  - gst-fluendo-wmadec to version 1.0.2
	  - gst-fluendo-wmvdec to version 1.0.2

- **Hardware**

	- Added hardware support for Lenovo ThinkPad L16 Gen1 Intel
	- Added function key support for Lenovo ThinkPad L13 Gen5 Intel, L14 Gen5 AMD/Intel, L16 Gen1 AMD/Intel:
		 - Fn+F1: Loudspeaker Off
		 - Fn+F2: Reduce audio volume
		 - Fn+F3: Increase audio volume
		 - Fn+F4: Mute microphone
		 - Fn+F5: Reduce display brightness
		 - Fn+F6: Increase display brightness
		 - Fn+F7: Display configuration
		 - Fn+F8: Thermal profile mode (L13 Gen5 Intel: Flight mode)
		 - Fn+Ctrl+F9: Screenshot (L13 Gen5 Intel: not mapped to any function)
		 - Fn+Ctrl+F10: Snipping Tool (L13 Gen5 Intel: not mapped to any function)
		 - Fn+Ctrl+F11: Maximise focused window (L13 Gen5 Intel: not mapped to any function)
	- Added hardware support for Lenovo ThinkCentre M75q Gen5.
	- Added hardware support for Lenovo ThinkCentre M70q Gen5.
	- Added configuration-driven hardware detection system.
	- Added hardware support for Lenovo ThinkPad L13 Gen5 Intel
	- Added support for Poly headsets (verified with HP mt645 G8 and t655)
		- Poly Voyager 4320 Microsoft Teams Certified
		- Poly Voyager Focus 2 Microsoft Teams Certified
		- Poly Blackwire 5220 Stereo USB-C Headset
		- Poly Blackwire 3320 Stereo Microsoft Teams Certified
		- Poly Blackwire 3220 Stereo USB-C Headset
		- Poly DA85-M USB to QD Adapter (allows the EP520 (and other Poly quick disconnect headsets) to connect to a USB port on the computer.)
		- Poly EP 520 Bin Headset +QD, incl. Poly DA85-M USB to QD Adapter (allows the EP520 (and other Poly quick disconnect headsets) to connect to a USB port on the computer.)
		- Poly EncorePro 310 Monaural USB-A Headset
		- Poly Savi 8220-M Stereo D2 Headset
		- Poly Savi 8420 Stereo -M D2 Headset
		- Poly Savi 8220 -M D2 USB-A Headset
		- Poly Voyager Free 60+ UC M Carbon Black
	- Note: Call Control via HID buttons is currently not supported.
	- Added hardware support for Lenovo ThinkPad L16 Gen1 AMD.
	- Added hardware support for HP Elite t660 thin client.
	- Replaced the self-developed “Webcam Information” tool with qcam, a standard utility included in most Linux distributions.
	- Updated grub boot code to version 2.12 which fixes a issue with out of memory if using 4K monitor.
	- Changed hardware names of supported LG devices (to only use underscores instead of spaces).

- **Remote Management**

	- Added support for application priorities when performing "Specific device commands" from the WUMS.
	- Added support for Wake on LAN proxy.
	- Added support for UMS files of type 'App Signing Certificate'.
	- Added support for dynamic file types.
	- Added setup parameter to set connection timeout
```

|  Parameter   |  Registry    |  Type        |  Value       |
| ------ | ------ | ------ | ------ |
|  `IGEL Remote Management Connect Timeout`        |  `system.remotemanager.connect_timeout`              |  integer                            |  timeout in sec / *45* (default)  |

```
	- Added new fallback strategy for connecting to UMS - now utilizing the list of UMS and ICG server addresses from last successful connection.

- **IGEL Desktop**

	- Added a new generic form dialog framework. A detailed documentation (how to use) will be provided via IGEL Knowledge Base.
		 - OpenVPN authentication dialog uses now the newly designed dialog framework.
	- Added: Prevent user from dimming display brightness completely.
	- Added new parameters to configure which notifications should be shown to the user
```

|  Parameter  |  Registry   |  Type       |  Value      |
| ------ | ------ | ------ | ------ |
|  `Action for suppressed notifications with user actions`  |  `notification.action_on_suppressed_notifications_with_user_action`  |  range  |  [*default*][cancel]  |
|  `Show notifications greater or equal to a specific severity`  |  `notification.show_notification_severity`  |  range  |  [*all*][info][warning][error][none]  |
|  `Show suppressed notifications in notification panel`  |  `notification.show_suppressed_notifications_in_panel`  |  bool  |  *true*/false |
|  `Suppress notification with user actions`  |  `notification.suppress_notifications_with_user_action`  |  bool  |  *true*/false |

```
	- Changed: Utilizing the newly introduced generic form dialog framework for the user password prompt during session startup.
	- Added new hotkey to enable logoff with a keybinding:
```

|  Parameter  |  Registry   |  Type       |  Value  |
| ------ | ------ | ------ | ------ |
|  `key for hotkey`  |  `sessions.wmcommands16.hotkeymodifier`  |  `range`  |  `Ctrl` (default)  |
|  `enable hotkey`  |  `sessions.wmcommands16.usehotkey`  |  `bool`  |  true/*false* (default)  |
|  `key for hotkey`  |  `sessions.wmcommands16.hotkey`  |  `string`  |  "l" (default)  |

```
- **Licensing**

	- Added catalog entry for add-on license "IGEL Advanced Device Redirection"
	- Added License Enforcement: After a 28-day grace period following the expiration of a subscription license, the apps will become non-functional. Users will receive notifications displaying the remaining days in grace period.

- **Mobile Broadband**

	- Added support for WWAN connection with Quectel EM160R-GL.

- **Virtualization**

	- Added hardware support for SINA workstation.
	- Added clipboard support to allow copy and paste from VMware Hypervisor (vSphere) to IGEL OS 12 guest.

## Security Fixes

- Fixed xorg-server security issue CVE-2024-9632.
- Fixed libheif security issues CVE-2024-41311, CVE-2023-49462 and CVE-2023-29659.
- Fixed python-reportlab security issue CVE-2023-33733.
- Fixed webkit2gtk security issues  CVE-2024-44185, CVE-2024-44244, CVE-2024-44296, CVE-2024-4558, CVE-2024-40794, CVE-2024-40789, CVE-2024-40785, CVE-2024-40782, CVE-2024-40780, CVE-2024-40779 and CVE-2024-40776.
- Fixed nss security issues CVE-2024-6609, CVE-2024-6602 and CVE-2024-0743.
- Fixed libarchive security issue CVE-2024-20696.
- Fixed curl security issue CVE-2024-8096.
- Fixed nghttp2 security issue CVE-2024-28182.
- Fixed ntfs-3g security issue CVE-2023-52890.
- Fixed python3.11 security issue CVE-2024-6232.
- Fixed sqlite3 security issue CVE-2023-7104.
- Fixed openssl security issues CVE-2024-9143 and CVE-2024-5535.
- Fixed python-cryptography security issues CVE-2024-26130 and CVE-2023-49083.
- Fixed ghostscript security issues CVE-2024-46956, CVE-2024-46955, CVE-2024-46953, CVE-2024-46952 and CVE-2024-46951.
- Fixed mpg123 security issue CVE-2024-10573.
- Fixed webkit2gtk security issues CVE-2024-44308 and CVE-2024-44309

## Resolved Issues

- Fixed documentation folder on Lenovo devices preinstalled with IGEL OS.
- Fixed LVFS command line tool fwupdmgr which resulted in the wrong Efi System Partion being selected for BIOS updates.
- Fixed credential passthrough from AD/Kerberos login to applications. In some cases a double login was necessary to perform.
- Fixed keyboard layouts
- Added new parameter to prohibit browsing the whole filesystem in the gtk-filechooser.
```

|  Parameter  |  Registry   |  Type       |  Value      |
| ------ | ------ | ------ | ------ |
|  `Prohibit browsing the whole filesystem`  |  `userinterface.gtk.filechooser.prohibit_filesystem_browsing`  |  bool  |  *enabled* (default) / disabled  |

```
- Fixed instability which occurred if endpoint was not rebooted for > 10 days. Endpoint was not possible to shutdown or reboot, app updates were not performed -  hard reboot was necessary to perform.
- Fixed display of drop down boxes in login screen.
- Fixed: Energy Star logo (shown in the power management options for supported HP devices) is shown after resume from suspend.
- Fixed permission problem with USB storage device removal.
- Fixed sporadic AD passthrough authentication failure, e.g. with RD Web Access login.
- Fixed Grub error message during boot about "/boot/grub/fonts/" not found.
- Fixed displaying of custom boot splash on AMD platforms.
- Removed the help menu from Network Tools, as there are no help databases anyway

- **OSC Installer**

	- Fixed settings injection via IGEL OS Creator.

- **App Management**

	- Fixed credential handling for downloading packages via Distributed App Repository.

- **Network**

	- Fixed iptables usage by adding back symlinks.
	- SCEP: Added a registry key for the case where the SCEP environment does not support certificate renewal in the SCEP sense, i.e. where starting over with the challenge password in the CSR is required.
```

|  Parameter  |  Registry   |  Range      |  Value      |
| ------ | ------ | ------ | ------ |
|  `Renewal method`  |  `network.scepclient.cert%.renewal_method`  |  [Renewal][Start-over][Fallback to start-over]  |  *Renewal*  |

```
	- Fixed issue with e1000e network card not working with powersave settings.
	- Added new registry key to add drivers to blacklist for powersave settings
```

|  Parameter  |  Registry   |  Type       |  Value      |
| ------ | ------ | ------ | ------ |
|  `List of drivers seperated by space which have issues with powersave settings.`  |  `system.powersave.powertop_drivers_blacklist`  |  string  |  empty *Default*  |

```
	- Fixed not using 2.5 Gbit/s or 5 Gbit/s network speed although possible.
	- Fixed wrong error messages "Proxy authentication failed." in case proxy does not require authentication.
	- Added parameters to control network proxy error messages. The total amount of messages and the message timeout can be configured:
```

| Parameter | Registry | Value |
| ------ | ------ | ------ |
| `Timeout for proxy error messages` | `network.proxy.settings.sys_proxy_message_timeout` | `10 (default)` |
| `Amount of proxy error messages to show` | `network.proxy.settings.sys_proxy_message_count` | `1 (default)` |

```
	- Fixed automatic network proxy with PAC file: if the PAC script indicates DIRECT for a requested URI, the connection is established directly and not via proxy as before. Furthermore, if no PAC file is specified or can be loaded, all connections are being established directly.
	- Fixed instabilities when using automatic network proxy.
	- Fixed ignoring network proxy URL if no port number is specified.

- **WiFi**

	- Added registry key to allow Network Manager to try a WPA2 configuration when SAE is desired but driver or hardware lack capablities:
```

|  Parameter  |  Registry   |  Type       |  Value      |
| ------ | ------ | ------ | ------ |
|  `SAE dependent on hardware/driver`  |  `network.interfaces.wirelesslan.device0.wpa.sae_capability_dependent`  |  bool  |  enabled / *disabled* (default)  |

```
		 - This  can be useful in situations where the access point offers WPA3 Personal and WPA2 Personal at the same time.
	- Fixed not possible Wi-Fi connection after entering an incorrect password once.

- **Smartcard**

	- Fixed smartcard resource manager (pcsc-lite) to enable seamless smartcard usage in IGEL AVD, IGEL Remote Desktop, and IGEL Windows 365 sessions.

- **HID**

	- Fixed auto-suspend of USB HID (non us-locale systems)
	- Fixed: The mouse pointer no longer jumps to the center of the primary screen when switching the primary mouse button through the Input Tray app.
	- Fixed hotkey functionality for enabling/disabling the touchpad.

- **Driver**

	- Fixed potential read/write errors for devices utilizing the O2 Micro, Inc. FORESEE E2M2 NVMe SSD bridge. Affected systems include the HP t660 and HP t655.

- **OS Update**

	- Fixed a possible failure while creating of custom CI, logging or debugging partitions.

- **Storage Devices**

	- Fixed start of Disk Utility Accessory after suspend and resume of a device.
	- Fixed external USB drives with partitions using NTFS filesystem (Storage Hotplug).

- **Audio**

	- Added registry keys to prevent automatic switch of bluetooth profile:
		 - For pulseaudio:
```

|  Parameter  |  Registry  |  Type  |  Value  |
| ------ | ------ | ------ | ------ |
|  `Set pulseaudio auto switching headset to A2DP`  |  `multimedia.pulseaudio.daemon.module-bluetooth-autoswitch-to-a2dp`  |  bool  |  *enabled* (default) / disabled  |

```
- For pipewire:
```

|  Parameter  |  Registry   |  Type       |  Value      |
| ------ | ------ | ------ | ------ |
|  `Autoselection to headset profile`  |  `multimedia.pipewire.wireplumber.autoswitch-to-headset-profile`  |  bool  |  *enabled* (default) / disabled  |

```
	- Fixed internal microphone on Lenovo ThinkPad L14 and L15 Gen4 (AMD).
	- Added registry key to enable / disable analog only profile in pipewire:
```

|  Parameter  |  Registry   |  Type       |  Value      |
| ------ | ------ | ------ | ------ |
|  `Enable analog only profile`  |  `multimedia.pipewire.wireplumber.enable-analog-only-profile`  |  bool  |  *enabled* (default) / disabled  |
 
```
	- Added registry parameter for switching rear side line-out to a line-in in HP t660 (requires a reboot to become active):
```

|  Parameter  |  Registry   |  Type       |  Value      |
| ------ | ------ | ------ | ------ |
|  `Switch back jack to line-in`  |  `system.sound_driver.snd_hda_intel.hp_t660_back_microphone`  |  bool  |  enabled / *disabled* (default)  |


|  Parameter  |  Registry   |  Type       |  Value      |
| ------ | ------ | ------ | ------ |
|  `Ignore dB`  |  `multimedia.pulseaudio.daemon.ignore-db`  |  bool  |  enabled / *disabled* (default)  |

```
	- Any decibel information given by the ALSA drivers will be ignored (useful if that information is wrong).
	- Fixed internal microphone not working on Lenovo E16 Gen 2 AMD
	- Improved default output device selection

- **Hardware**

	- Fixed Wake on LAN for Dell OptiPlex 3000.
	- Changed network driver on Lenovo Thinkpad L16 AMD Gen1 to r8168 by default.
	- The legacy device IGEL UD7 Model H850C is now shown correctly as "UC1-LX" (not fully supported / unsupported device) instead of "UD7-LX10" in the "About" info page of OS12.
	- Changed network driver on Lenovo ThinkCentre M75q Gen5 to r8168 by default.
	- The "About" page and the OSC installer show the correct device type and product id for the LG 24CN65x series.
	- The "About" page and the OSC installer show the correct device type and product id for the LG 34CN65x series.

- **Remote Management**

	- Fixed installation process of custom CI defined by UMS FWC objects.
	- Fixed rmagent not waiting for correct unit_id
	- Fixed fingerprint check during onboarding if root certificate of a public CA is imported into the UMS.
	- Fixed connecting process on devices having two or more active NICs.
	- Fixed file installation - now it is ensured that all assigned files are installed before applying settings and installing apps. This also fixes the deployment of app signing certificate and app that depends on the certificate at the same time.

- **IGEL Desktop**

	- Fixed application full screen behavior when another monitor is primary than the first.
	- Changed: Login mask for local login is shown on primary screen (instead of the first screen).
	- Fixed: Desktop starts correctly when IGEL disclaimer is configured.
	- Changed timeout for spinning mouse cursor upon wake up from suspend from 60 to 15 seconds.
	- Fixed AD / Kerberos login name handling. By default the name is not expanded with the domain any more (e.g. user -> user@EXAMPLE.COM). To restore the old behavior, set the following parameter:
```

| Parameter | Registry | Value |
| ------ | ------ | ------ |
| `Expand user name` | `auth.login.expand_username` | enabled / **disabled** (default) |

```
	- Fixed additional desktop restart when device encryption with PIN is used.
	- Fixed shadowing dialog disappearing after 2 seconds if language was other than English.
	- Fixed visibility of Kerberos login extension input fields.
	- Fixed issue with screens stays black after hotplug of USB-C dockingstations.

- **Licensing**

	- Fixed issue with license is not detected on some devices.
	- Fixed licensing issue where endpoints appeared unlicensed after suspend.

- **SSO**

	- Fixed Cloud ID Provider login to support more generic OpenID Connect providers, especially Cyberark.

- **Virtualization**

	- Fixed IGEL OS running as a virtual machine on a SINA Workstation S:
		- Added detection method to identify SINA WS host from IGEL OS.
		- Removed the VBoxClient clipboard and drag&drop services.
		- Added VBoxClient vmsvga support.

## Known Issues

- The downgrade to base system 12.00.900 or 12.00.910 is not supported.
- In very rare cases all apps are lost after an update. Should this be the case, an error message is shown "Opening system App Journal failed." - if the device is manged, the apps will be reinstalled after a reboot.
- Increased writeable cache partition size (by default). First boot with 12.4.x and newer may take more time (once) when updating from a 12.2.x or older base system app.
- Automatic proxy configuration: PAC file URL does not support https scheme.

- **Chromium**

	- Downgrading base system to earlier versions may result in reset of the Chromium profile partition.

- **Network**

	- In some cases, network is not working in combination of Lenovo K14 Gen1 (AMD) and Lenovo Universal Dock. There is a kernel bugreport open but no proper fix so far.
	- Device configured as Wake on LAN proxy can be shut down by the user or admin
	- If automatic network proxy with PAC file is used, the PAC file will be downloaded multiple times.
	- Proxy passthrough authentication together with AD auto logon does work despite of shown error message during logon.

- **WiFi**

	- WiFi chipset BE200 does not work reliable in WiFi 7 networks.

- **HID**

	- Some touchpads are recognized as touchpad and mouse. This results in showing possible user settings for both variants.

- **Setup Assistant**

	- Timezone auto-detection is currently not functional (due to discontinued location service). The timezone must be set manually (as interims / alternative solution).

- **Audio**

	- Headset mic via jack is not working on LG 27CN650 and LG 34CN650.

- **Multimedia**

	- Lenovo L13 Gen5 and L14 Gen5  Intel video codec errors (graphic glitches during accelerated video playback)
	- Playback of H.264 videos with GPU decoding over a long duration may result in increased memory consumption. As a workaround the gstreamer-vaapi plugin can be enabled with this parameter:
```

|  Parameter  |  Registry   |  Type       |  Value      |
| ------ | ------ | ------ | ------ |
|  `Switch from Fluendo to VAAPI h264 hardware accelerated decoder.`  |  `multimedia.gstreamer.use_vaapi_for_h264`  |  bool  |  enabled / *disabled* (default)  |

```
- **Hardware**

	- Wake on LAN is not functional on Lenovo K14 Gen1
	- Built-in fingerprint sensor is not supported on HP mt440 G3 and mt645 G7/G8.
	- If using 6 x 4K@60Hz monitors on HP t755/t740 with the additional graphic card, one or two of the monitors may stay black after coming back from DPMS off state.
	  This is caused by using the additional graphic card as primary, which only has 512MB VRAM (the VRAM is not sufficient in this configuration). Possible solution: Increasing the VRAM size of the iGPU to 2048MiB in BIOS (maybe 1024MiB may also work) and activate IGEL registry key `x.drivers.swap_card0_with_card1` so the iGPU will become the Primary GPU. Connector names will be changed with that!
	- Wake up from suspend via UMS does not work on HP mt645 G7 devices. Workaround: Disable system suspend and use shutdown instead.
	- Rotation of displays connected to the Lenovo ThinkPad USB-C Hybrid Dock may fail.
	- Display configuration of displays connected to HP G5 Docking Station may fail on HP t655. Furthermore displays connected to HP G5 Docking Station may not work anymore after system suspend and resume independent from the used hardware.
	- The "Star" special key on recent Lenovo laptop models has not yet been implemented. It's supposed to show the URL bar on a running web browser or launch the default browser if none is running.
	- On Lenovo ThinkPad L13 Intel Gen5, the functions keys Ctrl+Fn+F9, Ctrl+Fn+F10 and Ctrl+Fn+F11 are not mapped.

- **IGEL Desktop**

	- On-screen keyboard sporadically crashes when typing.
	- If two monitors are configured in a vertical layout (one above the other), and those monitors are configured with "auto-detect" resolution, saving leads to a wrong layout order.
	- Disabled compositing (transparency effects) in window manager to circumvent issues with screen lock. Registry key `windowmanager.wm0.variables.usecompositing` is not configurable anymore.

- **Licensing**

	- Manual deployment of add-on licenses for IGEL Agent for Imprivata licenses (via UMS) is only possible after finished installation of IGEL Agent for Imprivata app on device.

- **Mobile Broadband**

	- F11 flight mode function key does not switch off mobile broadband on HP Elite mt645 G7. (Deactivate mobile broadband in Network / Mobile Broadband settings)

- **Virtualization**

	- Changing the display configuration (monitor order and layout) should be done from the SINA OS menu bar. Change on IGEL OS results in faulty resolution settings and a mouse offset.
	- After a fresh OSC installation or factory reset, the IGEL "Welcome" screen has a mouse offset when using a dual monitor setup. Workaround: Select any available display configuration from the SINA OS menu bar to trigger an event which sets the correct resolution and therefore solves the issue.
	- If a second display was configured as the primary SINA OS display and is subsequently unplugged, IGEL OS might use the wrong resolution for the primary display. Using the SINA OS key combination Ctrl+Alt+o to show the taskbar is going to trigger a resize event, which automatically sets the correct resolution again. This affects SINA Workstation only.
	- SINA OS supports only 2 displays. If a docking station with 2 external displays is used, make sure to close the Laptop lid prior to starting IGEL OS. Do not open the Laptop lid when 2 external displays are connected.
```

----

## 2024-12-17 - [12.5.2](https://app.igel.com/base_system/12.5.2)

```
The new BUILD 12.5.2 for IGEL Workspace is ready.

These are the release notes published with that release:

# Changes since: 12.5.1

## Security Fixes

- Fixed nss security issues CVE-2024-6609, CVE-2024-6602 and CVE-2024-0743.
- Fixed libarchive security issue CVE-2024-20696.
- Fixed ghostscript security issues CVE-2024-46956, CVE-2024-46955, CVE-2024-46953, CVE-2024-46952 and CVE-2024-46951.
- Fixed libheif security issues CVE-2024-41311, CVE-2023-49462 and CVE-2023-29659.
- Fixed python3.11 security issue CVE-2024-6232.
- Fixed python-cryptography security issues CVE-2024-26130 and CVE-2023-49083.
- Fixed python-reportlab security issue CVE-2023-33733.
- Fixed webkit2gtk security issues CVE-2024-4558, CVE-2024-40794, CVE-2024-40789, CVE-2024-40785, CVE-2024-40782, CVE-2024-40780, CVE-2024-40779 and CVE-2024-40776.

## Resolved Issues

- Fixed sporadic AD passthrough authentication failure, e.g. with RD Web Access login.

- **App Management**

	- Fixed credential handling for downloading packages via Distributed App Repository.

- **HID**

	- Fixed auto-suspend of USB HID (non us-locale systems)

## Known Issues

- The downgrade to base system 12.00.900 or 12.00.910 is not supported.
- In very rare cases all apps are lost after an update. Should this be the case, an error message is shown "Opening system App Journal failed." - if the device is manged, the apps will be reinstalled after a reboot.
- Increased writeable cache partition size (by default). First boot with 12.4.x and newer may take more time (once) when updating from a 12.2.x or older base system app.
- Automatic proxy configuration: PAC file URL does not support https scheme.

- **Chromium**

	- Downgrading base system to earlier versions may result in reset of the Chromium profile partition.

- **Network**

	- In some cases, network is not working in combination of Lenovo K14 Gen1 (AMD) and Lenovo Universal Dock. There is a kernel bugreport open but no proper fix so far.
	- Device configured as WolProxy can be shut down by the user or admin
	- If automatic network proxy with PAC file is used, the PAC file will be downloaded multiple times.

- **HID**

	- Some touchpads are recognized as touchpad and mouse. This results in showing possible user settings for both variants.

- **Setup Assistant**

	- Timezone auto-detection is currently not functional (due to discontinued location service). The timezone must be set manually (as interims / alternative solution).

- **Audio**

	- Headset mic via jack is not working on LG 27CN650 and LG 34CN650.

- **Hardware**

	- Wake on LAN is not functional on Dell OptiPlex 3000 and Lenovo K14 Gen1
	- Built-in fingerprint sensor is not supported on HP mt440 G3 and mt645 G7/G8.
	- If using 6 x 4K@60Hz monitors on HP t755/t740 with the additional graphic card, one or two of the monitors may stay black after coming back from DPMS off state.
	 - This is caused by using the additional graphic card as primary, which only has 512MB VRAM (the VRAM is not sufficient in this configuration). Possible solution: Increasing the VRAM size of the iGPU to 2048MiB in BIOS (maybe 1024MiB may also work) and activate IGEL registry key `x.drivers.swap_card0_with_card1` so the iGPU will become the Primary GPU. Connector names will be changed with that!
	- Wake up from suspend via UMS does not work on HP mt645 G7 devices. Workaround: Disable system suspend and use shutdown instead.
	- Rotation of displays connected to the Lenovo ThinkPad USB-C Hybrid Dock may fail.
	- Display configuration of displays connected to HP G5 Docking Station may fail on HP t655.
	- Lenovo L13 Gen5 and L14 Gen5  Intel video codec errors (graphic glitches during accelerated video playback)
	- GRUB version 2.8 in combination with HP Elite t660 (BIOS 0.20) will run into "Out of memory" errors whenever the GRUB boot menu is displayed. This happens:
		- Always in OSC.
		- When entering boot menu by pressing Escape during regular IGEL OS startup.
		- A workaround is to [temporarily] boot OSC in verbose mode or connect an HD display when requiring access to the IGEL OS boot menu. This will be fixed in IGEL OS 12.6 by switching to GRUB 2.12.
	- The "Star" special key on recent Lenovo laptop models has not yet been implemented. It's supposed to show the URL bar on a running web browser or launch the default browser if none is running.
	- HP Elite t660 units may run into SquashFS errors during startup. This happens primarily during stress tests. As a workaround, please restart the unit.
	- On Lenovo ThinkPad L13 Intel Gen5, the functions keys Ctrl+Fn+F9, Ctrl+Fn+F10 and Ctrl+Fn+F11 are not mapped.

- **IGEL Desktop**

	- On-screen keyboard sporadically crashes when typing.
	- If two monitors are configured in a vertical layout (one above the other), and those monitors are configured with "auto-detect" resolution, saving leads to a wrong layout order.
	- Disabled compositing (transparency effects) in window manager to circumvent issues with screen lock. Registry key `windowmanager.wm0.variables.usecompositing` is not configurable anymore.

- **Licensing**

	- Manual deployment of add-on licenses for IGEL Agent for Imprivata licenses (via UMS) is only possible after finished installation of IGEL Agent for Imprivata app on device.

- **Mobile Broadband**

	- F11 flight mode function key does not switch off mobile broadband on HP Elite mt645 G7. (Deactivate mobile broadband in Network / Mobile Broadband settings)

- **Virtualization**

	- Changing the display configuration (monitor order and layout) should be done from the SINA OS menu bar. Change on IGEL OS results in faulty resolution settings and a mouse offset.
	- After a fresh OSC installation or factory reset, the IGEL "Welcome" screen has a mouse offset when using a dual monitor setup. Workaround: Select any available display configuration from the SINA OS menu bar to trigger an event which sets the correct resolution and therefore solves the issue.
	- If a second display was configured as the primary SINA OS display and is subsequently unplugged, IGEL OS might use the wrong resolution for the primary display. Using the SINA OS key combination Ctrl+Alt+o to show the taskbar is going to trigger a resize event, which automatically sets the correct resolution again. This affects SINA Workstation only.
	- SINA OS supports only 2 displays. If a docking station with 2 external displays is used, make sure to close the Laptop lid prior to starting IGEL OS. Do not open the Laptop lid when 2 external displays are connected.
```

----

## 2024-11-14 - [12.5.1](https://app.igel.com/base_system/12.5.1)

```
The new BUILD 12.5.1 for IGEL Workspace is ready.

These are the release notes published with that release:

# Changes since: 12.5.0

## New Features

- Added a new generic form dialog framework. A detailed documentation (how to use) will be provided via IGEL Knowledge Base.
	 - OpenVPN authentication dialog uses now the newly designed dialog framework.
- Added secure mini browser as default handler for URLs without installation of a full browser. This enables Zoom (local app) SSO login.
- Added fwupd in IGEL OS as base for upcoming BIOS-related apps.
- Added custom data partition (e.g. for storing images for screensaver slide show)
```

|  Parameter  |  Registry   |  Range      |  Value      |
| ------ | ------ | ------ | ------ |
|  `Custom Data Partition Size`  |  `custom_data_partition.size`  |  [(empty)][small][medium][large][(fixed size)]  |  **  |
	 
```
	 - Leave empty if this partition is not desired. Apart from small, medium and large an integer may be specified, potentially with K, M or G appended to refer to the respective multiplier. Changes are effective after reboot. The mount point is /custom-data/
- **OSC Installer**
	- Changed: Shutdown will be triggered after successful OS installation in unattended mode. Only the PXE installer is still using a reboot action as default.
- **App Management**
	- Changed: Dependency apps are automatically removed if corresponding dependent app(s) are removed.
	- Added: Possibility to download apps from custom webserver. If any custom webserver is configured, the system will first try to download from the custom webserver. Fallback are the configured app repositories. Requires UMS 12.07.100 or later.
```

|  Parameter  |  Registry   |  Type       |  Value      |
| ------ | ------ | ------ | ------ |
|  `Password for HTTP Auth`  |  `update.external_binary_source%.password`  |  string  |    |
|  `Priority, sources with higher priority will be tried first`  |  `update.external_binary_source%.priority`  |  int  |  100 |
|  `The base URL of the source, apps must be located in a specific subfolder structure`  |  `update.external_binary_source%.url`  |  string  |    |
|  `Root CA certificate to validate the SSL connection`  |  `update.external_binary_source%.certificate`  |  string  |    |
|  `Username for HTTP Auth`  |  `update.external_binary_source%.username`  |  string  |    |

```

- **Network**

	- Added ready-made challenge password retrieval for Microsoft NDES
	  - Set the following to NDES for enabling the feature:
```

|  Parameter  |  Registry   |  Range      |  Type       |  Value      |
| ------ | ------ | ------ | ------ | ------ |
|  `Password`  |  `network.scepclient.cert%.ndes.challenge_password_retrieval.crypt_password`  |     |  string  |  empty *Default*  |
|  `Ready-made Challenge Password Command`  |  `network.scepclient.cert%.use_ready_made_challenge_password_command`  |  [none][NDES]  |  string  |  *none*   |
|  `User name`  |  `network.scepclient.cert%.ndes.challenge_password_retrieval.user`  |     |  string  |  empty *Default*  |

```
	  - If the following is not 'none', https will be used. The default "getca" means the CA certificate received in the SCEP GetCA operation. The full path to a different CA certificate may also be specified.
```

|  Parameter  |  Registry   |  Range      |  Type       |  Value      |
| ------ | ------ | ------ | ------ | ------ |
|  `Debug level`  |  `network.scepclient.cert%.ndes.challenge_password_retrieval.debuglevel`  |     |  integer  |  0 *Default*  |
|  `CA certificate`  |  `network.scepclient.cert%.ndes.challenge_password_retrieval.cacert`  |   [none (not using https)][from getca operation]   |  string  |   *from getca operation*   |

```
	  - Added configuration for PKCS#7 encryption and signature algorithms (see sscep options -E and -S)
```

|  Parameter  |  Registry   |  Range      |  Type       |  Value      |
| ------ | ------ | ------ | ------ | ------ |
|  `PKCS#7 signature algorithm`  |  `network.scepclient.cert%.signalg`  |  [automatic][md5][sha1][sha224][sha256][sha384][sha512]  |  string  |  __ (automatic)  |
|  `PKCS#7 encryption algorithm`  |  `network.scepclient.cert%.encalg`  |  [automatic][des][3des][blowfish][aes128][aes192][aes256]  |  string  |  __ (automatic)  |

```
	  - Content-Type: application/x-pki-message is sent according to RFC 8894 if the following new option is enabled:
```

|  Parameter  |  Registry   |  Range      |  Type       |  Value      |
| ------ | ------ | ------ | ------ | ------ |
|  `Send Content-Type`  |  `network.scepclient.cert%.sscep.send_content_type`  |     |  bool  |  enabled / _disabled_ (default)  |

```
	  - SCEP: When the CA fingerprint or the CA identifier is changed the client certificate and the client key are not discarded anymore. Just new CA and RA certificates will be downloaded.
	- Added registry key for ignoring hostname received via DHCP
```

|  Parameter  |  Registry   |  Type       |  Value      |
| ------ | ------ | ------ | ------ |
|  `Ignore hostname received via DHCP`  |  network.dns.hostname_ignore_dhcp  |  bool  |  enabled / _disabled_ (default)  |

```

- **Hardware**

	- Added hardware support for Lenovo ThinkPad L16 Gen1 Intel
	- Added hardware support for Lenovo ThinkPad L16 Gen1 AMD
	- Added function key support for Lenovo ThinkPad L13 Gen5 Intel, L14 Gen5 AMD/Intel, L16 Gen1 AMD/Intel:
		 - Fn+F1: Loudspeaker Off
		 - Fn+F2: Reduce audio volume
		 - Fn+F3: Increase audio volume
		 - Fn+F4: Mute microphone
		 - Fn+F5: Reduce display brightness
		 - Fn+F6: Increase display brightness
		 - Fn+F7: Display configuration
		 - Fn+F8: Thermal profile mode (L13 Gen5 Intel: Flight mode)
		 - Fn+Ctrl+F9: Screenshot (L13 Gen5 Intel: not mapped to any function)
		 - Fn+Ctrl+F10: Snipping Tool (L13 Gen5 Intel: not mapped to any function)
		 - Fn+Ctrl+F11: Maximize focused window (L13 Gen5 Intel: not mapped to any function)
	- Added hardware support for Lenovo ThinkPad L13 Gen5 Intel
	- Added hardware support for HP Elite t660 thin client.
	- Validated support for Intel i226, 2.5Gbps ethernet card (copper and fiber) for HP t755 devices.
	- Validated support for Allied Telesis 2914SP Gbps PCIe network adapter with SFP Port for HP t755 devices.
	- Changed hardware names of supported LG devices (to only use underscores instead of spaces).

- **Remote Management**

	- Added setup parameter to set connection timeout
```

|  Parameter   |  Registry    |  Type        |  Value       |
| ------ | ------ | ------ | ------ |
|  `IGEL Remote Management Connect Timeout`        |  `system.remotemanager.connect_timeout`              |  integer                            |  timeout in sec / *45* (default)  |

```

- **Mobile Broadband**

	- Added support for WWAN connection with Quectel EM160R-GL.

## Security Fixes

- Fixed bubblewrap security issue CVE-2024-42472.
- Fixed webkit2gtk security issues CVE-2024-4558, CVE-2024-40794, CVE-2024-40789, CVE-2024-40785, CVE-2024-40782, CVE-2024-40780, CVE-2024-40779 and CVE-2024-40776.
- Fixed openvpn security issue CVE-2024-5594.
- Fixed wpa security issue CVE-2024-5290.
- Fixed tigervnc security issue CVE-2014-8240.
- Fixed bind9 security issues CVE-2024-4076, CVE-2024-1975, CVE-2024-1737 and CVE-2024-0760.
- Fixed aom security issue CVE-2024-5171.
- Fixed curl security issue CVE-2024-7264.
- Fixed expat security issues CVE-2024-45492, CVE-2024-45491 and CVE-2024-45490.
- Fixed ghostscript security issues CVE-2024-29509, CVE-2024-29508, CVE-2024-29507 and CVE-2024-29506.
- Fixed python3.11 security issues CVE-2024-8088, CVE-2024-4032 and CVE-2024-0397.
- Fixed openssl security issues CVE-2024-6119, CVE-2024-4741, CVE-2024-4603 and CVE-2024-2511.
- Fixed qemu security issue CVE-2024-4467.
- Fixed openssl1.1 security issues CVE-2024-5535, CVE-2024-4741 and CVE-2024-2511.
- Fixed openssh security issue CVE-2024-39894.
- Fixed cups security issues CVE-2024-47175 and CVE-2024-35235.
- Fixed cups-filters security issues CVE-2024-47176 and CVE-2024-47076.

## Resolved Issues

- Fixed documentation folder on Lenovo devices preinstalled with IGEL OS.
- Fixed: Removed command which damaged the bootreg. Not possible to confirm the final root cause yet.
- Fixed LVFS command line tool fwupdmgr which resulted in the wrong Efi System Partion being selected for BIOS updates.
- Fixed credential passthrough from AD/Kerberos login to applications. In some cases a double login was necessary to perform.
- Fixed keyboard layouts
- Fixed instability which occurred if endpoint was not rebooted for > 10 days. Endpoint was not possible to shutdown or reboot, app updates were not performed -  hard reboot was necessary to perform.
- Fixed: Energy Star logo (shown in the power management options for supported HP devices) is shown after resume from suspend.

- **OSC Installer**

	- Fixed settings injection via OSCreator.

- **Network**

	- Added back symlinks for iptables
	- Fixed not using 2.5 Gbit/s or 5 Gbit/s network speed although possible.
	- Fixed wrong error messages "Proxy authentication failed." in case proxy does not require authentication.
	- Added parameters to control network proxy error messages. The total amount of messages and the message timeout can be configured:
```

| Parameter | Registry | Value |
| ------ | ------ | ------ |
| `Timeout for proxy error messages` | `network.proxy.settings.sys_proxy_message_timeout` | `10 (default)` |
| `Amount of proxy error messages to show` | `network.proxy.settings.sys_proxy_message_count` | `1 (default)` |

```
	- Fixed automatic network proxy with PAC file: if the PAC script indicates DIRECT for a requested URI, the connection is established directly and not via proxy as before. Furthermore, if no PAC file is specified or can be loaded, all connections are being established directly.
	- Fixed instabilities when using automatic network proxy.

- **WiFi**

	- Added registry key to allow Network Manager to try a WPA2 configuration when SAE is desired but driver or hardware lack capabilities:
```

|  Parameter  |  Registry   |  Type       |  Value      |
| ------ | ------ | ------ | ------ |
|  `SAE dependent on hardware/driver`  |  `network.interfaces.wirelesslan.device0.wpa.sae_capability_dependent`  |  bool  |  enabled / *disabled* (default)  |

```
		 - This  can be useful in situations where the access point offers WPA3 Personal and WPA2 Personal at the same time.

- **OS Update**

	- Fixed a possible failure while creating of custom CI, logging or debugging partitions.

- **Storage Devices**

	- Fixed start of Disk Utility Accessory after suspend and resume of a device.
	- Fixed external USB drives with partitions using NTFS filesystem (Storage Hotplug).

- **VirtualBox**

	- Fixed IGEL OS running as a virtual machine on a SINA Workstation S:
		- Added detection method to identify SINA WS host from IGEL OS.
		- Removed the VBoxClient clipboard and drag&drop services.
		- Added VBoxClient vmsvga support.

- **Audio**

	- Added registry parameter for switching rear side line-out to a line-in in HP t660 (requires a reboot to become active):
```

|  Parameter  |  Registry   |  Type       |  Value      |
| ------ | ------ | ------ | ------ |
|  `Switch back jack to line-in`  |  `system.sound_driver.snd_hda_intel.hp_t660_back_microphone`  |  bool  |  enabled / *disabled* (default)  |

```

- **Hardware**

	- Changed network driver on Lenovo Thinkpad L16 AMD Gen1 to r8168 by default.
	- The legacy device IGEL UD7 Model H850C is now shown correctly as "UC1-LX" (not fully supported / unsupported device) instead of "UD7-LX10" in the "About" info page of OS12.
	- Changed network driver on Lenovo ThinkCentre M75q Gen5 to r8168 by default.

- **Remote Management**

	- Fixed connecting process on devices having two or more active NICs.
	- Fixed file installation - now it is ensured that all assigned files are installed before applying settings and installing apps. This also fixes the deployment of app signing certificate and app that depends on the certificate at the same time.

- **IGEL Desktop**

	- Fixed: Desktop starts correctly when IGEL disclaimer is configured.
	- Changed timeout for spinning mouse cursor upon wake up from suspend from 60 to 15 seconds.
	- Fixed additional desktop restart when device encryption with PIN is used.

- **SSO**

	- Fixed Cloud ID Provider login to support more generic OpenID Connect providers, especially Cyberark.

## Known Issues

- The downgrade to base system 12.00.900 or 12.00.910 is not supported.
- In very rare cases all apps are lost after an update. Should this be the case, an error message is shown "Opening system App Journal failed." - if the device is manged, the apps will be reinstalled after a reboot.
- Increased writeable cache partition size (by default). First boot with 12.4.x and newer may take more time (once) when updating from a 12.2.x or older base system app.
- Automatic proxy configuration: PAC file URL does not support https scheme.

- **OSC Installer**

	- Deployment via PXE is not supported with 12.5.1 base system.

- **Chromium**

	- Downgrading base system to earlier versions may result in reset of the Chromium profile partition.

- **Network**

	- In some cases, network is not working in combination of Lenovo K14 Gen1 (AMD) and Lenovo Universal Dock. There is a kernel bugreport open but no proper fix so far.
	- Device configured as WolProxy can be shut down by the user or admin
	- If automatic network proxy with PAC file is used, the PAC file will be downloaded multiple times.

- **HID**

	- Some touchpads are recognized as touchpad and mouse. This results in showing possible user settings for both variants.

- **Setup Assistant**

	- Timezone auto-detection is currently not functional (due to discontinued location service). The timezone must be set manually (as interims / alternative solution).

- **Audio**

	- Headset mic via jack is not working on LG 27CN650 and LG 34CN650.

- **Hardware**

	- Wake on LAN is not functional on Dell OptiPlex 3000 and Lenovo K14 Gen1
	- Built-in fingerprint sensor is not supported on HP mt440 G3 and mt645 G7/G8.
	- If using 6 x 4K@60Hz monitors on HP t755/t740 with the additional graphic card, one or two of the monitors may stay black after coming back from DPMS off state.
	 - This is caused by using the additional graphic card as primary, which only has 512MB VRAM (the VRAM is not sufficient in this configuration). Possible solution: Increasing the VRAM size of the iGPU to 2048MiB in BIOS (maybe 1024MiB may also work) and activate IGEL registry key `x.drivers.swap_card0_with_card1` so the iGPU will become the Primary GPU. Connector names will be changed with that!
	- Wake up from suspend via UMS does not work on HP mt645 G7 devices. Workaround: Disable system suspend and use shutdown instead.
	- Rotation of displays connected to the Lenovo ThinkPad USB-C Hybrid Dock may fail.
	- Display configuration of displays connected to HP G5 Docking Station may fail on HP t655.
	- Lenovo L13 Gen5 and L14 Gen5  Intel video codec errors (graphic glitches during accelerated video playback)
	- GRUB version 2.8 in combination with HP Elite t660 (BIOS 0.20) will run into "Out of memory" errors whenever the GRUB boot menu is displayed. This happens:
		- Always in OSC.
		- When entering boot menu by pressing Escape during regular IGEL OS startup.
		- A workaround is to [temporarily] boot OSC in verbose mode or connect an HD display when requiring access to the IGEL OS boot menu. This will be fixed in IGEL OS 12.6 by switching to GRUB 2.12.
	- The "Star" special key on recent Lenovo laptop models has not yet been implemented. It's supposed to show the URL bar on a running web browser or launch the default browser if none is running.
	- HP Elite t660 units may run into SquashFS errors during startup. This happens primarily during stress tests. As a workaround, please restart the unit.
	- On Lenovo ThinkPad L13 Intel Gen5, the functions keys Ctrl+Fn+F9, Ctrl+Fn+F10 and Ctrl+Fn+F11 are not mapped.

- **IGEL Desktop**

	- On-screen keyboard sporadically crashes when typing.
	- If two monitors are configured in a vertical layout (one above the other), and those monitors are configured with "auto-detect" resolution, saving leads to a wrong layout order.
	- Disabled compositing (transparency effects) in window manager to circumvent issues with screen lock. Registry key `windowmanager.wm0.variables.usecompositing` is not configurable anymore.

- **Licensing**

	- Manual deployment of add-on licenses for IGEL Agent for Imprivata licenses (via UMS) is only possible after finished installation of IGEL Agent for Imprivata app on device.

- **Mobile Broadband**

	- F11 flight mode function key does not switch off mobile broadband on HP Elite mt645 G7. (Deactivate mobile broadband in Network / Mobile Broadband settings)

- **Virtualization**

	- Changing the display configuration (monitor order and layout) should be done from the SINA OS menu bar. Change on IGEL OS results in faulty resolution settings and a mouse offset.
	- After a fresh OSC installation or factory reset, the IGEL "Welcome" screen has a mouse offset when using a dual monitor setup. Workaround: Select any available display configuration from the SINA OS menu bar to trigger an event which sets the correct resolution and therefore solves the issue.
	- If a second display was configured as the primary SINA OS display and is subsequently unplugged, IGEL OS might use the wrong resolution for the primary display. Using the SINA OS key combination Ctrl+Alt+o to show the taskbar is going to trigger a resize event, which automatically sets the correct resolution again. This affects SINA Workstation only.
	- SINA OS supports only 2 displays. If a docking station with 2 external displays is used, make sure to close the Laptop lid prior to starting IGEL OS. Do not open the Laptop lid when 2 external displays are connected.
```

----

## 2024-09-24 - [12.5.0](https://app.igel.com/base_system/12.5.0)

```
The new BUILD 12.5.0 for IGEL Workspace is ready.

These are the release notes published with that release:

Changelog for IGEL OS Base System @ 12.5.0

# Changes since: 12.4.0

## New Features

- Updated base system to Debian 12 (bookworm) base.
- Added: Strace and tcpdump debug tools are part of IGEL OS base system. tcpdump is configurable in registry with instances of debug.tcpdump%.
- Fixed fail safe boot functionality.
- Changed default of power saving settings for screen getting dimmed to 20% after 120 seconds inactivity.
```

|  Setup  |  Parameter  |  Registry  |  Type  |  Value  |
| ------ | ------ | ------ | ------ | ------ |
|  `System > Power Options > Display > Brightness Reduction`  |  `On inactivity reduce to`  |  `x.xserver%.brightness_level_ac`  |  integer  |  20 *Default*  |
|  `System > Power Options > Display > Brightness Reduction`  |  `Reduce after`  |  `x.xserver%.brightness_on_ac`  |  integer  |  120 *Default*  |
|  `System > Power Options > Display > Brightness Reduction`  |  `Reduce after`  |  `x.xserver%.brightness_on_battery`  |  integer  |  120 *Default*  |

```
- Added further registry keys for influencing power consumption (Auto means active on all Lenovo devices with battery):
```

|  Parameter  |  Registry   |  Range      |  Value      |  Type       |
| ------ | ------ | ------ | ------ | ------ |
|  `Call idle actions on battery after this time of inactivity (greater 10 seconds, value 9 or lower is never)`  |  `system.powersave.idle_action_on_battery`  |  |  50 *Default*  |  integer  |
|  `Use powertop auto tune to reduce power usage`  |  `system.powersave.powertop_auto_tune`  |  [Auto][Enable][Disable]  |  *Auto*  |  |
|  `Use laptop mode to reduce power usage`  |  `system.powersave.laptop_mode`  |  [Auto][Enable][Disable]  |  *Auto*  |  |
|  `Clock down AMDGPU if system is idle (idle action time reached).`  |  `system.powersave.clock_down_amdgpu_on_idle`  |  [Auto][Enable][Disable]  |  *Auto*  |  |
|  `Clock down Intel GPU if system is idle (idle action time reached).`  |  `system.powersave.clock_down_i915_on_idle`  |  [Auto][Enable][Disable]  |  *Auto*  |  |
|  `Set Ryzen CPU to power save mode if system is idle (idle action time reached).`  |  `system.powersave.use_ryzenadj_on_idle`  |  [Auto][Enable][Disable]  |  *Auto*  |  |
|  `Set Intel CPU to power save mode if system is idle (idle action time reached).`  |  `system.powersave.use_energy_policy_on_idle`  |  [Auto][Enable][Disable]  |  *Auto*  |  |
|  `Call idle actions on AC after this time of inactivity (greater 10 seconds, value 9 or lower is never)`  |  `system.powersave.idle_action_on_ac`  |  |  50 *Default*  |  integer  |

```
- Added system wide proxy support with manual and automatic proxy configuration (PAC and WPAD). Proxy configuration is available at IGEL Setup > Network > Proxy.
- Changed IGEL logo placement on default wallpaper.
- Added possiblibility to define post-session commands for generic processes in base_system.
```

|  Parameter  |  Registry   |  Type       |  Value      |  Range      |
| ------ | ------ | ------ | ------ | ------ |
|  `Ignore command lines`  |  `userinterface.postsession.process%.ignoredargs`  |  string  |  empty *Default*  |  |
|  `Activate generic base_system post-session command`  |  `userinterface.postsession.enabled`  |  bool  |  enabled / *disabled* (default)  |  |
|  `The post-session command to be executed`  |  `userinterface.postsession.command`  |  |  **  |  [Logoff][Shutdown][Enter custom command here]  |
|  `This session will have priority in executing the post-session command`  |  `userinterface.postsession.force`  |  bool  |  enabled / *disabled* (default)  |  |
|  `Process name`  |  `userinterface.postsession.process%.name`  |  string  |  empty *Default*  |  |
|  `Valid return codes`  |  `userinterface.postsession.process%.validrcs`  |  string  |  empty *Default*  |  |

```
- Improved multisession support for post-session commands: In case multiple sessions run in parallel with a set post-session command, command is only triggered when all sessions are finished successfully.
  If session has the 'force' post-session command parameter set, the command is triggered immediately once the session is finished.
- Updated kernel to 6.6.38 version.
- Added support for USB serial adapters in verbose boot mode (Linux kernel console) for debugging purposes. This is controlled by registry parameter `system.kernel.bootparams.serial_console_debug`
- Added option to set hardware clock. The default, Auto, will look for Windows partitions and, if present, assume that Windows is installed and the real time clock is set to local time.
```

|  Setup  |  Parameter   |  Registry    |  Range  |
| ------ | ------ | ------ | ------ |
|  System > Time and Date  |  `HW clock timezone`   |  `system.time.hwclock_timezon`  |  [Auto (default)] [UTC] [localtime]  |

```
- Added Chinese input support with Intelligent Pinyin method (experimental).
  - Enable Input Methods with parameter
```

| Parameter | Setup | Registry | Value |
| ------ | ------ | ------ | ------ |
| Keyboard Input Methods (experimental) | User Interface>Input>Keyboard>Input Methods | userinterface.keyboard.ibus.enable | false(default) / true |

```
  - Enable Pinyin method:
```

| Parameter | Setup | Registry | Value |
| ------ | ------ | ------ | ------ |
| Chinese Intelligent Pinyin | User Interface>Input>Keyboard>Input Methods>Methods | userinterface.keyboard.ibus.general.preload-engine-libpinyin | false(default) / true |

```
  - Enable Bopomofo method:
```

| Parameter | Setup | Registry | Value |
| ------ | ------ | ------ | ------ |
| Chinese Bopomofo | User Interface>Input>Keyboard>Input Methods>Methods | userinterface.keyboard.ibus.general.preload-engine-libbopomofo | false(default) / true |

```
  - Further properties:
```

| Parameter | Setup | Registry | Value |
| ------ | ------ | ------ | ------ |
| Auto hide timeout | User Interface>Input>Keyboard>Input Methods | userinterface.keyboard.ibus.panel.auto-hide-timeout | 10000 (default) |
| Next Input method | User Interface>Input>Keyboard>Input Methods | userinterface.keyboard.ibus.general.hotkeys.triggers | <Super>space (default) |
| Candidates orientation | User Interface>Input>Keyboard>Input Methods | userinterface.keyboard.ibus.panel.lookup-table-orientation | vertical (default) / horizontal |
| Show property panel | User Interface>Input>Keyboard>Input Methods | userinterface.keyboard.ibus.panel.show | do not show (default) / hide automatically / always |

```
  - Intelligent Pinyin properties:
```

| Parameter | Setup | Registry | Value |
| ------ | ------ | ------ | ------ |
| Initial state Simplified Chinese | User Interface>Input>Keyboard>Input Methods>Intelligent Pinyin | userinterface.keyboard.ibus.libpinyin.pinyin.init-simplified-chinese | false / true(default) |
| Initial state Chinese | User Interface>Input>Keyboard>Input Methods>Intelligent Pinyin | userinterface.keyboard.ibus.libpinyin.pinyin.init-chinese | false / true(default) |
| Initial state full width | User Interface>Input>Keyboard>Input Methods>Intelligent Pinyin | userinterface.keyboard.ibus.libpinyin.pinyin.init-full | false(default) / true |
| Initial state full punctuations | User Interface>Input>Keyboard>Input Methods>Intelligent Pinyin | userinterface.keyboard.ibus.libpinyin.pinyin.init-full-punct | false / true(default) |

```
- **OSC Installer**

	- Changed the size of the dummy partition from 1GB to 100MB or 10MB, depending on the storage capacity.
	- Changed: Reduced size of 1st partition on UD Pocket - effective with new installations (via OSC) or factory deployment of 12.4.1 or later.
	- Added new options for factory image creation:
	  - With the "Reset after first boot" option a deployed image can be tested and any change is resetted after boot.
	  -  With the "Automatically shutdown at first boot" option a deployed image does a self-check and automatically shuts down afterwards. A log file of this deployment self-check is written to the 1st partition.

- **App Management**

	- Added support for apps created via IGEL App Creator Portal. These apps are signed by corresponding app signing certificate, issued by IGEL via App Creator Portal. In order to install an app downloaded from IGEL App Creator Portal, the following steps are necessary:
		- Import of received app signing certificate (.crt) as file in UMS using the type "App Signing Certificate"
		- Import app in UMS (as usual)
		- Assigning received certificate and app to the endpoint(s)
	- Added: With the upcoming switch to bookworm as base for IGEL OS 12, a compatibility app was introduced for offering compatibility with all current released apps. If required, this app will automatically installed after the update to 12.5. A second reboot is needed after the update.
		 - With Base Sytem >= 12.4.2 the additional reboot is not needed as the compatibility app is directly installed with the Base System update.

- **Network**

	- Added Wake on LAN support via USB-C-to-LAN adapters
		- Activated by enabling any of the Wake on LAN settings of LAN Interfaces
		- Only Wake on LAN from Suspend is supported

- **WiFi**

	- Added option for DHCP refresh after roaming (within the same network).
```

|  Parameter  |  Registry   |  Type       |  Value      |
| ------ | ------ | ------ | ------ |
|  `Refresh DHCP after roaming`  |  `network.interfaces.wirelesslan.device0.roam_refresh_dhcp`  |  bool  |  enabled / *disabled* (default)  |

```
- **HID**

	- Added: In case no other input devices (keyboard or mouse) are detected on the device and there are bluetooth input devices available to pair, they will be automatically paired after booting as long as the parameter devices.bluetooth.auto_pair_if_no_input is set to true (which is the default)

- **Setup Assistant**

	- Changed label of WiFi configuration dialog in Setup Assistant (Country or Region).

- **Driver**

	- Updated libccid to version 1.5.5 to support rf IDEAS USB reader.

- **Print-Center**

	- Added information about print-jobs to the print-center tray app to inform about queued or running jobs. Completed or canceled jobs are not shown in tray app.
	- Added option to cancel a print job
	- Added system notification in case of failed print jobs.
	- Added option to print test page on connected printer.
	- Added print-center tray app to search and connect local or network printers. The tray app requires the CUPS printing app and uses Avahi to discover available network printers. For best results use CUPS printing app >= 1.2.0 older versions do not support auto discovery.
		 - New parameter were added to enable/disable the tray app and to enable/disable Avahi for auto discovery
```

|  Setup  |  Parameter  |  Registry  |  Type  |  Value  |
| ------ | ------ | ------ | ------ | ------ |
|  `Apps > Avahi Daemon`  |  `Enable the Avahi daemon`  |  `app.avahi_daemon.enable`  |  boolean  |  true *default* / false  |
|  `User Interface > Desktop > Taskbar Items`  |  `Show print-center tray icon on desktop`  |  `userinterface.system_tray.printer.desktop`  |  boolean  |  true *default* / false  |
|  `User Interface  > Screenlock / Screensaver > Taskbar`  |  `Show print-center tray icon on screenlock`  |  `userinterface.system_tray.printer.lockscreen`  |  boolean  |  true / false *default*  |

```
- **Audio**

	- Changed: On first boot (after installation) all devices are set to 50% volume.
	- Changed default audio backend to pipewire. Pulseaudio backend is still available and can be activated by registry key:
```

|  Parameter  |  Registry   |  Range      |  Value      |
| ------ | ------ | ------ | ------ |
|  `Audiobackend`  |  `multimedia.audiobackend`  |  [pipewire][pulseaudio]  |  *pipewire*  |
```
	- Removed parameter as no longer required / feature is offered via tray app now.
```

|  Parameter  |  Registry   |  Type       |  Value      |
| ------ | ------ | ------ | ------ |
|  `Volume Control per Application`  |  `userinterface.sound.app_volume_ctrl`  |  bool  |  *enabled* (default) / disabled  |

```
- **Multimedia**

	- Updated Fluendo multimedia codecs to the following version:
	- gst-fluendo-asfdemux to version 1.0.2
	- gst-fluendo-h264dec to version 1.0.10
	- gst-fluendo-hwvadec to version 1.0.10
	- gst-fluendo-mp3dec to version 1.0.5
	- gst-fluendo-mpeg4vdec to version 1.0.2
	- gst-fluendo-wmadec to version 1.0.2
	- gst-fluendo-wmvdec to version 1.0.2
	- Added VP9 and AV1 video hardware acceleration.
	- Added registry key to switch from fluendo to vaapi gstreamer plugin for h264 hardware acceleration.
```

|  Parameter  |  Registry   |  Type       |  Value      |
| ------ | ------ | ------ | ------ |
|  `Switch from Fluendo to VAAPI h264 hardware accelerated decoder.`  |  `multimedia.gstreamer.use_vaapi_for_h264`  |  bool  |  enabled / *disabled* (default)  |

```
- **Hardware**

	- Improved power consumption on Lenovo ThinkPad L14 Intel Gen5.
	- Added hardware support for Lenovo ThinkPad L14 AMD Gen5.
	- Changed energy savings settings for HP Elite mt645 G8.
	- Added hardware support for Lenovo ThinkCentre M75q Gen5.
	- Added hardware support for Lenovo ThinkCentre M70q Gen5.
	- Added hardware support for Lenovo ThinkPad L14 Intel Gen5.
	- Added hardware support for LG gram 14ZT90R, 15ZT90R and 17ZT90R.

- **Remote Management**

	- Added option to set rank of UMS connectors. UMS version 12.04.120 or later is required.
```

|  Parameter   |  Registry    |  Type        |  Value       |
| ------ | ------ | ------ | ------ |
|  `Ranking of connectors`   |  `system.remotemanager.connectorranking`           |  string                                |  *no preference*(default) / prefer UMS /   prefer ICG  |
|  `connector type`   |  `system.remotemanager.connector%.type`           |  string                                |  ums/icg/*undefined*(default)      |

```
		 - The `connector type` parameter is set automatically by UMS.
		 - If `Ranking of connectors` is set to "prefer ICG", the rmagent tries to connect to an ICG and only connects to an UMS server, if no ICG is reachable or configured.
		 -  If `Ranking of connectors` is set to "prefer UMS", the rmagent tries to connect to an UMS and only connects to an ICG, if no UMS is reachable or configured.
		 -  If `Ranking of connectors` is set to "no preference", the rmagent connects randomly to any configured device-connector.
	- Added support for UMS files of type 'App Signing Certificate'.
	- Added support for application priorities when performing "Specific device commands" from the WUMS.
	- Improved merging of received settings - merging process ignores parameters which are no longer existent in system.
	- Added support for dynamic file types.
	- Added setup parameter for setting of the UMS structure tag. The UMS structure tag can now additionally be set by value of this parameter. For setting or getting of the currently used UMS structure tag the commands /sbin/rmagent-set-structure-tag -t <TAG> and /sbin/rmagent-get-structure-tag can be used.
```

|  Parameter   |  Registry    |  Type        |  Value       |
| ------ | ------ | ------ | ------ |
|  `Structure tag`  |  `system.remotemanager.ums_structure_tag`  |  string  |    |

```
- **IGEL Desktop**

	- Added: Prevent user from dimming display brightness completely.
	- Added display of device type icons for discovered and paired bluetooth devices in bluetooth tray app.
	- Added: Bluetooth tray app supports input of a custom pairing pin code for older devices - if the pairing process does not work with default pin code.
	- Added Bluetooth tray app to system tray
	- Added: Secure pairing with passkey or pincode in Bluetooth tray app.
	- Added shutdown lid action for battery-powered and wired operation.
```

|  Parameter  |  Registry   |  Range      |  Value      |
| ------ | ------ | ------ | ------ |
|  `Lid close action while not plugged in`  |  `system.actions.lid.battery`  |  [Turn off display][Suspend][Shutdown]  |  *Suspend*  |
|  `Lid close action while plugged in`  |  `system.actions.lid.ac`  |  [Turn off display][Suspend][Shutdown]  |  *Suspend*  |

```
- **Licensing**

	- Added catalog entry for add-on license "IGEL Advanced Device Redirection"

- **Mobile Broadband**

	- Added support for Quectel CAT 61K-GL WW SKU - EM061K-GL on Lenovo ThinkPads L14 Intel/AMD Gen5 and L16 Intel/AMD Gen1
	- Updated Lenovo FCC Unlock Tool to version 2.3

- **SSO**

	- Changed / renamed Azure AD IDP to Microsoft Entra ID.
	- Added configuration of OpenID Connect scope value for authentication request:
```

|  Parameter  |  Registry   |  Type       |  Value      |
| ------ | ------ | ------ | ------ |
|  `OpenID Connect scope`  |  `auth.cloudidp.scope`  |  string  |  openid profile email *Default*  |

```
	- Added a parameter to Entra ID SSO which allows to add additional scopes.
	- Changed / improved error messages for SSO login.
	- Added: Configurable list of allowed hosts for redirection:
```

|  Parameter  |  Registry   |  Type       |  Value      |
| ------ | ------ | ------ | ------ |
|  `List of allowed hosts for redirection`  |  `auth.cloudidp.host_allowlist`  |  string  |  empty *Default*  |

```
- **Virtualization**

	- Added services related to VirtualBox Guest Additions.
	- Added support for virtualization environments:
		 - Oracle VM VirtualBox / VirtIO (kernel layer)
		 - VMware Workstation
		 - QEMU (limited support only)
		 - SPICE (virt-viewer) (limited support only)

## Security Fixes

- Fixed a privilege escalation issue in the starter license. Acknowledgements to Zack Didcott for responsible disclosure.
- Fixed libxml2 security issue CVE-2024-25062.
- Fixed python-cryptography security issue CVE-2023-50782.
- Fixed dnsmasq security issues CVE-2023-50868 and CVE-2023-50387.
- Fixed vim security issue CVE-2024-22667.
- Fixed nss security issues CVE-2023-6135, CVE-2023-5388 and CVE-2023-4421.
- Fixed shadow security issue CVE-2023-4641.
- Fixed nghttp2 security issue CVE-2024-28182.
- Fixed less security issue CVE-2024-32487.
- Fixed xorg-server security issues CVE-2024-31080, CVE-2024-31081 and CVE-2024-31083.
- Added registry key to enable support for byteswapped clients, disabled by default for security reasons:
```

|  Parameter  |  Registry   |  Type       |  Value      |
| ------ | ------ | ------ | ------ |
|  `Enable support for byteswapped X clients.`  |  `x.xserver%.allowbyteswappedclients`  |  bool  |  enabled / *disabled* (default)  |

```
- Fixed wpa security issue CVE-2023-52160.
- Fixed gdk-pixbuf security issue CVE-2022-48622.
- Fixed python3.11 security issues CVE-2024-0450, CVE-2023-6597, CVE-2023-41105, CVE-2023-40217 and CVE-2023-24329.
- Fixed qtbase-opensource-src security issues CVE-2024-25580, CVE-2023-51714, CVE-2023-38197, CVE-2023-37369, CVE-2023-34410 and CVE-2023-24607.
- Fixed qemu security issues CVE-2024-3447, CVE-2024-3446, CVE-2024-26328, CVE-2024-26327, CVE-2024-24474, CVE-2023-6683, CVE-2023-5088, CVE-2023-3301, CVE-2023-3019, CVE-2024-3567, CVE-2023-6693, CVE-2023-42467, CVE-2021-3750 and CVE-2021-20255.
- Fixed pillow security issues CVE-2024-28219, CVE-2023-50447 and CVE-2023-44271.
- Fixed openssl security issues CVE-2024-0727, CVE-2023-6237, CVE-2023-6129 and CVE-2023-5678.
- Fixed curl security issues CVE-2024-2398, CVE-2024-2004, CVE-2024-0853, CVE-2023-46219 and CVE-2023-46218.
- Fixed libarchive security issue CVE-2024-26256.
- Fixed gnutls28 security issues CVE-2024-28835 and CVE-2024-28834.
- Fixed openvpn security issues CVE-2024-5594 and CVE-2024-28882.
- Fixed python-idna security issue CVE-2024-3651.
- Fixed krb5 security issues CVE-2024-37371 and CVE-2024-37370.
- Fixed libvpx security issue CVE-2024-5197.
- Fixed libndp security issue CVE-2024-5564.
- Fixed openssh security issue CVE-2024-6387.
- Fixed cups security issue CVE-2024-35235.
- Fixed expat security issues CVE-2024-28757, CVE-2023-52426 and CVE-2023-52425.
- Fixed glibc security issues CVE-2024-33602, CVE-2024-33601, CVE-2024-33600, CVE-2024-33599 and CVE-2024-2961.
- Fixed iperf3 security issue CVE-2024-26306.
- Fixed ntfs-3g security issue CVE-2023-52890.
- Fixed libuv1 security issue CVE-2024-24806.
- Fixed iwd security issue CVE-2024-28084.
- Fixed exfatprogs security issue CVE-2023-45897.
- Fixed opensc security issues CVE-2024-1454 and CVE-2023-5992.
- Fixed tpm2-tools security issues CVE-2024-29039 and CVE-2024-29038.
- Fixed bind9 security issues CVE-2023-6516, CVE-2023-5517, CVE-2023-50868, CVE-2023-50387 and CVE-2023-4408.
- Fixed giflib security issues CVE-2023-39742, CVE-2022-28506 and CVE-2021-40633.
- Fixed glib2.0 security issue CVE-2024-34397.
- Fixed ghostscript security issues CVE-2024-33871, CVE-2024-33870, CVE-2024-33869, CVE-2024-29510 and CVE-2023-52722.
- Fixed mysql-8.0 security issues CVE-2024-21102, CVE-2024-21096, CVE-2024-21087, CVE-2024-21069, CVE-2024-21062, CVE-2024-21060, CVE-2024-21054, CVE-2024-21047, CVE-2024-21013, CVE-2024-21009, CVE-2024-21008, CVE-2024-21000, CVE-2024-20998 and CVE-2024-20994.
- Fixed tiff security issues CVE-2023-3164, CVE-2023-6277, CVE-2023-6228 and CVE-2023-52356.
- Fixed vte2.91 security issue CVE-2024-37535.
- Fixed wget security issue CVE-2024-38428.

## Resolved Issues

- Removed x.drivers.modesetting.no_min_cursor_size registry key as function was removed.
- Fixed: Wrong assignment of socks proxy port
- Changed: Login mask for local login is shown on primary screen (instead of the first screen).
- Fixed: UMS connectors are shown only once in setup.
- Fixed screen lagging issue with Dell Latitude 7430
- Fixed Intel PSR configuration via IGEL registry
```

|  Parameter  |  Registry   |  Range      |  Value      |
| ------ | ------ | ------ | ------ |
|  `Change settings for intel PSR (panel self refresh).`  |  `x.drivers.intel.psr`  |  [Default][Disable][Enable][Use only up to PSR1][Use up to PSR2]  |  *Default*  |

```
- Fixed: Proxy configuration issue in combination with AD/Kerberos
- Fixed application full screen behavior when another monitor is primary than the first.
- Fixed screen lock countdown-done command execution.
- Added access to advanced display configuration via desktop context menu

- **Citrix**

	- Screenshots are now enabled to be transferred from IgelOS to a Citrix session by copy'n'paste.

- **App Management**

	- Fixed: Showing error message on IGEL OS desktop if latest version can not be installed via auto update (dependency apps) due to not fulfilled requirements like Base System.

- **Network**

	- Fixed AD / Kerberos login name handling. By default the name is not expanded with the domain any more (e.g. user -> user@EXAMPLE.COM). To restore the old behavior, set the following parameter:
```

| Parameter | Registry | Value |
| ------ | ------ | ------ |
| `Expand user name` | `auth.login.expand_username` | enabled / **disabled** (default) |

```
	- Fixed network configuration on Hyper-V virtualization.
	- SCEP: Added a registry key for the case where the SCEP environment does not support certificate renewal in the SCEP sense, i.e. where starting over with the challenge password in the CSR is required.
```

|  Parameter  |  Registry   |  Range      |  Value      |
| ------ | ------ | ------ | ------ |
|  `Renewal method`  |  `network.scepclient.cert%.renewal_method`  |  [Renewal][Start-over][Fallback to start-over]  |  *Renewal*  |

```
	- Fixed issue with e1000e network card not working with powersave settings.
	- Added new registry key to add drivers to blacklist for powersave settings
```

|  Parameter  |  Registry   |  Type       |  Value      |
| ------ | ------ | ------ | ------ |
|  `List of drivers seperated by space which have issues with powersave settings.`  |  `system.powersave.powertop_drivers_blacklist`  |  string  |  empty *Default*  |

```
- **Open VPN**

	- Removed unsupported message digest algorithms [RSA-MD5][RSA-SHA][RSA-SHA1][RSA-SHA1-2][RSA-RIPEMD160][RSA-MD4][RSA-SHA256][RSA-SHA384][RSA-SHA512][RSA-SHA224] in parameter sessions.openvpn%.vpnopts.auth. Use alternative parameter:
		 - RSA-MD5        =>   MD5
		 - RSA-SHA        =>   SHA
		 - RSA-SHA1       =>   SHA1
		 - RSA-SHA1-2     =>   SHA1-2
		 - RSA-RIPEMD160  =>   RIPEMD160
		 - RSA-MD4        =>   MD4
		 - RSA-SHA256     =>   SHA256
		 - RSA-SHA384     =>   SHA384
		 - RSA-SHA512     =>   SHA512
		 - RSA-SHA224     =>   SHA224

- **HID**

	- Fixed: Mouse no longer moved to middle of primary screen when switching the primary mouse button via input tray app.

- **Setup Assistant**

	- Fixed Setup Assistant manual time entry.

- **Custom Partition**

	- Fixed custom partition download by adding UMS trust-store certificates to the valid chain for download. Additionally the host name check was removed and more debug output is generated.
	- Improved custom partition handling on slow devices - to avoid timeout.
	- Fixed custom partition downloads with password when profile was created with UMS >= 12.02.100
		 - To fix already created / existing profiles (for earlier IGEL OS releases), it is necessary to set the `custom_partition.source%.crypt_password` parameter in registry.

- **Audio**

	- Fixed internal microphone on Lenovo ThinkPad L14 and L15 Gen4 (AMD).
	- Added registry keys to prevent automatic switch of bluetooth profile:
		 - For pulseaudio:
```

|  Parameter  |  Registry  |  Type  |  Value  |
| ------ | ------ | ------ | ------ |
|  `Set pulseaudio auto switching headset to A2DP`  |  `multimedia.pulseaudio.daemon.module-bluetooth-autoswitch-to-a2dp`  |  bool  |  *enabled* (default) / disabled  |

```
		 - For pipewire:
```

|  Parameter  |  Registry   |  Type       |  Value      |
| ------ | ------ | ------ | ------ |
|  `Autoselection to headset profile`  |  `multimedia.pipewire.wireplumber.autoswitch-to-headset-profile`  |  bool  |  *enabled* (default) / disabled  |

```
	- Fixed headphone output at LG CQ601 jack.
	- Added registry key to enable / disable analog only profile in pipewire:
```

|  Parameter  |  Registry   |  Type       |  Value      |
| ------ | ------ | ------ | ------ |
|  `Enable analog only profile`  |  `multimedia.pipewire.wireplumber.enable-analog-only-profile`  |  bool  |  *enabled* (default) / disabled  |

```
- **Hardware**

	- Fixed wake up from suspend on HP Elite mt645 G8.
	- Fixed missing firmware file for intel 9462ngw WiFi chipset.
	- Fixed microphone mute function key on HP Elite mt645 G8.
	- Fixed microphone mute function key led on Lenovo ThinkPad L14 Gen5 Intel.

- **Remote Management**

	- Added automatic upgrade of valid UMS registration to Unified Protocol if the device was upgraded by the OSC remaining old settings.
	- Fixed fingerprint check during onboarding if root certificate of a public CA is imported into the UMS.
	- Fixed download of files beginning with a white space.
	- Fixed installing of TLS certificates assigned by the UMS into the web browser's CA certificates storage.

- **IGEL Desktop**

	- Network notifications are not shown anymore except for error messages.
	- Fixed: Set audio volume back to 100% after disabling overamplification.

- **Licensing**

	- Fixed issue with license is not detected on some devices.

- **Mobile Broadband**

	- Fixed: On devices supporting mobile broadband (physical) and eSim, an automatic switch to the physical SIM slot is performed if eSim has no profile assigned.

- **Virtualization**

	- Added clipboard support to allow copy and paste from VMware Hypervisor (vSphere) to IGEL OS 12 guest.

## Known Issues

- Automatic proxy configuration: PAC file URL does not support https scheme.
- Increased writeable cache partition size (by default). First boot with 12.4.x and newer may take more time (once) when updating from a 12.2.x or older base system app.
- In very rare cases all apps are lost after an update. Should this be the case, an error message is shown "Opening system App Journal failed." - if the device is manged, the apps will be reinstalled after a reboot.
- The downgrade to base system 12.00.900 or 12.00.910 is not supported.

- **OSC Installer**

	- Deployment via PXE is not supported with 12.5.0 base system.

- **Chromium**

	- Downgrading base system to earlier versions may result in reset of the Chromium profile partition.

- **Network**

	- In some cases, network is not working in combination of Lenovo K14 Gen1 (AMD) and Lenovo Universal Dock. There is a kernel bugreport open but no proper fix so far.

- **WiFi**

	- Globally configured WiFi static IP is not used if establishing WiFi connection via WiFi system tray

- **HID**

	- Some touchpads are recognized as touchpad and mouse. This results in showing possible user settings for both variants.

- **Setup Assistant**

	- Timezone auto-detection is currently not functional (due to discontinued location service). The timezone must be set manually (as interims / alternative solution).

- **Audio**

	- Headset mic via jack is not working on LG 27CN650 and LG 34CN650.

- **Hardware**

	- Lenovo L14 Gen5 Intel video codec errors (graphic glitches during accelerated video playback)
	- Display configuration of displays connected to HP G5 Docking Station may fail on HP t655.
	- Rotation of displays connected to the Lenovo ThinkPad USB-C Hybrid Dock may fail.
	- Wake up from suspend via UMS does not work on HP mt645 G7 devices. Workaround: Disable system suspend and use shutdown instead.
	- If using 6 x 4K@60Hz monitors on HP t755/t740 with the additional graphic card, one or two of the monitors may stay black after coming back from DPMS off state.
	 - This is caused by using the additional graphic card as primary, which only has 512MB VRAM (the VRAM is not sufficient in this configuration). Possible solution: Increasing the VRAM size of the iGPU to 2048MiB in BIOS (maybe 1024MiB may also work) and activate IGEL registry key `x.drivers.swap_card0_with_card1` so the iGPU will become the Primary GPU. Connector names will be changed with that!
	- Built-in fingerprint sensor is not supported on HP mt440 G3 and mt645 G7/G8.
	- Wake on LAN is not functional on Dell OptiPlex 3000 and Lenovo K14 Gen1

- **Remote Management**

	- When deploying app signing certificate and app that depends on the certificate at the same time, the app installation may fail because the certificate might not have been deployed in time. As a workaround, deploying app signing certificates first, followed by installation of the corresponding app(s) short time after.

- **IGEL Desktop**

	- Connecting a new audio device during running audio playback / stream may result in failure of audio tray.
	- External display mode not functional on ThinkPad L14 Gen3 AMD
	- Disabled compositing (transparency effects) in window manager to circumvent issues with screen lock. Registry key `windowmanager.wm0.variables.usecompositing` is not configurable anymore.
	- If two monitors are configured in a vertical layout (one above the other), and those monitors are configured with "auto-detect" resolution, saving leads to a wrong layout order.
	- On-screen keyboard sporadically crashes when typing.

- **Licensing**

	- Manual deployment of add-on licenses for IGEL Agent for Imprivata licenses (via UMS) is only possible after finished installation of IGEL Agent for Imprivata app on device.
```

----

## 2024-08-14 - [12.4.2 PR1 (Patch Release)](https://app.igel.com/base_system/12.4.2+1)

```
The new BUILD 12.4.2 PR1 for IGEL Workspace is ready.

These are the release notes published with that release:

Changelog for IGEL OS Base System @ 12.4.2 PR 1

Changes since: 12.4.2

## New Features

- **Hardware**

	- Added hardware support for Lenovo ThinkCentre M70q Gen5.
	- Added hardware support for Lenovo ThinkCentre M75q Gen5.

- **Licensing**

	- Added catalog entry for add-on license "IGEL Advanced Device Redirection"

## Resolved Issues

	- Fixed unpair functionality in bluetooth utility.

	- **Audio**

		- Fixed internal microphone on Lenovo ThinkPad L14 and L15 Gen4 (AMD).

## Known Issues

- Browser apps may not recognize custom certificates rolled out via UMS file transfer. The certificates are not correctly synchronized in the browser specific certificate stores/databases.
- Increased writeable cache partition size (by default). First boot with 12.4.x may take more time (once) when updating from a 12.2.x or older base system app.
- In very rare cases all apps are lost after an update. Should this be the case, an error message is shown "Opening system App Journal failed." - if the device is manged, the apps will be reinstalled after a reboot.
- The downgrade to base system 12.00.900 or 12.00.910 is not supported.

- **Chromium**

	- Downgrading base system to earlier versions may result in reset of the Chromium profile partition.

- **Network**

	- In some cases, network is not working in combination of Lenovo K14 Gen1 (AMD) and Lenovo Universal Dock. There is a kernel bugreport open but no proper fix so far.

- **WiFi**

	- Globally configured WiFi static IP is not used if establishing WiFi connection via WiFi system tray

- **HID**

	- Some touchpads are recognized as touchpad and mouse. This results in showing possible user settings for both variants.

- **Setup Assistant*8

- Timezone auto-detection is currently not functional (due to discontinued location service). The timezone must be set manually (as interims / alternative solution).

- **Audio**

	- Headset mic via jack is not working on LG 27CN650 and LG 34CN650.

- **Hardware**

	- Lenovo L14 Gen5 Intel video codec errors (graphic glitches during accelerated video playback)
	- Display configuration of displays connected to HP G5 Docking Station may fail on HP t655.
	- Rotation of displays connected to the Lenovo ThinkPad USB-C Hybrid Dock may fail.
	- Wake up from suspend via UMS does not work on HP mt645 G7 devices. Workaround: Disable system suspend and use shutdown instead.
	- If using 6 x 4K@60Hz monitors on HP t755/t740 with the additional graphic card, one or two of the monitors may stay black after coming back from DPMS off state.
	- This is caused by using the additional graphic card as primary, which only has 512MB VRAM (the VRAM is not sufficient in this configuration). Possible solution: Increasing the VRAM size of the iGPU to 2048MiB in BIOS (maybe 1024MiB may also work) and activate IGEL registry key x.drivers.swap_card0_with_card1 so the iGPU will become the Primary GPU. Connector names will be changed with that!
	- Built-in fingerprint sensor is not supported on HP mt440 G3 and mt645 G7/G8.
	- Wake on LAN is not functional on Dell OptiPlex 3000 and Lenovo K14 Gen1

- **IGEL Desktop**

	- Connecting a new audio device during running audio playback / stream may result in failure of audio tray.
	- External display mode not functional on ThinkPad L14 Gen3 AMD
	- Disabled compositing (transparency effects) in window manager to circumvent issues with screen lock. Registry key windowmanager.wm0.variables.usecompositing is not configurable anymore.
	- If two monitors are configured in a vertical layout (one above the other), and those monitors are configured with "auto-detect" resolution, saving leads to a wrong layout order.
	- On-screen keyboard sporadically crashes when typing.

- Licensing

	- Manual deployment of add-on licenses for IGEL Agent for Imprivata licenses (via UMS) is only possible after finished installation of IGEL Agent for Imprivata app on device.
```

----

## 2024-07-18 - [12.4.2](https://app.igel.com/base_system/12.4.2)

```
The new BUILD 12.4.2 for IGEL Workspace is ready.

These are the release notes published with that release:

# Changes since: 12.4.1

## New Features

- Added possibility to define post-session commands for generic processes in base_system.
```

|  Parameter  |  Registry   |  Type       |  Value      |  Range      |
| ------ | ------ | ------ | ------ | ------ |
|  `Ignore command lines`  |  `userinterface.postsession.process%.ignoredargs`  |  string  |  empty *Default*  |  |
|  `Activate generic base_system post-session command`  |  `userinterface.postsession.enabled`  |  bool  |  enabled / *disabled* (default)  |  |
|  `The post-session command to be executed`  |  `userinterface.postsession.command`  |  |  **  |  [Logoff][Shutdown][Enter custom command here]  |
|  `This session will have priority in executing the post-session command`  |  `userinterface.postsession.force`  |  bool  |  enabled / *disabled* (default)  |  |
|  `Process name`  |  `userinterface.postsession.process%.name`  |  string  |  empty *Default*  |  |
|  `Valid return codes`  |  `userinterface.postsession.process%.validrcs`  |  string  |  empty *Default*  |  |

```
- Added Chinese input support with Intelligent Pinyin method (experimental).

  - Enable Input Methods with parameter
```

| Parameter | Setup | Registry | Value |
| ------ | ------ | ------ | ------ |
| Keyboard Input Methods (experimental) | User Interface>Input>Keyboard>Input Methods | userinterface.keyboard.ibus.enable | false(default) / true |

```
  - Enable Pinyin method:
```

| Parameter | Setup | Registry | Value |
| ------ | ------ | ------ | ------ |
| Chinese Intelligent Pinyin | User Interface>Input>Keyboard>Input Methods>Methods | userinterface.keyboard.ibus.general.preload-engine-libpinyin | false(default) / true |

```
  - Enable Bopomofo method:
```

| Parameter | Setup | Registry | Value |
| ------ | ------ | ------ | ------ |
| Chinese Bopomofo | User Interface>Input>Keyboard>Input Methods>Methods | userinterface.keyboard.ibus.general.preload-engine-libbopomofo | false(default) / true |

```
  - Further properties:
```

| Parameter | Setup | Registry | Value |
| ------ | ------ | ------ | ------ |
| Auto hide timeout | User Interface>Input>Keyboard>Input Methods | userinterface.keyboard.ibus.panel.auto-hide-timeout | 10000 (default) |
| Next Input method | User Interface>Input>Keyboard>Input Methods | userinterface.keyboard.ibus.general.hotkeys.triggers | <Super>space (default) |
| Candidates orientation | User Interface>Input>Keyboard>Input Methods | userinterface.keyboard.ibus.panel.lookup-table-orientation | vertical (default) / horizontal |
| Show property panel | User Interface>Input>Keyboard>Input Methods | userinterface.keyboard.ibus.panel.show | do not show (default) / hide automatically / always |

```
  - Intelligent Pinyin properties:
```

| Parameter | Setup | Registry | Value |
| ------ | ------ | ------ | ------ |
| Initial state Simplified Chinese | User Interface>Input>Keyboard>Input Methods>Intelligent Pinyin | userinterface.keyboard.ibus.libpinyin.pinyin.init-simplified-chinese | false / true(default) |
| Initial state Chinese | User Interface>Input>Keyboard>Input Methods>Intelligent Pinyin | userinterface.keyboard.ibus.libpinyin.pinyin.init-chinese | false / true(default) |
| Initial state full width | User Interface>Input>Keyboard>Input Methods>Intelligent Pinyin | userinterface.keyboard.ibus.libpinyin.pinyin.init-full | false(default) / true |
| Initial state full punctuations | User Interface>Input>Keyboard>Input Methods>Intelligent Pinyin | userinterface.keyboard.ibus.libpinyin.pinyin.init-full-punct | false / true(default) |

```
- Improved multisession support for post-session commands: In case multiple sessions run in parallel with a set post-session command, command is only triggered when all sessions are finished successfully.
  If session has the 'force' post-session command parameter set, the command is triggered immediately once the session is finished.

- **App Management**

	- Added: With the upcoming switch to bookworm as base for IGEL OS 12, a compatibility app was introduced for offering compatibility with all current released apps. If required, this app will automatically installed after the update to 12.5. A second reboot is needed after the update.
		 - With Base Sytem >= 12.4.2 the additional reboot is not needed as the compatibility app is directly installed with the Base System update.

- **Network**

	- Added Wake on LAN support via USB-C-to-LAN adapters
		- Activation by enabling any of the Wake on LAN settings of the LAN Interfaces
		- Only Wake on LAN from Suspend is supported

- **Setup Assistant**

	- Changed label of WiFi configuration dialog in Setup Assistant (Country or Region).

- **Hardware**

	- Added hardware support for LG gram 14ZT90R, 15ZT90R and 17ZT90R.
	- Improved power consumption on Lenovo ThinkPad L14 Intel Gen5.
	- Added hardware support for Lenovo ThinkPad L14 AMD Gen5.

- **SSO**

	- Added: Configurable list of allowed hosts for redirection:
```

|  Parameter  |  Registry   |  Type       |  Value      |
| ------ | ------ | ------ | ------ |
|  `List of allowed hosts for redirection`  |  `auth.cloudidp.host_allowlist`  |  string  |  empty *Default*  |

```
	- Added a parameter to Entra ID SSO which allows to add additional scopes.
	- The OpenID Connect scope value for the authentication request is now configurable:
```

|  Parameter  |  Registry   |  Type       |  Value      |
| ------ | ------ | ------ | ------ |
|  `OpenID Connect scope`  |  `auth.cloudidp.scope`  |  string  |  openid profile email *Default*  |

```
## Security Fixes

- Fixed libarchive security issue CVE-2024-26256.
- Fixed cups security issue CVE-2024-35235.
- Fixed expat security issues CVE-2024-28757, CVE-2023-52426 and CVE-2023-52425.
- Fixed iperf3 security issue CVE-2024-26306.
- Fixed ntfs-3g security issue CVE-2023-52890.
- Fixed libuv1 security issue CVE-2024-24806.
- Fixed iwd security issue CVE-2024-28084.
- Fixed exfatprogs security issue CVE-2023-45897.
- Fixed opensc security issues CVE-2024-1454 and CVE-2023-5992.
- Fixed tpm2-tools security issues CVE-2024-29039 and CVE-2024-29038.
- Fixed gdk-pixbuf security issue CVE-2022-48622.
- Fixed bind9 security issues CVE-2023-6516, CVE-2023-5517, CVE-2023-50868, CVE-2023-50387 and CVE-2023-4408.
- Fixed glibc security issues CVE-2024-33602, CVE-2024-33601, CVE-2024-33600 and CVE-2024-33599.
- Fixed giflib security issues CVE-2023-39742, CVE-2022-28506 and CVE-2021-40633.
- Fixed glib2.0 security issue CVE-2024-34397.
- Fixed ghostscript security issues CVE-2024-33871, CVE-2024-33870, CVE-2024-33869, CVE-2024-29510 and CVE-2023-52722.
- Fixed mysql-8.0 security issues CVE-2024-21102, CVE-2024-21096, CVE-2024-21087, CVE-2024-21069, CVE-2024-21062, CVE-2024-21060, CVE-2024-21054, CVE-2024-21047, CVE-2024-21013, CVE-2024-21009, CVE-2024-21008, CVE-2024-21000, CVE-2024-20998 and CVE-2024-20994.
- Fixed libndp security issue CVE-2024-5564.
- Fixed tiff security issue CVE-2023-3164.
- Fixed vte2.91 security issue CVE-2024-37535.
- Fixed python-idna security issue CVE-2024-3651.
- Fixed curl security issues CVE-2024-2398, CVE-2024-2004, CVE-2024-0853, CVE-2023-46219 and CVE-2023-46218.
- Fixed qemu security issues CVE-2024-3567, CVE-2024-3447, CVE-2024-3446, CVE-2024-26328, CVE-2024-26327, CVE-2023-6693, CVE-2023-6683, CVE-2023-42467, CVE-2023-3019, CVE-2021-3750 and CVE-2021-20255.
- Fixed libvpx security issue CVE-2024-5197.
- Fixed wget security issue CVE-2024-38428.
- Fixed openssh security issue CVE-2024-6387.

## Resolved Issues

- Fixed screen lock countdown-done command execution.
- Removed x.drivers.modesetting.no_min_cursor_size registry key as function was removed.

- **App Management**

	- Fixed: Showing error message on IGEL OS desktop if latest version can not be installed via auto update (dependency apps) due to not fulfilled requirements like Base System.

- **Setup Assistant**

	- Fixed Setup Assistant manual time entry.

- **Hardware**

	- Fixed microphone mute function key on HP Elite mt645 G8.
	- Fixed wake up from suspend on HP Elite mt645 G8.
	- Fixed microphone mute function key led on Lenovo ThinkPad L14 Gen5 Intel.

- **Remote Management**

	- Fixed download of files beginning with a white space.

## Known Issues

- Browser apps may not recognize custom certificates rolled out via UMS file transfer. The certificates are not correctly synchronized in the browser specific certificate stores/databases.
- Increased writeable cache partition size (by default). First boot with 12.4.x may take more time (once) when updating from a 12.2.x or older base system app.
- In very rare cases all apps are lost after an update. Should this be the case, an error message is shown "Opening system App Journal failed." - if the device is manged, the apps will be reinstalled after a reboot.
- The downgrade to base system 12.00.900 or 12.00.910 is not supported.
- **Chromium**
	- Downgrading base system to earlier versions may result in reset of the Chromium profile partition.

- **Network**

	- In some cases, network is not working in combination of Lenovo K14 Gen1 (AMD) and Lenovo Universal Dock. There is a kernel bugreport open but no proper fix so far.

- **WiFi**

	- Globally configured WiFi static IP is not used if establishing WiFi connection via WiFi system tray

- **HID**

	- Some touchpads are recognized as touchpad and mouse. This results in showing possible user settings for both variants.

- **Setup Assistant**

	- Timezone auto-detection is currently not functional (due to discontinued location service). The timezone must be set manually (as interims / alternative solution).

- **Audio**

	- Headset mic via jack is not working on LG 27CN650 and LG 34CN650.

- **Hardware**

	- Lenovo L14 Gen5 Intel video codec errors (graphic glitches during accelerated video playback)
	- Display configuration of displays connected to HP G5 Docking Station may fail on HP t655.
	- Rotation of displays connected to the Lenovo ThinkPad USB-C Hybrid Dock may fail.
	- Wake up from suspend via UMS does not work on HP mt645 G7 devices. Workaround: Disable system suspend and use shutdown instead.
	- If using 6 x 4K@60Hz monitors on HP t755/t740 with the additional graphic card, one or two of the monitors may stay black after coming back from DPMS off state.
	 - This is caused by using the additional graphic card as primary, which only has 512MB VRAM (the VRAM is not sufficient in this configuration). Possible solution: Increasing the VRAM size of the iGPU to 2048MiB in BIOS (maybe 1024MiB may also work) and activate IGEL registry key `x.drivers.swap_card0_with_card1` so the iGPU will become the Primary GPU. Connector names will be changed with that!
	- Built-in fingerprint sensor is not supported on HP mt440 G3 and mt645 G7/G8.
	- Wake on LAN is not functional on Dell OptiPlex 3000 and Lenovo K14 Gen1

- **IGEL Desktop**

	- Connecting a new audio device during running audio playback / stream may result in failure of audio tray.
	- External display mode not functional on ThinkPad L14 Gen3 AMD
	- Disabled compositing (transparency effects) in window manager to circumvent issues with screen lock. Registry key `windowmanager.wm0.variables.usecompositing` is not configurable anymore.
	- If two monitors are configured in a vertical layout (one above the other), and those monitors are configured with "auto-detect" resolution, saving leads to a wrong layout order.
	- On-screen keyboard sporadically crashes when typing.

- **Licensing**

	- Manual deployment of add-on licenses for IGEL Agent for Imprivata licenses (via UMS) is only possible after finished installation of IGEL Agent for Imprivata app on device.
```

----

## 2024-06-19 - [12.4.1 PR1 (Patch Release)](https://app.igel.com/base_system/12.4.1+1)

```
The new BUILD 12.4.1 PR1 for IGEL Workspace is ready.

These are the release notes published with that release:

Changes since: 12.4.1

## New Features

- Improved power consumption on Lenovo L14 Gen5 Intel.

- Setup Assistant:

    Changed label of WiFi configuration dialogue in Setup Assistant (Country or Region).

## Resolved Issues

- Fixed screen lock countdown-done command execution.

- Hardware

    Fixed microphone mute function key led on Lenovo L14 Gen5 Intel.
    Fixed microphone mute function key on HP mt645 G8.
    Fixed wake up from suspend on HP mt645 G8.

## Known Issues

- Browser apps may not recognize custom certificates rolled out via UMS file transfer. The certificates are not correctly synchronized in the browser specific certificate stores/databases.
- Increased writeable cache partition size (by default). First boot with 12.4.x may take more time (once) when updating from a 12.2.x or older base system app.
- In very rare cases all apps are lost after an update. Should this be the case, an error message is shown "Opening system App Journal failed." - if the device is manged, the apps will be reinstalled after a reboot.
- The downgrade to base system 12.00.900 or 12.00.910 is not supported.

- Chromium

    Downgrading base system to earlier versions may result in reset of the Chromium profile partition.

- Network

    In some cases, network is not working in combination of Lenovo K14 Gen1 (AMD) and Lenovo Universal Dock. There is a kernel bugreport open but no proper fix so far.

- WiFi

    Globally configured WiFi static IP is not used if establishing WiFi connection via WiFi system tray

- HID

    Some touchpads are recognized as touchpad and mouse. This results in showing possible user settings for both variants.

- Setup Assistant

    Timezone auto-detection is currently not functional (due to discontinued location service). The timezone must be set manually (as interims / alternative solution).

- Audio

    Headset mic via jack is not working on LG 27CN650 and LG 34CN650.

- Hardware

    Lenovo L14 Gen5 Intel video codec errors (graphic glitches during accelerated video playback)
    Display configuration of displays connected to HP G5 Docking Station may fail on HP t655.
    Rotation of displays connected to the Lenovo ThinkPad USB-C Hybrid Dock may fail.
    Wake up from suspend via UMS does not work on HP mt645 G7 devices. Workaround: Disable system suspend and use shutdown instead.
    If using 6 x 4K@60Hz monitors on HP t755/t740 with the additional graphic card, one or two of the monitors may stay black after coming back from DPMS off state.
    This is caused by using the additional graphic card as primary, which only has 512MB VRAM (the VRAM is not sufficient in this configuration). Possible solution: Increasing the VRAM size of the iGPU to 2048MiB in BIOS (maybe 1024MiB may also work) and activate IGEL registry key x.drivers.swap_card0_with_card1 so the iGPU will become the Primary GPU. Connector names will be changed with that!
    Built-in fingerprint sensor is not supported on HP mt440 G3 and mt645 G7/G8.
    Wake on LAN is not functional on Dell OptiPlex 3000 and Lenovo K14 Gen1

- IGEL Desktop

    Connecting a new audio device during running audio playback / stream may result in failure of audio tray.
    External display mode not functional on ThinkPad L14 Gen3 AMD
    Disabled compositing (transparency effects) in window manager to circumvent issues with screen lock. Registry key windowmanager.wm0.variables.usecompositing is not configurable anymore.
    If two monitors are configured in a vertical layout (one above the other), and those monitors are configured with "auto-detect" resolution, saving leads to a wrong layout order.
    On-screen keyboard sporadically crashes when typing.

- Licensing

    Manual deployment of add-on licenses for IGEL Agent for Imprivata licenses (via UMS) is only possible after finished installation of IGEL Agent for Imprivata app on device.
```

-----

## 2024-05-31 - [12.4.1](readme12.4.1.txt)

```
The new BUILD 12.4.1 for IGEL Workspace is ready.

These are the release notes published with that release:
# Changes since: 12.4.0

## New Features

- Changed default of power saving settings for screen getting dimmed to 20% after 120 seconds inactivity.
```

|  Setup  |  Parameter  |  Registry  |  Type  |  Value  |
| ------ | ------ | ------ | ------ | ------ |
|  `System > Power Options > Display > Brightness Reduction`  |  `On inactivity reduce to`  |  `x.xserver%.brightness_level_ac`  |  integer  |  20 *Default*  |
|  `System > Power Options > Display > Brightness Reduction`  |  `Reduce after`  |  `x.xserver%.brightness_on_ac`  |  integer  |  120 *Default*  |
|  `System > Power Options > Display > Brightness Reduction`  |  `Reduce after`  |  `x.xserver%.brightness_on_battery`  |  integer  |  120 *Default*  |

```

- Added further registry keys for influencing power consumption (Auto means active on all Lenovo devices with battery):
```

|  Parameter  |  Registry   |  Range      |  Value      |  Type       |
| ------ | ------ | ------ | ------ | ------ |
|  `Call idle actions on battery after this time of inactivity (greater 10 seconds, value 9 or lower is never)`  |  `system.powersave.idle_action_on_battery`  |  |  50 *Default*  |  integer  |
|  `Use powertop auto tune to reduce power usage`  |  `system.powersave.powertop_auto_tune`  |  [Auto][Enable][Disable]  |  *Auto*  |  |
|  `Use laptop mode to reduce power usage`  |  `system.powersave.laptop_mode`  |  [Auto][Enable][Disable]  |  *Auto*  |  |
|  `Clock down AMDGPU if system is idle (idle action time reached).`  |  `system.powersave.clock_down_amdgpu_on_idle`  |  [Auto][Enable][Disable]  |  *Auto*  |  |
|  `Clock down Intel GPU if system is idle (idle action time reached).`  |  `system.powersave.clock_down_i915_on_idle`  |  [Auto][Enable][Disable]  |  *Auto*  |  |
|  `Set Ryzen CPU to power save mode if system is idle (idle action time reached).`  |  `system.powersave.use_ryzenadj_on_idle`  |  [Auto][Enable][Disable]  |  *Auto*  |  |
|  `Set Intel CPU to power save mode if system is idle (idle action time reached).`  |  `system.powersave.use_energy_policy_on_idle`  |  [Auto][Enable][Disable]  |  *Auto*  |  |
|  `Call idle actions on AC after this time of inactivity (greater 10 seconds, value 9 or lower is never)`  |  `system.powersave.idle_action_on_ac`  |  |  50 *Default*  |  integer  |

```

- Updated kernel to version 6.6.22
- Added option to set hardware clock. The default, Auto, will look for Windows partitions and, if present, assume that Windows is installed and the real time clock is set to local time.
```

|  Setup  |  Parameter   |  Registry    |  Range  |
| ------ | ------ | ------ | ------ |
|  System > Time and Date  |  `HW clock timezone`   |  `system.time.hwclock_timezon`  |  [Auto (default)] [UTC] [localtime]  |

```

- Added: Strace and tcpdump debug tools are part of IGEL OS base system.
- Added usage of minimal cursor size in X11 which helps reducing power consumption on Intel devices.
 - Added Registry key to disable minimal cursor size quirk:
```

|  Parameter  |  Registry   |  Type       |  Value      |
| ------ | ------ | ------ | ------ |
|  `Disable minimal cursor size quirk.`  |  `x.drivers.modesetting.no_min_cursor_size`  |  bool  |  enabled / *disabled* (default)  |

```

- **OSC Installer**

	- Changed the size of the dummy partition from 1GB to 100MB or 10MB, depending on the storage capacity.
	- Added installation option `Force Legacy (non UEFI) boot`. If enabled, BIOS boot will be used for installed IGEL OS - even if OSC was started in EFI mode
	  - In OS 11 the option is known as `Force Legacy`.
	- Added new options for factory image creation:
	  - With the "Reset after first boot" option a deployed image can be tested and any change is resetted after boot.
	  -  With the "Automatically shutdown at first boot" option a deployed image does a self-check and automatically shuts down afterwards. A log file of this deployment self-check is written to the 1st partition.
	- Changed: Reduced size of 1st partition on UD Pocket - effective with new installations (via OSC) or factory deployment of 12.4.1 or later.

- **WiFi**

	- Added option for DHCP refresh after roaming (within the same network).
```

|  Parameter  |  Registry   |  Type       |  Value      |
| ------ | ------ | ------ | ------ |
|  `Refresh DHCP after roaming`  |  `network.interfaces.wirelesslan.device0.roam_refresh_dhcp`  |  bool  |  enabled / *disabled* (default)  |

```

- **Print-Center**

	- Added print-center tray app to search and connect local or network printers. The tray app requires the CUPS printing app and uses Avahi to discover available network printers. For best results use CUPS printing app >= 1.2.0 older versions do not support auto discovery.
		 - New parameter were added to enable/disable the tray app and to enable/disable Avahi for auto discovery
```

|  Setup  |  Parameter  |  Registry  |  Type  |  Value  |
| ------ | ------ | ------ | ------ | ------ |
|  `Apps > Avahi Daemon`  |  `Enable the Avahi daemon`  |  `app.avahi_daemon.enable`  |  boolean  |  true *default* / false  |
|  `User Interface > Desktop > Taskbar Items`  |  `Show print-center tray icon on desktop`  |  `userinterface.system_tray.printer.desktop`  |  boolean  |  true *default* / false  |
|  `User Interface  > Screenlock / Screensaver > Taskbar`  |  `Show print-center tray icon on screenlock`  |  `userinterface.system_tray.printer.lockscreen`  |  boolean  |  true / false *default*  |

```

- **Audio**

	- Changed: On first boot (after installation) all devices are set to 50% volume.

- **Hardware**

	- Added support for Quectel CAT16 WW SKU - EM160R-GL Gen2 and Quectel CAT 6 WW SKU - EM061K-GL on Lenovo ThinkPads L14 Intel/AMD Gen5 and L16 Intel/AMD Gen1
	- Added hardware support for Lenovo ThinkPad L14 Intel Gen5.
	- Added support for Poly Voyager Focus 2.
	- Added hardware support for HP Elite mt645 G8.
	- Changed energy savings settings for HP Elite mt645 G8.

- **Remote Management**

	- Added option to set rank of UMS connectors. UMS version 12.04.120 or later is required.
```

|  Parameter   |  Registry    |  Type        |  Value       |
| ------ | ------ | ------ | ------ |
|  `connector type`   |  `system.remotemanager.connector%.type`           |  string                                |  ums/icg/*undefined*(default)      |
 
```

	- This parameter is set automaticly by UMS.
```

|  Parameter   |  Registry    |  Type        |  Value       |
| ------ | ------ | ------ | ------ |
|  `Ranking of connectors`   |  `system.remotemanager.connectorranking`           |  string                                |  *no preference*(default) / prefer UMS /   prefer ICG  |

```

	-  If connectorranking is set to "prefer ICG", the rmagent tries to connect to an ICG and only connects to an UMS server, if no ICG is reachable or configured.
	-  If connectorranking is set to "prefer UMS", the rmagent tries to connect to an UMS and only connects to an ICG, if no UMS is reachable or configured.
	-  If connectorranking is set to "no preference", the rmagent connects randomly to any configured device-connector.

- **SSO**

	- Changed / renamed Azure AD IDP to Microsoft Entra ID.
	- Changed / improved error messages for SSO login.

## Security Fixes

- Fixed tiff security issues CVE-2023-6277, CVE-2023-6228 and CVE-2023-52356.
- Fixed libxml2 security issue CVE-2024-25062.
- Fixed python-cryptography security issue CVE-2023-50782.
- Fixed dnsmasq security issues CVE-2023-50868 and CVE-2023-50387.
- Fixed vim security issue CVE-2024-22667.
- Fixed nss security issues CVE-2023-6135, CVE-2023-5388 and CVE-2023-4421.
- Fixed shadow security issue CVE-2023-4641.
- Fixed glibc security issue CVE-2024-2961.
- Fixed gnutls28 security issue CVE-2024-28834.
- Fixed nghttp2 security issue CVE-2024-28182.
- Fixed pillow security issue CVE-2024-28219.
- Fixed less security issue CVE-2024-32487.
- Fixed xorg-server security issues CVE-2024-31080, CVE-2024-31081 and CVE-2024-31083.
- Added registry key to enable support for byteswapped clients, disabled by default for security reasons:
```

|  Parameter  |  Registry   |  Type       |  Value      |
| ------ | ------ | ------ | ------ |
|  `Enable support for byteswapped X clients.`  |  `x.xserver%.allowbyteswappedclients`  |  bool  |  enabled / *disabled* (default)  |

```

## Resolved Issues

- Fixed: UMS connectors are shown only once in setup.
- Fixed: Proxy configuration issue in combination with AD/Kerberos

- **Network**

	- Fixed network configuration on Hyper-V virtualization.

- **Custom Partition**

	- Improved custom partition handling on slow devices - to avoid timeout.
	- Fixed custom partition download by adding UMS trust-store certificates to the valid chain for download. Additionally the host name check was removed and more debug output is generated.

- **Hardware**

	- Fixed missing firmware file for intel 9462ngw WiFi chipset.

- **Remote Management**

	- Implemented automatic upgrade of a valid UMS registration to Unified Protocol if the device was upgraded by the IGEL OSC12 remaining old settings.
	- Fixed installing of TLS certificates assigned by the UMS into the web browser's CA certificates storage.

- **IGEL Desktop**

	- Fixed: Set audio volume back to 100% after disabling overamplification.

- **Mobile Broadband**

	- Fixed: On devices supporting mobile broadband (physical) and eSim, an automatic switch to the physical SIM slot is performed if eSim has no profile assigned.

## Known Issues

- Browser apps may not recognize custom certificates rolled out via UMS file transfer. The certificates are not correctly synchronized in the browser specific certificate stores/databases.
- Increased writeable cache partition size (by default). First boot with 12.4.x may take more time (once) when updating from a 12.2.x or older base system app.
- In very rare cases all apps are lost after an update. Should this be the case, an error message is shown "Opening system App Journal failed." - if the device is manged, the apps will be reinstalled after a reboot.
- The downgrade to base system 12.00.900 or 12.00.910 is not supported.

- **Chromium**

	- Downgrading base system to earlier versions may result in reset of the Chromium profile partition.

- **Network**

	- In some cases, network is not working in combination of Lenovo K14 Gen1 (AMD) and Lenovo Universal Dock. There is a kernel bugreport open but no proper fix so far.

- **WiFi**

	- Globally configured WiFi static IP is not used if establishing WiFi connection via WiFi system tray

- **HID**

	- Some touchpads are recognized as touchpad and mouse. This results in showing possible user settings for both variants.

- **Setup Assistant**

	- Timezone auto-detection is currently not functional (due to discontinued location service). The timezone must be set manually (as interims / alternative solution).

- **Audio**

	- Headset mic via jack is not working on LG 27CN650 and LG 34CN650.

- **Hardware**

	- L14 Gen5 video codec errors (graphic glitches during accelerated video playback)
	- L14 Gen5 mic mute function button LED will always stay on
	- L14 Gen5 display brightness can be completely turned off
	- L14 Gen5 Intel disconnect / reconnect of LAN takes unusal long
	- The suspend/resume functionality on HP mt645 G8 laptops is currently broken due to an incompatibility with recent BIOS versions and the Linux 6.6.x kernel. As a result, affected laptops won't resume or resume incompletely and have to be restarted.
	- Display configuration of displays connected to HP G5 Docking Station may fail on HP t655.
	- Rotation of displays connected to the Lenovo ThinkPad USB-C Hybrid Dock may fail.
	- Wake up from suspend via UMS does not work on HP mt645 G7 devices. Workaround: Disable system suspend and use shutdown instead.
	- If using 6 x 4K@60Hz monitors on HP t755/t740 with the additional graphic card, one or two of the monitors may stay black after coming back from DPMS off state.
	 - This is caused by using the additional graphic card as primary, which only has 512MB VRAM (the VRAM is not sufficient in this configuration). Possible solution: Increasing the VRAM size of the iGPU to 2048MiB in BIOS (maybe 1024MiB may also work) and activate IGEL registry key `x.drivers.swap_card0_with_card1` so the iGPU will become the Primary GPU. Connector names will be changed with that!
	- Built-in fingerprint sensor is not supported on HP mt440 and mt645 G7/G8.
	- Wake on LAN is not functional on Dell OptiPlex 3000 and Lenovo K14 Gen1

- **IGEL Desktop**

	- Connecting a new audio device during running audio playback / stream may result in failure of audio tray.
	- External display mode not functional on ThinkPad L14 Gen3 AMD
	- Disabled compositing (transparency effects) in window manager to circumvent issues with screen lock. Registry key `windowmanager.wm0.variables.usecompositing` is not configurable anymore.
	- If two monitors are configured in a vertical layout (one above the other), and those monitors are configured with "auto-detect" resolution, saving leads to a wrong layout order.
	- On-screen keyboard sporadically crashes when typing.

- **Licensing**

	- Manual deployment of add-on licenses for IGEL Agent for Imprivata licenses (via UMS) is only possible after finished installation of IGEL Agent for Imprivata app on device.
```

-----

## 2024-04-24 - [12.4.0](readme12.4.0.txt)

```
The new BUILD 12.4.0 for IGEL Workspace is ready.

These are the release notes published with that release:

# Changes since: 12.3.0

## New Features

- Updated IGEL screensaver logo.
- Updated IGEL boot animation.
- Changed: Xorg.conf does not have any "Monitor" sections anymore, relying on Xorg's automatic detection.
- Updated kernel to version 6.6.16.
- Updated mesa to version 23.3.4.
- Added (enhanced) settings for kernel cmdline options

  - New registry keys:
```

| Parameter | Registry | Type | Value | Range |
| ------ | ------ | ------ | ------ | ------ |
| Set reboot kernel parameters. | system.kernel.bootparams.reboot |  | _Default_ | [Default][Bios][Triple][Kbd][Acpi][Efi][Pci] |
| Disable use of initial boot framebuffer. | system.kernel.bootparams.vga_off | bool | enabled / _disabled_ (default) |  |
| Set maximum allowed processor cstate. | system.kernel.bootparams.max_proc_cstate |  | _No limit_ | [No limit][1][2][3][4][5][6][7][8][9] |
| Enable debug output for i8042 driver. | system.kernel.bootparams.i8042.debug | bool | enabled / _disabled_ (default) |  |
| Do not use muxing for i8042 driver. | system.kernel.bootparams.i8042.nomux | bool | enabled / _disabled_ (default) |  |
| Disable use of PnP configuration for i8042 driver. | system.kernel.bootparams.i8042.nopnp | bool | enabled / _disabled_ (default) |  |
| Disable use of AUX loopback command for i8042 driver. | system.kernel.bootparams.i8042.noloop | bool | enabled / _disabled_ (default) |  |
| Ignore timeout signaled by controller for i8042 driver. | system.kernel.bootparams.i8042.notimeout | bool | enabled / _disabled_ (default) |  |
| Reset controller during init for i8042 driver. | system.kernel.bootparams.i8042.reset | bool | enabled / _disabled_ (default) |  |
| Set ACPI kernel parameters. | system.kernel.bootparams.acpi |  | _No setting_ | [No setting][Force][On][Off][Noirq][Strict][Rsdt][Copy_dsdt] |

```
  - Changed registry keys:
```

| Parameter | Registry | Range | Value |
| ------ | ------ | ------ | ------ |
| Various PCI subsystem options | system.kernel.bootparams.pci | [Default][Conf Mechanism 1][Conf Mechanism 2][Disable multiple PCI domains][Disable use of MMCONFIG][Disable MSI][Ignore ACPI PCI host bridge window][Ignore ACPI IRQ routing][Route IRQ for all PCI devices] | _Default_ |
| Set maximum allowed cstate on intel cpus. | system.kernel.bootparams.max_cstate | [No limit][0][1][2][3][4][5][6] | _No limit_ |

```
- Updated IGEL logo within IGEL Setup Assistant
- Changed logo on default wallpaper.
- Added support for User Login History for login types AD/Kerberos, Single Sign-On (ID Provider) and Local User. If enabled, login and logoff events of corresponding types are logged in UMS.
```

| Setup | Parameter | Registry | Value |
| ------ | ------ | ------ | ------ |
| System > Remote Management > Options | Log login and logoff events | system.remotemanager.log_authentication | *disabled* (default) / enabled |

```
- Added checkbox and corresponding text for accepting EULA on IGEL OS.
- Changed: Base system requires Citrix CWAL version 2311 or newer for Citrix Cloud login. Old libwebkit library is removed due to security reasons.
- Added / enhanced post session command support: Besides Logoff and Shutdown, customized commands can be configured.

- **OSC Installer**

	- Added possibility to create a minimal (self-extracting / expanding) factory image with the OSC installer.

- **Network**

	- SCEP: Improved handling of client certificate subject change (particularly if the hostname is part of the subject). Registry key:
```

|  Parameter  |  Registry   |  Range      |  Value      |
| ------ | ------ | ------ | ------ |
|  `Hostname change handling`  |  `network.scepclient.cert%.hostname_change_handling`  |  [Ignore][Reset]  |  *Ignore*  |

```
	- A notification is shown, when SCEP server is reachable but certificate renewal fails. The notification includes any deviation of the desired subject from the old one.
	- Added check if BIOS has Wake-on-LAN disabled. If disabled, it is not recommended to configure network interface to use WoL. This check is only supported / possible on Lenovo devices with official IGEL OS hardware support. Parameter:
```

| Parameter | Registry | Type | Value |
| ------ | ------ | ------ | ------ |
| `Respect the BIOS WoL setting so if disabled reflect this for the linux network devices settings.` | `network.interfaces.respect_bios_wol_setting` | bool | *enabled* (default) / disabled |

```
	- Added: The`Automatic switch of network connection` parameter (network.applet.wireless.enable_wifi_auto_switch) is renamed and handles Ethernet, WiFi and Mobile Broadband connections. Furthermore, the parameter was moved to a new section in Setup: `Network > Common Settings`, together with `Computer Name` (network.dns.hostname) and `Host List` (network.hosts%).
	- Added support for MACsec with preshared key. NetworkManager currently requires that the CAK consists of 32 hexadecimal digits and the CKN consists of 64 hexadecimal digits.

- **Audio**

	- Added input overamplification parameter to complement the existing overamplification parameter.
```

|  Setup  |  Parameter  |  Registry   |  Type       |  Value      |
| ------ | ------ | ------ | ------ | ------ |
|  `Devices > Audio > Options`  |  `Enable input volume overamplification`  |  `userinterface.sound.input_overamplification`  |  bool  |  enabled / *disabled* (default)  |

```
	- Added new Audio tray app. The Sound Preferences dialog is not available anymore.
```

|  Setup  |  Parameter  |  Registry   |  Type      |  Value      |
| ------ | ------ | ------ | ------ | ------ |
|  `User Interface > Desktop > Taskbar Items`  |  `Show audio tray icon on desktop`  |  `userinterface.system_tray.audio.desktop`  |  bool  |  *enabled (default)*/disabled  |

```
- **Hardware**

	- Added support for Lenovo USB-C to Ethernet Adapter
	- Added driver for Intel EC1000R gigabit network adapter.
	- Added hardware support for Lenovo ThinkPad L13 Intel Gen4.
	- Validated 256GB 2230 PCIe NVMe module for HP t550 and t655.
	- Added WWAN support on HP mt440 device with BIOS v1.08.00 and Intel XMM7560 module Firmware v1.16.48.
	- Added hardware support for Lenovo ThinkPad L13 AMD Gen4.

- **Remote Management**

	- Added support for system-wide proxy configuration.
	- Added compatibility for remote management via F5 Reverse Proxy / SSL Offloading (requires UMS 12.04.100 or later).
	- Added compatibility for remote management via Microsoft's Azure Application Gateway (requires UMS 12.04.100 or later).
	- Added: RSA-4096 key is created as device key by default. The key type can be changed via IGEL setup:
```

|  Registry    |  Value       |
| ------ | ------ |
|  `system.remotemanager.device_key_type`  |  *RSA-4096* (default) / EC-P521R1  |

```
- **IGEL Desktop**

	- Replaced Display Switcher with new Display Tray App.
```

|  Setup  |  Parameter  |  Registry   |  Type      |  Value      |
| ------ | ------ | ------ | ------ | ------ |
|  `User Interface > Desktop > Taskbar Items`  |  `Show display tray icon on desktop`  |  `userinterface.system_tray.display.desktop`  |  bool  |  *enabled (default)*/disabled  |

```
	- Added switch for changing display modes: Custom, External, Internal and Mirror.
	- Technically reworked monitor handling. Monitors are now identified by their EDID data.
	- Changed: Tray Apps are used in login and lock screen. Configurable on setup page `User Interface > Screenlock / Screensaver > Taskbar`:
```

|  Parameter  |  Registry   |  Type      |  Value      |
| ------ | ------ | ------ | ------ |
|  `Show input settings tray icon on lockscreen`  |  `userinterface.system_tray.input.lockscreen`  |  bool  |  enabled/*disabled (default)*  |
|  `Show battery tray icon on lockscreen`  |  `userinterface.system_tray.battery.lockscreen`  |  bool  |  *enabled (default)*/disabled  |
|  `Show UMS connection status tray icon on lockscreen`  |  `userinterface.system_tray.ums_status.lockscreen`  |  bool  |  *enabled (default)*/disabled  |
|  `Show ethernet connection status tray icon on lockscreen`  |  `userinterface.system_tray.lan.lockscreen`  |  bool  |  *enabled (default)*/disabled  |
|  `Show wifi connection status tray icon on lockscreen`  |  `userinterface.system_tray.wifi.lockscreen`  |  bool  |  *enabled (default)*/disabled  |
|  `Show mobile-broadband connection status tray icon on lockscreen`  |  `userinterface.system_tray.mobile_broadband.lockscreen`  |  bool  |  *enabled (default)*/disabled  |
|  `Show audio tray icon on lockscreen`  |  `userinterface.system_tray.audio.lockscreen`  |  bool  |  enabled/*disabled (default)*  |

```
	- Changed default values for taskbar and icon position, new defaults are:
```

|  Setup   |  Parameter   |  Registry    |  Type        |  Value       |
| ------ | ------ | ------ | ------ | ------ |
|  User Interface > Desktop > Taskbar  |  `Monitor`        |  `windowmanager.wm0.variables.taskbarxineramamonitor`              |  range                            |   *[Primary monitor] (default)* [1st monitor] [2nd monitor] [3rd monitor] [4th monitor] [5th monitor] [6th monitor] [7th monitor] [8th monitor] |
|  User Interface > Desktop  |  `Monitor for Desktop Icons`        |  `windowmanager.wm0.variables.desktopxineramamonitor`              |  range                            |   [All monitors] *[Same as taskbar] (default)* [1st monitor] [2nd monitor] [3rd monitor] [4th monitor] [5th monitor] [6th monitor] [7th monitor] [8th monitor] |

```
- **Mobile Broadband**

	- Added Quectel EM05-G support for Lenovo ThinkPad L13 AMD Gen4 and L13 Intel Gen4.
	- Added regional support with Quectel EM05-G for US SIM cards on supported Lenovo ThinkPad devices.
	- Added option to establish Mobile Broadband connection automatically.
```

|  Setup  | Parameter | Registry | Type | Value |
| ------ | ------ | ------ | ------ | ------ |
|  Network > Mobile Broadband  | `Enable automatically connect` | `network.interfaces.mobile_broadband.auto_connect` | bool | *enabled* (default) / disabled |

```
	- Added roaming parameter for WWAN connection.
```

|  Setup  | Parameter | Registry | Type | Value |
| ------ | ------ | ------ | ------ | ------ |
|  Network > Mobile Broadband  | `Roaming` | `network.interfaces.mobile_broadband.roaming` | bool | *enabled* (default) / disabled |

```
	- Added configurable request for entering PIN of SIM-card within the Mobile Broadband tray app.
```

|  Setup  | Parameter | Registry | Type | Value |
| ------ | ------ | ------ | ------ | ------ |
|  Network > Mobile Broadband  | `Allow changing the request for the PIN of the SIM-card after boot in the tray application` | `network.interfaces.mobile_broadband.changing_pin_request_allowed` | bool | *enabled* (default) / disabled |

```
	- Changed: Mobile Broadband (network.interfaces.mobile_broadband.enabled) is now enabled per default (configurable on setup page `Network > Mobile Broadband`).
	- The `Automatic switch of network connection` parameter (network.applet.wireless.enable_wifi_auto_switch) now handles the automatic blocking and unblocking not only for WiFi but also for Mobile Broadband connections. In Setup the parameter was moved to a new section `Network > Common Settings`, along with `Computer Name` (network.dns.hostname) and `Host List` (network.hosts%).
	- Added reworked Tray App for Mobile Broadband support.
```

|  Setup  |  Parameter  |  Registry   |  Type      |  Value      |
| ------ | ------ | ------ | ------ | ------ |
|  `User Interface > Desktop > Taskbar Items`  |  `Show mobile-broadband connection status tray icon on desktop`  |  `userinterface.system_tray.mobile_broadband.desktop`  |  bool  |  *enabled (default)*/disabled  |

```
	- Added: Mobile internet Access Point Name with username and password can be defined on setup page `Network > Mobile Broadband`. This APN has higher priority than any auto-detected provider.
	- Added configurable permission to change PIN of SIM-card within Mobile Broadband Tray App.
```

|  Setup  | Parameter | Registry | Type | Value |
| ------ | ------ | ------ | ------ | ------ |
|  Network > Mobile Broadband  | `Allow changing the PIN of the SIM-card in the tray application` | `network.interfaces.mobile_broadband.changing_pin_allowed` | bool | *enabled* (default) / disabled |

```
	- Added: Possibilty to unlock SIM card with PUK (if needed).

- **SSO**

	- Added support for automatical Single Sign-on (SSO) login with given user credentials. All our Identity Providers except the generic OpenID Connect provider are supported.
```

|  Setup      |  Parameter  |  Registry   |  Type       |  Value      |
| ------ | ------ | ------ | ------ | ------ |
|  Security > Logon > Single Sign-on  |  `Password for autologin`  |  `auth.cloudidp.password`  |  string  |  empty *Default*  |
|  Security > Logon > Single Sign-on  |  `Automatically perform login`  |  `auth.cloudidp.autologin`  |  bool  |  enabled / *disabled* (default)  |
|  Security > Logon > Single Sign-on  |  `Username for autologin`  |  `auth.cloudidp.username`  |  string  |  empty *Default*  |

```
	- Added password-less guest-user login with limited access to applications. Each application session can be made available in normal user login, guest login, or both with Registry parameters sessions.<instance>.login_method or app.<app-name>.sessions.<instance>.login_method - requires Chromium Browser 120.0.6099.216 Build 5.0 or later.
```

|  Setup  |  Parameter  |  Registry  |  Value  |
| ------ | ------ | ------ | ------ |
|  Security > Logon > Guest |  Present session to  |  `sessions.<instance>.login_method` <br> `app.<app-name>.sessions.<instance>.login_method`  |  "User" (default) / "Guest" / "All"  |

```
	- This is the default for any session including app sessions. Latter ones inherit to `app.<app-name>.sessions.<app_%_or_instance#>.login_method`. Standard sessions inherit to `sessions.<name_%_or_instance#>.login_method`.
	- Choose applications to be available in a guest session by setting the above parameters to 'Guest' or 'All'. On command-line usage of nodelist sessions to get a currently defined list of sessions.

## Security Fixes

- Fixed libssh2 security issue CVE-2023-48795.
- Fixed openssh security issues CVE-2023-51385, CVE-2023-51384 and CVE-2023-48795.
- Fixed libminizip1 security issue CVE-2023-45853
- Fixed vim-tiny security issues CVE-2022-1725, CVE-2022-1771, CVE-2022-1897, CVE-2022-2000, CVE-2023-46246, CVE-2023-48231, CVE-2023-48233, CVE-2023-48234, CVE-2023-48235, CVE-2023-48236 and CVE-2023-48237
- Fixed glibc security issues CVE-2023-4813 and CVE-2023-4806.
- Fixed nghttp2 security issue CVE-2023-44487.
- Fixed perl security issue CVE-2023-47038.
- Fixed poppler security issues CVE-2022-38349, CVE-2022-37052, CVE-2022-37051, CVE-2022-37050 and CVE-2020-23804.
- Fixed python3.8 security issue CVE-2023-40217.
- Fixed python-cryptography security issue CVE-2023-23931.
- Fixed sqlite3 security issue CVE-2023-7104.
- Fixed tiff security issues CVE-2023-3576 and CVE-2022-40090.
- Fixed tar security issue CVE-2023-39804.
- Updated gst-plugins-base1.0 packages:
  - gstreamer1.0-alsa from 1.22.6-1igel1701244602 to 1.22.9-1igel1707141227 version
  - gir1.2-gst-plugins-base-1.0 from 1.22.6-1igel1701244602 to 1.22.9-1igel1707141227 version
  - gstreamer1.0-gl from 1.22.6-1igel1701244602 to 1.22.9-1igel1707141227 version
  - gstreamer1.0-plugins-base from 1.22.6-1igel1701244602 to 1.22.9-1igel1707141227 version
  - gstreamer1.0-x from 1.22.6-1igel1701244602 to 1.22.9-1igel1707141227 version
  - libgstreamer-gl1.0-0 from 1.22.6-1igel1701244602 to 1.22.9-1igel1707141227 version
  - libgstreamer-plugins-base1.0-0 from 1.22.6-1igel1701244602 to 1.22.9-1igel1707141227 version
- Updated gstreamer1.0-libav from 1.22.7-1igel1701247613 to 1.22.9-1igel1707166316 version
- Updated gst-omx packages:
  - gstreamer1.0-omx-generic from 1.22.4-1igel1690182724 to 1.22.8-1igel1704883480 version
  - gstreamer1.0-omx-bellagio-config from 1.22.4-1igel1690182724 to 1.22.8-1igel1704883480 version
- Fixed gst-plugins-bad1.0 security issue CVE-2024-0444.
- Updated gst-plugins-good1.0 packages:
  - gstreamer1.0-plugins-good from 1.22.6-1+b1igel1701245188 to 1.22.9-1igel1707141628 version
  - gstreamer1.0-pulseaudio from 1.22.6-1+b1igel1701245188 to 1.22.9-1igel1707141628 version
- Updated gst-plugins-ugly1.0 packages:
  - gstreamer1.0-plugins-ugly-asf from 1.22.6-1igel1701246116 to 1.22.9-1igel1707142312 version
  - gstreamer1.0-plugins-ugly-x264 from 1.22.6-1igel1701246116 to 1.22.9-1igel1707142312 version
- Updated gstreamer1.0-vaapi from 1.22.6-1igel1701247435 to 1.22.9-1igel1707161592 version JIRA LX8-8432
- Updated gstreamer1.0 packages:
  - libgstreamer1.0-0 from 1.22.6-1igel1701244342 to 1.22.9-1+b1igel1707141080 version
  - gir1.2-gstreamer-1.0 from 1.22.6-1igel1701244342 to 1.22.9-1+b1igel1707141080 version
  - gstreamer1.0-tools from 1.22.6-1igel1701244342 to 1.22.9-1+b1igel1707141080 version
- Fixed gnutls28 security issue CVE-2024-0553:
  - libgnutls30 from 3.6.13-2ubuntu1.9 to 3.6.13-2ubuntu1.10 version (security update)
  - libgnutls-openssl27 from 3.6.13-2ubuntu1.9 to 3.6.13-2ubuntu1.10 version (security update)
- Fixed openldap security issues CVE-2023-2953:
  - libldap-2.4-2 from 2.4.49+dfsg-2ubuntu1.9 to 2.4.49+dfsg-2ubuntu1.10 version (security update)
  - ldap-utils from 2.4.49+dfsg-2ubuntu1.9 to 2.4.49+dfsg-2ubuntu1.10 version (security update)
  - libldap-common from 2.4.49+dfsg-2ubuntu1.9 to 2.4.49+dfsg-2ubuntu1.10 version (security update)
- Fixed xz-utils security issue CVE-2022-1271.
- Fixed mysql-8.0 security issues CVE-2024-20985, CVE-2024-20984, CVE-2024-20983, CVE-2024-20982, CVE-2024-20981, CVE-2024-20978, CVE-2024-20977, CVE-2024-20976, CVE-2024-20974, CVE-2024-20973, CVE-2024-20972, CVE-2024-20971, CVE-2024-20970, CVE-2024-20969, CVE-2024-20967, CVE-2024-20966, CVE-2024-20965, CVE-2024-20964, CVE-2024-20963, CVE-2024-20962, CVE-2024-20961 and CVE-2024-20960.
- Fixed openssl security issues CVE-2024-0727 and CVE-2023-5678.
- Fixed paramiko security issue CVE-2023-48795.
- Fixed pillow security issues CVE-2023-50447 and CVE-2023-44271.
- Fixed pam security issue CVE-2024-22365.
- Fixed webkit2gtk security issues CVE-2024-23222, CVE-2024-23213, CVE-2024-23206, CVE-2023-42833, CVE-2023-40414 and CVE-2014-1745.
- Fixed zlib security issues CVE-2023-45853, CVE-2022-37434 and CVE-2018-25032.
- Updated ca-certificates.
- Added registry key to prevent terrapin attack (mitigation is not active as default) on the SSH server:
```

| Parameter | Registry | Type | Value |
| ------ | ------ | ------ | ------ |
| Disable weak MACs and Chipers to prevent terrapin attack. | network.ssh_server.enable_terrapin_mitigation | bool | enabled / _disabled_ (default) |

```
- Added registry key to prevent terrapin attack (mitigation is not active as default) on the SSH client:
```

| Parameter | Registry | Type | Value |
| ------ | ------ | ------ | ------ |
| Disable weak MACs and Chipers to prevent terrapin attack. | network.ssh_client.enable_terrapin_mitigation | bool | enabled / _disabled_ (default) |

```
- Fixed a privilege escalation issue in the starter license. Acknowledgements to Zack Didcott for responsible disclosure.
- Fixed a privilege escalation in setup_cmd utility.
- For security reasons the accessory 'Network Tools' is enforced to run with Administrator (root) privileges only. Therefore, parameter 'Password protection on page Accessories>Network Tools was removed.
- Updated Bluez to version 5.71-1 to fix CVE-2023-45866.
- Removed custom command selection from application start dialog of file manager to prevent the execution of arbitrary commands by user.

- **X server**

	- Fixed xorg-server security issues CVE-2024-21886, CVE-2024-21885, CVE-2024-0409, CVE-2024-0408, CVE-2024-0229 and CVE-2023-6816.
	- Fixed xorg-server security issues CVE-2023-6478 and CVE-2023-6377.

## Resolved Issues

- Fixed browser certificates could not be loaded.
- More logs in the custom partition
- Also added trust-store certificates from UMS, to the valid chain for download
- Remove check of host name
- In cases where the APP Portal is unreachable the user will be informed when trying to open the local APP Portal app
- Fixed Post Session shutdown command not working.

- **Network**
	- Fixed respecting NTP server from DHCP

- **WiFi**
	- Added registry key to switch between 8852be and rtw_8852be WiFi driver. Switching to 8852be driver possibly fixes some WiFi issues. (Auto uses 8852be on HP mt645 G7).
```

| Parameter | Registry | Range | Value |
| ------ | ------ | ------ | ------ |
| Use 8852be driver instead of rtw_8852be for WLAN. | network.drivers.realtek.use_8852be | [Auto][Yes][No] | _Auto_ |

```
	- Added options for configuration of rtw89core and rtw89pci kernel modules (used e.g by the rtw_8852be driver).
```

|  Parameter  |  Registry   |  Type       |  Value      |
| ------ | ------ | ------ | ------ |
|  disable_ps_mode  |  network.drivers.rtw89core.options.disable_ps_mode  |  bool  |  _enabled_ (default) / disabled  |
|  disable_clkreq  |  network.drivers.rtw89pci.options.disable_clkreq  |  bool  |  _enabled_ (default) / disabled  |
|  disable_aspm_l1  |  network.drivers.rtw89pci.options.disable_aspm_l1  |  bool  |  _enabled_ (default) / disabled  |
|  disable_aspm_l1ss  |  network.drivers.rtw89pci.options.disable_aspm_l1ss  |  bool  |  _enabled_ (default) / disabled  |

```
- **HID**

	- Fixed touchscreen calibration issues when multiple monitors are connected.

- **Custom Partition**
	- Fixed custom partition downloads with password when profile was created with UMS >= 12.02.100
		 - To fix already created / existing profiles (for earlier IGEL OS releases), it is necessary to set the `custom_partition.source%.crypt_password` parameter in registry.

- **Driver**
	- Fixed: Certain bluetooth devices with Mediatek-based devices were not functional.

- **VirtualBox**
	- Fixed mouse offset if using multi-monitor setup as a VirtualBox guest.

- **Audio**

	- Added parameter to disable timer scheduling in pulseaudio module-udev-detect.
```

| Parameter | Registry | Range | Value |
| ------ | ------ | ------ | ------ |
| Disable timer scheduling for module-udev | multimedia.pulseaudio.daemon.disable-module-udev-tsched | [auto][true][false] | *auto* |

```
- **Remote Management**

	- Custom device attributes can now be showed and changed as user.
	- Added missing rmagent-devattrs-reset command.
	- Fixed UMS file upload that also renames the file at the destination location. Considering that change / fix, it is recommended to check if UMS file upload works as expected.
	- Fixed fingerprint check during ICG onboarding, this was impossible if the CA chain contains more than one public CA.
	- Fixed setup parameters userinterface.shutdown_dialog.allow_cancel, userinterface.shutdown_dialog.disable_dialog, userinterface.rmagent.cancel_usermessage and userinterface.rmagent.enable_usermessage.
	- Fixed enumeration of a range of a device attribute of type range (list).

- **IGEL Desktop**
	- The Igel-System-Tray icons are now correctly colored black or white according to the set theme.

- **SSO**

	- Added registry key to define a semicolon separated list of allowed hostnames
	for URL-redirections during the SSO login view:
```

|  Parameter  |  Registry   |  Type       |  Value      |
| ------ | ------ | ------ | ------ |
|  `List of allowed hosts for redirection`  |  `auth.cloudidp.host_allowlist`  |  string  |  empty *Default*  |

```
## Known Issues

- Browser apps may not recognize custom certificates rolled out via UMS file transfer. The certificates are not correctly synchronized in the browser specific certificate stores/databases.
- Increased writeable cache partition size (by default). First boot with 12.4.x may take more time (once) when updating from a 12.2.x or older base system app.
- In very rare cases all apps are lost after an update. Should this be the case, an error message is shown "Opening system App Journal failed." - if the device is manged, the apps will be reinstalled after a reboot.
- The downgrade to base system 12.00.900 or 12.00.910 is not supported.

- **Chromium**

	- Downgrading base system to earlier versions may result in reset of the Chromium profile partition.

- **Network**

	- In some cases, network is not working in combination of Lenovo K14 Gen1 (AMD) and Lenovo Universal Dock. There is a kernel bugreport open but no proper fix so far.

- **WiFi**

	- Globally configured WiFi static IP is not used if establishing WiFi connection via WiFi system tray

- **HID**

	- Some touchpads are recognized as touchpad and mouse. This results in showing possible user settings for both variants.

- **Setup Assistant**

	- Timezone auto-detection is currently not functional (due to discontinued location service). The timezone must be set manually (as interims / alternative solution).

- **Audio**

	- Headset mic via jack is not working on LG 27CN650 and LG 34CN650.

- **Hardware**

	- Display configuration of displays connected to HP G5 Docking Station may fail on HP t655.
	- Rotation of displays connected to the Lenovo ThinkPad USB-C Hybrid Dock can fail.
	- Wake up from suspend via UMS does not work on HP mt645 devices. Workaround: Disable system suspend and use shutdown instead.
	- If using 6 x 4K@60Hz monitors on a t755/t740 with the additional graphic card, one or two of the monitors may stay black after coming back from DPMS off state.
	- This is caused by using the additional graphic card as primary, which only has 512MB VRAM (the VRAM is not sufficient in this configuration). Possible solution: Increasing the VRAM size of the iGPU to 2048MiB in BIOS (maybe 1024MiB may also work) and activate IGEL registry key `x.drivers.swap_card0_with_card1` so the iGPU will become the Primary GPU. Connector names will be changed with that!
	- Built-in fingerprint sensor is not supported on HP mt440 and mt645.
	- Wake on LAN is not functional on Dell OptiPlex 3000 and Lenovo K14 Gen1

- **IGEL Desktop**

	- Connecting a new audio device during running audio playback / stream may result in failure of audio tray.
	- External display mode not functional on ThinkPad L14 Gen3 AMD
	- Disabled compositing (transparency effects) in window manager to circumvent issues with screen lock. Registry key `windowmanager.wm0.variables.usecompositing` is not configurable anymore.
	- If two monitors are configured in a vertical layout (one above the other), and those monitors are configured with "auto-detect" resolution, saving leads to a wrong layout order.
	- On-screen keyboard sporadically crashes when typing.

- **Licensing**

	- Manual deployment of add-on licenses for IGEL Agent for Imprivata licenses (via UMS) is only possible after finished installation of IGEL Agent for Imprivata app on device.
```

-----

## 2024-03-21 - [12.3.2](readme12.3.2.txt)

```
The new BUILD 12.3.2 for IGEL Workspace is ready.

These are the release notes published with that release:

# Changes since: 12.3.1

## New Features

- Updated IGEL screensaver logo.
- Updated IGEL logo within IGEL Setup Assistant
- Updated IGEL boot animation.
- Added checkbox and corresponding text for accepting EULA on IGEL OS.
- **Network**
	- Added check if BIOS has Wake-on-LAN disabled. If disabled, it is not recommended to configure network interface to use WoL. This check is only supported / possible on Lenovo devices with official IGEL OS hardware support. Parameter:
```

| Parameter | Registry | Type | Value |
| ------ | ------ | ------ | ------ |
| `Respect the BIOS WoL setting so if disabled reflect this for the linux network devices settings.` | `network.interfaces.respect_bios_wol_setting` | bool | *enabled* (default) / disabled |

```
- SCEP: Improved handling of client certificate subject change (particularly if the hostname is part of the subject). Registry key:
```

|  Parameter  |  Registry   |  Range      |  Value      |
| ------ | ------ | ------ | ------ |
|  `Hostname change handling`  |  `network.scepclient.cert%.hostname_change_handling`  |  [Ignore][Reset]  |  *Ignore*  |

```
	- A notification is shown, when SCEP server is reachable but certificate renewal fails. The notification includes any deviation of the desired subject from the old one.

- **Hardware**

	- Added support for Lenovo USB-C to Ethernet Adapter
	- Added WWAN support on HP mt440 device with BIOS v1.08.00 and Intel XMM7560 module Firmware v1.16.48.

- **Remote Management**

	- Added compatibility for remote management via Microsoft's Azure Application Gateway (requires UMS 12.04.100 or later).
	- Added compatibility for remote management via F5 Reverse Proxy / SSL Offloading (requires UMS 12.04.100 or later).
	- Added support for system-wide proxy configuration.
	- Added: RSA-4096 key is created as device key by default. The key type can be changed via IGEL setup:
```

|  Registry    |  Value       |
| ------ | ------ |
|  `system.remotemanager.device_key_type`  |  *RSA-4096* (default) / EC-P521R1  |

```
- **SSO**

	- Added support for automatical Single Sign-on (SSO) login with given user credentials. All our Identity Providers except the generic OpenID Connect provider are supported.
```

|  Setup      |  Parameter  |  Registry   |  Type       |  Value      |
| ------ | ------ | ------ | ------ | ------ |
|  Security > Logon > Single Sign-on  |  `Password for autologin`  |  `auth.cloudidp.password`  |  string  |  empty *Default*  |
|  Security > Logon > Single Sign-on  |  `Automatically perform login`  |  `auth.cloudidp.autologin`  |  bool  |  enabled / *disabled* (default)  |
|  Security > Logon > Single Sign-on  |  `Username for autologin`  |  `auth.cloudidp.username`  |  string  |  empty *Default*  |

```
	- Added password-less guest-user login with limited access to applications. Each application session can be made available in normal user login, guest login, or both with Registry parameters sessions.<instance>.login_method or app.<app-name>.sessions.<instance>.login_method - requires Chromium Browser 120.0.6099.216 Build 5.0 or later.
```

|  Setup  |  Parameter  |  Registry  |  Value  |
| ------ | ------ | ------ | ------ |
|  Security>Logon>Guest |  Present session to  |  `sessions.<instance>.login_method` <br> `app.<app-name>.sessions.<instance>.login_method`  |  "User" (default) / "Guest" / "All"  |

```
	- This is the default for any session including app sessions. Latter ones inherit to `app.<app-name>.sessions.<app_%_or_instance#>.login_method`. Standard sessions inherit to `sessions.<name_%_or_instance#>.login_method`.
	- Choose applications to be available in a guest session by setting the above parameters to 'Guest' or 'All'. On command-line usage of nodelist sessions to get a currently defined list of sessions.

## Security Fixes

- Added registry key to prevent terrapin attack (mitigation is not active as default) on the SSH client:
```

| Parameter | Registry | Type | Value |
| ------ | ------ | ------ | ------ |
| Disable weak MACs and Chipers to prevent terrapin attack. | network.ssh_client.enable_terrapin_mitigation | bool | enabled / _disabled_ (default) |

```
- Updated gst-plugins-base1.0 packages:
- gstreamer1.0-alsa from 1.22.6-1igel1701244602 to 1.22.9-1igel1707141227 version
- gir1.2-gst-plugins-base-1.0 from 1.22.6-1igel1701244602 to 1.22.9-1igel1707141227 version
- gstreamer1.0-gl from 1.22.6-1igel1701244602 to 1.22.9-1igel1707141227 version
- gstreamer1.0-plugins-base from 1.22.6-1igel1701244602 to 1.22.9-1igel1707141227 version
- gstreamer1.0-x from 1.22.6-1igel1701244602 to 1.22.9-1igel1707141227 version
- libgstreamer-gl1.0-0 from 1.22.6-1igel1701244602 to 1.22.9-1igel1707141227 version
- libgstreamer-plugins-base1.0-0 from 1.22.6-1igel1701244602 to 1.22.9-1igel1707141227 version
- Updated gstreamer1.0-libav from 1.22.7-1igel1701247613 to 1.22.9-1igel1707166316 version
- Updated gst-omx packages:
- gstreamer1.0-omx-generic from 1.22.4-1igel1690182724 to 1.22.8-1igel1704883480 version
- gstreamer1.0-omx-bellagio-config from 1.22.4-1igel1690182724 to 1.22.8-1igel1704883480 version
- Fixed gst-plugins-bad1.0 security issue CVE-2024-0444.
- Updated gst-plugins-good1.0 packages:
- gstreamer1.0-plugins-good from 1.22.6-1+b1igel1701245188 to 1.22.9-1igel1707141628 version
- gstreamer1.0-pulseaudio from 1.22.6-1+b1igel1701245188 to 1.22.9-1igel1707141628 version
- Updated gst-plugins-ugly1.0 packages:
- gstreamer1.0-plugins-ugly-asf from 1.22.6-1igel1701246116 to 1.22.9-1igel1707142312 version
- gstreamer1.0-plugins-ugly-x264 from 1.22.6-1igel1701246116 to 1.22.9-1igel1707142312 version
- Updated gstreamer1.0-vaapi from 1.22.6-1igel1701247435 to 1.22.9-1igel1707161592 version JIRA LX8-8432
- Updated gstreamer1.0 packages:
- libgstreamer1.0-0 from 1.22.6-1igel1701244342 to 1.22.9-1+b1igel1707141080 version
- gir1.2-gstreamer-1.0 from 1.22.6-1igel1701244342 to 1.22.9-1+b1igel1707141080 version
- gstreamer1.0-tools from 1.22.6-1igel1701244342 to 1.22.9-1+b1igel1707141080 version
- Fixed gnutls28 security issue CVE-2024-0553:
- libgnutls30 from 3.6.13-2ubuntu1.9 to 3.6.13-2ubuntu1.10 version (security update)
- libgnutls-openssl27 from 3.6.13-2ubuntu1.9 to 3.6.13-2ubuntu1.10 version (security update)
- Fixed openldap security issues CVE-2023-2953:
- libldap-2.4-2 from 2.4.49+dfsg-2ubuntu1.9 to 2.4.49+dfsg-2ubuntu1.10 version (security update)
- ldap-utils from 2.4.49+dfsg-2ubuntu1.9 to 2.4.49+dfsg-2ubuntu1.10 version (security update)
- libldap-common from 2.4.49+dfsg-2ubuntu1.9 to 2.4.49+dfsg-2ubuntu1.10 version (security update)
- Fixed xz-utils security issue CVE-2022-1271.
- Fixed mysql-8.0 security issues CVE-2024-20985, CVE-2024-20984, CVE-2024-20983, CVE-2024-20982, CVE-2024-20981, CVE-2024-20978, CVE-2024-20977, CVE-2024-20976, CVE-2024-20974, CVE-2024-20973, CVE-2024-20972, CVE-2024-20971, CVE-2024-20970, CVE-2024-20969, CVE-2024-20967, CVE-2024-20966, CVE-2024-20965, CVE-2024-20964, CVE-2024-20963, CVE-2024-20962, CVE-2024-20961 and CVE-2024-20960.
- Fixed openssl security issues CVE-2024-0727 and CVE-2023-5678.
- Fixed paramiko security issue CVE-2023-48795.
- Fixed pillow security issues CVE-2023-50447 and CVE-2023-44271.
- Fixed pam security issue CVE-2024-22365.
- Fixed webkit2gtk security issues CVE-2024-23222, CVE-2024-23213, CVE-2024-23206, CVE-2023-42833, CVE-2023-40414 and CVE-2014-1745.
- Fixed zlib security issues CVE-2023-45853, CVE-2022-37434 and CVE-2018-25032.
- Updated ca-certificates.
- Removed custom command selection from application start dialog of file manager to prevent the execution of arbitrary commands by user.
- Fixed a privilege escalation in setup_cmd utility.
- Added registry key to prevent terrapin attack (mitigation is not active as default) on the SSH server:
```

| Parameter | Registry | Type | Value |
| ------ | ------ | ------ | ------ |
| Disable weak MACs and Chipers to prevent terrapin attack. | network.ssh_server.enable_terrapin_mitigation | bool | enabled / _disabled_ (default) |

```
- **X server**

	- Fixed xorg-server security issues CVE-2024-21886, CVE-2024-21885, CVE-2024-0409, CVE-2024-0408, CVE-2024-0229 and CVE-2023-6816.

## Resolved Issues

- Fixed browser certificates could not be loaded.

- **WiFi**

	- Added options for rtw89core and rtw89pci kernel modules (used e.g by the rtw_8852be driver) configurable.
```

|  Parameter  |  Registry   |  Type       |  Value      |
| ------ | ------ | ------ | ------ |
|  disable_ps_mode  |  network.drivers.rtw89core.options.disable_ps_mode  |  bool  |  _enabled_ (default) / disabled  |
|  disable_clkreq  |  network.drivers.rtw89pci.options.disable_clkreq  |  bool  |  _enabled_ (default) / disabled  |
|  disable_aspm_l1  |  network.drivers.rtw89pci.options.disable_aspm_l1  |  bool  |  _enabled_ (default) / disabled  |
|  disable_aspm_l1ss  |  network.drivers.rtw89pci.options.disable_aspm_l1ss  |  bool  |  _enabled_ (default) / disabled  |

```
- **VirtualBox**

	- Fixed mouse offset if using multi-monitor setup as a VirtualBox guest.

- **Remote Management**

	- Fixed onboarding via ICG server using a public CA as root of the trust chain.
	- Added missing rmagent-devattrs-reset command.
	- Fixed enumeration of a range of a device attribute of type range (list).
	- Fixed setup parameters userinterface.shutdown_dialog.allow_cancel, userinterface.shutdown_dialog.disable_dialog, userinterface.rmagent.cancel_usermessage and userinterface.rmagent.enable_usermessage.

- **SSO**

	- Added registry key to define a semicolon separated list of allowed hostnames
	for URL-redirections during the SSO login view:
```

|  Parameter  |  Registry   |  Type       |  Value      |
| ------ | ------ | ------ | ------ |
|  `List of allowed hosts for redirection`  |  `auth.cloudidp.host_allowlist`  |  string  |  empty *Default*  |

```
## Known Issues

- Shutdown via Post Session Command not yet supported.
- Increased writeable cache partition size (by default). First boot with 12.3.x may take more time (once).
- Display Configurator: Rotation of displays connected to the Lenovo ThinkPad USB-C Hybrid Dock can fail.
- In very rare cases all apps are lost after an update. Should this be the case, an error message is shown "Opening system App Journal failed." - if the device is manged, the apps will be reinstalled after a reboot.
- The downgrade to base system 12.00.900 or 12.00.910 is not supported.
- Display Configurator may show hotplugged monitors as disabled.
- Issues may occur if monitors are connected via docking station.
	- In general: Monitor hotplug not stable yet and can trigger misconfiguration.

- **Citrix**

	- In regards of CVE-2023-41993, CVE-2023-39928 & CVE-2023-41074: Older Webkit libraries are used in Citrix for compatibility reasons. Further details via Knowledge Base [https://kb.igel.com/securitysafety/en/isn-2023-25-webkit-vulnerabilities-101066782.html]

- **Chromium**

	- Downgrading base system to earlier versions may result in reset of the Chromium profile partition.

- **Network**

	- In some cases, network is not working in combination of Lenovo K14 Gen1 (AMD) and Lenovo Universal Dock. There is a kernel bugreport open but no proper fix so far.

- **Audio**

	- LG 34CN650 Headset mic via jack is not working
	- LG 27CN650 Headset mic via jack is not working

- **Hardware**

	- Wake up from suspend via UMS does not work on HP mt645 devices. Workaround: Disable system suspend and use shutdown instead.
	- If using 6 x 4K@60Hz monitors on a t755/t740 with the additional graphic card, one or two of the monitors may stay black after coming back from DPMS off state.
	- This is caused by using the additional graphic card as primary, which only has 512MB VRAM (the VRAM is not sufficient in this configuration)
	- The solution:
	-* Open BIOS and increase the VRAM size of the iGPU to 2048MiB (maybe 1024MiB may also work)
	-* Activation of IGEL registry key *x.drivers.swap_card0_with_card1,* so the iGPU will become the Primary GPU. Connector names will be changed with that!!
	- Built-in fingerprint sensor is not supported on HP mt440 and mt645.
	- Wake on LAN is not functional on Dell OptiPlex 3000 and Lenovo K14 Gen1

- **IGEL Desktop**

	- Globally configured WiFi static IP is not used if establishing WiFi connection via WiFi system tray
	- Some touchpads are recognized as touchpad and mouse. This results in showing possible user settings for both variants.
	- If two monitors are configured in a vertical layout (one above the other), and those monitors are configured with "auto-detect" resolution, saving leads to a wrong layout order.
	- Closing shutdown dialog requires a double ESC key press.
	- XFWM4 composite manager can break screen lock and enables sporadically access to open applications. It is recommended to not enable registry key windowmanager.wm0.variables.usecompositing. The composite manager is disabled by default.
	- On-screen keyboard sporadically crashes when typing.

- **Licensing**

	- Manual deployment of add-on licenses for IGEL Agent for Imprivata licenses (via UMS) is only possible after finished installation of IGEL Agent for Imprivata app on device.
```
-----

## 2024-02-06 - [12.3.1](readme12.3.1.txt)

```
The new BUILD 12.3.1 for IGEL Workspace is ready.

These are the release notes published with that release:

# Changes since: 12.3.0

## New Features

- Added (enhanced) settings for kernel cmdline options
- New registry keys:
```

| Parameter | Registry | Type | Value | Range |
| ------ | ------ | ------ | ------ | ------ |
| Set reboot kernel parameters. | system.kernel.bootparams.reboot |  | _Default_ | [Default][Bios][Triple][Kbd][Acpi][Efi][Pci] |
| Disable use of initial boot framebuffer. | system.kernel.bootparams.vga_off | bool | enabled / _disabled_ (default) |  |
| Set maximum allowed processor cstate. | system.kernel.bootparams.max_proc_cstate |  | _No limit_ | [No limit][1][2][3][4][5][6][7][8][9] |
| Enable debug output for i8042 driver. | system.kernel.bootparams.i8042.debug | bool | enabled / _disabled_ (default) |  |
| Do not use muxing for i8042 driver. | system.kernel.bootparams.i8042.nomux | bool | enabled / _disabled_ (default) |  |
| Disable use of PnP configuration for i8042 driver. | system.kernel.bootparams.i8042.nopnp | bool | enabled / _disabled_ (default) |  |
| Disable use of AUX loopback command for i8042 driver. | system.kernel.bootparams.i8042.noloop | bool | enabled / _disabled_ (default) |  |
| Ignore timeout signaled by controller for i8042 driver. | system.kernel.bootparams.i8042.notimeout | bool | enabled / _disabled_ (default) |  |
| Reset controller during init for i8042 driver. | system.kernel.bootparams.i8042.reset | bool | enabled / _disabled_ (default) |  |
| Set ACPI kernel parameters. | system.kernel.bootparams.acpi |  | _No setting_ | [No setting][Force][On][Off][Noirq][Strict][Rsdt][Copy_dsdt] |

```

- Changed registry keys:
```

| Parameter | Registry | Range | Value |
| ------ | ------ | ------ | ------ |
| Various PCI subsystem options | system.kernel.bootparams.pci | [Default][Conf Mechanism 1][Conf Mechanism 2][Disable multiple PCI domains][Disable use of MMCONFIG][Disable MSI][Ignore ACPI PCI host bridge window][Ignore ACPI IRQ routing][Route IRQ for all PCI devices] | _Default_ |
| Set maximum allowed cstate on intel cpus. | system.kernel.bootparams.max_cstate | [No limit][0][1][2][3][4][5][6] | _No limit_ |

```

- **Network**

	- Added Quectel EM05-G support for Lenovo ThinkPad L13 AMD Gen4 and L13 Intel Gen4.
	- Added regional support with Quectel EM05-G for US SIM cards on supported Lenovo ThinkPad devices.

- **Hardware**

	- Added hardware support for Lenovo ThinkPad L13 AMD Gen4.
	- Added hardware support for Lenovo ThinkPad L13 Intel Gen4.

## Security Fixes

- For security reasons the accessory 'Network Tools' is enforced to run with Administrator (root) privileges only. Therefore, parameter 'Password protection on page Accessories>Network Tools was removed.
- Fixed libssh2 security issue CVE-2023-48795.
- Fixed openssh security issues CVE-2023-51385, CVE-2023-51384 and CVE-2023-48795.
- Fixed vim-tiny security issues CVE-2022-1725, CVE-2022-1771, CVE-2022-1897, CVE-2022-2000, CVE-2023-46246, CVE-2023-48231, CVE-2023-48233, CVE-2023-48234, CVE-2023-48235, CVE-2023-48236 and CVE-2023-48237
- Fixed glibc security issues CVE-2023-4813 and CVE-2023-4806.
- Fixed nghttp2 security issue CVE-2023-44487.
- Fixed perl security issue CVE-2023-47038.
- Fixed poppler security issues CVE-2022-38349, CVE-2022-37052, CVE-2022-37051, CVE-2022-37050 and CVE-2020-23804.
- Fixed python3.8 security issue CVE-2023-40217.
- Fixed python-cryptography security issue CVE-2023-23931.
- Fixed sqlite3 security issue CVE-2023-7104.
- Fixed tiff security issues CVE-2023-3576 and CVE-2022-40090.
- Fixed tar security issue CVE-2023-39804.
- Updated Bluez to version 5.71-1 to fix CVE-2023-45866.
- Fixed webkit2gtk issues CVE-2023-42916, CVE-2023-42917, CVE-2023-42883 and CVE-2023-42890.
- **X server**
	- Fixed xorg-server security issues CVE-2023-6478 and CVE-2023-6377.

## Resolved Issues

- Fixed: Certain bluetooth devices with Mediatek-based devices were not functional.

- **WiFi**

	- Added registry key to switch between 8852be and rtw_8852be WiFi driver. Switching to 8852be driver possibly fixes some WiFi issues. (Auto uses 8852be on HP mt645 G7).
```

| Parameter | Registry | Range | Value |
| ------ | ------ | ------ | ------ |
| Use 8852be driver instead of rtw_8852be for WLAN. | network.drivers.realtek.use_8852be | [Auto][Yes][No] | _Auto_ |

```

- **Audio**

	- Added parameter to disable timer scheduling in pulseaudio module-udev-detect.
```

| Parameter | Registry | Range | Value |
| ------ | ------ | ------ | ------ |
| Disable timer scheduling for module-udev | multimedia.pulseaudio.daemon.disable-module-udev-tsched | [auto][true][false] | *auto* |

```

## Known Issues

- Display Configurator may show hotplugged monitors as disabled.
- Issues may occur if monitors are connected via docking station.
	- In general: Monitor hotplug not stable yet and can trigger misconfiguration.
- The downgrade to base system 12.00.900 or 12.00.910 is not supported.
- In very rare cases all apps are lost after an update. Should this be the case, an error message is shown "Opening system App Journal failed." - if the device is manged, the apps will be reinstalled after a reboot.
- Display Configurator: Rotation of displays connected to the Lenovo ThinkPad USB-C Hybrid Dock can fail.
- Display configuration of displays connected to HP G5 Docking Station may fail on HP t655.
- Increased writeable cache partition size (by default). First boot with 12.3.x may take more time (once).

- **Citrix**

	- In regards of CVE-2023-41993, CVE-2023-39928 & CVE-2023-41074: Older Webkit libraries are used in Citrix for compatibility reasons. Further details via Knowledge Base [https://kb.igel.com/securitysafety/en/isn-2023-25-webkit-vulnerabilities-101066782.html]

- **Chromium**

	- Downgrading base system to earlier versions may result in reset of the Chromium profile partition.

- **Network**

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
	- Some touchpads are recognized as touchpad and mouse. This results in showing possible user settings for both variants.
	- Globally configured WiFi static ip is not used when establishing a WiFi connection via WiFi system tray

- **Licensing**

	- Manual deployment of add-on licenses for IGEL Agent for Imprivata licenses (via UMS) is only possible after finished installation of IGEL Agent for Imprivata app on device.

```

-----

## 2023-12-19 - [12.3.0](readme12.3.0.txt)

```
The new BUILD 12.3.0 for IGEL Workspace is ready.

These are the release notes published with that release:

# Changes since: 12.2.0

## New Features

- Added system-tray app for mouse and touchpad device configuration.
	- User is able to adjust main mouse and touchpad settings like:
	- Speed
	- Left handed mode
	- Scrolling direction and method
	- Tap to click and palm detection
- Changed default input driver to libinput.
- Added parameter to enable/disable tray-icon and to enable/disable natural scrolling for mice:
```

| Parameter | Registry | Type | Value |
| ------ | ------ | ------ | ------ |
| Natural Scroll | `userinterface.mouse.naturalscroll` | bool | enabled / *disabled* (default) |
| Show input settings tray icon on desktop | `userinterface.system_tray.input.desktop` | bool | *enabled* (default) / disabled |

```
- Added: In Setup Assistant, user can enter optional structure tag during connection to UMS via one-time-password.
- Added: If system gets automatically assigned to an UMS during firstboot, the Setup Assistant presents profile- and app-installation(s) and reboots automatically.
- Added SSO support for Identity Providers using OpenID Connect. Configuration at IGEL Setup > Security > Logon > Single Sign-On > Identity Providers - select Identity Provider "OpenID Connect":
```

| Parameter | Registry | Type | Value |
| ------ | ------ | ------ | ------ |
| `Client secret` | `auth.cloudidp.oidc.client_secret` | string | empty *Default* |
| `Issuer URL` | `auth.cloudidp.oidc.idpurl` | string | empty *Default* |
| `Client ID` | `auth.cloudidp.oidc.client_id` | string | empty *Default* |

```
- Added SSO support for VMware Workspace ONE Access as Identity Provider. Configuration at IGEL Setup > Security > Logon > Single Sign-On > Identity Providers - select Identity Provider "VMware Workspace ONE Access":
```

|  Parameter  |  Registry   |  Type       |  Value      |
| ------ | ------ | ------ | ------ |
|  `Client secret`  |  `auth.cloudidp.vmwaccess.client_secret`  |  string  |  empty *Default*  |
|  `Workspace ONE Access issuer URL`  |  `auth.cloudidp.vmwaccess.idpurl`  |  string  |  empty *Default*  |
|  `Client ID`  |  `auth.cloudidp.vmwaccess.client_id`  |  string  |  empty *Default*  |

```
- Added SSO support for Ping Identity / PingOne as Identity Provider. Configuration at IGEL Setup > Security > Logon > Single Sign-On > Identity Providers - select Identity Provider "Ping Identity | PingOne":
```

| Parameter | Registry | Type | Value |
| ------ | ------ | ------ | ------ |
| `Client secret` | `auth.cloudidp.pingone.client_secret` | string | empty *Default* |
| `PingOne issuer URL` | `auth.cloudidp.pingone.idpurl` | string | empty *Default* |
| `Client ID` | `auth.cloudidp.pingone.client_id` | string | empty *Default* |

```
- Added support for post session commands. To configure and use post session commands, corresponding OS12 App must support post session commands as well.
- Changed the initial default devicename and hostname of UD Pockets to UDP<UnitId>. Systems already in use will only be affected after reset to factory defaults.
- Improved add-on license handling: A message is shown if OS12 App requires add-on license which is not present / available via UMS.
- Updated kernel to version 6.1.63.

- **OSC Installer**

	- Added support for custom Unit ID rules. This offers possibility to choose appropriate MAC address of an internal network interface as Unit ID. Please visit the Knowledge Base for further details and how to use this feature.

- **App Management**

	- Added support for automatic update on boot and automatic update on calendar time. The following parameters were introduced for corresponding configuration.
```

| Parameter | Registry | Type | Value |
| ------ | ------ | ------ | ------ |
| `Check for and download updates for non pinned apps on given calendar time, use the crontab syntax to specify the calendar time` | `update.auto_update_calendar` | string | *empty* |
| `Check for and download updates for non pinned apps on boot` | `update.auto_update_on_boot` | bool | *enabled* (default) / disabled |

```
- **Network**

	- Added MACsec (IEEE 802.1AE) support in dynamic CAK mode.
	- Updated Lenovo FCC unlock tool for support of Quectel EM05 chipset - used on several Lenovo devices.

- **Open VPN**

	- Updated cipher configuration of Open VPN -  and added possibility to specify data-ciphers list. By default the default cipher list AES-256-GCM:AES-128-GCM:CHACHA20-POLY1305 is active. Otherwise, custom list can be specified in the Data ciphers parameter. Enter the ciphers separated with ':'. The existing parameter 'Cipher' is outdated and therefore removed.
```

| Setup | Parameter | Registry | Value |
| ------ | ------ | ------ | ------ |
| `Network > VPN > Open VPN > Connection > Options` | `Data ciphers` | `sessions.openvpn%.vpnopts.data_ciphers` | empty *{*}Default{*}* |
| `Network > VPN > Open VPN > Connection > Options` | `Use default data cipher list` | `sessions.openvpn%.vpnopts.use_default_cipher_list` | *on* / off |

```
- **HID**

	- Updated ELO touch driver to version 5.2 for single-touch - and version 4.3 for multi-touch.

- **X11 system**

	- Changed registry default to activate DRI3 as default.
```

|  Parameter  |  Registry   |  Type       |  Value      |
| ------ | ------ | ------ | ------ |
|  `Use DRI3`  |  `x.drivers.use_dri3`  |  bool  |  *enabled* (default) / disabled  |

```
- **Multimedia**

	- Added libcam-tools to base system.

- **Hardware**

	- Added hardware support for Lenovo ThinkPad L14 and L15 Gen4 AMD/Intel
	- Added hardware support for Lenovo ThinkStation P3 Tiny.
	- Added hardware support for LG 24CR670I AiO.
	- Added hardware support for LG AiO 34CR650.
	- Added hardware support for LG AiO 27CQ650.
	- Removed support for UD7-LX 10 and UD7-LX 11 (devices do not meet minimal hardware requirements for OS12).

- **Remote Management**

	- Added support for custom device attributes.
	- Added device specific command support for OS12 Apps and OS12 Base System.
	- Fixed sporadically failures while retrieving authentication token within of a 'scan-and-register' or automatic registering process.
	- Switched to the IGEL's implementation of the EST, used for onboarding of devices running IGEL OS12.
	- Switched to RSA 4096 key pair instead of EC-521 - this broadens the compatibility with various application firewalls or reverse proxy systems. The existing key pair is automatically changed from EC to RSA during boot after device is removed from the UMS.
	- Fixed handling of CA chains issued by a public PKI - now the CA certificates of the involved public PKI are automatically added to trusted CA bundle during onboarding process.
	- Fixed retrieving of bootstrapping 'zero-trust' CA certificates - this is involved in ICG-style, automatic and 'scan-and-register' onboarding flows. The retrieving of CA certificates could fail if server side must be accessed over reverse proxy.

- **IGEL Desktop**

	- Added: If OS12 runs on UD Pocket, the Setup Assistant shows the unit ID (usb-serial-number) in system information.
	- Added option to configure time zone within calendar tray app. Feature can be disabled by parameter system.time.timezone_in_tray.
	- Changed default value of palmdetection from false to true.
	- The LAN system tray displays if connection is secured via MACsec.

## Security Fixes

- Fixed libwebp security issue CVE-2023-4863 (initial only Chromium related) and CVE-2023-5129.
- Fixed open-vm-tools security issues CVE-2023-20900, CVE-2023-20867, CVE-2023-34059 and CVE-2023-34058.
- Fixed vim security issues CVE-2023-5535, CVE-2023-5441, CVE-2023-5344, CVE-2023-4781, CVE-2023-4752, CVE-2023-4751, CVE-2023-4750, CVE-2023-4735, CVE-2023-4733, CVE-2022-4293, CVE-2022-4292, CVE-2022-3705, CVE-2022-3591, CVE-2022-3520, CVE-2022-3352, CVE-2022-3324, CVE-2022-3256, CVE-2022-3234, CVE-2022-3099, CVE-2022-3037, CVE-2022-3016, CVE-2022-2598, CVE-2022-2289, CVE-2022-2287, CVE-2022-2286, CVE-2022-2285, CVE-2022-2284, CVE-2022-2264, CVE-2022-2257, CVE-2022-2210 and CVE-2022-2208.
- Fixed cups security issues CVE-2023-4504 and CVE-2023-32360.
- Fixed curl security issues CVE-2023-38039, CVE-2023-38546 and CVE-2023-38545.
- Fixed krb5 security issue CVE-2023-36054.
- Fixed gawk security issue CVE-2023-4156.
- Fixed bind9 security issue CVE-2023-3341.
- Fixed cjose security issue CVE-2023-37464.
- Fixed flac security issue CVE-2020-22219.
- Fixed ghostscript security issues CVE-2023-38559, CVE-2020-21890 and CVE-2020-21710.
- Fixed mysql-8.0 security issues CVE-2023-22058, CVE-2023-22057, CVE-2023-22056, CVE-2023-22054, CVE-2023-22053, CVE-2023-22048, CVE-2023-22046, CVE-2023-22038, CVE-2023-22033, CVE-2023-22008, CVE-2023-22005, CVE-2023-22114, CVE-2023-22112, CVE-2023-22103, CVE-2023-22097, CVE-2023-22092,CVE-2023-22084, CVE-2023-22079, CVE-2023-22078, CVE-2023-22070, CVE-2023-22068, CVE-2023-22066, CVE-2023-22064,CVE-2023-22059 and CVE-2023-22032.
- Fixed poppler security issues CVE-2022-27337, CVE-2020-36024 and CVE-2020-36023.
- Fixed librsvg security issue CVE-2023-38633.
- Fixed tiff security issues CVE-2023-38289, CVE-2023-38288, CVE-2023-3618, CVE-2023-3316, CVE-2023-2908, CVE-2023-26966, CVE-2023-26965, CVE-2023-25433 and CVE-2022-48281.
- Fixed qemu security issues CVE-2023-4135, CVE-2023-40360, CVE-2023-3354, CVE-2023-3255, CVE-2023-3180 and CVE-2023-2861.
- Fixed webkit2gtk security issues CVE-2023-41993, CVE-2023-41074, CVE-2023-40451, CVE-2023-39928, CVE-2023-39434 and CVE-2023-35074.
- Fixed llvm-toolchain-15 security issues CVE-2023-29939, CVE-2023-29934, CVE-2023-29933 and CVE-2023-29932.
- Fixed libx11 security issues CVE-2023-43787, CVE-2023-43786 and CVE-2023-43785.
- Fixed ghostscript security issue CVE-2023-43115.
- Fixed samba security issues CVE-2023-42669, CVE-2023-4154 and CVE-2023-4091.
- Fixed tiff security issue CVE-2023-1916.
- Fixed libxpm security issues CVE-2023-43789, CVE-2023-43788, CVE-2023-43787 and CVE-2023-43786.
- Fixed procps security issue CVE-2023-4016.
- Fixed qtbase-opensource-src security issues CVE-2023-38197, CVE-2023-37369, CVE-2023-34410, CVE-2023-33285, CVE-2023-32763, CVE-2023-32762, CVE-2023-24607 and CVE-2022-25255.
- Fixed qtsvg-opensource-src security issues CVE-2023-32573 and CVE-2021-45930.
- Fixed aom security issues CVE-2021-30475, CVE-2021-30474, CVE-2021-30473, CVE-2020-36135, CVE-2020-36133, CVE-2020-36131 and CVE-2020-36130.
- Fixed openssl security issues CVE-2023-3817 and CVE-2023-3446.
- Fixed xorg-server security issues CVE-2023-5574, CVE-2023-5380 and CVE-2023-5367.
- Fixed opensc security issues CVE-2023-4535, CVE-2023-40661 and CVE-2023-40660.
- Fixed python-urllib3 security issues CVE-2023-45803 and CVE-2023-43804.
- Fixed grub2 security issues CVE-2022-3775, CVE-2022-2601 and CVE-2021-3981.
- Fixed openvpn security issues CVE-2023-46850 and CVE-2023-46849.
- Fixed avahi security issues CVE-2023-38473, CVE-2023-38472, CVE-2023-38471, CVE-2023-38470 and CVE-2023-38469.
- Fixed gnutls28 security issue CVE-2023-5981.
- Fixed user permission configuration of editor mousepad.
- Fixed gstreamer and plugin (libav, omx, vaapi) security issues CVE-2023-44446, CVE-2023-44429, CVE-2023-40476, CVE-2023-40475, CVE-2023-40474, ZDI-CAN-21444, ZDI-CAN-21443, CVE-2023-37329, CVE-2023-37328, CVE-2023-37327
- Fixed libminizip1 security issue CVE-2023-45853

## Resolved Issues

- Fixed known limitation: On some devices the cpu governor did not switch to set value when power supply is plugged or unplugged.
- Added former Single Sign-On configuration parameters for backwards compatibility. These were used before 12.2.0.
```

| Parameter | Registry | Type | Value |
| ------ | ------ | ------ | ------ |
| `Azure AD Tenant Name/ID (deprecated)` | `auth.cloudidp.aad_tenant` | string | empty *Default* |
| `Identity Provider URL (deprecated)` | `auth.cloudidp.idpurl` | string | empty *Default* |
| `Client/Application ID (deprecated)` | `auth.cloudidp.client_id` | string | empty *Default* |
| `Client secret (deprecated)` | `auth.cloudidp.client_secret` | string | empty *Default* |

```
- Fixed immediate wakeup issue after shutdown on some HP mt645 G7.
- Fixed not starting Lenovo docking station TBT 3
- Fixed handling of proxy configurations with a protocol like "http://". If no protocol is specified, system adds "http://". Otherwise, specified protocol is used.
- The Setup Assistant shows base system version in correct scheme / format.
- Fixed label and tooltip of parameter "Deny shadowing via external VNC tool" on page System>Remote Access>Shadow. Before this fix the meaning was the opposite, which was wrong.
- Fixed IGEL OS version showed in System Information accessory.
- Fixed hiding 'About' button in start menu - if set via setup parameter.
- Fixed device getting stuck while reboot/shutdown/logoff if network is offline and local user login is active.

- **App Management**

	- Fixed: Show all app-related errors as notification locally on IGEL OS. Only errors while downloading were shown locally before - now also installation errors are included / shown.

- **Chromium**

	- Fixed Chromium not being able to import certificates with spaces in file name.

- **Network**

	- Added information about used encryption or security type to the ethernet and wifi network tray-apps.
	- Fixed: If WiFi automatic switch is enabled and WiFi got disabled due to an active LAN connection, the user cannot (re-)enable WiFi via system tray app.

- **HID**

	- Fixed handling of ELO touch devices in multi-monitor configuration.
	- Fixed Elo Singletouch (USB) configuration to work after reboot.
	- Fixed touchscreen configuration for devices using standard mouse interface.

- **CUPS Printing**

	- Fixed handling of cups services in base_system. Added conditions to start services only, if cups_printing app is installed.

- **Audio**

	- Fixed configuration of "PCM Volume" at IGEL Setup > Devices > Audio > Options to work for values 100% - 150% (registry key 'userinterfacte.sound.remote_values'). This over amplification must be enabled by parameter 'userinterface.sound.overamplification'.
	- Fixed headset support on LG 24CN650 with sound chip ALC256.
	- Fixed audio on HP t240: Removed internal speaker and microphone devices as not supported. Fixed hotplug of external headsets.

- **Hardware**

	- Fixed function key F8 for microphone on/off on HP mt645 G7.

- **Remote Management**

	- Fixed applying of received settings during boot. Applying could sporadically block and result in a deadlock, the received settings were not applied then.

- **IGEL Desktop**

	- Fixed: Mobile broadband configuration dialogue in IGEL OS Setup Assistant and Setup.
	- Fixed missing suspend button text in suspend confirmation dialog when suspend timeout is triggered

- **Licensing**

	- "Migrate Licenses" button in OSC is off and disabled during installation if no previous installed licenses are found
	- Fixed validity of Starter license after reinstalling OS via OS Creator with "Migrate Settings" activated.
	- Fixed custom Unit ID rules.
	- Fixed computation of the Unit ID. Now wired interfaces take precedence over wireless interfaces again.

## Known Issues

- Display Configurator may show hotplugged monitors as disabled.
- Issues may occur if monitors are connected via docking station.
	- In general: Monitor hotplug not stable yet and can trigger misconfiguration.
- The downgrade to base system 12.00.900 or 12.00.910 is not supported.
- In very rare cases all apps are lost after an update. Should this be the case, an error message is shown "Opening system App Journal failed." - if the device is manged, the apps will be reinstalled after a reboot.
- Display Configurator: Rotation of displays connected to the Lenovo ThinkPad USB-C Hybrid Dock can fail.
- Display configuration of displays connected to HP G5 Docking Station may fail on HP t655.
- PXE Image for 12.3.0 is not offered with that release.
- Increased writeable cache partition size (by default). First boot with 12.3.0 may take more time (once).
- **Citrix**
	- In regards of CVE-2023-41993, CVE-2023-39928 & CVE-2023-41074: Older Webkit libraries are used in Citrix for compatibility reasons. Further details via Knowledge Base [https://kb.igel.com/securitysafety/en/isn-2023-25-webkit-vulnerabilities-101066782.html]

- **Chromium**

	- Downgrading base system to earlier versions may result in reset of the Chromium profile partition.

- **Network**

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
	- Some touchpads are recognized as touchpad and mouse. This results in showing possible user settings for both variants.

- **Licensing**

	- Manual deployment of add-on licenses for IGEL Agent for Imprivata licenses (via UMS) is only possible after finished installation of IGEL Agent for Imprivata app on device.
```

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
```

|  Parameter  |  Registry   |  Range      |  Value      |
| ------ | ------ | ------ | ------ |
|  `Change settings for intel PSR (panel self refresh).`  |  `x.drivers.intel.psr`  |  [Default][Disable][Enable][Use only up to PSR1][Use up to PSR2]  |  *Default*  |

```
- Added old Single Sign-On configuration parameters for backward compatibility.
```

| Parameter | Registry | Type | Value |
| ------ | ------ | ------ | ------ |
| `Azure AD Tenant Name/ID (deprecated)` | `auth.cloudidp.aad_tenant` | string | empty *Default* |
| `Identity Provider URL (deprecated)` | `auth.cloudidp.idpurl` | string | empty *Default* |
| `Client/Application ID (deprecated)` | `auth.cloudidp.client_id` | string | empty *Default* |
| `Client secret (deprecated)` | `auth.cloudidp.client_secret` | string | empty *Default* |

```
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

- Added SSO login for Azure AD IdP using web context.

- Added setup parameter, required to set if Okta is selected as IdP.
```

| Parameter | Registry | Type | Value |
| ------ | ------ | ------ | ------ |
| `Client secret` | `auth.cloudidp.client_secret` | string | empty *Default* |

```
- Introduced new setup parameter, required to be set if Azure AD is selected as IdP.
```

| Parameter | Registry | Type | Value |
| ------ | ------ | ------ | ------ |
| `Azure AD Tenant Name/ID` | `auth.cloudidp.aad_tenant` | string | empty *Default* |

```
- Added IGEL Add-On License support.

- Changed touchpad parameter name from `Enable Touchpad` to `Enable Touchpad on Boot` which make it more obvious what is meant here.
```

|  Setup  |  Parameter  |  Tooltip  |  Registry   |  Type       |  Value      |
| ------ | ------ | ------ | ------ | ------ | ------ |
|  `User Interface > Input > Touchpad`  |  `Enable Touchpad on Boot`  |  `Can be overruled by Hotkey.`  |  `userinterface.touchpad.general.TouchpadEnable`  |  bool  |  *enabled* (default) / disabled  |

```
- Also changed function of TouchpadOff registry key to only be used to switch on and off the tapping.
```

|  Setup  |  Parameter  |  Registry   |  Range      |  Value      |
| ------ | ------ | ------ | ------ | ------ |
|  `User Interface > Input > Touchpad`  |  `Tapping Mode`  |  `userinterface.touchpad.general.TouchpadOff`  |  [With tapping][Without tapping]  |  *With tapping*  |

```
- Added new registry key to set left-hand on touchpad devices
```

|  Parameter  |  Registry  |  Type  |  Value  |
| ------ | ------ | ------ | ------ |
|  `Left hand`  |  `userinterface.touchpad.general.LeftHand`  |  bool  |  *disabled* (default)/enabled |

```
- Added WiFi Regulatory Domain configuration to Setup Assistant.

- Added setup parameter to enable/disable debugging mode of SSO related services and programs.
```

| Parameter | Registry | Type | Value |
| ------ | ------ | ------ | ------ |
| `Enable Debugging of Single Sign-On` | `debug.auth.cloudidp_debug` | bool | enabled / *disabled* (default) |

```
- Added registry key to enable natural scrolling
```

| Parameter | Registry | Type | Value |
| ------ | ------ | ------ | ------ |
| `Natural Scroll` | `userinterface.touchpad.general.naturalscroll` | bool | *disabled* (default)/enabled |

```
- Added parameter to adjust position of shadow indicator popup window.
```

| IGEL Setup | Parameter | Registry | Range |
| ------ | ------ | ------ | ------ |
| System > Remote Access > Shadow | `Position of the indicator` | `userinterface.vncserver.indicatorposition` | [Bottom left][ *Bottom right* ][Top left][Top right] |

```
- Added setup option to disable Single-Sign-On URL restrictions for debugging purposes.
```

| Parameter | Registry | Type | Value |
| ------ | ------ | ------ | ------ |
| `Disable Single Sign-On URL Restrictions` | `debug.auth.cloudidp_disable_url_restrictions` | bool | enabled / *disabled* (default) |

```
- Updated EULA to version of April 2023

- **App Management**

	- Added: Automatic up- / downgrade is not allowed for pinned apps (assigned via UMS). Base System version is always pinned - even if not assigned via UMS.

- **X11 system**

	- Fixed default mirror mode from Panning to Scale down
```

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