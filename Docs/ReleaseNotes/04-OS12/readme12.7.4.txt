IGEL OS Creator  
===============

Firmware version 12.7.4  
Release date 2025-12-09  
Last update of this document 2025-12-09  


Supported Devices  
-------------------------------------------------------------------------------

[> Supported IGEL OS 12 devices](https://kb.igel.com/os12-supported-hardware)


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
		|  Parameter  |  Registry   |  Type       |  Value      |
		| ------ | ------ | ------ | ------ |
		|  `Disable dconf monitor (admin and debug use only)`  |  `network.proxy.settings.sys_proxy_dconf_disable`  |  bool  |  enabled / *disabled* (default)  |
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

## Security Fixes
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
	|  Parameter  |  Registry   |  Type       |  Value      |
	| ------ | ------ | ------ | ------ |
	|  `Switch to out of tree i915 sriov driver.`  |  `x.drivers.intel.use_sriov_version`  |  bool  |  enabled / *disabled* (default)  |
- **Network**
	- Removed all Wake On LAN option except for "Wake on magic packet" from IGEL Setup page `Network > LAN Interfaces > Interface % > Wake on LAN`.
	- The removed settings can still be configured via the registry:
		|  network.interfaces.ethernet.device%.wol.wake_arp  |  network.interfaces.ethernet.device%.wol.wake_bcast  |  network.interfaces.ethernet.device%.wol.wake_mcast  |  network.interfaces.ethernet.device%.wol.wake_phy  |  network.interfaces.ethernet.device%.wol.wake_ucast  |
		| ------ | ------ | ------ | ------ | ------ |
- **WiFi**
	- Fixed WiFi support for some devices by adding missing INTEL/iwlwifi driver firmware files.
- **Smartcard**
	- Fixed OpenSC detection of certain PIV smart cards.
- **Audio**
	- Fixed double microphone entries in audio tray for Dell Optiplex 3000 hardware.
	- Updated KB article about default audio device configuration:  https://kb.igel.com/en/igel-os-base-system/current/audio-in-igel-os-12
	  - With this new parameter the last default audio device is restored after reboot:
		|  Parameter  |  Registry   |  Type       |  Value      |
		| ------ | ------ | ------ | ------ |
		|  `Force default audio device after reboot`  |  `multimedia.force_default_after_reboot`  |  bool  |  enabled / *disabled* (default)  |
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
	- On Lenovo ThinkPad models equipped with AMD graphics, when connected to a USB-C Universal Dock driving multiple 4K displays via DisplayPort, system boot or reboot may result in incomplete display initialization. In these cases, one or more external displays may remain black while others function normally. Disconnecting and reconnecting the dock restores full multi-display functionality.
	- When using an HP G5 Dock, disconnecting and reconnecting the dock may cause display configurations (such as display order, resolution, and orientation) to be lost. After reconnection, displays may revert to default settings, requiring manual reconfiguration. For some devices, this issue can be mitigated by setting the registry key `x.xserver0.quirks.dp_mst_hotplug` to "Never."
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
