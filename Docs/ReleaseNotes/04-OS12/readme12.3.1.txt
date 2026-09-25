
IGEL OS Creator  
===============

Firmware version 12.3.1  
Release date 2024-02-01  
Last update of this document 2024-02-01  


Supported Devices  
-------------------------------------------------------------------------------

[> Supported IGEL OS 12 devices](https://kb.igel.com/os12-supported-hardware)


Component Versions
-------------------------------------------------------------------------------

| Components                                |                                  |
|-------------------------------------------|----------------------------------|
| OpenSSL                                   | 1.1.1f-1ubuntu2.20               |
| Bluetooth Stack (bluez)                   | 5.71-1igel1704700934             |
| MESA OpenGL Stack                         | 22.3.6-1+deb12u1igel1683795808   |
| VDPAU Library Version                     | 1.5-2igel1677954724              |
| Graphics Driver INTEL                     | 2.99.917+git20210115-1igel1647250103     |
| Graphics Driver ATI/RADEON                | 19.1.0-3igel1657777718           |
| Graphics Driver ATI/AMDGPU                | 23.0.0-1igel1677481842           |
| Graphics Driver Nouveau (Nvidia Legacy)   | 1.0.17-2igel1644486678           |
| Graphics Driver Nvidia                    | 525.125.06-0ubuntu0.20.04.3      |
| Graphics Driver VMware                    | 13.3.0-3igel1628859075           |
| Graphics Driver QXL (Spice)               | 0.1.5-3+git20200331-2igel1647014792    |
| Graphics Driver FBDEV                     | 0.5.0-2igel1644486279            |
| Graphics Driver VESA                      | 2.5.0-1+b1igel1647004096         |
| Input Driver Evdev                        | 2.10.6-2+b1igel1647004239        |
| Input Driver Elographics                  | 1.4.3-1igel1678083379            |
| Input Driver Synaptics                    | 1.9.2-1+b1igel1683803726         |
| Input Driver VMMouse                      | 13.1.0-1ubuntu2igel1628499891    |
| Input Driver Wacom                        | 0.39.0-0ubuntu1igel1629136980    |
| Kernel                                    | 6.1.63 #mainline-lxos12-g1705487185    |
| Xorg X11 Server                           | 21.1.10-1igel1703307487          |
| Lightdm Graphical Login Manager           | 1.30.0-0ubuntu4~20.04.2igel1649274243      |
| XFCE4 Window Manager                      | 4.14.5-1~18.04igel1643191202     |
| ISC DHCP Client                           | 4.4.1-2.1ubuntu5.20.04.5         |
| WebKit2Gtk                                | 2.42.4-1igel1704895168           |
| Python3                                   | 3.8.10                           |
| Virtualbox Guest Utils                    | 7.0.8-dfsg-2igel1682408222       |
| Virtualbox X11 Guest Utils                | 7.0.8-dfsg-2igel1682408222       |
| Open VM Tools                             | 11.3.0-2ubuntu0~ubuntu20.04.7    |
| Open VM Desktop Tools                     | 11.3.0-2ubuntu0~ubuntu20.04.7    |
| Xen Guest Utilities                       | 7.10.0-0ubuntu2                  |
| Spice Vdagent                             | 0.22.1-3+b2igel1680584586        |
| Qemu Guest Agent                          | 8.0.4+dfsg-3+b1igel1692901316    |


Release Notes of installable IGEL OS 12 base system  
================================================================================

# Changes since: 12.3.0

## New Features
- Added (enhanced) settings for kernel cmdline options
- New registry keys:
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
- Changed registry keys:
	| Parameter | Registry | Range | Value |
	| ------ | ------ | ------ | ------ |
	| Various PCI subsystem options | system.kernel.bootparams.pci | [Default][Conf Mechanism 1][Conf Mechanism 2][Disable multiple PCI domains][Disable use of MMCONFIG][Disable MSI][Ignore ACPI PCI host bridge window][Ignore ACPI IRQ routing][Route IRQ for all PCI devices] | _Default_ |
	| Set maximum allowed cstate on intel cpus. | system.kernel.bootparams.max_cstate | [No limit][0][1][2][3][4][5][6] | _No limit_ |
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
		| Parameter | Registry | Range | Value |
		| ------ | ------ | ------ | ------ |
		| Use 8852be driver instead of rtw_8852be for WLAN. | network.drivers.realtek.use_8852be | [Auto][Yes][No] | _Auto_ |
- **Audio**
	- Added parameter to disable timer scheduling in pulseaudio module-udev-detect.
		| Parameter | Registry | Range | Value |
		| ------ | ------ | ------ | ------ |
		| Disable timer scheduling for module-udev | multimedia.pulseaudio.daemon.disable-module-udev-tsched | [auto][true][false] | *auto* |

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
