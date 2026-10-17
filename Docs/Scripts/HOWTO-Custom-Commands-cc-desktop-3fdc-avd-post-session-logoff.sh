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

# Send all stdout/stderr from this script to journald/syslog
exec > >(logger -t "$ACTION") 2>&1

echo "Started"

while true; do
  # Check if the process is running
  PID=$(pgrep -x "$PROCESS_NAME")
  if [ -n "$PID" ]; then
    echo "Found AVD Session" $PID
    while pgrep -x "$PROCESS_NAME" > /dev/null; do
      echo "$PROCESS_NAME is still running..."
      sleep $CHECK_INTERVAL
    done
    #logoff
    echo "AVD Session Ended - Now Logoff" $PID
    logoff
  fi
  sleep $CHECK_INTERVAL
done
