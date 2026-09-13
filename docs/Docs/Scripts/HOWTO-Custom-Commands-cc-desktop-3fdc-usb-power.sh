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

# Send all stdout/stderr from this script to journald/syslog
exec > >(logger -t "$ACTION") 2>&1

echo "Starting"

echo on | tee /sys/bus/usb/devices/*/power/level > /dev/null

echo "Finished"

exit 0
