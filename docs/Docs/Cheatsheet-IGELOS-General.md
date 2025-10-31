# Cheatsheet IGELOS General

## apparmor_status

Lists all services protected by apparmor

```bash linenums="1"
apparmor_status
```

```bash linenums="1"
apparmor module is loaded.
18 profiles are loaded.
18 profiles are in enforce mode.
   /sbin/dhclient
...
   /{dev/.mnt-system/ro/,dev/.mnt-system/ro/sys/,}usr/sbin/tcpdump
0 profiles are in complain mode.
8 processes have profiles defined.
7 processes are in enforce mode.
   /sbin/dhclient (12496)
...
   /{dev/.mnt-system/ro/,dev/.mnt-system/ro/sys/,dev/.mnt-system/rw/,dev/.mnt-system/rw/sys/,}services/fbrw/firefox/{,*[^s][^h]} (14061)
0 processes are in complain mode.
1 processes are unconfined but have a profile defined.
   /usr/sbin/haveged (366)
```

## chromium-browser

Start Chromium browser in App Mode for Citrix Storefront and similar pages - to use with Custom App function

```bash linenums="1"
chromium-browser --app=https://storefront-url.domain.org --start-maximized
```

## curl

Check for trusted certificate or download files

**Download script from Github and save it:**

```bash linenums="1"
curl -O https://raw.githubusercontent.com/IGEL-Community/IGEL-Custom-Partitions/master/CP_Source/Unified_Communications/Zoom/build/build-zoom-cp.sh
```

```bash linenums="1"
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   982  100   982    0     0   3494      0 --:--:-- --:--:-- --:--:--  3494
```

Find location of device

```bash linenums="1"
curl -s "http://worldtimeapi.org/api/ip/"
```

```bash linenums="1"
{"utc_offset":"-06:00","timezone":"America/Denver","day_of_week":2,"day_of_year":303,"datetime":"2024-10-29T14:20:43.282300-06:00","utc_datetime":"2024-10-29T20:20:43.282300+00:00","unixtime":1730233243,"raw_offset":-25200,"week_number":44,"dst":true,"abbreviation":"MDT","dst_offset":3600,"dst_from":"2024-03-10T09:00:00+00:00","dst_until":"2024-11-03T08:00:00+00:00","client_ip":"162.142.58.63"}
```

Find timezone for current location

```bash linenums="1"
curl -s "http://worldtimeapi.org/api/ip/" | jq --raw-output '(.timezone)'
```

Script to update timezone

```bash linenums="1"
#!/bin/bash
#set -x
#trap read debug

TZ=
while [ -z "$TZ" ]
do
	sleep 5s;
	TZ=$(curl -s "http://worldtimeapi.org/api/ip/" | jq --raw-output '(.timezone)');
done
timedatectl set-timezone $TZ
ntpdate pool.ntp.org
```

Find geo location of device

```bash linenums="1"
curl http://ip-api.com/json/$(curl https://ipinfo.io/ip 2>/dev/null) 2>/dev/null
```

```bash linenums="1"
{"status":"success","country":"United States","countryCode":"US","region":"NM","regionName":"New Mexico","city":"Corrales","zip":"87048","lat":35.2358,"lon":-106.6177,"timezone":"America/Denver","isp":"Comcast Cable Communications, LLC","org":"Comcast Cable Communications, LLC","as":"AS7922 Comcast Cable Communications, LLC","query":"73.242.149.67"}
```

## microsoft-edge-stable

Start Edge browser in App Mode for Citrix Storefront and similar pages - to use with Custom App function

```bash linenums="1"
microsoft-edge-browser --app=https://storefront-url.domain.org --start-maximized
```

## florence

Onscreen keyboard

Sample settings in configuration file: `/wfs/user/florence.store`

```bash linenums="1"
window_xpos=9
window_ypos=71
window_zoom=33
```

## get

Read variable from registry

**Read variable system.remotemanager.ums_structure_tag:**

```bash linenums="1"
get system.remotemanager.ums_structure_tag
```

```bash linenums="1"
Building1
```

## get_unit_id

Get the Unit ID

**get the Unit-ID:**

```bash linenums="1"
get_unit_id && echo
```

```bash linenums="1"
85641000F615234423
```

**reset the original Unit-ID:**

```bash linenums="1"
get_unit_id -m
```

```bash linenums="1"
Manually set new Unit ID

    0 abort setting Unit ID
    1 UD Pocket Unit ID 85641000F615234423
    2 eth0: Unit ID 002326FC34DE, connected via PCI, wired, has no license
    3 wlan0: Unit ID 002314200E4, connected via PCI, wireless, has no license

Choose number to abort or set new Unit ID:
```

**reset it to the correct ID, Reboot, and then license it.**

```bash linenums="1"
get_unit_id -if
```

## getmyip

show device IP

```bash linenums="1"
getmyip && echo
```

```bash linenums="1"
192.168.1.2
```

## getsysvalue

Read variable from registry

**Get NTP server name**

```bash linenums="1"
getsysvalue system.time.ntp_timeserver
```

## icg-config

IGEL Cloud Gateway config; with url and mass deployment key

```bash linenums="1"

```

```bash linenums="1"

```

## kinit

Active Directory login

[Kinit command explained](https://www.ionos.com/digitalguide/server/configuration/kinit-command/)

## klist

Display kerberos tickets

Get current domain user (if logged in via kerberos)

```bash linenums="1"
klist --json | jq -r .principal
```

## resetvalue_tree

Reset defined section of the IGEL registry

- Reset all settings under each of the registry classes back to default `but do not include network`

```bash linenums="1"
#!/bin/bash
/bin/resetvalue_tree auth
/bin/resetvalue_tree awsc
/bin/resetvalue_tree browserglobal
/bin/resetvalue_tree chromiumglobal
/bin/resetvalue_tree custom_partition
/bin/resetvalue_tree debug
/bin/resetvalue_tree devices
/bin/resetvalue_tree evidian
/bin/resetvalue_tree fwtools
/bin/resetvalue_tree ibm
/bin/resetvalue_tree ica
/bin/resetvalue_tree igel-sound-control
/bin/resetvalue_tree imprivata
/bin/resetvalue_tree jabra
/bin/resetvalue_tree java
/bin/resetvalue_tree monitoring_agent
/bin/resetvalue_tree multimedia
#/bin/resetvalue_tree network
/bin/resetvalue_tree pcoip
/bin/resetvalue_tree pcom
/bin/resetvalue_tree print
/bin/resetvalue_tree printerlogic
/bin/resetvalue_tree product
/bin/resetvalue_tree rdp
/bin/resetvalue_tree scard
/bin/resetvalue_tree services
/bin/resetvalue_tree sessions
/bin/resetvalue_tree speechwrite
/bin/resetvalue_tree spice
/bin/resetvalue_tree stratusphere_ux
/bin/resetvalue_tree system
/bin/resetvalue_tree thinlinc
/bin/resetvalue_tree twox
/bin/resetvalue_tree update
/bin/resetvalue_tree userinterface
/bin/resetvalue_tree vmware
/bin/resetvalue_tree vmwarevdmapp
/bin/resetvalue_tree voip
/bin/resetvalue_tree windowmanager
/bin/resetvalue_tree wvd
/bin/resetvalue_tree x
/bin/resetvalue_tree xen
/bin/killwait_postsetupd
/sbin/write_rmsettings
```

## setcryptparam

Saves encrypted Data like password to IGEL registry

**Set password for OS 11 Horizon**

```bash linenums="1"
setcryptparam app.horizon.sessions.vdm_client0.options.crypt_password "$EncryptedPW"
```

<iframe width="560" height="315" src="https://www.youtube.com/embed/XfVq3Hxe0-4?si=mZ2-QI_VQX8dOZpk" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## setparam

Write variable to registry

**Write variable system.remotemanager.ums_structure_tag with Value Building1:**

```bash linenums="1"
setparam system.remotemanager.ums_structure_tag "Building1"
write_rmsettings
```

**Write and read variable system.remotemanager.ums_structure_tag with MAC Address of all network interfaces:**

```bash linenums="1"
setparam system.remotemanager.ums_structure_tag $(ip a | grep ether | tr -s ' ' | cut -d " " -f 3 | paste -d " "  - -)
write_rmsettings
get system.remotemanager.ums_structure_tag
```

## soft_reboot

Soft reboot

```bash linenums="1"
soft_reboot
```

## soft_shutdown

Soft shutdown

```bash linenums="1"
soft_shutdown
```

## user_shutdown

shutdown the system

```bash linenums="1"
user_shutdown
```

## user_reboot

reboot the system

```bash linenums="1"
user_reboot
```

- [How to Perform an Emergency Reboot with IGEL UMS](https://www.igelcommunity.com/post/how-to-perform-an-emergency-reboot-with-igel-ums)

## vdm_client0

After creating a VMware Horizon session, you can get it to run fully as User from command line with the following command.

```bash linenums="1"
su -c "XDG_RUNTIME_DIR=/run/user/777 /config/sessions/vdm_client0" user &
```

## xrandr

Controls the Screens from command line

Scale down a 4k-monitor in conference room to match laptop display resolution.

- Find the outputs

```bash linenums="1"
su user -c xrandr
```

- Example 1:

```bash linenums="1"
su user -c xrandr --output DISPLAY1 --rate 60 --mode 1920x1080 --fb 1920x1080 --panning 1920x1080* --output DISPLAY2 --mode 1920x1080 --same-as DISPLAY1
```

- Example 2:

```bash linenums="1"
su user -c xrandr —output HDMI-1 —rate 60 —mode 1920x1080 —fb 1920x1080 —panning 1920x1080* —output eDP-1 —mode 1920x1080 —same-as HDMI-1
```

Create a virtual monitor to be used for applications, such as VMware Horizon, that expect a monitor to be attached. This can be added to `Setup > System > Firmware Customization > Custom Commands > Desktop > Final desktop command`

```bash linenums="1"
xrandr --setmonitor virtual 640/64x480/48+1680+0 none
```

Rotate window 90 degrees

```bash linenums="1"
xrandr -o left
```

To revert back

```bash linenums="1"
xrandr -o normal
```

Resize virtual machine

```bash linenums="1"
xrandr --output Virtual-1 --auto
```

- [How to duplicate desktop with xrandr?](https://unix.stackexchange.com/questions/371793/how-to-duplicate-desktop-in-linux-with-xrandr)