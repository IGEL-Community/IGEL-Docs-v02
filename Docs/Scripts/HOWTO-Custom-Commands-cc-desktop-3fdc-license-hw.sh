#!/bin/bash
#set -x
#trap read debug

#
# Version: 
# License Hardware
# System > Firmware Customization > Custom Commands > Desktop
#
# Custom Commands: Desktop: Final Desktop Command
#

ACTION="cc-desktop-3fdc-license-hw"

# Send all stdout/stderr from this script to journald/syslog
exec > >(logger -t "$ACTION") 2>&1

shopt -s nullglob

LICENSE_FILES=(/wfs/license-hw-*.lic)
UNIT_ID=$(get_unit_id)

echo "Starting"

if (( ${#LICENSE_FILES[@]} == 0 )); then
    echo "No license files found matching /wfs/license-hw-*.lic"
    echo "Finished"
    exit 0
fi

FOUND=0

for LICENSE_FILE in "${LICENSE_FILES[@]}"; do
    echo "Checking ${LICENSE_FILE}"

    if sed '/macaddress/s/://g' "${LICENSE_FILE}" | grep -q "${UNIT_ID}"; then
        echo "File ${LICENSE_FILE} contains ${UNIT_ID}: Licensing device"
        install_igel_license "${LICENSE_FILE}"
        FOUND=1
    fi
done

if (( ! FOUND )); then
    echo "No matching license file contains ${UNIT_ID}: Not Licensing device"
fi

echo "Finished"

exit 0