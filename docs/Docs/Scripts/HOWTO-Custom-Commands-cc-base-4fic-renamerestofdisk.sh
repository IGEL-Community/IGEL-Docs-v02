#!/bin/bash
#set -x
#trap read debug

# 
# Custom Commands: Desktop: Final Desktop Command
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