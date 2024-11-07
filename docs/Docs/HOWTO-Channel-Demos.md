# HOWTO Channel Demos

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