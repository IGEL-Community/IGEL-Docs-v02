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

## kinit

Active Directory login

```bash linenums="1"

```

```bash linenums="1"

```

## klist

Display kerberos tickets

```bash linenums="1"

```

```bash linenums="1"

```

## getmyip

show device IP

```bash linenums="1"
getmyip && echo
```

```bash linenums="1"
192.168.1.2
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

## setparam

Write variable to registry

**Write variable system.remotemanager.ums_structure_tag with Value Building1:**

```bash linenums="1"
setparam system.remotemanager.ums_structure_tag "Building1"
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

## icg-config

IGEL Cloud Gateway config; with url and mass deployment key

```bash linenums="1"

```

```bash linenums="1"

```

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