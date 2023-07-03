# HOWTO UCC

## [IGEL OS UCC Configuration Guide](http://files.igelcommunity.com/igelos_ucc_guide.pdf)

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

## [Virtual Background for Unified Communication Apps in IGEL OS](https://kb.igel.com/igelos-11.08.330/en/virtual-background-for-unified-communication-apps-in-igel-os-88020980.html)

-----

## USB Devices and UCC

In general, USB redirection is not needed for standard functionality such as audio, video, HID input, etc. However, in some special circumstances, a device may need to be redirected into a VDI session for full functionality, or if it requires a specific driver to function.

- [When to use USB Redirection](https://kb.igel.com/igelos-11.08/en/when-to-use-usb-redirection-63804088.html)

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

-----

## [Cisco Webex App for VDI using IGEL OS and the known limitation with "ring all devices"](https://www.cisco.com/c/en/us/td/docs/voice_ip_comm/cloudCollaboration/wbxt/vdi/wbx-vdi-deployment-guide/wbx-teams-vdi-deployment_chapter_010.html#id_133267)

**NOTE:** Cisco fix planned for 43.6 version scheduled June 2023. 

- On Linux VDI clients, an incoming call does not ring all devices (including speakers on the thin client) even if that option is selected in Webex App on the HVD host. Only the audio device selected on the HVD plays the ringtone.

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