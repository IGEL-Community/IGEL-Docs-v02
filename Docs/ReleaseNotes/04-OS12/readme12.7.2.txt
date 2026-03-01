IGEL OS Creator  
===============

Firmware version 12.7.2  
Release date 2025-09-29  
Last update of this document 2025-09-29  


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
