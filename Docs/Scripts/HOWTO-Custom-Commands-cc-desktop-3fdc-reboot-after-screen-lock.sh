#!/bin/bash
#set -x
#trap read debug

#
# Version:
# Reboot when lock screen running for WAIT_AFTER_START
#
# Custom Commands: Desktop: Final Desktop Command
#

ACTION="cc-desktop-3fdc-reboot-after-lock-screen"

# output to systemlog with ID amd tag
LOGGER="logger -it ${ACTION}"

PROCESS_NAME="lightdm-igel-greeter"
CHECK_INTERVAL=5    # seconds between checks
WAIT_AFTER_START=300  # 5 minutes in seconds
#WAIT_AFTER_START=10  # 5 minutes in seconds

echo "Starting" | $LOGGER

while true; do
    # Check if the process is running
    PID=$(pgrep -f "$PROCESS_NAME")
    echo $PID

    if [ -n "$PID" ]; then
        echo "[$(date)] $PROCESS_NAME started with PID $PID. Waiting $WAIT_AFTER_START seconds..." | $LOGGER
        sleep "$WAIT_AFTER_START"

        # Recheck if process is still running
        PID=$(pgrep -f "$PROCESS_NAME")
        if [ -n "$PID" ]; then
            echo "[$(date)] $PROCESS_NAME still running. Reboot ..." | $LOGGER
            pkill -f ${PROCESS_NAME}
            reboot
        fi
    fi

    sleep "$CHECK_INTERVAL"
done
