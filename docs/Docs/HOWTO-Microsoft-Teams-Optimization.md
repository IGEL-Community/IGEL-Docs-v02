# HOWTO Microsoft Teams

## [IGEL OS UCC Configuration Guide](http://files.igelcommunity.com/igelos_ucc_guide.pdf)

## [Teams for Virtualized Desktop Infrastructure](https://learn.microsoft.com/en-us/microsoftteams/teams-for-vdi)

## [Microsoft Teams optimization in a virtual desktop](https://www.go-euc.com/microsoft-teams-optimization-in-a-virtual-desktop/)

-----

## Communication one-to-one vs. three (3) or more:

- If there are two (2) participants, communication is established as peer connection between the two IGEL devices.
- If there are three (3) or more, the peer is broken and all is orchestrated through the teams servers in the cloud. So, when 3 or more, IGEL OS sends the videos stream to a server in azure, that combine all video streams and send to all participants.

-----

## How to Check communication to the Microsoft API URLs and IPs?

If Microsoft Teams is not running in optimized mode, then check that the IGEL endpoint can communicate with the Microsoft API URLs and IPs?

Run the following script in a local terminal window on IGEL endpoint:

```bash linenums="1"
#!/bin/bash

nc -u -v -z 13.107.64.21 3478-3481
nc -u -v -z 52.112.0.31 3478-3481
nc -u -v -z 52.120.0.41 3478-3481
nc -v -z teams.microsoft.com 80
nc -v -z teams.microsoft.com 443
nc -v -z compass-ssl.microsoft.com 443
nc -v -z mlccdnprod.azureedge.net 443
nc -v -z aka.ms 443
```

-----  

## Microsoft Teams progressive web app (PWA) via Chromium

The PWA provides the latest Microsoft Teams features via a native IGEL client.

The PWA offers access to more capabilities, including custom backgrounds, gallery view, reactions, the raise-a-hand feature in meetings, large gallery and Together mode views, etc..

[Steps to install the PWA into Chromium](https://www.igelcommunity.com/post/how-to-igel-os-with-teams-pwa-progressive-web-app)

-----  

## Microsoft Teams progressive web app (PWA) via Edge

The PWA provides the latest Microsoft Teams features via a native IGEL client.

The PWA offers access to more capabilities, including custom backgrounds, gallery view, reactions, the raise-a-hand feature in meetings, large gallery and Together mode views, etc..

Steps to install the PWA into Microsoft Edge:

- Deploy Microsoft Edge Browser custom partition. **Note:** Increase the CP partition size by 500MB - [Microsoft Edge CP](https://github.com/IGEL-Community/IGEL-Custom-Partitions/tree/master/CP_Source/Browsers/Microsoft_Edge_stable)
- Start up Microsoft Teams in the browser - [Microsoft Teams Login](https://teams.microsoft.com)
- In the upper right hand corner of Edge, Select `...` (Settings and more (Alt+F))
- Select `Apps > Install this site as an app`

![Install-this-site-as-an-app](Images/HOWTO-Microsoft-Teams-01.png)
![Install-app](Images/HOWTO-Microsoft-Teams-02.png)

- Run the installed Microsoft Teams PWA

![Run-PWA-app](Images/HOWTO-Microsoft-Teams-03.png)

- Manage installed PWA applications `edge://apps`

![Manage-PWA-apps](Images/HOWTO-Microsoft-Teams-04.png)
![Manage-PWA-Teams-app](Images/HOWTO-Microsoft-Teams-05.png)

-----

### Create shortcut for Teams PWA application

**NOTE:** A reboot may be needed for the Teams icon to show up.

- Command Line (cmdline):

```bash linenums="1"
microsoft-edge-stable --profile-directory=Default --app-id=cifhbcnohmdccbgoicgdjpfamggdegmo "--app-url=https://teams.microsoft.com/?clientType=pwa"
```

- icon:

```bash linenums="1"
/custom/edge_stable/userhome/.config/microsoft-edge/Default/Web Applications/Manifest Resources/cifhbcnohmdccbgoicgdjpfamggdegmo/Icons/256.png
```
