# HOWTO UCC

<!---
## [IGEL OS UCC Configuration Guide](https://perusat.net/icbackup/igelos_ucc_guide.pdf)
-->

## [IGEL OS UCC Configuration Guide](HOWTO-UCC-Guide.md)

<!---
Remove for now
## [Alternate site for guide: IGEL OS UCC Configuration Guide](http://files.igelcommunity.com/igelos_ucc_guide.pdf)
-->

-----

## Addendum to UCC Guide

-----

## UCC Hardware Requirements

| UCC Type | Hardware Limits | Link to Vendor |
|----------|-----------------|----------------|
| Zoom VDI - ANY (Citrix / Horizon / AVD) | Dual Core `<` 2GHz base clock = LIMITED to 9 video streams <br /> Dual Core AMD chips with `2x` in name = LIMITED to 6 video streams <br /> Dual Core `>=` 2GHz clock (or Intel i5/i7 `<` 2GHz) = 25 video streams <br /> Quad Core or higher (any clock speed) = 25 video streams | [Zoom VDI Client Hardware Requirements](https://support.zoom.us/hc/en-us/articles/4404773645069-Calculating-video-streams-for-VDI-clients) <br /><br /> [Zoom VDI client features comparison](https://support.zoom.us/hc/en-us/articles/360031441671-VDI-client-features-comparison) |
| MS Teams VDI (Citrix) | Dual Core `>=` 1.8GHz base clock speed for 720p 1:1 call <br /> Dual or Quad Core `>=` 1.8GHz with 2.9GHz boost for many:many call | [Teams VDI for Citrix Client Hardware Requirements](https://docs.citrix.com/en-us/citrix-virtual-apps-desktops/multimedia/opt-ms-teams.html#:~:text=Citrix%20Workspace%20app%20requires%20at,2.) |
| MS Teams VDI (Horizon) | Dual Core `>=` 2.4GHz base clock speed | [Teams VDI for Horizon Client Hardware Requirements](https://docs.vmware.com/en/VMware-Horizon/2212/horizon-remote-desktop-features/GUID-F68FA7BB-B08F-4EFF-9BB1-1F9FC71F8214.html) |
| MS Teams VDI (AVD) | Dual Core `>=` 1.6GHz base clock speed <br /> 4GB of Available memory | [Teams VDI for AVD Client Hardware Requirements](https://learn.microsoft.com/en-us/microsoftteams/hardware-requirements-for-the-teams-app#hardware-requirements-for-teams-on-linux) |
| Webex VDI - ANY (Citrix / Horizon / AVD not yet available) | Any 64-bit x86 + 2GB RAM | [Webex VDI Client Hardware Requirements](https://www.cisco.com/c/en/us/td/docs/voice_ip_comm/cloudCollaboration/wbxt/vdi/wbx-vdi-deployment-guide/wbx-teams-vdi-deployment_chapter_01.html#Cisco_Reference.dita_02ec38ca-aa77-4ae5-967f-03af2d3f22ef) |

-----

## Latest Known Good Settings for Citrix

**NOTE:** If you are experiencing an issue with Citrix, test with one of these profiles assigned for OS 11 or OS 12. It may not fix the issue, but it is a good place to start.
 
**Tested with IGEL OS 11.09.160 and IGEL OS 12.3.0.**

These are known good settings for Citrix browser content redirection, HDX webcam redirection, and also a setting that if you are in a meeting (Zoom VDI, Teams, Webex Meetings VDI) and are inactive the screensaver will not kick in.
 
This setting also work for VMware and may also work for AVD: `debug.tools.igel-screensaver-monitor.enable`
 
- <a href="../Profiles/HOWTO-UCC-Citrix-Known-Good-Settings.xml" download> Profile OS 11 (.xml) - HOWTO-UCC-Citrix-Known-Good-Settings</a> 

- <a href="../Profiles/HOWTO-UCC-Citrix-Known-Good-Settings.ipm" download> Profile OS 12 (.ipm) - HOWTO-UCC-Citrix-Known-Good-Settings</a> 

-----

## IGEL + Citrix = HEVC

Citrix recently shared an Early Access Release of the Citrix Workspace App for Linux 2408 (CWAL2408) with IGEL. One of the biggest features that are added, that I have been waiting for a very long time, is the H.265 enablement for Hardware Acceleration of the session delivery. 

- [Citrix Workspace App for Linux 2408 (CWAL2408) with IGEL](https://virtualbrat.com/2024/09/13/igel-citrix-hevc/)

-----

## [Virtual Background for Unified Communication Apps in IGEL OS](https://kb.igel.com/en/igel-os/11.10/virtual-background-for-unified-communication-apps-)

-----

## USB Devices and UCC

In general, USB redirection is not needed for standard functionality such as audio, video, HID input, etc. However, in some special circumstances, a device may need to be redirected into a VDI session for full functionality, or if it requires a specific driver to function.

**Note from IGEL Support:** Native USB redirection should be a means of last resort - it's pretty much the equivalent of plugging that device directly into the session via a long, virtual USB cable. The virtual session has direct access to the device, which is nice, but you lose compression, flow control, and any other optimizations that may occur via a dedicated virtual channel.

- [When to use USB Redirection](https://kb.igel.com/en/igel-os/11.10/when-to-use-usb-redirection)

- [Citrix 2405 - Composite USB device redirection using DDC policies](https://docs.citrix.com/en-us/citrix-workspace-app-for-linux/whats-new.html#composite-usb-device-redirection-using-ddc-policies)

-----

## Citrix with the Jabra Evolve 20 to enable the call button on the headset:

Setup call button on Jabra Evolve 20 with Native USB Redirection enabled via following device rule:

```
Rule=Connect, VID= 0B0E, PID=0300, extra config = split=1 intf=03
```

-----

## Cisco Webex Meetings VDI Optimization

There have been some changes with Webex Meetings VDI, and now instead of using a separate installer for Webex Meetings, they are now bundled.

In short, if you are using Webex VDI (Teams), and Webex Meetings VDI, and want both to be optimized, make sure to [use the bundle installer from here](https://www.webex.com/downloads/teams-vdi.html).

This is the [latest version of the documentation](https://www.cisco.com/c/en/us/td/docs/voice_ip_comm/cloudCollaboration/wbxt/vdi/wbx-teams-vdi-deployment-guide/wbx-teams-vdi-deployment_chapter_010.html#id_127338)

### Auto-upgrade disabled:

VDI client in a persistent VDI setting with autoupgrade disabled

`msiexec /i c:\users\[username]\Downloads\WebexBundle.msi ALLUSERS=1 ENABLEVDI=2 AUTOUPGRADEENABLED=0 FORCELOCKDOWN=NeverUpdate`

VDI client in a non-persistent VDI setting with autoupgrade disabled

`msiexec /i c:\users\[username]\Downloads\WebexBundle.msi ALLUSERS=1 ENABLEVDI=2 AUTOUPGRADEENABLED=0 ROAMINGENABLED=1 FORCELOCKDOWN=NeverUpdate`

-----

## Cisco Webex Meetings VDI & Cisco Webex App VDI Compatibility Lists

Compatibility lists for Cisco Webex Meetings VDI & Cisco Webex App VDI:

[Webex Meetings Virtual Desktop Infrastructure release notes](https://help.webex.com/en-us/article/glj57y/Webex-Meetings-Virtual-Desktop-Infrastructure-release-notes#Cisco_Reference.dita_fcb4e1d7-dbef-4bab-8842-9b1a8f84a9e5)

[Webex App | VDI release notes](https://help.webex.com/en-us/article/ntp1us7/Webex-App-%7C-VDI-release-notes#Cisco_Reference.dita_13d9aace-b6f9-41dc-a6e0-9f7a48834060)

### Steps to automatically update
 
 **Must** keep up the race to stay on latest version of IGEL OS so as to not fall out of sync with backend releases as noted in links above.

 For example, when the latest version was 43.5, then [IGEL OS 11.08.248](https://github.com/IGEL-Community/IGEL-Docs/blob/main/Docs/ReleaseNotes/01-OS11/readme11.08.248.txt) is needed since it includes the plugin for Cisco Webex Meetings VDI plugin 42.10.

-----

## [Citrix HDX Webcam redirection for 64-bit applications. HowTo guide!](https://virtualbrat.com/2023/02/23/citrix-hdx-webcam-redirection-for-64-bit-applications-how-to-guide/)

Sample profile to use with 11.08.360 and above for HDX webcam redirection. Tested with Logitech C920e, Logitech HD Pro C920 and Logitech C925.

<a href="../Profiles/HOWTO-UCC-Citrix-Global-64bit-Webcam-Delay-Type-2-Manual-Config-Logitech-HD-Pro-Webcam-C920.xml" download> HOWTO-UCC-Citrix-Global-64bit-Webcam-Delay-Type-2-Manual-Config-Logitech-HD-Pro-Webcam-C920</a> 

[KB: HDX Multimedia Settings for an IGEL OS Citrix Session](https://kb.igel.com/en/igel-os/11.10/hdx-multimedia-settings-for-an-igel-os-citrix-sess)
 
Also, please note that if using Chromium to connect to Citrix to set the following in the registry for the session:

  - Set `multimedia.gstreamer.version` to 1.x
  - Set `sessions.chromium%.gstreamer_version` to 1.0

-----

## [Cisco Webex App for VDI using IGEL OS and the known limitation with "ring all devices"](https://www.cisco.com/c/en/us/td/docs/voice_ip_comm/cloudCollaboration/wbxt/vdi/wbx-vdi-deployment-guide/wbx-teams-vdi-deployment_chapter_010.html#id_133267)

**NOTE:** Cisco fix planned for 43.6 version scheduled June 2023. 

- On Linux VDI clients, an incoming call does not ring all devices (including speakers on the thin client) even if that option is selected in Webex App on the HVD host. Only the audio device selected on the HVD plays the ringtone.

-----

## Wacom Tablets

IGEL OS 11 includes drivers for Wacom tablets.

The [Linux Wacom Project](https://linuxwacom.github.io/) manages the drivers, libraries, and documentation for configuring and running Wacom tablets under the Linux operating system. These drivers are pre-installed in IGEL OS 11 and provide out-of-the box support for a virtually all Wacom tablets and TabletPCs.

-----

## Bandwidth Requirements for Various Types of Users
 
When determining minimum bandwidth requirements for Citrix / VMware, plan with the following estimates:
 
- `100 to 150Kbps` average bandwidth for a basic office productivity desktop: typical office applications with no video, no 3D graphics, and the default Windows and Citrix / VMware settings. 
- `50 to 100Kbps` average bandwidth for an optimized office productivity desktop: typical office applications with no video, no 3D graphics, with Windows desktop settings optimized and Citrix / Horizon optimized.
- `400 to 600Kbps` average bandwidth for virtual desktops utilizing multiple monitors, 3D, Aero, and Microsoft Office. 
- `500Kbps to 1Mbps` minimum peak bandwidth to provide headroom for bursts of display changes. In general, size your network using the average bandwidth, but consider peak bandwidth to accommodate bursts of imaging traffic associated with large screen changes.
- `2Mbps` per simultaneous user running 480p video, depending upon the configured frame rate limit and the video type. 
 
### Example -- Branch or Remote Office Scenario

- Users have basic Microsoft Office productivity applications, no video, no 3D graphics, and USB keyboards and mouse devices. 
- The bandwidth required per typical office user on Horizon is from 50-150Kbps.
- The T1 network capacity is 1.5Mbps.
- Bandwidth utilization is 80 percent (.8 utilization factor).
 
### Formula for Determining the Number of Users Supported
 
- In the worst case, users require `150Kbps: (1.5Mbps*.8)/150Kbps = (1500*.8)/150 = 8 users`
- In the best case, users require `50Kbps: (1.5Mbps*.8)/50Kbps = (1500*.8)/50 = 24 users`
 
Result 
 
- This remote office can support between 8 and 24 concurrent users per T1 line with 1.5Mbps capacity.

-----

## Sample Guideline for VDA workloads – Number of users per server
 
### Guideline for VDA workloads – based on CPU Cores (Servers have 2 CPUs with 18 cores per CPU - Total of 36 cores)
 
- HSA (Hosted Shared Applications):
    - Light -- 4 applications running at the same time (12:1 users to core) (12 * 36 = 432 users per server)
    - Medium -- 4 applications running at the same time (10:1 users to core) (10 * 36 = 360 users per server)
    - Heavy -- 4 applications running at the same time (8:1 users to core) (8 * 36 = 288 users per server)
- HSD (Hosted Shared Desktops - Windows Server 2016) (8:1 users to core) (follow Memory guideline)
- NVD (Non-Persistent Desktops - Windows 10) (5:1 users to core) (follow Memory guideline)
- PVD (Persistent Desktops - Windows 11 (should be 5% of total workload) (4:1 users to core) (follow Memory guideline)
 
### Guideline for VDA workloads – based on server memory (768GB RAM)
 
- HSA (Hosted Shared Applications):
    - Light -- 4 applications running at the same time (12:1 users to core) (follow CPU cores guideline)
    - Medium -- 4 applications running at the same time (10:1 users to core) (follow CPU cores guideline)
    - Heavy -- 4 applications running at the same time (8:1 users to core) (follow CPU cores guideline)
- HSD (Hosted Shared Desktops - Windows Server 2016) (8:1 users to core) (768GB / 3GB per user = 256 users per server)
- NVD (Non-Persistent Desktops - Windows 11) (5:1 users to core) (768GB / 6GB per user = 128 users per server)
- PVD (Persistent Desktops - Windows 11 (should be 5% of total workload) (4:1 users to core) (768GB / 8GB per user = 96 users per server)

[Citrix: Design Decision: Single Server Scalability](https://docs.citrix.com/en-us/tech-zone/design/design-decisions/single-server-scalability.html)

-----

## Citrix Browser Content Redirection (BCR)

Browser content redirection prevents the rendering of webpages in the allow list on the VDA side. This feature uses Citrix Workspace app for Linux to instantiate a corresponding rendering engine on the client side, which fetches the HTTP and HTTPS content from the URL.

- [Citrix -  Browser content redirection](https://docs.citrix.com/en-us/citrix-virtual-apps-desktops/multimedia/browser-content-redirection.html)
- [Citrix - How to Troubleshoot Browser Content Redirection](https://support.citrix.com/article/CTX230052/how-to-troubleshoot-browser-content-redirection)

-----

## Google Meet in VDI

Steps to optimize Google Meet in VDI:

- [Improved meeting quality when joining on virtual machines](https://workspaceupdates.googleblog.com/2022/11/improved-meeting-quality-for-virtual-machines.html)
- [Prepare your network for Meet meetings](https://support.google.com/a/answer/1279090?hl=en#zippy=%2Cusing-vdi%2Cavoid-using-vdi)

-----

## [MS Teams Optimization Feature Compatibility Matrix for Horizon 7 and Horizon 8 Recent Releases. (86475)](https://kb.vmware.com/s/article/86475)

-----

## IGEL adds Citrix Device Posture Service support – Higher security and extended control of access

IGEL has integrated with the Device Posture Service (DPS) team at Citrix to add the functionality of validating that the endpoint fulfills requirements set to access the Citrix Cloud environment.

Device Posture service with IGEL OS offers conditional access control to your Citrix Cloud environment and is a key component to Zero Trust based access.

[IGEL adds Citrix Device Posture Service support – Higher security and extended control of access. IGEL + Citrix = Better together!](https://virtualbrat.com/2023/11/22/igel-adds-citrix-device-posture-service-support-higher-security-and-extended-control-of-access-igel-citrix-better-together/)

-----

## [Unexpected Keyboard Layout in a Citrix Session](https://kb.igel.com/en/igel-os/11.10/troubleshooting-unexpected-keyboard-layout-in-a-ci)

When a Citrix session has started, the keyboard layout changes in an unexpected way. On the local system, the keyboard layout may still be as expected.

-----

## [Touchpad pressure-based touch detection](https://wayland.freedesktop.org/libinput/doc/1.11.3/touchpad_pressure.html)

Sample profiles to address touchpad sensitivity issue.

- <a href="../Profiles/HOWTO-UCC-Disable-Touchpad-While-Typing.xml" download> Profile OS 11 (.xml) - HOWTO-UCC-Disable-Touchpad-While-Typing</a> 
- <a href="../Profiles/HOWTO-UCC-Touchpad-Libinput-Adjustments-Clickpad-Disabled.xml" download> Profile OS 11 (.xml) - HOWTO-UCC-Touchpad-Libinput-Adjustments-Clickpad-Disabled</a> 

-----

## Citrix HDX service fails on 29th February

- [Citrix HDX HTML5 video redirection service crashing on 29th February.](https://support.citrix.com/article/CTX617043/citrix-hdx-service-fails-on-29th-february)

- This can be achieved through the command mentioned below:

```
>> Run the below command from an administrative command prompt [Start > cmd > right click and run as admin]
```

```bash linenums="1"
net stop w32time & date 03-01-2024 & net start CtxHdxWebSocketService & net start w32time
```

-----

## IGEL OS 11.09.217 / 11.09.260 Citrix Multiple Audio Device Support / Unified Communications Issue

**NOTE:** Fixed with 11.09.313 release on 17 April 2024

- Issue is the multiple audio device support is not working 
- Zoom VDI/Microsoft Teams will not work when the device is in the problem state

**Workaround:**

- Configure the following as a final desktop command: `systemctl restart igel-citrix-icaconfig.service`
- If you have a session that is configured to autostart, also add an autostart delay of 5 seconds.

-----

## [How to disconnect all Bluetooth devices at reboot / shutdown](https://www.igelcommunity.com/post/how-to-disconnect-all-bluetooth-devices-at-reboot-shutdown)

-----

## Horizon with Black Screen with Flickering White Spots

This is a quirk of current Horizon linux clients which show this when there's no compositor in the window manager.

In IGEL OS the compositor is off by default because it may have side effects on older / slower devices.

Here is registry setting: `windowmanager.wm0.variables.usecompositing`

-----

## Citrix Workspace cannot find a valid smart card certificate

OS 12 issue inserting smart card and Citrix Workspace 
starts and then error message: `Citrix Workspace cannot find a valid smart card certificate`.

 If the smart card is removed and reinserted then Citrix Workspace app recognizes the smart card and login can proceed.

Issue the following command via [IGEL KB: Before Desktop Start](https://kb.igel.com/en/igel-os/11.10/desktop-1)

```bash linenums="1"
sed -i "/SinglePin=0/c SinglePin=1" /etc/netid.conf
```

-----

## Citrix Workspace App (CWA) for Linux – ICA File Not Launching Automatically

The removal of NPAPI support by Firefox will affect user experience for users who access Citrix Receiver for Web using the Firefox browser on Linux. The impact to the users are as follows:

- Users will be prompted to install Citrix Receiver every time they access the Receiver for web site.
- An ICA file will be saved when users try to launch an application or desktop. They will have to click the ICA file at the bottom of the browser to activate the launch.

**Note:** This article is also applicable for Google Chrome browser users.

[Citrix Workspace App (CWA) for Linux – ICA File Not Launching Automatically](https://support.citrix.com/article/CTX237727/citrix-workspace-app-cwa-for-linux-ica-file-not-launching-automatically?recommended)

-----

## Adding FabulaTech to the Virtual Channel Allow List of Citrix

There are two options how to configure the virtual channel allow list for enabling FabulaTech in a Citrix Virtual Apps and Desktops environment: Allowing all virtual channels or Allowing all Citrix channels and FabulaTech channel. Both settings need to be set on VDA level. The required configuration can be found in the Citrix farm policies. The setting’s name is "Virtual channel allow list".

- [FabulaTech Support: Adding FabulaTech to the Virtual Channel Allow List of Citrix](https://www.fabulatech.com/support-articles/citrix-allow-list.html)

-----

## Citrix testing tools for Webcam and Audio/Mic redirection

- [Webcam Preview Test Application](https://support.citrix.com/s/article/CTX547245-webcam-preview-test-application?language=en_US)
- [Citrix Audio Diagnostic Tool](https://support.citrix.com/s/article/CTX579089-citrix-audio-diagnostic-tool?language=en_US)
