#!/bin/bash
#set -x
#trap read debug

#
# Version: Tue Mar 17 10:17:19 AM MDT 2026
#
# Custom Commands: Desktop: Final Desktop Command
#

ACTION="cc-desktop-3fdc-terminal"

# output to systemlog with ID amd tag
LOGGER="logger -it ${ACTION}"

echo "Starting" | $LOGGER

if [ ! -e /wfs/terminalrc ]; then
  echo "Terminal settings not found. Creating terminal settings" | $LOGGER
  cat << "EOF" > /wfs/terminalrc
ColorForeground=#FFFFFF
ColorBackground=#000000
ColorCursor=#FFFFFF
ColorPalette=#000000;#AA0000;#00AA00;#AA5500;#0000AA;#AA00AA;#00AAAA;#AAAAAA;#555555;#FF5555;#55FF55;#FFFF55;#5555FF;#FF55FF;#55FFFF;#FFFFFF
EOF
else
  echo "Terminal settings found." | $LOGGER
fi

chmod a+r /wfs/terminalrc
ln -svf /wfs/terminalrc /userhome/.config/xfce4/terminal/terminalrc | $LOGGER

echo "Finished" | $LOGGER

exit 0

