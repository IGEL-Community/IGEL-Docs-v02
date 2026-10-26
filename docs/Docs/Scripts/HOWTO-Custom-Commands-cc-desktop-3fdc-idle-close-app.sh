#!/bin/bash
#set -x
#trap read debug

#
# Version:
# Close an application (and optionally clear its profile) after the desktop has been idle for IDLE_LIMIT seconds
#
# Custom Commands: Desktop: Final Desktop Command
#

ACTION="cc-desktop-3fdc-idle-close-app"

# Send all stdout/stderr from this script to journald/syslog
exec > >(logger -t "$ACTION") 2>&1

# Application to close (matched with pgrep -f) and its profile / config folder
# Microsoft Edge:  APP_NAME="msedge"            APP_CONFIG="/userhome/.config/microsoft-edge"
# Chromium:        APP_NAME="chromium-browser"  APP_CONFIG="/userhome/.config/chromium"
APP_NAME="msedge"
APP_CONFIG="/userhome/.config/microsoft-edge"
# TRUE = remove the contents of APP_CONFIG after closing the application
CLEAR_CONFIG="FALSE"
IDLE_LIMIT=300      # idle time limit in seconds (5 minutes)
CHECK_INTERVAL=5    # seconds between checks

CLOSED=false

echo "Starting: close ${APP_NAME} after ${IDLE_LIMIT} seconds idle"

while true; do
  # xprintidle returns the X idle time in milliseconds
  IDLE_MS=$(DISPLAY=:0 /usr/bin/xprintidle 2>/dev/null) || IDLE_MS=0
  IDLE_TIME=$(( ${IDLE_MS:-0} / 1000 ))
  if [ "$IDLE_TIME" -ge "$IDLE_LIMIT" ]; then
    if [ "$CLOSED" = false ] && pgrep -f "${APP_NAME}" > /dev/null; then
      echo "Idle for ${IDLE_TIME} seconds - closing ${APP_NAME}"
      pkill -9 -f "${APP_NAME}"
      if [ "${CLEAR_CONFIG}" = "TRUE" ]; then
        echo "Clearing ${APP_CONFIG}"
        rm -rf "${APP_CONFIG:?}"/*
      fi
      CLOSED=true
    fi
  else
    CLOSED=false
  fi
  sleep "$CHECK_INTERVAL"
done
