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
| Add CUPS Network Printers | <a href="../Scripts/HOWTO-Custom-Commands-cc-desktop-3fdc-cupsnetworkprinters.sh" download>LINK to Profile</a> |

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

-----

### Base

| Base Execution Times | Description | Basename of Scripts |
|-------------------------|-------------|----------------------
| Final initialization command | command is executed during boot, after the initialization | cc-base-4fic- |

| Name | Script |
|-------------|---------|
| Wrapper - Final initialization command | <a href="../Scripts/HOWTO-Custom-Commands-cc-base-4fic.sh" download>LINK to Profile</a> |
| Rename rest of disk partition (GParted) | <a href="../Scripts/HOWTO-Custom-Commands-cc-base-4fic-renamerestofdisk.sh" download>LINK to Profile</a> |

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
  $LINE & | $LOGGER
  done

echo "Finished" | $LOGGER

exit 0
```

- Rename rest of disk partition (GParted)

```bash linenums="1"
#!/bin/bash
#set -x
#trap read debug

# 
# After using GParted to format rest of desk
#
# Change /media mount point to be hostname
# 

ACTION="cc-base-4fic"

# output to systemlog with ID amd tag
LOGGER="logger -it ${ACTION}"

MOUNTPOINT=$(ls /media)
NEWMP="/media/$(hostname)"

if [ "${MOUNTPOINT}" != "$(hostname)" ]; then
 MOUNTDEV=$(df -H | grep media | cut -d " " -f 1)
 umount ${MOUNTDEV} | $LOGGER
 if [ ! -e ${NEWMP} ]; then
   mkdir -p "${NEWMP}" | $LOGGER
 fi
 mount ${MOUNTDEV} ${NEWMP} | $LOGGER
fi
```