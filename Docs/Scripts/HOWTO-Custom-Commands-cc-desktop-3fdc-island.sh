#!/bin/bash
#set -x
#trap read debug

#
# Version: Mon Oct 20 12:23:17 PM MDT 2025
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
  rm -rf /userhome/.config/island/Default/Service\ Worker/CacheStorage/*
else
  echo "APT NOT FOUND: /services/island/usr/bin/island-browser-stable not found" | $LOGGER
fi

echo "Finished" | $LOGGER

exit 0
