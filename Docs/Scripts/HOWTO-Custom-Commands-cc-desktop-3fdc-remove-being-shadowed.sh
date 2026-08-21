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
