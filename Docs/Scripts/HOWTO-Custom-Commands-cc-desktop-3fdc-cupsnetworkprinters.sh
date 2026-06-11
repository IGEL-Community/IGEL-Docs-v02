#!/bin/bash
#set -x
#trap read debug

#
# Version: Mon Jun  9 14:26:23 MDT 2025
# Add CUPS network printers
#
# Custom Commands: Desktop: Final Desktop Command
#

ACTION="cc-desktop-3fdc-cupsnetworkprinters"

COUNT=1

# output to systemlog with ID amd tag
LOGGER="logger -it ${ACTION}"

echo "Starting" | $LOGGER

if [ ! -e /usr/lib/cups/backend/snmp ]; then
  echo "ERROR: CUPS not installed. Please install CUPS app" | $LOGGER
fi

# create network printers from /usr/lib/cups/backend/snmp
/usr/lib/cups/backend/snmp | while read LINE
  do
    URI=ipp://`echo "${LINE}" | awk --field-separator " " '{print $2}' | sed -e 's|^.*//||' -e 's|[:/].*||'`/ipp/print
    lpadmin -p wifiprinter${COUNT} -E -v $URI -m everywhere | $LOGGER
    if [ ${COUNT} -eq 1 ]; then
      lpoptions -d wifiprinter${COUNT} | $LOGGER
    fi
    COUNT=$COUNT+1
  done

echo "Finished" | $LOGGER

exit 0