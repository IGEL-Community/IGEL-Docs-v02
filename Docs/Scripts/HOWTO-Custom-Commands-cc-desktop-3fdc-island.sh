#!/bin/bash
#set -x
#trap read debug

#
# Version: Mon Oct 20 12:23:17 PM MDT 2025
#
# Custom Commands: Desktop: Final Desktop Command
#

ACTION="cc-desktop-3fdc-island"

# Send all stdout/stderr from this script to journald/syslog
exec > >(logger -t "$ACTION") 2>&1

echo "Starting"

if [ -e /services/island/usr/bin/island-browser-stable ]; then
  echo "APT FOUND: /services/island/usr/bin/island-browser-stable found"
  echo "Set Default Browser to Island"
  xdg-settings set default-web-browser island-browser.desktop
  echo "Clear Island Browser CacheStorage"
  rm -rf /userhome/.config/island/Default/Service\ Worker/CacheStorage/*
else
  echo "APT NOT FOUND: /services/island/usr/bin/island-browser-stable not found"
fi

echo "Finished"

exit 0
