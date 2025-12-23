# HOWTO Custom Commands

-----

-----

<!--
Comments
-->

## Custom Commands in IGEL OS 12

Custom commands are executed at specific points of the system startup process.

- [IGEL KB: Custom Commands in IGEL OS 12](https://kb.igel.com/en/igel-os-base-system/current/custom-commands-in-igel-os-12)

    - **Base:** The commands defined here are executed at the specific execution times during the boot process. [IGEL KB: Base Custom Commands in IGEL OS 12](https://kb.igel.com/en/igel-os-base-system/current/base-custom-commands-in-igel-os-12)

    - **Network:** Commands for network-related execution times. [IGEL KB: Network Custom Commands in IGEL OS 12](https://kb.igel.com/en/igel-os-base-system/current/network-custom-commands-in-igel-os-12)

    - **Desktop:** Commands are executed at the specific execution times when the X server is launched. [IGEL KB: Desktop](https://kb.igel.com/en/igel-os-base-system/current/desktop-1)

    - **Reconfiguration:** Commands defined here is executed after settings relating to the local setup or the UMS have been changed. [IGEL KB: Reconfiguration Custom Commands in IGEL OS 12](https://kb.igel.com/en/igel-os-base-system/current/reconfiguration-custom-commands-in-igel-os-12)

Since multiple profiles with custom commands can overwrite each other, a method for combining custom commands is needed.

-----

-----

## Method for Managing Custom Commands

A profile can be setup with a wrapper script to look for custom command scripts. The wrapper script looks for related scripts.

- Use UMS Files to deploy the scripts to IGEL OS
- Create profile for Custom Commands that call the wrapper scripts

Final desktop command:

```bash linenums="1"
System --> System Customization --> Custom Commands --> Desktop --> Final desktop command --> /wfs/cc-desktop-3fdc.sh &
```

-----

-----

### Desktop


| Desktop Execution Times | Description | Basename of Scripts |
|-------------------------|-------------|---------------------|
| Desktop initialization | Executed during the boot process, before the X server is started | cc-desktop-1ini- |
| Before desktop start | The command is executed before the windowmanager and the autostart sessions are started. | cc-desktop-2bds- |
| Final desktop command | The command is executed after each user logon and desktop restart | cc-desktop-3fdc- |

| Name | Script |
|------|--------|
| Wrapper - Final desktop command | <a href="../Scripts/HOWTO-Custom-Commands-cc-desktop-3fdc.sh" download>LINK to script</a> |
| Sort Desktop Icons | <a href="../Scripts/HOWTO-Custom-Commands-cc-desktop-3fdc-sorticons.sh" download>LINK to script</a> |
| Add CUPS Network Printers | <a href="../Scripts/HOWTO-Custom-Commands-cc-desktop-3fdc-cupsnetworkprinters.sh" download>LINK to script</a> |
| USB Always On | <a href="../Scripts/HOWTO-Custom-Commands-cc-desktop-3fdc-usb-power.sh" download>LINK to script</a> |
| Set Permissions on Apache Webdav Folder | <a href="../Scripts/HOWTO-Custom-Commands-cc-desktop-3fdc-apache.sh" download>LINK to script</a> |
| Set Island.io as default browser | <a href="../Scripts/HOWTO-Custom-Commands-cc-desktop-3fdc-island.sh" download>LINK to script</a> |
| How to remove --> `Currently being shadowed - Disconnect` | <a href="../Scripts/HOWTO-Custom-Commands-cc-desktop-3fdc-remove-being-shadowed.sh" download>LINK to script</a> |
| AVD Post Session Logoff | <a href="../Scripts/HOWTO-Custom-Commands-cc-desktop-3fdc-avd-post-session-logoff.sh" download>LINK to script</a> |
| Reboot when lock screen running for WAIT_AFTER_START time | <a href="../Scripts/HOWTO-Custom-Commands-cc-desktop-3fdc-reboot-after-screen-lock.sh" download>LINK to script</a> |

-----

- Wrapper - Final desktop command

```bash linenums="1"
#!/bin/bash
#set -x
#trap read debug

#
# Version: 
# Run all Final Desktop Commands
#
# Custom Commands: Desktop: Final Desktop Command
#

ACTION="cc-desktop-3fdc"

# output to systemlog with ID amd tag
LOGGER="logger -it ${ACTION}"

echo "Starting" | $LOGGER

# run all final desktop scripts
ls /wfs/cc-desktop-3fdc-*.sh | while read LINE
  do
  echo "Starting: ${LINE}" | $LOGGER
  $LINE &
  done

echo "Finished" | $LOGGER

exit 0
```

-----

- Add CUPS Network Printers

```bash linenums="1"
#!/bin/bash
#set -x
#trap read debug

#
# Version:
# Add CUPS network printers
#
# Custom Commands: Desktop: Final Desktop Command
#

ACTION="cc-desktop-3fdc-cupsnetworkprinters"

COUNT=1

# output to systemlog with ID amd tag
LOGGER="logger -it ${ACTION}"

echo "Starting" | $LOGGER

if [ ! -e /usr/lib/cups/backend/snmp ]; then
  echo "ERROR: CUPS not installed. Please install CUPS app" | $LOGGER
fi

# create network printers from /usr/lib/cups/backend/snmp
/usr/lib/cups/backend/snmp | while read LINE
  do
    URI=ipp://`echo "${LINE}" | awk --field-separator " " '{print $2}' | sed -e 's|^.*//||' -e 's|[:/].*||'`/ipp/print
    lpadmin -p wifiprinter${COUNT} -E -v $URI -m everywhere | $LOGGER
    if [ ${COUNT} -eq 1 ]; then
      lpoptions -d wifiprinter${COUNT} | $LOGGER
    fi
    COUNT=$COUNT+1
  done

echo "Finished" | $LOGGER

exit 0
```

-----

- USB Always on (Printer, Scanner, etc.)

```bash linenums="1"
#!/bin/bash
#set -x
#trap read debug

#
# Version: 
# USB always on (Printer, Scanner, etc.)
# System > Firmware Customization > Custom Commands > Desktop
#
# Custom Commands: Desktop: Final Desktop Command
#

ACTION="cc-desktop-3fdc-usb-power"

# output to systemlog with ID amd tag
LOGGER="logger -it ${ACTION}"

echo "Starting" | $LOGGER

echo on | tee /sys/bus/usb/devices/*/power/level > /dev/null

echo "Finished" | $LOGGER

exit 0
```

-----

- Set Permissions on Apache Webdav Folder

```bash linenums="1"
#!/bin/bash
#set -x
#trap read debug

#
# Version: 
# Set Permissions on /var/www/webdav
#
# Custom Commands: Desktop: Final Desktop Command
#

# set up logging function
ACTION="apache2_set_permissions"
function log {
    logger -it "$ACTION" "$1"
}

log "Starting $ACTION"
chown -R www-data:www-data /services_rw/apache/var/www/webdav
chmod -R 775 /var/www/webdav/* /services_rw/apache/var/www/webdav
log "Ending $ACTION"
```

-----

- Sort Desktop Icons

```bash linenums="1"
#!/bin/bash
#set -x
#trap read debug

#
# Version: 
# Sort Desktop Icons
#
# Custom Commands: Desktop: Final Desktop Command
#

# set up logging function
ACTION="sort_icons"
function log {
    logger -it "$ACTION" "$1"
}

# function to sort icons
function sort_icons {
    # iterate over each .desktop file in the directory
    for file in "$desktop_dir"/*.desktop; do
        # extract the file name without numeric prefix
        file_name="$(basename $file .desktop | sed 's/^[0-9]*_//')"
        # read the session name from the .desktop file
        session_name="$(grep -Po "(?<=^Name=).*" $file | sed -e 's/ /_/g')"
        # extract the app name from the file name
        app_name="$(echo $file_name | sed 's/_[0-9]*$//')"
        # extract the session ID from the filename
        session_id="$(basename $file .desktop | grep -Po "\d+$")"
        # construct the new filename based on the sorting format
        if [ "$sorting_format" -eq 1 ]; then
            new_filename="${session_name}_${app_name}_${session_id}.desktop"
        elif [ "$sorting_format" -eq 2 ]; then
            new_filename="${app_name}_${session_name}_${session_id}.desktop"
        else
            log "Invalid sorting format specified. Exiting."
            exit 1
        fi
        # check if the filename is already in the correct format
        if [[ ! "$file" =~ "${session_name}" ]]; then
        https://kb.igel.com/en/igel-apps/current/citrix-workspace-app    if [[ "$file" =~ "cwa" ]]; then
                log "Skipping ${file##*/} as cwa shortcuts should not be renamed"
            else
                # rename the .desktop file
                mv "$file" "$desktop_dir/$new_filename"
                log "Renamed ${file##*/} to $new_filename"
            fi
        else
            log "Skipping ${file##*/} as it is already in the correct format"
        fi
    done
}

log "Starting sort_icons script"

# define the directory containing the .desktop files
desktop_dir="/userhome/Desktop"

# specify the sorting format:
# set to 1 for "sessionname_appname_sessionid.desktop"
# set to 2 for "appname_sessionname_sessionid.desktop"
sorting_format=1

# execute the sorting function at the start of the script
sort_icons

# monitor for changes in the directory
while inotifywait -qq -e create -e modify -e delete "$desktop_dir"; do
    # execute the sorting function inside the loop
    sort_icons
done
```

-----

- Set Island.io as the default browser

```bash linenums="1"
#!/bin/bash
#set -x
#trap read debug

#
# Version:
# Set Island.io as the default browser
#
# Custom Commands: Desktop: Final Desktop Command
#

ACTION="cc-desktop-3fdc-island"

# output to systemlog with ID amd tag
LOGGER="logger -it ${ACTION}"

echo "Starting" | $LOGGER

if [ -e /services/island/usr/bin/island-browser-stable ]; then
  echo "APT FOUND: /services/island/usr/bin/island-browser-stable found" | $LOGGER
  echo "Set Default Browser to Island" | $LOGGER
  xdg-settings set default-web-browser island-browser.desktop
  echo "Clear Island Browser CacheStorage" | $LOGGER
  rm -rf /userhome/.config/island/Default/Service Worker/CacheStorage/*
else
  echo "APT NOT FOUND: /services/island/usr/bin/island-browser-stable not found" | $LOGGER
fi

echo "Finished" | $LOGGER

exit 0
```

-----

- UMS Shadow to device -- How to remove --> `Currently being shadowed - Disconnect`

```bash linenums="1"
#!/bin/bash
#set -x
#trap read debug

#
# Version:
# UMS Shadow to device -- How to remove --> "Currently being shadowed - Disconnect"
#
# Custom Commands: Desktop: Final Desktop Command
#

ACTION="cc-desktop-3fdc-remove-being-shadowed"

# output to systemlog with ID amd tag
LOGGER="logger -it ${ACTION}"

echo "Starting" | $LOGGER

sed -ie '/vncmessage/d' /config/vncserver/x11vnc0

echo "Finished" | $LOGGER

exit 0
```

-----

- AVD Post Session Logoff

```bash linenums="1"
#!/bin/bash
#set -x
#trap read debug

#
# Log off device after AVD ends
#

PROCESS_NAME="igelrdp3-avd"
# seconds between checks
CHECK_INTERVAL=5

ACTION="cc-desktop-3fdc-avd-post-session_logoff"

LOGGER="logger -it ${ACTION}"

echo "Started" | $LOGGER

while true; do
  # Check if the process is running
  PID=$(pgrep -x "$PROCESS_NAME")
  if [ -n "$PID" ]; then
    echo "Found AVD Session" $PID | $LOGGER
    while pgrep -x "$PROCESS_NAME" > /dev/null; do
      echo "$PROCESS_NAME is still running..."
      sleep $CHECK_INTERVAL
    done
    #logoff
    echo "AVD Session Ended - Now Logoff" $PID | $LOGGER
    logoff
  fi
  sleep $CHECK_INTERVAL
done
```

-----

- Reboot after lock screen running for `WAIT_AFTER_START`

```bash linenums="1"
#!/bin/bash
#set -x
#trap read debug

#
# Version:
# Reboot when lock screen running for WAIT_AFTER_START
#
# Custom Commands: Desktop: Final Desktop Command
#

ACTION="cc-desktop-3fdc-reboot-after-lock-screen"

# output to systemlog with ID amd tag
LOGGER="logger -it ${ACTION}"

PROCESS_NAME="lightdm-igel-greeter"
CHECK_INTERVAL=5    # seconds between checks
WAIT_AFTER_START=300  # 5 minutes in seconds
#WAIT_AFTER_START=10  # 5 minutes in seconds

echo "Starting" | $LOGGER

while true; do
    # Check if the process is running
    PID=$(pgrep -f "$PROCESS_NAME")
    echo $PID

    if [ -n "$PID" ]; then
        echo "[$(date)] $PROCESS_NAME started with PID $PID. Waiting $WAIT_AFTER_START seconds..." | $LOGGER
        sleep "$WAIT_AFTER_START"

        # Recheck if process is still running
        PID=$(pgrep -f "$PROCESS_NAME")
        if [ -n "$PID" ]; then
            echo "[$(date)] $PROCESS_NAME still running. Reboot ..." | $LOGGER
            pkill -f ${PROCESS_NAME}
            reboot
        fi
    fi

    sleep "$CHECK_INTERVAL"
done
```

-----

-----

### Base


| Base Execution Times | Description | Basename of Scripts |
|----------------------|-------------|---------------------|
| Final initialization command | command is executed during boot, after the initialization | cc-base-4fic- |

| Name | Script |
|------|--------|
| Wrapper - Final initialization command | <a href="../Scripts/HOWTO-Custom-Commands-cc-base-4fic.sh" download>LINK to script</a> |
| Link /media/hostname to /media mount point (GParted) | <a href="../Scripts/HOWTO-Custom-Commands-cc-base-4fic-linkmediadisk.sh" download>LINK to script</a> |

-----

- Wrapper - Final Base initialization command

```bash linenums="1"
#!/bin/bash
#set -x
#trap read debug

#
# Version: 
# Run all Final Base Initialization Commands
#
# Custom Commands: Base: Final Initialization Command
#

ACTION="cc-base-4fic"

# output to systemlog with ID amd tag
LOGGER="logger -it ${ACTION}"

echo "Starting" | $LOGGER

# run all final desktop scripts
ls /wfs/cc-base-4fic-*.sh | while read LINE
  do
  echo "Starting: ${LINE}" | $LOGGER
  $LINE &
  done

echo "Finished" | $LOGGER

exit 0
```

-----

- Link /media/hostname to /media mount point (GParted)

```bash linenums="1"
#!/bin/bash
#set -x
#trap read debug

# 
# Custom Commands: Base: Final Initialization Command
#
# After using GParted to format rest of desk
#
# Link /media/hostname to /media mount point
# 

ACTION="cc-base-4fic-linkmediadisk"

# output to systemlog with ID amd tag
LOGGER="logger -it ${ACTION}"

MOUNTPOINT=$(mount | grep "/media" | cut -d " " -f 3)
NEWLINK="/media/$(hostname)"

# exit if no media mount point
if [ "${MOUNTPOINT}" == "" ]; then
  echo "No media mount point to link to." | $LOGGER
  exit 0
fi

if [ -L ${NEWLINK} ]; then
  echo "Unlinking ${NEWLINK}" | $LOGGER
  unlink ${NEWLINK} | $LOGGER
elif [  -d ${NEWLINK} ]; then
  echo "${NEWLINK} is a directory. Not linking ${NEWLINK} to ${MOUNTPOINT}" | $LOGGER
  exit 1
fi

ln -svf ${MOUNTPOINT} ${NEWLINK} | $LOGGER
```
