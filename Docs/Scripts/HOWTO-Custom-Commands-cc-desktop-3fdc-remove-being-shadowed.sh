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

# Send all stdout/stderr from this script to journald/syslog
exec > >(logger -t "$ACTION") 2>&1

echo "Starting"

sed -ie '/vncmessage/d' /config/vncserver/x11vnc0

echo "Finished"
