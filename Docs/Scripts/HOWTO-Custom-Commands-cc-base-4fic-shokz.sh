#!/bin/bash
#set -x
#trap read debug

# 
# Custom Commands: Desktop: Final Desktop Command
#
# Shokz shutdown fix found in 12.8.0-12.8.4 12.9.0
#

ACTION="cc-base-4fic-shokz"

# Send all stdout/stderr from this script to journald/syslog
exec > >(logger -t "$ACTION") 2>&1

echo "Starting"

# Get IGEL OS version from /etc/os-release
IGEL_VERSION=$(sed -n 's/^VERSION="\([^"]*\)"/\1/p' /etc/os-release)

MIN_VERSION="12.8.0"

echo "IGEL OS version: $IGEL_VERSION"

if [ "$(printf '%s\n' "$MIN_VERSION" "$IGEL_VERSION" | sort -V | head -n1)" = "$MIN_VERSION" ]; then
    echo "IGEL OS version is greater than or equal to 12.8.x"
    printf '%s\n' 'ACTION!="remove", SUBSYSTEM=="input", KERNEL=="event*", ENV{ID_VENDOR_ID}=="3511", ENV{ID_MODEL_ID}=="2b0a|2b1e|2f06", ENV{ID_INPUT_KEY}="0"' > /etc/udev/rules.d/69-shokz-no-power-switch.rules
    udevadm control --reload-rules
else
    echo "IGEL OS version is less than 12.8.x"
    echo "Shokz fix not required for IGEL OS < 12.8.x"
    printf '%s\n' 'ACTION!="remove", SUBSYSTEM=="input", KERNEL=="event*", ENV{ID_VENDOR_ID}=="3511", ENV{ID_MODEL_ID}=="2b0a|2b1e|2f06", ENV{ID_INPUT_KEY}="0"'
fi

echo "Finished"