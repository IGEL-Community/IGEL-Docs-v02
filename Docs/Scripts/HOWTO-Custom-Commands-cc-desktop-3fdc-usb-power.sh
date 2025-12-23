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
