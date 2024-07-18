IGEL OS Creator  
===============

Firmware version 12.4.2  
Release date 2024-07-17  
Last update of this document 2024-07-17  


Supported Devices  
-------------------------------------------------------------------------------

[> Supported IGEL OS 12 devices](https://kb.igel.com/os12-supported-hardware)


Component Versions
-------------------------------------------------------------------------------

| Components                                |                                  |
|-------------------------------------------|----------------------------------|
| OpenSSL                                   | 1.1.1f-1ubuntu2.22               |
| Bluetooth Stack (bluez)                   | 5.71-1igel1704700934             |
| MESA OpenGL Stack                         | 24.0.5-1igel1714385672           |
| VDPAU Library Version                     | 1.5-2igel1677954724              |
| Graphics Driver INTEL                     | 2.99.917+git20210115-1igel1647250103     |
| Graphics Driver ATI/RADEON                | 19.1.0-3igel1657777718           |
| Graphics Driver ATI/AMDGPU                | 23.0.0-1igel1677481842           |
| Graphics Driver Nouveau (Nvidia Legacy)   | 1.0.17-2igel1644486678           |
| Graphics Driver Nvidia                    | 525.147.05-0ubuntu0.20.04.1      |
| Graphics Driver VMware                    | 13.3.0-3igel1628859075           |
| Graphics Driver QXL (Spice)               | 0.1.5-3+git20200331-2igel1647014792    |
| Graphics Driver FBDEV                     | 0.5.0-2igel1644486279            |
| Graphics Driver VESA                      | 2.5.0-1+b1igel1647004096         |
| Input Driver Evdev                        | 2.10.6-2+b1igel1647004239        |
| Input Driver Elographics                  | 1.4.3-1igel1678083379            |
| Input Driver Synaptics                    | 1.9.2-1+b1igel1683803726         |
| Input Driver VMMouse                      | 13.1.0-1ubuntu2igel1628499891    |
| Input Driver Wacom                        | 0.39.0-0ubuntu1igel1629136980    |
| Kernel                                    | 6.6.22 #mainline-lxos12-g1719995155    |
| Xorg X11 Server                           | 21.1.12-1igel1720008240          |
| Lightdm Graphical Login Manager           | 1.30.0-0ubuntu4~20.04.2igel1649274243      |
| XFCE4 Window Manager                      | 4.14.5-1~18.04igel1643191202     |
| ISC DHCP Client                           | 4.4.1-2.1ubuntu5.20.04.5         |
| ModemManager                              | 1.22.0-3igel1706595056           |
| WebKit2Gtk                                | 2.42.5-1igel1707390006           |
| Python3                                   | 3.8.10                           |
| Virtualbox Guest Utils                    | 7.0.8-dfsg-2igel1682408222       |
| Virtualbox X11 Guest Utils                | 7.0.8-dfsg-2igel1682408222       |
| Open VM Tools                             | 11.3.0-2ubuntu0~ubuntu20.04.7    |
| Open VM Desktop Tools                     | 11.3.0-2ubuntu0~ubuntu20.04.7    |
| Xen Guest Utilities                       | 7.10.0-0ubuntu2                  |


Release Notes of installable IGEL OS 12 base system
================================================================================

# Changes since: 12.4.1

## New Features
- Added possiblibility to define post-session commands for generic processes in base_system.
	|  Parameter  |  Registry   |  Type       |  Value      |  Range      |
	| ------ | ------ | ------ | ------ | ------ |
	|  `Ignore command lines`  |  `userinterface.postsession.process%.ignoredargs`  |  string  |  empty *Default*  |  |
	|  `Activate generic base_system post-session command`  |  `userinterface.postsession.enabled`  |  bool  |  enabled / *disabled* (default)  |  |
	|  `The post-session command to be executed`  |  `userinterface.postsession.command`  |  |  **  |  [Logoff][Shutdown][Enter custom command here]  |
	|  `This session will have priority in executing the post-session command`  |  `userinterface.postsession.force`  |  bool  |  enabled / *disabled* (default)  |  |
	|  `Process name`  |  `userinterface.postsession.process%.name`  |  string  |  empty *Default*  |  |
	|  `Valid return codes`  |  `userinterface.postsession.process%.validrcs`  |  string  |  empty *Default*  |  |
- Added Chinese input support with Intelligent Pinyin method (experimental).
  - Enable Input Methods with parameter
	| Parameter | Setup | Registry | Value |
	| ------ | ------ | ------ | ------ |
	| Keyboard Input Methods (experimental) | User Interface>Input>Keyboard>Input Methods | userinterface.keyboard.ibus.enable | false(default) / true |
  - Enable Pinyin method:
	| Parameter | Setup | Registry | Value |
	| ------ | ------ | ------ | ------ |
	| Chinese Intelligent Pinyin | User Interface>Input>Keyboard>Input Methods>Methods | userinterface.keyboard.ibus.general.preload-engine-libpinyin | false(default) / true |
  - Enable Bopomofo method:
	| Parameter | Setup | Registry | Value |
	| ------ | ------ | ------ | ------ |
	| Chinese Bopomofo | User Interface>Input>Keyboard>Input Methods>Methods | userinterface.keyboard.ibus.general.preload-engine-libbopomofo | false(default) / true |
  - Further properties:
	| Parameter | Setup | Registry | Value |
	| ------ | ------ | ------ | ------ |
	| Auto hide timeout | User Interface>Input>Keyboard>Input Methods | userinterface.keyboard.ibus.panel.auto-hide-timeout | 10000 (default) |
	| Next Input method | User Interface>Input>Keyboard>Input Methods | userinterface.keyboard.ibus.general.hotkeys.triggers | <Super>space (default) |
	| Candidates orientation | User Interface>Input>Keyboard>Input Methods | userinterface.keyboard.ibus.panel.lookup-table-orientation | vertical (default) / horizontal |
	| Show property panel | User Interface>Input>Keyboard>Input Methods | userinterface.keyboard.ibus.panel.show | do not show (default) / hide automatically / always |
  - Intelligent Pinyin properties:
	| Parameter | Setup | Registry | Value |
	| ------ | ------ | ------ | ------ |
	| Initial state Simplified Chinese | User Interface>Input>Keyboard>Input Methods>Intelligent Pinyin | userinterface.keyboard.ibus.libpinyin.pinyin.init-simplified-chinese | false / true(default) |
	| Initial state Chinese | User Interface>Input>Keyboard>Input Methods>Intelligent Pinyin | userinterface.keyboard.ibus.libpinyin.pinyin.init-chinese | false / true(default) |
	| Initial state full width | User Interface>Input>Keyboard>Input Methods>Intelligent Pinyin | userinterface.keyboard.ibus.libpinyin.pinyin.init-full | false(default) / true |
	| Initial state full punctuations | User Interface>Input>Keyboard>Input Methods>Intelligent Pinyin | userinterface.keyboard.ibus.libpinyin.pinyin.init-full-punct | false / true(default) |
- Improved multisession support for post-session commands: In case multiple sessions run in parallel with a set post-session command, command is only triggered when all sessions are finished successfully.
  If session has the 'force' post-session command parameter set, the command is triggered immediately once the session is finished.
- **App Management**
	- Added: With the upcoming switch to bookworm as base for IGEL OS 12, a compatibility app was introduced for offering compatibility with all current released apps. If required, this app will automatically installed after the update to 12.5. A second reboot is needed after the update.
		 - With Base Sytem >= 12.4.2 the additional reboot is not needed as the compatibility app is directly installed with the Base System update.
- **Network**
	- Added Wake on LAN support via USB-C-to-LAN adapters
		- Activatation by enabling any of the Wake on LAN settings of the LAN Interfaces
		- Only Wake on LAN from Suspend is supported
- **Setup Assistant**
	- Changed label of WiFi configuration dialog in Setup Assistant (Country or Region).
- **Hardware**
	- Added hardware support for LG gram 14ZT90R, 15ZT90R and 17ZT90R.
	- Improved power consumption on Lenovo ThinkPad L14 Intel Gen5.
	- Added hardware support for Lenovo ThinkPad L14 AMD Gen5.
- **SSO**
	- Added: Configurable list of allowed hosts for redirection:
		|  Parameter  |  Registry   |  Type       |  Value      |
		| ------ | ------ | ------ | ------ |
		|  `List of allowed hosts for redirection`  |  `auth.cloudidp.host_allowlist`  |  string  |  empty *Default*  |
	- Added a parameter to Entra ID SSO which allows to add additional scopes.
	- The OpenID Connect scope value for the authentication request is now configurable:
		|  Parameter  |  Registry   |  Type       |  Value      |
		| ------ | ------ | ------ | ------ |
		|  `OpenID Connect scope`  |  `auth.cloudidp.scope`  |  string  |  openid profile email *Default*  |

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
