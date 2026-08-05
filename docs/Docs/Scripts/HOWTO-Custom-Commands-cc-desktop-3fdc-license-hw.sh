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

# output to systemlog with ID amd tag
LOGGER="logger -it ${ACTION}"

shopt -s nullglob

LICENSE_FILES=(/wfs/license-hw-*.lic)
UNIT_ID=$(get_unit_id)

echo "Starting" | $LOGGER

if (( ${#LICENSE_FILES[@]} == 0 )); then
    echo "No license files found matching /wfs/license-hw-*.lic" | $LOGGER
    echo "Finished" | $LOGGER
    exit 0
fi

FOUND=0

for LICENSE_FILE in "${LICENSE_FILES[@]}"; do
    echo "Checking ${LICENSE_FILE}" | $LOGGER

    if sed '/macaddress/s/://g' "${LICENSE_FILE}" | grep -q "${UNIT_ID}"; then
        echo "File ${LICENSE_FILE} contains ${UNIT_ID}: Licensing device" | $LOGGER
        install_igel_license "${LICENSE_FILE}"
        FOUND=1
    fi
done

if (( ! FOUND )); then
    echo "No matching license file contains ${UNIT_ID}: Not Licensing device" | $LOGGER
fi

echo "Finished" | $LOGGER

exit 0