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

LICENSE_FILE="/wfs/license-hw.lic"
UNIT_ID=$(get_unit_id)

echo "Starting" | $LOGGER

if [[ -f ${LICENSE_FILE} && $(grep -q ${UNIT_ID} ${LICENSE_FILE}; echo $?) -eq 0 ]]; then
echo "File ${LICENSE_FILE} exists and contains ${UNIT_ID}: Licensing device"
install_igel_license ${LICENSE_FILE}
else
echo "File ${LICENSE_FILE} does not exist or does not contain ${UNIT_ID}: Not Licensing device"
fi

echo "Finished" | $LOGGER

exit 0
