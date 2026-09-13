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

# Send all stdout/stderr from this script to journald/syslog
exec > >(logger -t "$ACTION") 2>&1

MOUNTPOINT=$(mount | grep "/media" | cut -d " " -f 3)
NEWLINK="/media/$(hostname)"

# exit if no media mount point
if [ "${MOUNTPOINT}" == "" ]; then
  echo "No media mount point to link to."
  exit 0
fi

if [ -L ${NEWLINK} ]; then
  echo "Unlinking ${NEWLINK}"
  unlink ${NEWLINK}
elif [  -d ${NEWLINK} ]; then
  echo "${NEWLINK} is a directory. Not linking ${NEWLINK} to ${MOUNTPOINT}"
  exit 1
fi

ln -svf ${MOUNTPOINT} ${NEWLINK}