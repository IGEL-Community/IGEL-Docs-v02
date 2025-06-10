#!/bin/bash
#set -x
#trap read debug

#
# Version: 
# Run all Final initialization Commands
#
# Custom Commands: Base: Final initialization Command
#

ACTION="cc-base-4fic"

# output to systemlog with ID amd tag
LOGGER="logger -it ${ACTION}"

echo "Starting" | $LOGGER

# run all final base scripts
ls /wfs/cc-base-4fic-*.sh | while read LINE
  do
  echo "Starting: ${LINE}" | $LOGGER
  $LINE &
  done

echo "Finished" | $LOGGER

exit 0