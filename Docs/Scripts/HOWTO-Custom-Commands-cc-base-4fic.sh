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

# Send all stdout/stderr from this script to journald/syslog
exec > >(logger -t "$ACTION") 2>&1

echo "Starting"

# run all final base scripts
ls /wfs/cc-base-4fic-*.sh | while read LINE
  do
  echo "Starting: ${LINE}"
  $LINE &
  done

echo "Finished"

exit 0