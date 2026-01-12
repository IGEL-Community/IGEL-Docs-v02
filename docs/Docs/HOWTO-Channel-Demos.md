# HOWTO Channel Demos

-----

## Demo: UMS

What is shown in this demo:

- Customizing the appearance (light vs. dark mode)
- Show menu items (such as Apps, Configuration, and Devices)
- Connecting to IGEL App Portal and searching for apps
- Configurations for Apps
- Shadow Device
- Assign Profile (Edge) 

<iframe width="560" height="315" src="https://www.youtube.com/embed/he-gN4dFZ9Q?si=NAL_4G94l4SBcwj2" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

-----

## Demo: iPhone Like Experience

Like the iPhone, allow user to choose applications to install and configure. 

- [Video show steps to add applications to OS 12 without UMS12](https://raw.githubusercontent.com/IGEL-Community/IGEL-Docs-v02/main/docs/Docs/videos/HOWTO-Add-Applications-IGEL_OS_12_wo_UMS_AppPortal.mp4)

<video controls>
<source src="../videos/HOWTO-Add-Applications-IGEL_OS_12_wo_UMS_AppPortal.mp4" type="video/mp4">
</video>

### Steps to Setup this Demo

- Boot device
- Skip -- Let's connect to the company network
- Skip -- Use the one-time password to onboard this device?
- Obtain IGEL OS 12 Evaluation License -- Are you implementing as IGEL solution for your company? (This is 90 a day day evaluation license)
- Reboot
- Open the App Portal and install applications

### Using igelpkgctl command line

- [Options for igelpkgctl](https://igel-community.github.io/IGEL-Docs-v02/Docs/Cheatsheet-IGELCommunity/?h=igelpkgctl#igelos-12-packages-igelpkgctl)

- Open a Terminal Window as root (add terminal session from setup)

- List packages to install:

```bash linenums="1"
igelpkgctl list
```

- Update to latest version of IGEL OS

```bash linenums="1"
igelpkgctl install base_system
```

- Install lastest AVD client:

```bash linenums="1"
igelpkgctl install avd
```

- Open Setup to add a AVD session: ++ctrl+alt+s++ 

- Install lastest Chromium client:

```bash linenums="1"
igelpkgctl install chromium
```

- Open Setup to add a Chromium session: ++ctrl+alt+s++ 

- Uninstall AVD:

```bash linenums="1"
echo "Y" | igelpkgctl uninstall avd
```

### How to reset a device

Run the following command as root in terminal window:

```bash linenums="1"
delete_igel_licenses ALL && reset_to_defaults && reboot
```

-----

## IGEL App Creator Portal - Steps to build Simple-Scan

The App creator portal replaces Custom Partitions by using recipe
to create OS 12 application that can be deployed from your UMS.

The IGEL Community provides a GitHub site with recipes.

This video will show the steps to take recipe from GitHub, use IGEL
App creator portal to create application, and finally to add it to
UMS and deploy to OS 12 device.

- Demo Simple-Scan (native image / document scanner app)
- Show GitHub recipe for Simple-Scan
- Take simple_scan-community.zip and use in IGEL App Creator Portal
- Download app
- Download certificate 
- Setup in UMS
- Deploy to OS 12 device

Links for additional information:

- [IGEL Community App Recipes](https://github.com/IGEL-Community/IGEL-OS-APP-RECIPES)
- [HOWTO: Add Applications - App Creator Portal](https://igel-community.github.io/IGEL-Docs-v02/Docs/HOWTO-Add-Applications/#igel-app-creator-portal)
- [HOWTO: Add Application - SpeedCrunch](https://igel-community.github.io/IGEL-Docs-v02/Docs/HOWTO-Add-Applications/#building-an-os-12-app-recipe-for-igel-app-creator-portal-speedcrunch)

<iframe width="560" height="315" src="https://www.youtube.com/embed/0-6_4AV19s0?si=J9vK0Rz9AIXo9Hov" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

-----

## Direct Boot to Microsoft AVD with IGEL OS in 33 seconds 

<iframe width="560" height="315" src="https://www.youtube.com/embed/JxuK7DHiqY8?si=sQTsbgktEcqXmKgx" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

-----

## Rapid Onboarding with IGEL OS and Azure Virtual Desktop 

<iframe width="560" height="315" src="https://www.youtube.com/embed/GMMSC8bHj1k?si=qwyherdWCke1nim6" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

-----

## Installing the ZOOM desktop application on IGEL OS 

<iframe width="560" height="315" src="https://www.youtube.com/embed/ejWUeQ4i46E?si=HLpwlqcqn5diCQRD" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

-----

## Installing ControlUp EDGE DX onto IGEL 

<iframe width="560" height="315" src="https://www.youtube.com/embed/oZrCxL2l3pc?si=rlUV3-YNhyDcwxV6" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

-----

## rf IDEAS HIMSS24 - IGEL Demo 

<iframe width="560" height="315" src="https://www.youtube.com/embed/jWhoUIgI3HM?si=cfF1d5zKvsjoWzwV" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

-----

## IGEL OS 12 FastOnboarding with Citrix 

<iframe width="560" height="315" src="https://www.youtube.com/embed/Ore9a9f5A0I?si=GRBvYrbwu-bCu99r" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

-----

## How to onboard an IGEL UD Pocket with OS 12 without a UMS in place?

 <iframe width="560" height="315" src="https://www.youtube.com/embed/CJFEAlpGh24?si=FVu9AcoVh249oAta" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

 -----

## How to IGEL OS 12 + Microsoft EntraID + Microsoft EDGE + Fido2 + YubiKey

Demonstrates using a YubiKey with Fido2 authentication and EntraID as identity provider to log into Microsoft Office Apps.

 <iframe width="560" height="315" src="https://www.youtube.com/embed/G6l0qIXes1k?si=c4tOpRwfTu-mMQI2" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

 -----

## How to Microsoft Intune on IGEL – Entra Conditional Access with IGEL OS 12 to control access to Azure Virtual Desktop and Windows 365

- IGEL OS 12 with Intune App provides conditional access to Azure Virtual Desktop and Windows 365
- Additional details can be found on this [Blog Post](https://virtualbrat.com/2024/11/20/microsoft-intune-on-igel-entra-conditional-access-with-igel-os-12-to-control-access-to-azure-virtual-desktop-and-windows-365-check-this-demo/)

 <iframe width="560" height="315" src="https://www.youtube.com/embed/XwtP3cbVs1o?si=95EzgncTKV5rv3H7" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

-----

## Using VueScan application to scan on OS 12

- [VueScan](https://www.hamrick.com/) supports over 7400 scanners and included built in drivers in VueScan so you can keep using the scanner you already have.
- [IGEL Community GitHub Builder for VueScan](https://github.com/IGEL-Community/IGEL-Custom-Partitions/tree/master/CP_Source/Apps/VueScan)

This demo shows VueScan connecting to network attached Brother MFC-L2750DW and scanning a post card.

 <iframe width="560" height="315" src="https://www.youtube.com/embed/DKAR2hqaltY?si=zmEumFUzfxDAJe_c" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

-----

## Stratodesk to IGEL Conversion Summary

This demo shows the steps to use Stratodesk NoTouch Center to deploy IGEL OS via LFI (image update) file of IGEL OS 12.

- [IGEL KB: How to Migrate from Stratodesk to IGEL](https://kb.igel.com/new-features/current/how-to-migrate-from-stratodesk-to-igel)

 <iframe width="560" height="315" src="https://www.youtube.com/embed/yTwaswmLq28?si=1XVtm8ADmkm-4pkK" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

-----

## How to find and build a screen magnifier (KMag) app

This demo shows the steps to identify a screen magnifier app, how to download the app, how to find missing libraries, and finally creating the recipe that can be used in IGEL App Creator Portal.

Items used:

- [ChatGPT](https://chatgpt.com)
- [Docker](HOWTO-Docker.md)
- [IGEL-Community / IGEL-OS-APP-RECIPES / Docker Script](https://github.com/IGEL-Community/IGEL-OS-APP-RECIPES/tree/main/utils/scripts/docker)
- [IGEL-Community / IGEL-OS-APP-RECIPES / KMag](https://github.com/IGEL-Community/IGEL-OS-APP-RECIPES/tree/main/APP_Source/Apps/kmag)

 <iframe width="560" height="315" src="https://www.youtube.com/embed/EOxcVahGfR4?si=JjcnAh8zVj1Q4CJq" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

### Quick recap

Ron discussed the installation process of KMag, a screen magnification application, on Debian Bookworm using ChatGPT for guidance and demonstrating how to run Docker containers on IGEL devices. He explained the steps involved in setting up a Debian bookworm environment, identifying and resolving missing shared libraries, and successfully running KMag with the necessary dependencies. Ron also demonstrated how to build a recipe for KMag, including capturing configuration settings and handling individual files, and discussed creating a custom installation for the KMag application.

### Summary - KMag Installation on Debian Bookworm

Ron discussed installing KMag, a screen magnification application, on Debian Bookworm. He used ChatGPT to find installation instructions, which revealed that KMag is available in the official repositories. Ron planned to download KMag and examine its dependencies to determine if any additional libraries were needed for installation on IGEL.

### Docker on IGEL Devices Demo

Ron demonstrated how to run Docker containers on IGEL devices using a created recipe, which involves spinning up a Debian Bookworm instance, downloading and extracting deb files, and copying the results back to the IGEL device. He showed how to identify missing shared libraries in the extracted KMag files using command `ldd kmag | grep found`, and explained how to use ChatGPT to find the necessary packages in Debian Bookworm to resolve these dependencies.

### Debian KMag Setup Demonstration

Ron demonstrated setting up a Debian bookworm environment and successfully running KMag with the necessary libraries. He explained the process of collecting and configuring the required packages, setting the library path `export LD_LIBRARY_PATH=$(pwd)`, and verifying that all dependencies were correctly installed with `ldd kmag | grep found` returning no `not found` items.

### KMag Recipe Configuration Demonstration

Ron demonstrated how to build a recipe for KMag, explaining the structure of the recipe files and the process of capturing configuration settings. He showed how to copy the settings from the user's home directory to a read-write area to prevent loss of configuration data when the system reboots. Ron also discussed the need to handle individual application configuration files within the recipe, requiring additional work compared to handling them as a directory.

### KMEG Custom Installation Process

Ron explained the process of creating a custom installation for the KMEG application, which involves specifying the source files and excluding unnecessary programs. He described setting up a service to manage the kmagrc file and creating a symbolic link to it.