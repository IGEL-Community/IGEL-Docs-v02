# HOWTO UCC Guide OS12

<!--
Comments here
-->

- IGEL UMS Version Base: [UMS Release Notes](https://igel-community.github.io/IGEL-Docs-v02/Docs/ReleaseNotes/02-UMS/)

- IGEL OS Firmware Base: [IS 12 Release Notes](https://igel-community.github.io/IGEL-Docs-v02/Docs/ReleaseNotes/04-OS12/)


- [Cisco JVDI Client](https://app.igel.com/cisco_jvdi/)
- [Cisco Webex Meetings VDI plugin](https://app.igel.com/cisco_meetings/)
- [Cisco Webex VDI plugin](https://app.igel.com/cisco_webex/)
- [Citrix HDX Realtime Media Engine](https://app.igel.com/hdx_rtme/)
- [Citrix Workspace App](https://app.igel.com/cwa/) 
- [IGEL AVD Client](https://app.igel.com/avd/)
- [IGEL RDP Client](https://app.igel.com/rdp//)
- [IGEL Windows 365 Client](https://app.igel.com/cpc/)
- [Omnissa Horizon Client](https://app.igel.com/horizon/)
- [Zoom Media Plugin](https://app.igel.com/zoomvdi/)            


- [Zoom VDI 64bit releases and downloads](https://support.zoom.com/hc/en/article?id=zm_kb&sysparm_article=KB0063810)

- [Cisco Webex download](https://help.webex.com/en-us/article/ntp1us7/Webex-App-%7C-VDI-release-notes#_ff8dd002-55da-4c64-a481-32a465c09fc1)

- [IGEL Addendum to UCC Guide](HOWTO-UCC.md)

**NOTES:**

- For Cisco Webex testing, you need an Webex account. Testing Webex in guest mode may cause issues with validating optimization.

-----

-----

## Introduction 

### Purpose of this Document

The purpose of this document is to explain the configuration of Unified Communication (UC) solutions which are included in IGEL OS – in short term: UCC Guide. 

Every section of the document contains the configuration for the endpoint with IGEL OS (Configuration with use of the IGEL Universal Management Suite - UMS) and the configuration for the VDI infrastructure. 

At the end of some of the sections you will find also results from tests.

The use of the document will be done on your own risks and without support from IGEL Technology. 

The guide will cover the last public IGEL OS build and in addition to appropriate private build that may address key item not available in current public build.

If you need additional help, you can contact [IGEL Community](https://www.igelcommunity.com) on slack.

### Software Base of this Document

**Note:** Download latest version of IGEL OS and UMS from [app.igel.com](https://app.igel.com/software) or [IGEL Community Docs - Appendix - Current IGEL Downloads](https://igel-community.github.io/IGEL-Docs-v02/Docs/HOWTO-Setup-Lab-Sandbox-Environment/#appendix-current-igel-downloads)

-----

-----

## General Configuration for Unified Communications IGEL OS 12.x and later

### Webcam Audio and PCI Audio features

Create a Profile based on the [IGEL OS Base System](https://app.igel.com/base_system/).

If you need to use your webcam in different applications, there is a special registry key available which disables the audio stream from the webcam:

![image001](Images/HOWTO-UCC-Guide12-001.png)

The new function to disable pci audio is also available:

![image002](Images/HOWTO-UCC-Guide12-002.png)

### Zoom Virtual Background for IGEL OS

Create a Profile based on the [Zoom Media Plugins for VDI](https://app.igel.com/zoomvdi/) app.

![image003](Images/HOWTO-UCC-Guide12-003.png)

- **NOTE:** If the Printing (Internet printing protocol CUPS) feature is disabled, then a dependent GTK Webkit will not work, and the Virtual Webcam feature will not work. 

-----

-----

## Citrix on IGEL OS 12

### Citrix Base configuration (HDX optimized) for CWA 2505

- [Citrix Workspace App for Linux 2505](https://www.citrix.com/downloads/workspace-app/linux/workspace-app-for-linux-latest.html)

Create a Profile based on the [Citrix Workspace App](https://app.igel.com/cwa/).

![image017](Images/HOWTO-UCC-Guide12-017.png)

- Make sure to configure the right version `Based on Firmware`:

![image018](Images/HOWTO-UCC-Guide12-018.png)

- If you choose UDP on Citrix, you need to enable UDP Audio on IGEL OS too:

![image019](Images/HOWTO-UCC-Guide12-019.png)

- and you can use UDP audio through Citrix Gateway:

![image020](Images/HOWTO-UCC-Guide12-020.png)

- Here is current recommend configuration for graphics:

![image021](Images/HOWTO-UCC-Guide12-021.png)

- Now you can use the new Multi Monitor Feature which is great for docking devices for example

![image022](Images/HOWTO-UCC-Guide12-022.png)

- You should enable the Multiple Audio Device support: 

![image023](Images/HOWTO-UCC-Guide12-023.png)

- If you want to use the HDX webcam feature, there is an automatic configuration available: 

![image024](Images/HOWTO-UCC-Guide12-024.png)

- There is also a new feature for H264 codec support for webcam redirection:

![image025](Images/HOWTO-UCC-Guide12-025.png)
![image026](Images/HOWTO-UCC-Guide12-026.png)
![image027](Images/HOWTO-UCC-Guide12-027.png)

- Starting CWA 22.07 there are some new audio enhancements:

**NOTE:** [1] When the audio throughput undergoes a sudden spike or is not enough for an unstable network, this value increases the output buffering value. This increase in the output buffering value provides smooth audio. However, the audio might be slightly delayed. This parameter is only valid when `AudioRedirectionV4`, and `AudioLatencyControlEnabled` is set to True.

![image028](Images/HOWTO-UCC-Guide12-028.png)

**NOTE:** [2] Improved audio echo cancellation support

![image029](Images/HOWTO-UCC-Guide12-029.png)

**NOTE:** [3] With this enhancement, the maximum output buffering value is decreased from 200 ms to 50 ms in Citrix Workspace app. As a result, the user experience of the interactive audio application is improved. Also, the round-trip time (RTT) is decreased by 150 ms. This parameter is valid only when `AudioRedirectionV4` is set to `True`

![image030](Images/HOWTO-UCC-Guide12-030.png)

### Important Citrix Configuration Topics

Starting with Citrix VDA 2109, the default `virtual channel allow list` policy changed from `disabled` to `enabled`. This occurs even if you are upgrading an existing installation where you did not change the policy. Additional steps are required to allow Zoom, WebEx, and other tools to open a virtual channel.

Required steps:

Changing the virtual channel allow list policy to `disabled`:

The easiest way to ensure that Zoom, WebEx, and other tools can create and open a virtual channel to connect to the VDI plugin, is to set the policy for the virtual channel allow list to `disabled`. 

If the policy state was changed to `enabled` after updating to VDA release 2109, you can edit the policy to return the status to `disabled`.

You will need to open Citrix Studio and navigate to the ICA policies section. The following dialog shows the virtual channel allow list policy configured for `disabled`.

![image031](Images/HOWTO-UCC-Guide12-031.png)

Change it to disabled:

![image032](Images/HOWTO-UCC-Guide12-032.png)

- Enable the Citrix connection bar for Citrix sessions and you can save the monitor layout within the session (it will be stored into User profile):

![image033](Images/HOWTO-UCC-Guide12-033.png)
![image034](Images/HOWTO-UCC-Guide12-034.png)

- There was a long running Citrix ERROR - it ends mostly with the message: Cannot add store (cannot validate certificate) `ERROR adding store 65147`.

The root cause is, that Microsoft changed in 2021 the PKI provider to SHA2 - if you use Windows Server 2019 or Windows Server 2022 you need to migrate your Root CA from SHA to SHA2: 

[Certificate Services - Migrate form SHA1 to SHA2 (SHA256) | PeteNetLive](https://www.petenetlive.com/KB/Article/0001243)

On Citrix you need to configure these 5 policies like this:

![image035](Images/HOWTO-UCC-Guide12-035.png)

### Citrix Configuration for HDX Webcam redirection without plugins

- If you want to use applications on Citrix which do not have any plugins inside IGEL OS, it is also possible to use Citrix Webcam Redirection. You need to follow this section to proceed an optimal configuration.

Use this configuration on IGEL OS:

![image036](Images/HOWTO-UCC-Guide12-036.png)

![image037](Images/HOWTO-UCC-Guide12-037.png)

**Dependencies**

- Webcam redirection works with and without RTME.

- Webcam redirection works for 32-bit applications. For example, Skype, GoToMeeting. Use a 32-bit browser to verify webcam redirection online. For example, www.webcamtests.com 

- Webcam usage is exclusive to applications. For example, when Skype is running with a webcam and you launch GoToMeeting, exit Skype to use the webcam with GoToMeeting.

-  with CWA 21.12 Webcam redirection also works for 64-bit applications! *experimental*

**Dependencies for 64-bit Webcam redirection support**

Here are some additional topics which needs to be considered that the 64-bit redirection is working:

- Check if you have the right CVAD version in place: If CWA 21.12 or greater is used, you need to use at least Windows Client oder Server VDA 21.09 or 1912 LTSR CU4 or 2203 LTSR, unfortunately, 7.15 LTSR will not work at all.

**Supported and working video conferencing applications**

- Adobe Connect
- GoToMeeting
- Google Hangouts and Hangouts Meet
- IBM Sametime
- BlueJeans*
- BigBlueButton*
- Jitsi*
- Microsoft Skype for Business 2015
- Microsoft Lync 2010 and 2013
- Microsoft Skype 7 or higher
- Media Foundation-based video applications on Windows 8.x or higher / Windows Server 2012 R2 or higher

**NOTE:** * Not officially supported by Citrix

### Citrix Configuration for HDX -> Windows GPOs

- Applied Audio settings via GPO:

Computer Config > Admin Templates > Windows Components > Remote Desktop Services > Remote Desktop Session Host> Device and Resource Redirection

Changed `Allow audio and video playback redirection` from `Not Configured` to `Enabled`

Changed `Allow audio recording redirection` from `Not Configured` to `Enabled`

Computer Config > Admin Templates > Windows Components > App Privacy

- Changed `Let Windows apps access the microphone` from `Not Configured` to `Enabled`.  Options > Default for all apps changed from `User is in control` to `Force Allow`.

Changed `Let Windows apps access the camera` from `Not Configured` to `Enabled`.  Options > Default for all apps changed from `User is in control` to `Force Allow`.

Computer Config > Admin Templates > Windows Components > Camera changed `Let Allow use of Camera` from `Not Configured` to `Enabled`.

![image038](Images/HOWTO-UCC-Guide12-038.png)
![image039](Images/HOWTO-UCC-Guide12-039.png)

### Cisco WebEx Meetings

- IGEL OS Configuration (UMS based)

Create a Profile based on the [Cisco Webex Meetings VDI](https://app.igel.com/cisco_meetings/) app.

![image040](Images/HOWTO-UCC-Guide12-040.png)


- Citrix Desktop Configuration (XenApp and XenDesktop)

Install the right software at the backend infrastructure:

**NOTE:** All VDI downloads are at the top of this guide

[Cisco Webex Meetings Virtual Desktop Software](https://help.webex.com/en-us/article/xcwws1/Release-notes-for-Webex-Meetings) to check all what is needed for the installation.

- Citrix XenDesktop and Citrix XenApp are supported (no published app support) 

add the following values under HKEY_USERS\.DEFAULT:

![image041](Images/HOWTO-UCC-Guide12-041.png)

When you start Webex, it is only working with the redirection, if you can see the “VDI” sign here:

![image042](Images/HOWTO-UCC-Guide12-042.png)

Check if you have the right Connection configuration:

[Test your WebEx Connection Configuration](https://mediatest.webex.com/)

[Further known issues and solved bugs](https://help.webex.com/en-us/c3r7uf/Open-and-Resolved-Bugs-for-the-Latest-Webex-Meetings-Updates)

[Check the release notes for further information](https://help.webex.com/en-us/article/ntp1us7/Webex-App-%7C-VDI-release-notes)

### Cisco WebEx

- IGEL OS Configuration (UMS based)

Create a Profile based on the [Cisco Webex VDI](https://app.igel.com/cisco_webex/) app.

![image043](Images/HOWTO-UCC-Guide12-043.png)
![image044](Images/HOWTO-UCC-Guide12-044.png)

- Citrix Desktop Configuration (XenApp and XenDesktop)

Install the right software at the backend infrastructure: 

Cisco WebEx

[Only 64-bit installer](https://help.webex.com/en-us/article/ntp1us7/Webex-App-%7C-VDI-release-notes#_ff8dd002-55da-4c64-a481-32a465c09fc1)

Next, install the Host Installer package, Webex.msi, in the VDI image. 
You can use the following commands to do this:

```bash linenums="1"
Persistent VDI: msiexec /i Webex.msi ALLUSERS=1 ENABLEVDI=2 AUTOUPGRADEENABLED=0 /quiet /norestart
Non-persistent VDI: msiexec /i Webex.msi ALLUSERS=1 ENABLEVDI=2 AUTOUPGRADEENABLED=0 ROAMINGENABLED=1 /quiet /norestart
```

**NOTE:** The most important setting is `ENABLEVDI=1`. If you just simply double-click the MSI this option is not used, and redirection will not work.

**NOTE:** To control the optimized VDI solution

| Argument | Notes |
|----------|-------|
| ENABLEVDI=1 | 1 enforces optimized VDI mode |
| ENABLEVDI=2 | 2 enables optimized VDI mode automatically with environment detection |

The other important setting is `ROAMINGENABLED=1` for non-persistent VDI. If this argument is specified, then the roaming database (the “spark_roaming_store.db” file) is stored in the end-user’s roaming directory (AppData\Roaming). Otherwise, the roaming database is stored in AppData\Local. This argument must be accompanied by `ALLUSERS=1`, otherwise the `ROAMINGENABLED` argument is ignored.

Users may be in a Citrix environment and not have the thin client installed or the virtual channel is disconnected. We support this scenario with fallback to a non-virtual Webex App installation. In this mode, the app shows a warning that the quality of video may be affected. Once the virtual channel is connected, the app can change to VDI mode. 

Use this table to understand the different installation combinations and how they affect media optimization for 
Unified CM, Webex Calling, and calls on Webex App.

|HVD VDI argument | Thin client plugin | Call service-enabled User | Calls on Webex App |
|-----------------|--------------------|---------------------------|---------------|
| ENABLEVDI=0 | Not installed | Media is not optimized | Media is not optimized |
| ENABLEVDI=0 | Installed | Media is not optimized | Media is not optimized |
| ENABLEVDI=1 * | Installed | Supported deployment; Media is optimized | Supported deployment; Media is optimized |
| ENABLEVDI=2 ** | Installed | Supported deployment; Media is optimized | Supported deployment; Media is optimized |
| ENABLEVDI=1 * | Not installed | Fallback to non-optimized media | Fallback to non-optimized media |

* This argument does not detect the VDI environment automatically.

** This argument detects the VDI environment automatically.

- Testing the solution

You can verify if the redirection is working by checking the Health Checker option in the Help menu. This option must show a connected status for the Virtual Channel. If you are missing a requirement, the Virtual Channel does not have connected status, or is not there at all.

[Deployment Guide for Cisco Webex for Virtual Desktop Infrastructure (VDI) - Deploy Webex for VDI [Support] - Cisco](https://www.cisco.com/c/en/us/td/docs/voice_ip_comm/cloudCollaboration/wbxt/vdi/wbx-teams-vdi-deployment-guide/wbx-teams-vdi-deployment_chapter_010.html)

- Management and troubleshooting around Cisco WebEx: 

[Deployment Guide for Cisco Webex for Virtual Desktop Infrastructure (VDI) - Manage and Troubleshoot Webex for VDI [Support] - Cisco](https://www.cisco.com/c/en/us/td/docs/voice_ip_comm/cloudCollaboration/wbxt/vdi/wbx-teams-vdi-deployment-guide/manage-teams-vdi.html)

- Attention:

In Citrix and Windows Virtual Desktop vGPU environments, Webex is not detected as working in a VDI environment.

These Windows registry entries on the HVDs are used to detect Webex in a VDI environment:

```bash linenums="1"
[HKEY_CURRENT_USER\Software\Cisco Systems, Inc.\CiscoVDI] "isVDIEnv" = "true", datatype:REG_EXPAND_SZ

[HKEY_LOCAL_MACHINE\SOFTWARE\Cisco Spark Native] "isVDIEnv" = "true", datatype:REG_EXPAND_SZ
```

WebEx only support one Webex VDI client working together with one instance of Webex. Users can start multiple Citrix or VMWare sessions, but only one connection instance works, and the other instances fall back to non-VDI mode.

- Important hint:

You want to use Cisco WebEx and Cisco Jabber in parallel? 

Unfortunately, it is not possible to use Cisco Jabber and Cisco WebEx in parallel with the same headset and / or webcam. But this does not mean, that you cannot use both apps for meetings. There is an easy to fulfill possibility directly mentioned by Cisco how your users can use Cisco Jabber at all (for Cisco WebEx conferences and for direct calls).

On this page you will find how you need to configure that: 

[CALLING - Webex with Jabber Cross Launch - Application Note](https://www.cisco.com/c/dam/en/us/td/docs/solutions/PA/mcp/APPLICATION_CALLING-Webex_with_Jabber_Cross_Launch.pdf)

### Microsoft Teams (and Skype for Business)

- IGEL Configuration (UMS based)

Create a Profile based on the [Citrix Workspace App](https://app.igel.com/cwa/).

![image044](Images/HOWTO-UCC-Guide12-044.png)

Microsoft Teams and Skype for Business optimization are enabled by default. HDX webcam parameters are listed in the Citrix general section. No further configuration is needed.

- Citrix Desktop Configuration (XenApp and XenDesktop)

The Citrix Workspace App (formerly Receiver) has an optimization that does not even exist in Windows 10 below Build 1909 and then falls back on the standard transmission, which has high performance impacts.

[What's new in Windows 10, version 1909 for IT Pros](https://docs.microsoft.com/en-us/windows/whats-new/whats-new-windows-10-version-1909)
 
Please install at least Version 20H2, you can get it here: [Windows 10, version 20H2](https://docs.microsoft.com/en-us/windows/release-health/status-windows-10-20h2)

HDX Realtime Optimization Pack: [HDX RealTime Optimization Pack 2.9 LTSR ](https://docs.citrix.com/en-us/hdx-optimization/current-release.html) that is only needed, if you want to use Skype for business 
 
Now you must start with installation of the right components:
 
Optimization for Microsoft Teams requires a minimum of Microsoft Teams version 1.3.00.28778. [Optimization for Microsoft Teams](https://docs.citrix.com/en-us/citrix-virtual-apps-desktops/multimedia/opt-ms-teams.html)

You need to open a lot of firewall ports to allow MS Teams to communicate with its cloud service: [Office 365 URLs and IP address ranges](https://learn.microsoft.com/en-us/microsoft-365/enterprise/urls-and-ip-address-ranges?view=o365-worldwide#skype-for-business-online-and-microsoft-teams)

Use the Office 365 online test to check if your network fulfills all the requirements to support Skype and/or Teams: [Microsoft 365 network connectivity test](https://connectivity.office.com/)

If you need help, here are the best list on open or known problems:
 
[Troubleshooting HDX Optimization for Microsoft Teams](https://support.citrix.com/article/CTX253754)

Check the Citrix Channel Allow List (with VDA 21.09 and higher) and activate this:

![image045](Images/HOWTO-UCC-Guide12-045.png)

How you can check if the Teams Optimization is working?

1.	Select your user profile image, then select About.
2.	Select Version.

If the media optimization is loaded correctly, you will see this banner: 

![image046](Images/HOWTO-UCC-Guide12-046.png)

Sometimes it is also helpful to do a connection check on the endpoint. Execute these lines inside a local terminal and you can check if the needed addresses and ports can be reached:

```bash linenums="1"
nc -u -v -z 13.107.64.21 3478-3481
nc -u -v -z 52.112.0.31 3478-3481
nc -u -v -z 52.120.0.41 3478-3481
nc -v -z teams.microsoft.com 80
nc -v -z teams.microsoft.com 443
nc -v -z compass-ssl.microsoft.com 443
nc -v -z mlccdnprod.azureedge.net 443
nc -v -z aka.ms 443
```

EPOS headset configuration for Skype for Business

Configuration needed for the standard function (= pick up softphone = connect):

```bash linenums="1"
DW Pro 1 / DW Pro 2 = DIP 4 Autolink ON 
SDW 5035 / 5065 = DIP 5 = up = Audio Quality Best
SDW 5035 / 5065 = DIP 2 = down = Autolink ON
```

Teams Call seems to crash after 20 seconds without connection

It may appear that calls are crashing after 20 seconds. But this is not the case.
In the general Teams configuration after 20 seconds a call will be forwarded to voicemail. So, it seems that the call was crashed before the connection was established. Sometimes if you use firewall and/or proxy configuration it is possible that the connection need more than 20 seconds. You can check this with a configuration change on the Teams App configuration:

![image047](Images/HOWTO-UCC-Guide12-047.png)

Change `Calls ring me` --> if unanswered --> Voicemail --> after 20 Seconds to `Do nothing`

[Also see HOWTO Microsoft Teams](https://igel-community.github.io/IGEL-Docs-v02/Docs/HOWTO-Microsoft-Teams-Optimization/)

### Zoom

- IGEL Configuration (UMS based)

Create a Profile based on the [Zoom Media Plugins for VDI](https://app.igel.com/zoomvdi/) app.

![image048](Images/HOWTO-UCC-Guide12-048.png)

You can select the use of Smart Virtual Background Supporthttps://app.igel.com/zoomvdi/

![image049](Images/HOWTO-UCC-Guide12-049.png)

- Citrix Desktop Configuration (XenApp and XenDesktop)

You need at least Citrix Desktops and App 7.15 CU4 or 1912 LTSR CU2 (CU4 for virtual backgrounds).

If you want to use a perfect Zoom experience on Citrix Desktop, you need the corresponding Zoom VDI build which fits to the plugin you have chosen in the UMS:

To be compatible, the plugin version must be equal to or less than the Zoom VDI application version. Installing a plugin with a version greater than the Zoom VDI application is not supported. Zoom always recommends updating the Zoom Plugin after updating the Zoom VDI application as many new features require an updated plugin.
 [VDI backwards compatibility](https://support.zoom.us/hc/en-us/articles/360041602711-VDI-backwards-compatibility)

**NOTE:** All VDI downloads are at the top of this guide

For Citrix XenDesktop or Citrix XenApp installation you should use at least these parameters:

msiexec /i ZoomInstallerVDI.msi ZNoDesktopShortCut="true" ZConfig="nogoogle=1" ZRecommend="AudioAutoAdjust=1" /norestart ALLUsers=1

[Mass-deploying with preconfigured settings for Windows] (https://support.zoom.us/hc/en-us/articles/201362163-Mass-Installation-and-Configuration-for-Windows)

**Note:** Zoom VDI is supported on Citrix XenDesktop and Citrix XenApp published desktop (not with published apps)

Troubleshooting:

[Microphone and video not working for Zoom meetings inside HDX session](https://support.citrix.com/article/CTX275259)

Zoom has a list of Registry Settings that can help you troubleshoot or control the client. Here is a list of all available registry keys: [VDI client registry settings](https://support.zoom.us/hc/en-us/articles/360032343371)

![image050](Images/HOWTO-UCC-Guide12-050.png)

### Citrix Browser Content Redirection for MS Teams, GoToMeeting

- IGEL OS Configuration (UMS based)

![image051](Images/HOWTO-UCC-Guide12-051.png)

If you need to use Browser Content Redirection with Proxy (on the VDA), you need to activate this option too:

![image052](Images/HOWTO-UCC-Guide12-052.png)

Client-side proxy configuration (and BCR is also possible), please follow the document below: 

[IGEL KB: Proxy Configuration](https://kb.igel.com/en/igel-os/current/proxy-1)

-  Citrix Desktop Configuration (XenApp and XenDesktop)

[Learn all what is needed on Citrix for BCR](https://docs.citrix.com/en-us/citrix-virtual-apps-desktops-service/multimedia/browser-content-redirection.html)

[Browser Content Redirection: whitelisting websites](https://support.citrix.com/article/CTX238236)

[Browser content redirection policy settings](https://docs.citrix.com/en-us/citrix-virtual-apps-desktops/policies/reference/ica-policy-settings/browser-content-redirection-policy-settings.html)

[How to Troubleshoot Browser Content Redirection](https://support.citrix.com/article/CTX230052)

[Please install Browser Redirection Extension v6.1](https://chrome.google.com/webstore/detail/browser-redirection-exten/hdppkjifljbdpckfajcmlblbchhledln?hl=en)

Product Documentation: 

[Browser content redirection policy settings](https://docs.citrix.com/en-us/citrix-virtual-apps-desktops/policies/reference/ica-policy-settings/browser-content-redirection-policy-settings.html)

[Browser content redirection](https://docs.citrix.com/en-us/citrix-virtual-apps-desktops/multimedia/browser-content-redirection.html)

What’s new in version 6.1

1) Revert to Chrome Extensions manifest v2 to circumvent a Chromium bug with manifest v3 extensions that causes high CPU utilization.

2) Supports redirection in inactive Chrome tabs (Requires CVAD 2112 or higher)

3) Supports migrating redirected tabs from one Chrome window to another (Requires CVAD 2112 or higher)
 
What’s new in version 5.1 (The following features require CVAD 2109 or higher)

1) Introduces an improved redirection mechanism that uses a page in the chrome extension to begin the redirection process and solves script injection timing issues 

2) Solves issues with redirection of websites enforcing a Content Security Policy (CSP) policy 

3) Solves issues with redirection of websites that perform JavaScript redirects to authentication page in their Single Sign On (SSO) mechanisms

4) Solves issues with redirection of websites that perform 302 redirects

5) Solves issues with acquisition of multimedia devices on the BCR overlay after webpage is redirected
 
What’s new in version 5.0 

1) Fixes high DPI and scaling issues on overlay and VDA

2) Fixes some issues with redirected Angular websites


Important information for Audio inside the Browser:

Here is a quick tip on how to correct sound issues occurring in a Citrix session running Google Chrome / Chromium or Microsoft Edge. Often when the user went to a website that had media (i.e., YouTube), the sound would be broken. No audio sound would play on the endpoint via ICA.

It seems that this is an issue with Google Chrome version 79 or later. The newest versions of Chrome have an Audio Sandbox feature enabled by default which breaks sound on Citrix Apps and Desktops. 

To resolve this issue, you can do one of three workarounds:

Edit the registry on the XenApp server (or XenDesktop Desktop):

```bash linenums="1"
HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome
reg:dword AudioSandboxEnabled = 0
```
For Chromium based Microsoft Edge users:

The same DWORD can be added to HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Edge
or editing the shortcut that launches Google Chrome to add the following arguments: `–disable-features=AudioServiceSandbox` or disable the feature using Group Policy. You can [download the Google Chrome ADMX templates](https://chromeenterprise.google/browser/download/#windows-tab). 

Then navigate to Google -> Google Chrome -> Allow the audio sandbox to run setting. `Set the option to Disabled`.

These workarounds will effectively disable the Audio Sandbox for Google Chrome on the Citrix VDI or Desktops Server.

[Citrix Browser Content Redirection](https://www.jgspiers.com/citrix-browser-content-redirection/)

- Configuration: YouTube with Citrix BCR

![image053](Images/HOWTO-UCC-Guide12-053.png)
![image054](Images/HOWTO-UCC-Guide12-054.png)

### Cisco JVDI on Citrix

- IGEL OS Configuration (UMS based)

Create a Profile based on the [Cisco Jabber VDI](https://app.igel.com/cisco_jvdi/) app.

![image055](Images/HOWTO-UCC-Guide12-055.png)

- Citrix Desktop Configuration (XenApp and XenDesktop)

Install the right software at the backend infrastructure: [Jabber Softphone for VDI - Windows](https://software.cisco.com/download/home/286304684/type/283802941/release/15.0(0))

[Deployment and Installation Guide for Cisco Jabber Softphone for VDI](https://www.cisco.com/c/en/us/td/docs/voice_ip_comm/jvdi/14_1/jvdi_b_deploy-install-jvdi-141.html)

Clients are available on this page: [Cisco Jabber VDI](https://www.webex.com/downloads/jabber/jabber-vdi.html)

**Note:** Only published desktops are supported (no published app support) 

Find out which Collaboration Accessories are recommended: [Unified Communications Endpoint and Client Accessories - Cisco](https://www.cisco.com/c/en/us/products/unified-communications/uc_endpoints_accessories.html)

**Important hint:** You want to use Cisco WebEx and Cisco Jabber in parallel? 

Unfortunately, it is not possible to use Cisco Jabber and Cisco WebEx in parallel with the same headset and / or webcam. But this does not mean, that you cannot use both apps for meetings. There is an easy to fulfill possibility directly mentioned by Cisco how your users can use Cisco Jabber at all (for Cisco WebEx conferences and for direct calls).

On this page you will find how you need to configure that: 
[Webex with Jabber Cross Launch Application Note](https://www.cisco.com/c/dam/en/us/td/docs/solutions/PA/mcp/APPLICATION_CALLING-Webex_with_Jabber_Cross_Launch.pdf)
 
**Important note**

Cisco is merging Jabber into WebEx 

[Transitioning from Jabber to Webex Deployment Guide](https://www.cisco.com/c/dam/en/us/td/docs/solutions/PA/mcp/DEPLOYMENT_CLIENTS_Jabber_to_Webex.pdf)

[Configure Users to Move Jabber Contacts and Common Settings to Webex App](https://help.webex.com/en-us/article/nyxlcde/Configure-Users-to-Move-Jabber-Contacts-and-Common-Settings-to-Webex-App)

- Additional information and Links for Troubleshooting on Citrix

[Microphone not working in session on Server 2019 VDA](https://support.citrix.com/article/CTX272452)

[Delivering Softphones with Virtual Apps and Desktops](https://support.citrix.com/article/CTX133024)

[Troubleshooting DTLS and EDT on Citrix Gateway](https://support.citrix.com/article/CTX226385)

[PoC Guide: Microsoft Teams optimization in Citrix Virtual Apps and Desktops environments](https://docs.citrix.com/en-us/tech-zone/learn/poc-guides/microsoft-teams-optimizations.html)

[How to Enable H.264 Hardware Encoding on 7.15 LTSR](https://support.citrix.com/article/CTX220731/how-to-enable-h264-hardware-encoding-with-intel-iris-pro-gpu-on-715-ltsr)

[Troubleshooting Citrix Workspace App for Linux](https://docs.citrix.com/en-us/citrix-workspace-app-for-linux/troubleshooting.html)

[Tech Paper: Communications Ports Used by Citrix Technologies](https://docs.citrix.com/en-us/tech-zone/build/tech-papers/citrix-communication-ports.html)

[Reference Architecture: Optimizing Unified Communications Solutions](https://docs.citrix.com/en-us/tech-zone/design/reference-architectures/optimizing-unified-communications-solutions.html)

-----

-----

## Omnissa Horizon on IGEL OS 12

Create a Profile based on the [Omnissa Horizon Client](https://app.igel.com/horizon/) app.

- Horizon Base configuration (RTAV optimized)

![image056](Images/HOWTO-UCC-Guide12-056.png)

if you need USB Redirection, please make sure, it is right configured:

![image057](Images/HOWTO-UCC-Guide12-057.png)
![image058](Images/HOWTO-UCC-Guide12-058.png)

### Cisco WebEx Meetings

- IGEL OS Configuration (UMS based)

Create a Profile based on the [Cisco Webex Meetings VDI](https://app.igel.com/cisco_meetings/) app.

![image059](Images/HOWTO-UCC-Guide12-059.png)

- Horizon VDI Configuration (Horizon 8.x)

Install the right software at the backend infrastructure:

**NOTE:** All VDI downloads are at the top of this guide

Installation notes for [Cisco Webex Meetings Virtual Desktop Software](https://help.webex.com/en-us/article/xcwws1/Release-notes-for-Webex-Meetings)

**Note:** Citrix XenDesktop and Citrix XenApp are supported (no published app support) 

Add the following values under HKEY_USERS\.DEFAULT:

![image060](Images/HOWTO-UCC-Guide12-060.png)

When you start Webex, it is only working with the redirection, if you can see the “VDI” sign here:

![image061](Images/HOWTO-UCC-Guide12-061.png)

Check if your site administrator allows to use [Cisco WebEx for VDI](https://help.webex.com/en-us/pyham7/Enable-Webex-Meetings-Virtual-Desktop-Software)

Check if you have the right Connection configuration:

[Test your WebEx Connection Configuration](https://mediatest.webex.com/)

[Open and Resolved Bugs for the Latest Webex Meetings Updates](https://help.webex.com/en-us/c3r7uf/Open-and-Resolved-Bugs-for-the-Latest-Webex-Meetings-Updates)

### Cisco WebEx

- IGEL OS Configuration (UMS based)

Create a Profile based on the [Cisco Webex VDI](https://app.igel.com/cisco_webex/) app.

![image062](Images/HOWTO-UCC-Guide12-062.png)

- Horizon VDI Configuration (Horizon 8.x)

Install the right software at the backend infrastructure: 

[Only 64-bit installer](https://help.webex.com/en-us/article/ntp1us7/Webex-App-%7C-VDI-release-notes)

Next, install the Host Installer package, Webex.msi, in the VDI image. 
You can use the following commands to do this:

Persistent VDI: `msiexec /i Webex.msi ALLUSERS=1 ENABLEVDI=2 AUTOUPGRADEENABLED=0 /quiet /norestart`

Non-persistent VDI: `msiexec /i Webex.msi ALLUSERS=1 ENABLEVDI=2 AUTOUPGRADEENABLED=0 ROAMINGENABLED=1 /quiet /norestart`

**Note:** The most important setting is ENABLEVDI=2. If you just simply double-click the MSI this option is not used, and redirection will not work.

**NOTE:** To control the optimized VDI solution

| Argument | Notes |
|----------|-------|
| ENABLEVDI=1 | 1 enforces optimized VDI mode |
| ENABLEVDI=2 | 2 enables optimized VDI mode automatically with environment detection |

**Note:** Use this table to understand the different installation combinations and how they affect media optimization for Unified CM, Webex Calling, and calls on Webex App. 

|HVD VDI argument | Thin client plugin | Call service-enabled User | Calls on Webex App |
|-----------------|--------------------|---------------------------|---------------|
| ENABLEVDI=0 | Not installed | Media is not optimized | Media is not optimized |
| ENABLEVDI=0 | Installed | Media is not optimized | Media is not optimized |
| ENABLEVDI=1 * | Installed | Supported deployment; Media is optimized | Supported deployment; Media is optimized |
| ENABLEVDI=2 ** | Installed | Supported deployment; Media is optimized | Supported deployment; Media is optimized |
| ENABLEVDI=1 * | Not installed | Fallback to non-optimized media | Fallback to non-optimized media |

* This argument does not detect the VDI environment automatically.

** This argument detects the VDI environment automatically.

The other important setting is `ROAMINGENABLED=1` for non-persistent VDI. If this argument is specified, then the roaming database (the “spark_roaming_store.db” file) is stored in the end-user’s roaming directory (AppData\Roaming). Otherwise, the roaming database is stored in AppData\Local. This argument must be accompanied by `ALLUSERS=1i`, otherwise the `ROAMINGENABLED` argument is ignored.

Testing the solution

You can verify if the redirection is working by checking the Health Checker option in the Help menu. This option must show a connected status for the Virtual Channel. If you are missing a requirement, the Virtual Channel does not have connected status, or is not there at all.

**Note:** Tests were done using a 2vCPU, 4GB memory Windows 10 virtual desktop with one other colleague in the WebEx Teams session. 

With VDI redirection enabled, we noticed the video was presented in a higher resolution and the sound was much clearer as opposed to not using redirection. 

Also noticed the CPU and memory usage dropped by 10% and 200MB when using redirection, this was of course because the video content was offloaded/redirected to the endpoint device.

[Deployment Guide for Cisco Webex for Virtual Desktop Infrastructure (VDI) - Deploy Webex for VDI](https://www.cisco.com/c/en/us/td/docs/voice_ip_comm/cloudCollaboration/wbxt/vdi/wbx-teams-vdi-deployment-guide/wbx-teams-vdi-deployment_chapter_010.html)

**Attention:**

In Horizon and Windows Virtual Desktop vGPU environments, Webex is not detected as working in a VDI environment.

These Windows registry entries on the HVDs are used to detect Webex in a VDI environment:

```bash linenums="1"
[HKEY_CURRENT_USER\Software\Cisco Systems, Inc.\CiscoVDI] “isVDIEnv” = “true”, datatype:REG_EXPAND_SZ

[HKEY_LOCAL_MACHINE\SOFTWARE\Cisco Spark Native] “isVDIEnv” = “true”, datatype:REG_EXPAND_SZ
```

WebEx only support one Webex VDI client working together with one instance of Webex. Users can start multiple Citrix or Horizon sessions, but only one connection instance works, and the other instances fall back to non-VDI mode.

Webex VDI detects Citrix at first and then Horizon in the HVD environment. If you want to use Horizon, make sure no Citrix Agent is installed. 

You can check if the connection is configured right:

![image063](Images/HOWTO-UCC-Guide12-063.png)
![image064](Images/HOWTO-UCC-Guide12-064.png)

### Microsoft Teams

- IGEL OS Configuration (UMS based)

Create a Profile based on the [Omnissa Horizon Client](https://app.igel.com/horizon/) app.

![image065](Images/HOWTO-UCC-Guide12-065.png)

IGEL OS 12 includes the right client software.

[TechZone Media Optimization for Microsoft Teams](https://techzone.omnissa.com/resource/microsoft-teams-optimization-horizon#overview)

[Media Optimization for Microsoft Teams](https://docs.omnissa.com/bundle/Horizon-Remote-Desktop-FeaturesV2309/page/MediaOptimizationforMicrosoftTeams.html)

- VMware VDI Configuration (Horizon 8.x)

Media Optimization for the new Microsoft Teams client is supported as part of Omnissa Horizon 8.4 (2111 and later). Horizon versions earlier than 8.4 have not been tested.

The Media Optimization for Microsoft Teams feature is also available with Horizon Cloud on Microsoft Azure, Pod Manifest version 2298.X and later.

The Media Optimization for Microsoft Teams group policy setting must be turned on in the virtual desktop for Horizon Agent 8.7 (2209) and earlier.

For Horizon Agent 8.8 (2212) and later, Media Optimization for Microsoft Teams is turned on by default when Horizon Agent is installed. 

![image066](Images/HOWTO-UCC-Guide12-066.png)

Please follow these steps to install Microsoft Teams for Omnissa Horizon:

The Optimization for Microsoft Teams configuration requires:

Microsoft Azure / 365 in backend: where the client would connect to establish the connection

Microsoft Teams Client (Optimized) 

Enough resource in virtual desktop: Minimum requirement is 2 vCPU

Network with IPv4, reachability of vDesktops and Horizon client to Microsoft 365

**The installation**

To make it work it require to do configuration in 2 locations:

In vDesktops Master Image

In AD Group Policy

**In vDesktops Master Image:**

Horizon Agent Installation and Configuration

During installation of Horizon Agent, the registry key shown below is automatically created and set to 1. This turns on Media Optimization by default.

“HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Omnissa\Horizon\WebRTCRedir” teamsEnabled (REG_DWORD)

Force Client Side WebRTC Optimization

On the Client, there is a setting Media Optimization for WebRTC based applications that controls if the client enables WebRTC optimization. By default, this setting is enabled.

Additionally, there is a group policy setting, Force client side WebRTC optimization, that can override this. By default, this group policy is not enabled. 

If the Force client side WebRTC optimization group policy setting is enabled, Microsoft Teams Media Optimization is forced on the endpoint, and any client setting or any other admin policy (for example, the Chrome-level user policy for the Chrome client) is ignored.

If the Force client side WebRTC optimization is unchecked, Windows endpoint users have the option to use or not use Microsoft Teams Optimization by configuring the Horizon Client setting called Media Optimization for WebRTC based applications. Also, any Chrome-level user policy would take effect.

![image067](Images/HOWTO-UCC-Guide12-067.png)

-Windows Desktop Installation

To install the new Teams app into a Horizon 8 Windows desktop golden image, use the teamsbootstrapper.exe utility provided by Microsoft for VDI environments.

At a high level, use the following steps:

Install the Teams Client

Disable Autoupdate

Install Teams Client

Download the bootstrapper.exe utility.

Download the Teams MSIX installation file.

Open a Command Prompt as an Administrator

Run the following command, modifying the path to match the location of where you downloaded the files to .\teamsbootstrapper.exe -p -o "c:\path\to\ MSTeams-x64.msix"

Replace C:\path\to\MSTeams-x64.msix with the actual path to the downloaded MSIX file.

Disable Autoupdate

To prevent new Teams client from auto updating, use the following registry key on the virtual machine.

Only new Team client builds higher than 23306.3314.2555.9628 in VDI can process this registry key.

Open regedit, and navigate to Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\. 

Right-click and create a New Key called Teams

Select the Teams key, right-click and add a new DWORD (32-bit) Value

Edit the new Value and change:

Value name = disableAutoUpdate

Value data = 1

-Windows Server Installation

As the Microsoft Store is not available on Server OS, the process to install the new Teams client is slightly different.

This uses DISM to install the client, which requires Microsoft Edge WebView2 to be installed and sideloading to non-store apps to be enabled.

At a high level, use the following steps:

Install Microsoft Edge WebView2

Enable Side-loading of Microsoft Store Apps

Install the Teams Client

Disable Autoupdate

Add Microsoft New Teams as a Hosted Application

Optional: Outlook Presence Integration with New Teams in Windows Server

Note: Horizon Agent version 2312.1 or later is required to support the publishing of a store app in Horizon.

Install Microsoft Edge WebView2

The Microsoft Edge WebView2 framework is required in Windows Server and Windows 10/11 Multi-User environments. The minimum version required is: 90.0.818.66.

Learn more: [Enterprise management of WebView2 Runtimes.](https://learn.microsoft.com/en-us/microsoft-edge/webview2/concepts/enterprise)

Download and install [Microsoft Edge WebView2](https://developer.microsoft.com/en-us/microsoft-edge/webview2/consumer/?form=MA13LH) as an Administrator.

Enable Side-loading of Microsoft Store Apps

As the Teams client is not being downloaded from the Microsoft store, we need to enable side-loading of store apps to be able to install it. If desired, this can be turned off again after installation is completed.

Open the Local Group Policy Editor (gpedit.msc) and navigate to:

Computer Configuration > Administrative Templates > Windows Components > App Package Deployment > Allow all trusted apps to install

Double-click to open the policy, select Enabled, and click OK.

![image068](Images/HOWTO-UCC-Guide12-068.png)

Install the Teams Client

Download the [Teams MSIX Installation file](https://go.microsoft.com/fwlink/?linkid=2196106)

Open a Command Prompt as an Administrator and run:

Dism /Online /Add-ProvisionedAppxPackage /PackagePath:"c:\path\to\ MSTeams-x64.msix" /SkipLicense

Replace C:\path\to\MSTeams-x64.msix with the actual path to the downloaded MSIX file.

After installing, you can verify the Teams client installation using the following command:

DISM /Online /Get-ProvisionedAppxPackages

Look through the output for an MSTeams entry to confirm it's correctly installed. Record the PackageName for reference.

Disable Autoupdate

To prevent new Teams client from auto updating, use the following registry key on the virtual machine. Only new Team client builds higher than 23306.3314.2555.9628 can process this registry key.

Open regedit, and navigate to Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\

Right-click and create a New Key called Teams

Select the Teams key, right-click and add a new DWORD (32-bit) Value

Edit the new Value and change:

Value name = disableAutoUpdate

Value data = 1

Add Microsoft New Teams as a Hosted Application

To configure Microsoft New Teams as a hosted (published) applications, a policy needs to be enabled that allows Microsoft Store Apps (also known as UWP) to be scanned and launched on RDSH farms (for operating system versions that supports Microsoft Store Applications).

When enabled, store apps can be used as Hosted Apps from RDSH farms.

Apply the following setting to the RDS host(s) with either a local group policy, or a domain group policy.

Be conscious that if your golden image is not domain joined, that a domain group policy will not be applied. In that case, apply this setting using the Local Group Policy Editor.

Extract the Group Policy template files available in the Horizon-Extras bundle and copy to the C:\Windows\PolicyDefinitions folder on either the golden image, or on a domain controller depending on what policy type you are using.

Depending on how you are applying the policy, open either the Local Group Policy Editor (gpedit.msc) or the domain Group Policy Management console, and navigate to:

Computer Configuration > Administrative Templates > View Agent Configuration > Unity Touch and Hosted Apps > Enable UWP support on RDSH platforms

Double-click to open the policy, select Enabled, and click OK.

![image069](Images/HOWTO-UCC-Guide12-069.png)

Restart the Horizon Agent service (wsnm) or restart RDSH server to have the GPO take effect.

The New Teams UWP app should now be available when publishing a new Application Pool in the Horizon Administrator Console, using the Add from Installed Applications selection.

Outlook Presence Integration with New Teams in Windows Server (Optional)

For Outlook to properly display presence status, the steps outlined in the [Microsoft documentation](https://learn.microsoft.com/en-us/microsoftteams/new-teams-vdi-requirements-deploy#outlook-presence-integration-with-new-teams-in-windows-server-2019)are required on the golden image.

**Troubleshooting**

[Omnissa article for Troubleshooting MS Teams Optimization](https://techzone.omnissa.com/resource/microsoft-teams-optimization-horizon#troubleshooting)

Sometimes it is also helpful to do a connection check on the endpoint. Execute these lines inside a local terminal and you can check if the needed addresses and ports can be reached:

```bash linenums="1"
nc -u -v -z 13.107.64.21 3478-3481
nc -u -v -z 52.112.0.31 3478-3481
nc -u -v -z 52.120.0.41 3478-3481
nc -v -z teams.microsoft.com 80
nc -v -z teams.microsoft.com 443
nc -v -z compass-ssl.microsoft.com 443
nc -v -z mlccdnprod.azureedge.net 443
nc -v -z aka.ms 443
```

How you can check if the Teams Optimization is working?

1.	Select your user profile image, then select About.
2.	Select Version.

If the media optimization is loaded correctly, you will see this banner: 

![image070](Images/HOWTO-UCC-Guide12-070.png)

**EPOS headset configuration for Teams and Skype for Business:**

Configuration needed for the standard function (= pick up softphone = connect):

```bash linenums="1"
DW Pro 1 / DW Pro 2 = DIP 4 Autolink ON 
SDW 5035 / 5065 = DIP 5 = up = Audio Quality Best
SDW 5035 / 5065 = DIP 2 = down = Autolink ON
```

**Teams Call seems to crash after 20 seconds without connection**

It may appear that calls are crashing after 20 seconds. But this is not the case.
In the general Teams configuration after 20 seconds a call will be forwarded to voicemail. So, it seems that the call was crashed before the connection was established. Sometimes if you use firewall and/or proxy configuration it is possible that the connection need more than 20 seconds. You can check this with a configuration change on the Teams App configuration:

![image071](Images/HOWTO-UCC-Guide12-071.png)

Change `Calls ring me` --> if unanswered --> Voicemail --> after 20 Seconds to `Do nothing`

[Also see HOWTO Microsoft Teams](https://igel-community.github.io/IGEL-Docs-v02/Docs/HOWTO-Microsoft-Teams-Optimization/)

### Zoom

- IGEL OS Configuration (UMS based)

Create a Profile based on the [Zoom Media Plugins for VDI](https://app.igel.com/zoomvdi/) app.

![image072](Images/HOWTO-UCC-Guide12-072.png)

You can select the use of Smart Virtual Background Support:

![image073](Images/HOWTO-UCC-Guide12-073.png)

- VMware VDI Configuration (Horizon 8.x)

If you want to use a perfect Zoom experience on VMware Horizon, you need the corresponding Zoom VDI build which fits to the plugin you have chosen in the UMS:

**Note:** To be compatible, the plugin version must be equal to or less than the Zoom VDI application version. Installing a plugin with a version greater than the Zoom VDI application is not supported. Zoom always recommends updating the Zoom Plugin after updating the Zoom VDI application as many new features require an updated plugin. [VDI backwards compatibility](https://support.zoom.us/hc/en-us/articles/360041602711-VDI-backwards-compatibility)

All VDI Downloads are located here: [VDI releases and downloads – Zoom Support](https://support.zoom.com/hc/en/article?id=zm_kb&sysparm_article=KB0063810)

**NOTE:** All VDI downloads are at the top of this guide

For VMware Horizon 7.x and 8.x installation you should use these parameters:

```bash linenums="1"
msiexec /i C:\yourfolder\ZoomInstallerVDI.msi ZNoDesktopShortCut="true" ZConfig="nogoogle=1" ZRecommend="AudioAutoAdjust=1" /quiet /qn /norestart ALLUsers=1
```

[Mass-deploying with preconfigured settings for Windows](https://support.zoom.us/hc/en-us/articles/201362163-Mass-Installation-and-Configuration-for-Windows)

If you have an audio problem with Zoom on VMware Horizon, [Audio distortion when using Zoom meeting in Horizon remote desktop session (78481)](https://kb.omnissa.com/s/article/78481?lang=en_US)

### VMware Horizon Browser Content Redirection with HTML5

- IGEL OS Configuration (UMS based)

Create a Profile based on the [Omnissa Horizon Client](https://app.igel.com/horizon/) app.

![image074](Images/HOWTO-UCC-Guide12-074.png)

- VMware VDI Configuration (Horizon 7.x and 8.x)

VDI or RDSH images must have at least the Horizon Agent 7.10 with HTML5 option. This option is included by default.

The HTML5 Multimedia Redirection GPO settings must be configured on the Active Directory server.

The Chrome or Edge browser must be installed in the VDI or RDSH image.

The VMware Horizon HTML5 Multimedia Redirection extension must be installed in the Chrome or Edge browser.

The BLAST (Extreme) or PCoIP protocols must be used.

Redirecting HTML5 multimedia content from a VDI or RDSH session to the local client system requires installing the HTML5 Multimedia Redirection feature and the Chrome or Edge browser within the VDI or RDSH image, enabling the HTML5 Multimedia Redirection plug-in, and specifying which websites will use this feature.

Assuming you already copied the `vdm_agent.admx` file (which is part of the [VMware Horizon GPO bundle](https://docs.omnissa.com/bundle/Horizon-Remote-Desktop-FeaturesV2309/page/ADMXTemplateFiles.html) in the SYSVOL folder of your Active Directory server, you can go ahead and configure the required VMware Horizon settings.

When creating the GPO, navigate to `Computer Configuration > Policies > Administrative Templates > VMware View Agent Configuration > VMware HTML5 Features`

Enable the following settings:

1) Enable VMware HTML5 Multimedia Redirection

2) Enable Chrome and/or Edge Browser HTML5 Multimedia Redirection

3) Enable the URL list and fill in the value name, for example: `https://www.youtube.com/*` and do not fill in any value (leave this empty). It is important to include the http:// or https:// prefix in the URLs. You can use wildcards.

![image075](Images/HOWTO-UCC-Guide12-075.png)
![image076](Images/HOWTO-UCC-Guide12-076.png)

For the Chrome and Edge browsers, you can opt to automatically manage and activate the HTML5 Multimedia Redirection plug-in for the end-users by configuring the following GPO settings. For Chrome, download the Chrome .admx file and copy this to the SYSVOL folder of the Active Directory server.

When creating the GPO, go to `User or Computer Configuration > Policies > Administrative Templates > Google > Google Chrome > Extensions`

Enable the setting “Configure the list of force-installed apps and extensions” and fill in the following line:

`ljmaegmnepbgjekghdfkgegbckolmcok;https://clients2.google.com/service/update2/crx`

![image077](Images/HOWTO-UCC-Guide12-077.png)
![image078](Images/HOWTO-UCC-Guide12-078.png)

**Note:** Since this can also be set on the user level, this setting can of course also be done with a User Environment Manager tool, such as Omnissa Dynamic Environment Manager.

![image079](Images/HOWTO-UCC-Guide12-079.png)

To automatically enable the Edge browser plugin, please follow [Horizon Release Notes](https://docs.omnissa.com/bundle/horizon8-rnV2412/page/Horizon8-ReleaseNotes.html)

If you have met all the requirements, it is time to test if the configuration is working! Within the VDI or RDSH session, launch the Chrome or Edge browser, and look for the VMware Horizon HTML5 Redirection Extension icon in the right-upper corner.

![image080](Images/HOWTO-UCC-Guide12-080.png)
![image081](Images/HOWTO-UCC-Guide12-081.png)

Note to the following:

1) The icon must be green. Only then the plug-in is active and ready for use.

2) If the icon is grey, then you have not met one of the requirements. For example, the Horizon Agent install parameter or Horizon Client version.

Here is a quick tip on how to correct sound issues occurring in a VMware Horizon session running Google Chrome / Chromium or Microsoft Edge. It is possible, that inside a virtual desktop that had Google Chrome in it, when a user went to a website that had media (i.e., YouTube), the sound would be broken. No audio sound would play on the endpoint.

It seems that this is an issue with Google Chrome version 79 or later. The newest versions of Chrome have an Audio Sandbox feature enabled by default which breaks sound on VMware Horizon. To resolve this issue, you can do one of three workarounds:

Edit the registry on Horizon Desktop:

```bash linenums="1"
HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome
reg:dword AudioSandboxEnabled = 0
```

**For Chromium based Microsoft Edge users**

The same DWORD can be added to HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Edge or editing the shortcut that launches Google Chrome to add the following arguments:

```bash linenums="1"
"–disable-features=AudioServiceSandbox"
```

or disable the feature using Group Policy. You can [download the Google Chrome ADMX templates](https://cloud.google.com/chrome-enterprise/browser/download/). 

Then navigate to Google -> Google Chrome -> Allow the audio sandbox to run setting. `Set the option to Disabled`.

These workarounds will effectively disable the Audio Sandbox for Google Chrome in the VDI.

[Additional policy settings](https://docs.omnissa.com/bundle/Horizon-Remote-Desktop-FeaturesV2312/page/HTML5FeaturePolicySettings.html)

**Note:** If CPU usage is above the default threshold of 85, the sent video resolution is reduced, which will lower client CPU usage. Activates the "Configure CPU overuse threshold" policy with a value less than 85 to reduce client CPU during video calls.

To use the default threshold of 85, deactivate or do not configure this policy. If you do not want to detect CPU overuse, activate this policy with a value of 0. This setting takes effect at the next logon.

**VIDEO TEST**

For this test following VM was used:

1) Windows 10, build 1803 VDI

2) Horizon Agent 7.10

3) Specs: 2vCPU, 4GB Memory

Let us first play a FULL HD (1080p) video without HTLM5 Redirection. We immediately see the CPU spiking to 100%. Furthermore, the image and audio quality are quite poor. Bandwidth consumption is around 200Kbps and 8Mbps, using BLAST Extreme.

![image082](Images/HOWTO-UCC-Guide12-082.png)

Let us launch the same demo video (also in 1080p) with HTLM5 Redirection. We immediately notice the plugin icon changing with the addition of the blue “REDR” letters. This means redirection is fully operational. We notice the image and quality levels are excellent!

![image083](Images/HOWTO-UCC-Guide12-083.png)

When you look at the CPU resources, the CPU will stay around 20-40%.

![image084](Images/HOWTO-UCC-Guide12-084.png)

The bandwidth consumption is the same as playing the video without HTML5 Redirection, around 200Kbps and 8Mbps using Blast Extreme.

![image085](Images/HOWTO-UCC-Guide12-085.png)

Even when using a 1vCPU, 2GB Memory Windows 7 VDI, we notice a great multimedia experience!! With only about 40-60% CPU consumption.

![image086](Images/HOWTO-UCC-Guide12-086.png)

### Cisco JVDI on VMware Horizon

- IGEL OS Configuration (UMS based)

Create a Profile based on the [Cisco Jabber VDI](https://app.igel.com/cisco_jvdi/) app.

![image087](Images/HOWTO-UCC-Guide12-087.png)

- VMware Horizon 8.x

Install the right software at the backend infrastructure [Jabber Softphone for VDI - Windows](https://software.cisco.com/download/home/286304684/type/283802941/release/15.0(0))

How to install: [Deployment and Installation Guide for Cisco Jabber Softphone for VDI Release](https://www.cisco.com/c/en/us/td/docs/voice_ip_comm/jvdi/14_1/jvdi_b_deploy-install-jvdi-141.pdf)

all clients are available on this page [Cisco Jabber VDI](https://www.webex.com/downloads/jabber/jabber-vdi.html)

**Important hint:**

You want to use Cisco WebEx and Cisco Jabber in parallel? 

Unfortunately, it is not possible to use Cisco Jabber and Cisco WebEx in parallel with the same headset and / or webcam. But this does not mean, that you cannot use both apps for meetings. There is an easy to fulfill possibility directly mentioned by Cisco how your users can use Cisco Jabber at all (for Cisco WebEx conferences and for direct calls).

On this page you will find how you need to configure that: [Webex with Jabber Cross Launch Application Note](https://www.cisco.com/c/dam/en/us/td/docs/solutions/PA/mcp/APPLICATION_CALLING-Webex_with_Jabber_Cross_Launch.pdf)

 **Important note** Cisco is merging Jabber into WebEx 

Deployment Guide for this merge: [Transitioning from Jabber to Webex Deployment Guide](https://www.cisco.com/c/dam/en/us/td/docs/solutions/PA/mcp/DEPLOYMENT_CLIENTS_Jabber_to_Webex.pdf)

There is also another document which describes how you merge all your contacts and configurations from Jabber to WebEx: [Configure Users to Move Jabber Contacts and Common Settings to Webex App](https://help.webex.com/en-us/article/nyxlcde/Configure-Users-to-Move-Jabber-Contacts-and-Common-Settings-to-Webex-App)

-----

-----

## Azure Virtual Desktop (AVD) on IGEL OS 12

There is a good feature included in the AVD registry: Create a Profile based on the [IGEL Azure Virtual Desktop](https://app.igel.com/avd/) app.

![image088](Images/HOWTO-UCC-Guide12-088.png)

Learn more about that on Microsoft Learn: [RDP Shortpath for Azure Virtual Desktop](https://learn.microsoft.com/en-us/azure/virtual-desktop/rdp-shortpath?tabs=managed-networks)

### Cisco WebEx Meetings

Unfortunately, currently no Client Plugin for IGEL OS is available

### Cisco WebEx Teams

Create a Profile based on the [Cisco Webex VDI](https://app.igel.com/cisco_webex/) app.

![image089](Images/HOWTO-UCC-Guide12-089.png)

Install the right software at the backend infrastructure: 

[Only 64-bit installer](https://help.webex.com/en-us/article/ntp1us7/Webex-App-%7C-VDI-release-notes)

Next, install the Host Installer package, Webex.msi, in the VDI image. 
You can use the following commands to do this:

Persistent VDI: `msiexec /i Webex.msi ALLUSERS=1 ENABLEVDI=2 AUTOUPGRADEENABLED=0 /quiet /norestart`

Non-persistent VDI: `msiexec /i Webex.msi ALLUSERS=1 ENABLEVDI=2 AUTOUPGRADEENABLED=0 ROAMINGENABLED=1 /quiet /norestart`

**Note:** The most important setting is ENABLEVDI=2. If you just simply double-click the MSI this option is not used, and redirection will not work.

**NOTE:** To control the optimized VDI solution

| Argument | Notes |
|----------|-------|
| ENABLEVDI=1 | 1 enforces optimized VDI mode |
| ENABLEVDI=2 | 2 enables optimized VDI mode automatically with environment detection |

**Note:** Use this table to understand the different installation combinations and how they affect media optimization for Unified CM, Webex Calling, and calls on Webex App. 

|HVD VDI argument | Thin client plugin | Call service-enabled User | Calls on Webex App |
|-----------------|--------------------|---------------------------|---------------|
| ENABLEVDI=0 | Not installed | Media is not optimized | Media is not optimized |
| ENABLEVDI=0 | Installed | Media is not optimized | Media is not optimized |
| ENABLEVDI=1 * | Installed | Supported deployment; Media is optimized | Supported deployment; Media is optimized |
| ENABLEVDI=2 ** | Installed | Supported deployment; Media is optimized | Supported deployment; Media is optimized |
| ENABLEVDI=1 * | Not installed | Fallback to non-optimized media | Fallback to non-optimized media |

* This argument does not detect the VDI environment automatically.

** This argument detects the VDI environment automatically.

The other important setting is `ROAMINGENABLED=1` for non-persistent VDI. If this argument is specified, then the roaming database (the “spark_roaming_store.db” file) is stored in the end-user’s roaming directory (AppData\Roaming). Otherwise, the roaming database is stored in AppData\Local. This argument must be accompanied by `ALLUSERS=1i`, otherwise the `ROAMINGENABLED` argument is ignored.

Testing the solution

You can verify if the redirection is working by checking the Health Checker option in the Help menu. This option must show a connected status for the Virtual Channel. If you are missing a requirement, the Virtual Channel does not have connected status, or is not there at all.

**Note:** Tests were done using a 2vCPU, 4GB memory Windows 10 virtual desktop with one other colleague in the WebEx Teams session. 

With VDI redirection enabled, we noticed the video was presented in a higher resolution and the sound was much clearer as opposed to not using redirection. 

Also noticed the CPU and memory usage dropped by 10% and 200MB when using redirection, this was of course because the video content was offloaded/redirected to the endpoint device.

[Deployment Guide for Cisco Webex for Virtual Desktop Infrastructure (VDI) - Deploy Webex for VDI](https://www.cisco.com/c/en/us/td/docs/voice_ip_comm/cloudCollaboration/wbxt/vdi/wbx-teams-vdi-deployment-guide/wbx-teams-vdi-deployment_chapter_010.html)

### Microsoft Teams

- IGEL OS Configuration (UMS based)

Both classic and New Teams Optimization is included. Just use a profile with AVD activated – there is no need to activate Teams optimization, it is still activated at all.

NOTE:: Until Microsoft releases SlimCore for Linux, WebRTC optimization must not be disabled using the VDI Partner's policy engine

 - - - AVD Configuration

Before you can use Microsoft Teams on Azure Virtual Desktop, you'll need to do these things:

1) Prepare your network for Microsoft Teams.

2) Connect to a Windows 10 or 11 Multi-session or Windows 10 or 11 Enterprise virtual machine (VM).

**Install the Teams desktop app**

This section will show you how to install the Teams desktop app on your Windows 10 or 11 Multi-session or Windows 10 or 11 Enterprise VM image. To learn more, check out Install or update the Teams desktop app on VDI.

**Prepare your image for Teams**

To enable media optimization for Teams, set the following registry key on the host VM:

1) From the start menu, run RegEdit as an administrator. Navigate to HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Teams. Create the Teams key if it doesn't already exist.

2) Create the following value for the Teams key:

![image090](Images/HOWTO-UCC-Guide12-090.png)

**Install the Teams WebSocket Service**

Install the latest version of the [Remote Desktop WebRTC Redirector Service](https://aka.ms/msrdcwebrtcsvc/msi) on your VM image. If you encounter an installation error, install the latest [Microsoft Visual C++ Redistributable](https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist?view=msvc-170) and try again.

**Latest WebSocket Service versions**

The following table lists the latest versions of the WebSocket Service:

| Version | Release date |
|---------|--------------|
| 1.54.2408.19001 | 08/21/2024 |
| 1.54.2407.26001 | 07/29/2024 |
| 1.50.2402.29001 | 03/25/2024 |
| 1.45.2310.13001 | 11/15/2023 |
| 1.43.2306.30001 | 09/07/2023 |
| 1.33.2302.07001 |	03/01/2023 |

**Install Microsoft Teams**

![image091](Images/HOWTO-UCC-Guide12-091.png)

Recommended way to deploy Teams in VDI. The direct or 'bulk deployment' method is used for this option. Learn more at [Bulk Deployment of the Teams desktop client](https://learn.microsoft.com/en-us/microsoftteams/teams-client-bulk-install).

Using the teamsbootstrapper.exe -p command always guarantees the latest Teams client is installed.

A phased and controlled rollout can then be achieved by selectively expanding the new computer catalogue/delivery group assignments to more users.

Admins can also use a local teams MSIX to provision Teams. This option minimizes the amount of bandwidth used for the initial installation. The MSIX can exist in a local path or UNC.

[Download the .exe installer](https://go.microsoft.com/fwlink/?linkid=2243204&clcid=0x409)

Download the MSIX:
- [MSIX x86](https://go.microsoft.com/fwlink/?linkid=2196060&clcid=0x409)
- [MSIX x64](https://go.microsoft.com/fwlink/?linkid=2196106)

Open the Command Prompt as an Admin.

Depending on where your MSIX is located, do the following steps:

For local path, enter: .\teamsbootstrapper.exe -p -o "c:\path\to\teams.msix"

Example:

![image092](Images/HOWTO-UCC-Guide12-092.png)

For UNC, enter: .\teamsbootstrapper.exe -p -o "\unc\path\to\teams.msix"

Example:

![image093](Images/HOWTO-UCC-Guide12-093.png)

Teamsbootstrapper.exe logs are located in C:\WINDOWS\Temp\teamsprovision.log.xxxxxxxx.

For Windows Server 2019, the only supported installation method is:

Dism /Online /Add-ProvisionedAppxPackage /PackagePath:<MSIX package path> /SkipLicense

Make sure sideloading is enabled, and that WebView2 is installed. 

The /SkipLicense command is needed because the MSIX package isn't considered a "Store Package" (since it wasn't downloaded from the store). Therefore, for the Dism installation command to succeed, you need to enable this policy as well during installation time: Computer Configuration > Administrative Templates > Windows Components > App Package Deployment > Allow all trusted apps to install.

 Important

AllowAllTrustedApps must be enabled after the Teams package is successfully staged in the golden image. Otherwise, the registration of the package to each user (which happens only on login) fails and users aren't able to launch the app.

Known limitations:

If you're using FSLogix as the Profile Manager solution, Teams on Windows Server 2019 needs FSLogix 2210 HotFix 4 or higher (Microsoft recommends the latest available version).

**Verify media optimizations loaded**

After installing the WebSocket Service and the Teams desktop app, follow these steps to verify that Teams media optimizations loaded:

1. Quit and restart the Teams application.
2. Select your user profile image, then select About.
3. Select Version.

If the media optimization is loaded correctly, you will see this banner:

![image094](Images/HOWTO-UCC-Guide12-094.png)

[Also see HOWTO Microsoft Teams](https://igel-community.github.io/IGEL-Docs-v02/Docs/HOWTO-Microsoft-Teams-Optimization/)

### Zoom

- IGEL OS Configuration (UMS based)

Create a Profile based on the [Zoom Media Plugins for VDI](https://app.igel.com/zoomvdi/) app.

![image095](Images/HOWTO-UCC-Guide12-095.png)

You can enable Smart Virtual Backgrounds

![image096](Images/HOWTO-UCC-Guide12-096.png)

- AVD Configuration

![image097](Images/HOWTO-UCC-Guide-097.png)

If you want to use a perfect Zoom experience on Azure Virtual Desktop, you need the corresponding Zoom VDI build which fits to the plugin you have chosen in the UMS:

To be compatible, the plugin version must be equal to or less than the Zoom VDI application version. Installing a plugin with a version greater than the Zoom VDI application is not supported. Zoom always recommends updating the Zoom Plugin after updating the Zoom VDI application as many new features require an updated plugin. [VDI backwards compatibility](https://support.zoom.us/hc/en-us/articles/360041602711-VDI-backwards-compatibility)

All VDI Downloads are located here: [VDI Releases and downloads](https://support.zoom.com/hc/en/article?id=zm_kb&sysparm_article=KB0063810)

**NOTE:** All VDI downloads are at the top of this guide

For AVD installation you should use these parameters:

```bash linenums="1"
msiexec /i C:\yourfolder\ZoomInstallerVDI.msi ZNoDesktopShortCut="true" ZConfig="nogoogle=1" ZRecommend="AudioAutoAdjust=1" /quiet /qn /norestart ALLUsers=1
```

[Mass-deploying with preconfigured settings for Windows](https://support.zoom.us/hc/en-us/articles/201362163-Mass-Installation-and-Configuration-for-Windows)

After installation you should be able to start the Zoom VDI app:

![image098](Images/HOWTO-UCC-Guide-098.png)

**Results**

Looking at the processes running on the AVD Desktop, we can see that Zoom is using pretty much zero resources:

![image099](Images/HOWTO-UCC-Guide-099.png)

-----

-----

## Microsoft Windows 365 on IGEL OS 12 

### Cisco Webex

- IGEL OS Configuration (UMS based)

Install the Cisco Webex HVD client on the Cloud PC

Have the user sign in to the Cloud PC as a local administrator and, in their browser, navigate to the [Webex VDI Download page](https://www.webex.com/downloads/teams-vdi.html)

In Release date column of the table, find the most recent date (for example, 12/14/2021).

Select the appropriate link for your Windows system (32-bit or 64-bit) to download the MSI.

You must set some required switches to install the VDI components. So, to run the MSI, open an elevated command prompt and run the following install command. Replace the path and MSI filename with the correct path and filename that you downloaded. msiexec /i %path%\Webex.msi ALLUSERS=1 ENABLEVDI=1 AUTOUPGRADEENABLED=0

To complete the MSI installer, follow the installation instructions.

Alternatively, the admin can deploy the Cisco Webex VDI client. For more information about deploying apps, see the [Win32 App Management guide](https://learn.microsoft.com/en-us/mem/intune/apps/apps-win32-app-management)

Create a Profile based on the [Cisco Webex VDI](https://app.igel.com/cisco_webex/) app.

![image0100](Images/HOWTO-UCC-Guide12-100.png)

To confirm that the Cisco Webex client is using the optimizations

Sign in to the Cloud PC from the Windows client.

Open the Cisco Webex client and sign in using your Cisco Webex credentials.

Select your user profile icon > Help > Health Checker.

The VDI section of the Health Checker shows the status of the optimizations.

For more information see [Optimize Cisco Webex on a Windows 365 Cloud PC](https://learn.microsoft.com/en-us/windows-365/enterprise/cisco-webex-support)

### Zoom

Install the Zoom VDI client on the Cloud PC

Have the user sign in to the Cloud PC as a local administrator and, in their browser, navigate to the [Zoom VDI Downloads and Backward Compatibility](https://support.zoom.us/hc/en-us/articles/360041602711) app.

Locate and download the most recent VDI client version.

Run the MSI and follow the installation instructions.

Alternatively, the admin can deploy the Zoom VDI client. For more information about deploying apps, see the [Win32 App Management guide](https://learn.microsoft.com/en-us/mem/intune/apps/apps-win32-app-management)

Create a Profile based on the [Zoom Plugins for VDI](https://app.igel.com/zoomvdi/) app.

![image0101](Images/HOWTO-UCC-Guide12-101.png)

For more information see [Optimize Zoom on a Windows 365 Cloud PC](https://learn.microsoft.com/en-us/windows-365/enterprise/zoom-support)

### Teams

NOTE:: Until Microsoft releases SlimCore for Linux, WebRTC optimization must not be disabled using the VDI Partner's policy engine

Before you can use Microsoft Teams on Windows 365, you'll need to do these things:

1) Prepare your network for Microsoft Teams.

2) Connect to a Windows 10 or 11 image in the gallery. They are preconfigured with the Teams optimization components.

**Prepare your image for Teams**

To enable media optimization for Teams, verify the following registry key on the Cloud PC:

1) From the start menu, run RegEdit as an administrator. Navigate to HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Teams. Create the Teams key if it doesn't already exist.

2) Create the following value for the Teams key:

![image0102](Images/HOWTO-UCC-Guide12-102.png)

**Install the Teams WebSocket Service**

Install the latest version of the [Remote Desktop WebRTC Redirector Service](https://aka.ms/msrdcwebrtcsvc/msi) on your gallery image (if needed). If you encounter an installation error, install the latest [Microsoft Visual C++ Redistributable](https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist?view=msvc-170) and try again.

**Latest WebSocket Service versions**

The following table lists the latest versions of the WebSocket Service:

| Version | Release date |
|---------|--------------|
| 1.54.2408.19001 | 08/21/2024 |
| 1.54.2407.26001 | 07/29/2024 |
| 1.50.2402.29001 | 03/25/2024 |
| 1.45.2310.13001 | 11/15/2023 |
| 1.43.2306.30001 | 09/07/2023 |
| 1.33.2302.07001 |	03/01/2023 |

[Also see HOWTO Microsoft Teams](https://igel-community.github.io/IGEL-Docs-v02/Docs/HOWTO-Microsoft-Teams-Optimization/)

## Microsoft Remote Desktop (RDSH, RDP) on IGEL OS 12 

- IGEL OS Configuration (UMS based)

Create a Profile based on the [IGEL Remote Desktop](https://app.igel.com/rdp/) app.

![image103](Images/HOWTO-UCC-Guide12-103.png)

- 6.1.2.	Windows 10, Windows Server 2016, 2019 and 2022 Base Configuration

**Applied Audio settings via GPO:**

`Computer Config > Admin Templates > Windows Components > Remote Desktop Services > Remote Desktop Session Host> Device and Resource Redirection`

Changed `Allow audio and video playback redirectioni` from `Not Configured`` to `Enabled`

Changed `Allow audio recording redirection` from `Not Configured` to `Enabled`

**Computer Config > Admin Templates > Windows Components > App Privacy**

Changed `Let Windows apps access the microphone` from `Not Configured` to `Enabled``

`Options > Default for all apps` changed from `User is in control1cl` to `Force Allow`

Changed `Let Windows apps access the camera` from `Not Configured` to `Enabled`

`Options > Default for all apps` changed from `User is in control` to `Force Allow`

**Computer Config > Admin Templates > Windows Components > Camera**

Changed `Let Allow use of Camera` from `Not Configured` to `Enabled`

![image106](Images/HOWTO-UCC-Guide12-106.png)
![image107](Images/HOWTO-UCC-Guide12-107.png)

- Cisco WebEx Meetings

Unfortunately, currently no Client Plugin for IGEL OS is available

- Cisco WebEx Teams

Create a Profile based on the [Cisco Webex VDI](https://app.igel.com/cisco_webex/) app.

![image108](Images/HOWTO-UCC-Guide12-108.png)


- Microsoft Teams

Unfortunately, currently no Client Plugin for IGEL OS is available

- Zoom

Create a Profile based on the [Zoom Plugins for VDI](https://app.igel.com/zoomvdi/) app.

![image109](Images/HOWTO-UCC-Guide12-109.png)
