# HOWTO Custom Commands

-----

-----

<!--
Comments
-->

## Custom Commands in IGEL OS 12

Custom commands are executed at specific points of the system startup process.

- [IGEL KB: Custom Commands in IGEL OS 12](https://kb.igel.com/en/igel-os-base-system/12.4/custom-commands-in-igel-os-12)

    - **Base:** The commands defined here are executed at the specific execution times during the boot process. [IGEL KB: Base Custom Commands in IGEL OS 12](https://kb.igel.com/en/igel-os-base-system/12.4/base-custom-commands-in-igel-os-12)

    - **Network:** Commands for network-related execution times. [IGEL KB: Network Custom Commands in IGEL OS 12](https://kb.igel.com/en/igel-os-base-system/12.4/network-custom-commands-in-igel-os-12)

    - **Desktop:** Commands are executed at the specific execution times when the X server is launched. [IGEL KB: Desktop](https://kb.igel.com/en/igel-os-base-system/12.4/desktop-1)

Since multiple profiles with custom commands can overwrite each other, a method for combining custom commands is needed.

## Method for Managing Custom Commands

A profile can be setup with a wrapper script to look for custom command scripts. The wrapper script looks for related scripts.

- Use UMS Files to deploy the scripts to IGEL OS
- Create profile for Custom Commands that call the wrapper scripts

-----

-----

### Desktop

| Desktop Execution Times | Description | Basename of Scripts |
|-------------------------|-------------|----------------------
| Desktop initialization | Executed during the boot process, before the X server is started | cc-desktop-1ini- |
| Before desktop start | The command is executed before the windowmanager and the autostart sessions are started. | cc-desktop-2bds- |
| Final desktop command | The command is executed after each user logon and desktop restart | cc-desktop-3fdc- |

| Name | Script |
|-------------|---------|
| Wrapper - Final desktop command | <a href="../Scripts/HOWTO-Custom-Commands-cc-desktop-3fdc.sh" download>LINK to Profile</a> |
| Sort Desktop Icons | <a href="../Scripts/HOWTO-Custom-Commands-cc-desktop-3fdc-sorticons.sh" download>LINK to Profile</a> |
| Add CUPS Network Printers | <a href="../Scripts/HOWTO-Custom-Commands-cc-desktop-3fdc-cupsnetworkprinters.sh" download>LINK to Profile</a> |

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

COUNT=1

# output to systemlog with ID amd tag
LOGGER="logger -it ${ACTION}"

echo "Starting" | $LOGGER

# run all final desktop scripts
ls /wfs/cc-desktop-3fdc-*.sh | while read LINE
  do
  echo "Starting: ${LINE}" | $LOGGER
  $LINE & | $LOGGER
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
            if [[ "$file" =~ "cwa" ]]; then
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

-----

### Base

| Base Execution Times | Description | Basename of Scripts |
|-------------------------|-------------|----------------------
| Final initialization command | command is executed during boot, after the initialization | cc-base-4fic- |

| Name | Script |
|-------------|---------|
| Wrapper - Final initialization command | <a href="../Scripts/HOWTO-Custom-Commands-cc-base-4fic.sh" download>LINK to Profile</a> |
| Link /media/hostname to /media mount point (GParted) | <a href="../Scripts/HOWTO-Custom-Commands-cc-base-4fic-linkmediadisk.sh" download>LINK to Profile</a> |

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
# Custom Commands: Desktop: Final Desktop Command
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