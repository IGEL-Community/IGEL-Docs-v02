#!/bin/bash
#set -x
#trap read debug

#
# Log off device after AVD ends
#

PROCESS_NAME="igelrdp3-avd"
# seconds between checks
CHECK_INTERVAL=5

ACTION="cc-desktop-3fdc-avd-post-session_logoff"
LOGGER="logger -it ${ACTION}"

echo "Started" | $LOGGER

while true; do
  # Check if the process is running
  PID=$(pgrep -x "$PROCESS_NAME")
  if [ -n "$PID" ]; then
    echo "Found AVD Session" $PID | $LOGGER
    while pgrep -x "$PROCESS_NAME" > /dev/null; do
      echo "$PROCESS_NAME is still running..."
      sleep $CHECK_INTERVAL
    done
    #logoff
    echo "AVD Session Ended - Now Logoff" $PID | $LOGGER
    logoff
  fi
  sleep $CHECK_INTERVAL
done
