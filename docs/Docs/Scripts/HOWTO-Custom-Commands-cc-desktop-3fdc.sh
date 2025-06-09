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

COUNT=1

# output to systemlog with ID amd tag
LOGGER="logger -it ${ACTION}"

echo "Starting" | $LOGGER

# run all final desktop scripts
ls /wfs/cc-desktop-3fdc-*.sh | while read LINE
  do
  echo "Starting: ${LINE}" | $LOGGER
  $LINE & | $LOGGER
  done

echo "Finished" | $LOGGER

exit 0