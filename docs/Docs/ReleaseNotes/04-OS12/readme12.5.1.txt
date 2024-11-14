IGEL OS Creator  
===============

Firmware version 12.5.1  
Release date 2024-11-12  
Last update of this document 2024-11-12  


Supported Devices  
-------------------------------------------------------------------------------

[> Supported IGEL OS 12 devices](https://kb.igel.com/os12-supported-hardware)


Component Versions
-------------------------------------------------------------------------------

| Components                                |                                  |
|-------------------------------------------|----------------------------------|
| MESA OpenGL Stack                         | 24.1.5-1igel1722536318           |
| VDPAU Library Version                     | 1.5-2                            |
| Graphics Driver INTEL                     | 2.99.917+git20210115-1igel1654609037     |
| Graphics Driver ATI/RADEON                | 22.0.0-1igel1704966675           |
| Graphics Driver ATI/AMDGPU                | 23.0.0-1igel1705669076           |
| Graphics Driver Nouveau (Nvidia Legacy)   | 1.0.17-3igel1713877061           |
| Graphics Driver Nvidia                    | 525.147.05-0ubuntu0.20.04.1      |
| Graphics Driver VMware                    | 13.3.0-3igel1713934792           |
| Graphics Driver QXL (Spice)               | 0.1.6-1igel1687782644            |
| Graphics Driver FBDEV                     | 0.5.0-2igel1654609009            |
| Graphics Driver VESA                      | 2.6.0-1igel1704966930            |
| Input Driver Evdev                        | 2.10.6-2+b3igel1713876266        |
| Input Driver Elographics                  | 1.4.3-1igel1678083379            |
| Input Driver Synaptics                    | 1.9.2-1+b1igel1683803726         |
| Input Driver VMMouse                      | 13.1.0-1ubuntu2igel1628499891    |
| Input Driver Wacom                        | 1.2.2-1igel1718951939            |
| Kernel                                    | 6.6.38 #mainline-lxos12-g1728479947    |
| Xorg X11 Server                           | 21.1.13-2igel1727249069          |
| Lightdm Graphical Login Manager           | 1.26.0-8igel1716879255           |
| XFCE4 Window Manager                      | 4.14.5-1~18.04igel1643191202     |
| ISC DHCP Client                           | 4.4.3-P1-2                       |
| ModemManager                              | 1.22.0-3+b1igel1713521667        |
| WebKit2Gtk                                | 2.44.3-1~deb12u1igel1725857403   |
| Python3                                   | 3.11.2                           |
| Virtualbox Guest Utils                    | 7.0.18-dfsg-2igel1718956134      |
| Virtualbox X11 Guest Utils                | 7.0.18-dfsg-2igel1718956134      |
| Open VM Tools                             | 12.2.0-1+deb12u2                 |
| Open VM Desktop Tools                     | 12.2.0-1+deb12u2                 |


Release Notes of installable IGEL OS 12 base system
================================================================================

# Changes since: 12.5.0

## New Features
- Added a new generic form dialog framework. A detailed documentation (how to use) will be provided via IGEL Knowledge Base.
	 - OpenVPN authentication dialog uses now the newly designed dialog framework.
- Added secure mini browser as default handler for URLs without installation of a full browser. This enables Zoom (local app) SSO login.
- Added fwupd in IGEL OS as base for upcoming BIOS-related apps.
- Added custom data partition (e.g. for storing images for screensaver slide show)
	|  Parameter  |  Registry   |  Range      |  Value      |
	| ------ | ------ | ------ | ------ |
	|  `Custom Data Partition Size`  |  `custom_data_partition.size`  |  [(empty)][small][medium][large][(fixed size)]  |  **  |
	 - Leave empty if this partition is not desired. Apart from small, medium and large an integer may be specified, potentially with K, M or G appended to refer to the respective multiplier. Changes are effective after reboot. The mount point is /custom-data/
- **OSC Installer**
	- Changed: Shutdown will be triggered after successful OS installation in unattended mode. Only the PXE installer is still using a reboot action as default.
- **App Management**
	- Changed: Dependency apps are automatically removed if corresponding dependent app(s) are removed.
	- Added: Possibility to download apps from custom webserver. If any custom webserver is configured, the system will first try to download from the custom webserver. Fallback are the configured app repositories. Requires UMS 12.07.100 or later.
		|  Parameter  |  Registry   |  Type       |  Value      |
		| ------ | ------ | ------ | ------ |
		|  `Password for HTTP Auth`  |  `update.external_binary_source%.password`  |  string  |    |
		|  `Priority, sources with higher priority will be tried first`  |  `update.external_binary_source%.priority`  |  int  |  100 |
		|  `The base URL of the source, apps must be located in a specific subfolder structure`  |  `update.external_binary_source%.url`  |  string  |    |
		|  `Root CA certificate to validate the SSL connection`  |  `update.external_binary_source%.certificate`  |  string  |    |
		|  `Username for HTTP Auth`  |  `update.external_binary_source%.username`  |  string  |    |
- **Network**
	- Added ready-made challenge password retrieval for Microsoft NDES
	  - Set the following to NDES for enabling the feature:
		|  Parameter  |  Registry   |  Range      |  Type       |  Value      |
		| ------ | ------ | ------ | ------ | ------ |
		|  `Password`  |  `network.scepclient.cert%.ndes.challenge_password_retrieval.crypt_password`  |     |  string  |  empty *Default*  |
		|  `Ready-made Challenge Password Command`  |  `network.scepclient.cert%.use_ready_made_challenge_password_command`  |  [none][NDES]  |  string  |  *none*   |
		|  `User name`  |  `network.scepclient.cert%.ndes.challenge_password_retrieval.user`  |     |  string  |  empty *Default*  |
	  - If the following is not 'none', https will be used. The default "getca" means the CA certificate received in the SCEP GetCA operation. The full path to a different CA certificate may also be specified.
		|  Parameter  |  Registry   |  Range      |  Type       |  Value      |
		| ------ | ------ | ------ | ------ | ------ |
		|  `Debug level`  |  `network.scepclient.cert%.ndes.challenge_password_retrieval.debuglevel`  |     |  integer  |  0 *Default*  |
		|  `CA certificate`  |  `network.scepclient.cert%.ndes.challenge_password_retrieval.cacert`  |   [none (not using https)][from getca operation]   |  string  |   *from getca operation*   |
	  - Added configuration for PKCS#7 encryption and signature algorithms (see sscep options -E and -S)
		|  Parameter  |  Registry   |  Range      |  Type       |  Value      |
		| ------ | ------ | ------ | ------ | ------ |
		|  `PKCS#7 signature algorithm`  |  `network.scepclient.cert%.signalg`  |  [automatic][md5][sha1][sha224][sha256][sha384][sha512]  |  string  |  __ (automatic)  |
		|  `PKCS#7 encryption algorithm`  |  `network.scepclient.cert%.encalg`  |  [automatic][des][3des][blowfish][aes128][aes192][aes256]  |  string  |  __ (automatic)  |
	  - Content-Type: application/x-pki-message is sent according to RFC 8894 if the following new option is enabled:
		|  Parameter  |  Registry   |  Range      |  Type       |  Value      |
		| ------ | ------ | ------ | ------ | ------ |
		|  `Send Content-Type`  |  `network.scepclient.cert%.sscep.send_content_type`  |     |  bool  |  enabled / _disabled_ (default)  |
	  - SCEP: When the CA fingerprint or the CA identifier is changed the client certificate and the client key are not discarded anymore. Just new CA and RA certificates will be downloaded.
	- Added registry key for ignoring hostname received via DHCP
		|  Parameter  |  Registry   |  Type       |  Value      |
		| ------ | ------ | ------ | ------ |
		|  Ignore hostname received via DHCP  |  network.dns.hostname_ignore_dhcp  |  bool  |  enabled / _disabled_ (default)  |
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
		 - Fn+Ctrl+F11: Maximise focused window (L13 Gen5 Intel: not mapped to any function)
	- Added hardware support for Lenovo ThinkPad L13 Gen5 Intel
	- Added hardware support for HP Elite t660 thin client.
	- Validated support for Intel i226, 2.5Gbps ethernet card (copper and fiber) for HP t755 devices.
	- Validated support for Allied Telesis 2914SP Gbps PCIe network adapter with SFP Port for HP t755 devices.
	- Changed hardware names of supported LG devices (to only use underscores instead of spaces).
- **Remote Management**
	- Added setup parameter to set connection timeout
		|  Parameter   |  Registry    |  Type        |  Value       |
		| ------ | ------ | ------ | ------ |
		|  `IGEL Remote Management Connect Timeout`        |  `system.remotemanager.connect_timeout`              |  integer                            |  timeout in sec / *45* (default)  |
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
		| Parameter | Registry | Value |
		| ------ | ------ | ------ |
		| `Timeout for proxy error messages` | `network.proxy.settings.sys_proxy_message_timeout` | `10 (default)` |
		| `Amount of proxy error messages to show` | `network.proxy.settings.sys_proxy_message_count` | `1 (default)` |
	- Fixed automatic network proxy with PAC file: if the PAC script indicates DIRECT for a requested URI, the connection is established directly and not via proxy as before. Furthermore, if no PAC file is specified or can be loaded, all connections are being established directly.
	- Fixed instabilities when using automatic network proxy.
- **WiFi**
	- Added registry key to allow Network Manager to try a WPA2 configuration when SAE is desired but driver or hardware lack capablities:
		|  Parameter  |  Registry   |  Type       |  Value      |
		| ------ | ------ | ------ | ------ |
		|  `SAE dependent on hardware/driver`  |  `network.interfaces.wirelesslan.device0.wpa.sae_capability_dependent`  |  bool  |  enabled / *disabled* (default)  |
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
		|  Parameter  |  Registry   |  Type       |  Value      |
		| ------ | ------ | ------ | ------ |
		|  `Switch back jack to line-in`  |  `system.sound_driver.snd_hda_intel.hp_t660_back_microphone`  |  bool  |  enabled / *disabled* (default)  |
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
