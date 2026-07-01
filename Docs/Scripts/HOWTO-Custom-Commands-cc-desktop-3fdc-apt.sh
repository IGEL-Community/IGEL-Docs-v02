#!/bin/bash
#set -x
#trap read debug

#
# Version: Fri Oct  3 03:23:50 PM MDT 2025
# Setup apt from Ubuntu system tar file
#
# Custom Commands: Desktop: Final Desktop Command
#

ACTION="cc-desktop-3fdc-apt"

# output to systemlog with ID amd tag
LOGGER="logger -it ${ACTION}"

echo "Starting" | $LOGGER

if [ -d /etc/apt ]; then
  echo "APT FOUND: /etc/apt folder found" | $LOGGER

  if [ -e /wfs/etc-apt-file.tar.bz2 ]; then
    echo "APT EXTRACT: extracting etc-apt-file.tar.bz2" | $LOGGER
    tar xvf /media/ITC10B6762436B2/Code/igelpkg/etc-apt-file.tar.bz2 -C /etc/apt
    /services/igelpkg/usr/bin/apt update
  else
    echo "ERROR: etc-apt-file.tar.bz2 does not exist" | $LOGGER
  fi 
else
  echo "APT NOT FOUND: /etc/apt folder not found" | $LOGGER
fi

echo "Finished" | $LOGGER

exit 0
