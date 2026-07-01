IGEL OS Creator  
===============

Firmware version 12.5.2  
Release date 2024-12-16  
Last update of this document 2024-12-16  


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
| WebKit2Gtk                                | 2.46.4-1~deb12u1igel1733301627   |
| Python3                                   | 3.11.2                           |
| Virtualbox Guest Utils                    | 7.0.18-dfsg-2igel1718956134      |
| Virtualbox X11 Guest Utils                | 7.0.18-dfsg-2igel1718956134      |
| Open VM Tools                             | 12.2.0-1+deb12u2                 |
| Open VM Desktop Tools                     | 12.2.0-1+deb12u2                 |


Release Notes of installable IGEL OS 12 base system
================================================================================

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
