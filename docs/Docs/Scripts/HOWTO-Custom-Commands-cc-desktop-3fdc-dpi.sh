#!/bin/bash
#set -x
#trap read debug

#
# Version:
# Ask the user to choose the display DPI (first desktop start only)
#
# Custom Commands: Desktop: Final Desktop Command
#

ACTION="cc-desktop-3fdc-dpi"

# Send all stdout/stderr from this script to journald/syslog
exec > >(logger -t "$ACTION") 2>&1

export DISPLAY=:0

# Remove this file to ask for the DPI again at the next desktop start
MARKER="/wfs/.cc-desktop-3fdc-dpi-done"
# Start the slider at the current DPI (96 if not set)
DEFAULT_DPI=$(getsysvalue x.xserver0.dpi 2>/dev/null)
DEFAULT_DPI=${DEFAULT_DPI:-96}

echo "Starting"

if [ -e "${MARKER}" ]; then
  echo "DPI already chosen (${MARKER} exists) - nothing to do"
  exit 0
fi

DPI=$(zenity --scale --title="Display DPI" --text="Please choose the DPI scale (96 default)" \
  --min-value=30 --max-value=300 --step=5 --value=${DEFAULT_DPI})

if [ -z "${DPI}" ]; then
  echo "No DPI selected (dialog cancelled)"
  exit 0
fi

echo "Setting DPI to ${DPI}"
setparam x.xserver0.auto_dpi off && setparam x.xserver0.dpi "${DPI}" && /usr/bin/wmrefresh
touch "${MARKER}"

echo "Finished"

exit 0
