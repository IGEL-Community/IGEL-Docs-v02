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

# Send all stdout/stderr from this script to journald/syslog
exec > >(logger -t "$ACTION") 2>&1

COUNT=1

echo "Starting"

if [ ! -e /usr/lib/cups/backend/snmp ]; then
  echo "ERROR: CUPS not installed. Please install CUPS app"
fi

# create network printers from /usr/lib/cups/backend/snmp
/usr/lib/cups/backend/snmp | while read LINE
  do
    URI=ipp://`echo "${LINE}" | awk --field-separator " " '{print $2}' | sed -e 's|^.*//||' -e 's|[:/].*||'`/ipp/print
    lpadmin -p wifiprinter${COUNT} -E -v $URI -m everywhere
    if [ ${COUNT} -eq 1 ]; then
      lpoptions -d wifiprinter${COUNT}
    fi
    COUNT=$COUNT+1
  done

echo "Finished"

exit 0