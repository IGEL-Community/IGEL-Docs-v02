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

# Send all stdout/stderr from this script to journald/syslog
exec > >(logger -t "$ACTION") 2>&1

echo "Starting"

# run all final desktop scripts
ls /wfs/cc-desktop-3fdc-*.sh | while read LINE
  do
  echo "Starting: ${LINE}"
  $LINE &
  done

echo "Finished"

exit 0