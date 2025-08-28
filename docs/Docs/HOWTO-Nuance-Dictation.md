# HOWTO Nuance Dictation

## [Nuance Compatibility with Citrix](https://kb.igel.com/en/igel-os/current/nuance-compatibility)

## [Dragon Medical One Desktop Application 2023.4](https://isupportcontent.nuance.com/healthcare/documents/relnotes/direct/SOD_RELEASE_NOTES_2023.4_US.htm)

## USB Devices and UCC

In general, USB redirection is not needed for standard functionality such as audio, video, HID input, etc. However, in some special circumstances, a device may need to be redirected into a VDI session for full functionality, or if it requires a specific driver to function.
 
[When to use USB Redirection](https://kb.igel.com/en/igel-os/current/when-to-use-usb-redirection)

- Citrix made a change in CWAL 2405 that affects USB redirection. In order to support the new method, Citrix Virtual Apps and Desktops 2206 or later is needed. Then the following Citrix policies must be configured and enabled.

    - Allow Existing USB Devices to automatically be connected: `Automatically redirect all available USB Devices`
    - Allow Newly Arrived USB Devices to be automatically connected: `Automatically redirect all available USB Devices`
    - Client USB Redirection Rules: `Allowed`

![image32](Images/HOWTO-Nuance-Dictation-32.png)

-----

-----

## USB Redirection - Class and Device Rules

### Class Rules

| Rule | Family | Name |
|------|--------|------|
| Deny | Audio (input) | Deny Audio Input |
| Deny | Audio | Deny Audio Output |
| Deny | Audio | Deny Audio |

### Device Rules

| Rule | Vendor ID | Product ID | Interface Exclude List | Device Quirk | Name |
|------|-----------|------------|------------------------|--------------|------|
| Allow | 0554 | 0064 | | No | Allow - PowerMic4 |
| Allow | 0554 | 1001 | | No | Allow - PowerMic II & III |
| Split | 0554 | 0064 | 01 03 04 05 06 07 | No | Split - PowerMic4 |
| Split | 0554 | 1001 | 00 01 02 | No | Split - PowerMic II & III |
| Allow | 07b4 | 0218 | | No | Allow - Olympus Footswitch |
| Allow | 07b4 | 0256 | | No | Allow - Olympus DR 2300 |
| Split | 07b4 | 0256 | 01 02 03 04 05 06 | No | Split - Olympus DR 2300 |
| Allow | 0911 | 091a | | No | Allow - Philips Foot Control LFH2330 |
| Allow | 0911 | 14a4 | | No | Allow - Philips SpeechMike II |
| Allow | 0911 | 14a4 | | No | Allow - Philips SpeechMike II |
| Allow | 0911 | 1844 | | No | Allow - Philips Foot Control LFH2300 |
| Allow | 0911 | 0c1c | | No | Allow - Philips III |
| Split | 0911 | 14a4 | 00 01 02 03  | No | Split - Philips SpeechMike II |
| Split | 0911 | 0c1c | 00 01 02 03 | No | Split - Philips III |
| Allow | 15d8 | 0024 | | No | Allow - Grundig Digta Foot Control 540|
| Allow | 15d8 | 0025 | | No | Allow - Grundig Digta SonicMic |
| Split | 15d8 | 0025 | 00 01 02 04 05 | No | Split - Grundig Digta SonicMic |

-----

-----

## Nuance Dictation: VMware Configuration Single Hop

### UMS Configurations

- UMS Console: USB Redirection Configurations

![image01](Images/HOWTO-Nuance-Dictation-01.png)

- UMS Console: USB Redirection Configurations

![image02](Images/HOWTO-Nuance-Dictation-02.png)

### Horizon Group Policy Configurations

- Active Directory - Group Policy Management: Configure the following setting either via GPO or Regedit to your Virtual Machines

![image03](Images/HOWTO-Nuance-Dictation-03.png)
![image04](Images/HOWTO-Nuance-Dictation-04.png)

**NOTE** From the IGEL perspective we are passing the device through without interfaces and allowing the VDI session to distinguish the interfaces when the device connects to the Virtual Machine

![image05](Images/HOWTO-Nuance-Dictation-05.png)

### OS Configurations

- Device Connectivity: Verify that the PowerMic is being redirected into the session correctly. 

![image06](Images/HOWTO-Nuance-Dictation-06.png)

- Dragon Medical One: Microphone is showing correctly, this will allow DMO to open without any issues and be able to utilize all of the PowerMic buttons​

![image07](Images/HOWTO-Nuance-Dictation-07.png)

- Dragon Medical One: Copy the Standalone app to your virtual machine and launch the SoD application

**NOTE:** [Resource site for Nuance](https://dragonmedicalone.nuance.com/StandAlone/)

![image08](Images/HOWTO-Nuance-Dictation-08.png)

-----

## Nuance Dictation: Citrix Configuration Single Hop with CVAD (XenDesktop)

### UMS Configurations

- UMS Console: USB Redirection Configurations

![image09](Images/HOWTO-Nuance-Dictation-09.png)

- UMS Console: Nuance Extension Enablement

![image10](Images/HOWTO-Nuance-Dictation-10.png)

### Citrix Policy Configurations

- Citrix Policies: Set the following settings for the microphone. Note that these can be set via Citrix Studio or Active Directory Group Policy Management

![image11](Images/HOWTO-Nuance-Dictation-11.png)

### OS Configurations

- Device Connectivity: Verify that the PowerMic is being redirected into the session correctly. 

![image12](Images/HOWTO-Nuance-Dictation-12.png)

- Dragon Medical One: Microphone is showing correctly, this will allow DMO to open without any issues and be able to utilize all of the PowerMic buttons​

![image13](Images/HOWTO-Nuance-Dictation-13.png)

- Device Connectivity: Verify that the PowerMic is being redirected into the session correctly. 

![image14](Images/HOWTO-Nuance-Dictation-14.png)

-----

## Nuance Dictation: Citrix Configuration Single Hop with CVAD (XenApp Published Desktop/App)

### UMS Configurations

- UMS Console: USB Redirection Configurations

![image15](Images/HOWTO-Nuance-Dictation-15.png)

- UMS Console: Nuance Extension Enablement

![image16](Images/HOWTO-Nuance-Dictation-16.png)

### Citrix Policy Configurations

- Citrix Policies: Set the following settings for the microphone. Note that these can be set via Citrix Studio or Active Directory Group Policy Management

![image17](Images/HOWTO-Nuance-Dictation-17.png)

### OS Configurations

- Device Connectivity: Verify that the PowerMic is being redirected into the session correctly. 

![image18](Images/HOWTO-Nuance-Dictation-18.png)

- USB Audio Redirection: The following registry key must be set on any Server OS Virtual Machines that will be connecting to Citrix Workspace App for Linux (CWAL)

**NOTE:** [There is a limitation between Server OS and Citrix VDA](https://support.citrix.com/article/CTX238341)

![image19](Images/HOWTO-Nuance-Dictation-19.png)

- Dragon Medical One (Published Desktop): Microphone is showing correctly, this will allow DMO to open without any issues and be able to utilize all of the PowerMic buttons​

![image20](Images/HOWTO-Nuance-Dictation-20.png)

- Device Connectivity: Verify that the PowerMic is being redirected into the session correctly. 

![image21](Images/HOWTO-Nuance-Dictation-21.png)

- Dragon Medical One (Published App): Accessing DMO from a Published Application is also supported 

![image22](Images/HOWTO-Nuance-Dictation-22.png)

- Dragon Medical One (Published App): Microphone is showing correctly, this will allow DMO to open without any issues and be able to utilize all the PowerMic buttons​

**NOTE:** One thing to notice is that when utilizing the Nuance Extension in Citrix, the microphone is redirected to the Citrix session and no longer shows attached to the endpoint. 

![image23](Images/HOWTO-Nuance-Dictation-23.png)

-----

## Nuance Dictation: Citrix Configuration Double Hop with CVAD (XenApp Published Desktop to XenApp Published App)

### UMS Configurations

- UMS Console: USB Redirection Configurations

![image24](Images/HOWTO-Nuance-Dictation-24.png)

- UMS Console: Ensure that Nuance Dictation Extension is disabled

![image25](Images/HOWTO-Nuance-Dictation-25.png)

### Citrix Policy Configurations

- Citrix Policies: Set the following settings for the microphone.

**NOTE:** These can be set via Citrix Studio or Active Directory Group Policy Management

![image26](Images/HOWTO-Nuance-Dictation-26.png)

### OS Configurations

- USB Audio Redirection: The following registry key must be set on any Server OS Virtual Machines that will be connecting to Citrix Workspace App for Linux (CWAL)

**NOTE:** [There is a limitation between Server OS and Citrix VDA](https://support.citrix.com/article/CTX238341
)

![image27](Images/HOWTO-Nuance-Dictation-27.png)

- Nuance Extension Installs on First Hop: The following extensions have to be installed on the first hop. 

**NOTE:** If the first hop is Server OS, the following syntax must be used “SKIP_OSCHECK=1”

[Download site for Nuance Extensions](https://dragonmedicalone.nuance.com/StandAlone/)

![image28](Images/HOWTO-Nuance-Dictation-28.png)
![image29](Images/HOWTO-Nuance-Dictation-29.png)

- Dragon Medical One (Published Desktop): Microphone is showing correctly, this will allow DMO to open without any issues and be able to utilize all the PowerMic buttons​

![image30](Images/HOWTO-Nuance-Dictation-30.png)

- Dragon Medical One (Published Desktop): Microphone is showing correctly, this will allow DMO to open without any issues and be able to utilize all the PowerMic buttons​

![image31](Images/HOWTO-Nuance-Dictation-31.png)

