#!/bin/bash
#set -x
#trap read debug

#
# Version: Tue Mar 17 10:17:19 AM MDT 2026
#
# Custom Commands: Desktop: Final Desktop Command
#

ACTION="cc-desktop-3fdc-terminal"

# Send all stdout/stderr from this script to journald/syslog
exec > >(logger -t "$ACTION") 2>&1

echo "Starting"

if [ -e /wfs/terminalrc ]; then
  echo "Terminal settings found and removed"
  rm -f /wfs/terminalrc
fi

cat << "EOF" > /wfs/terminalrc
ColorForeground=#FFFFFF
ColorBackground=#000000
ColorCursor=#FFFFFF
ColorPalette=#000000;#AA0000;#00AA00;#AA5500;#0000AA;#AA00AA;#00AAAA;#AAAAAA;#555555;#FF5555;#55FF55;#FFFF55;#5555FF;#FF55FF;#55FFFF;#FFFFFF
EOF

chmod a+r /wfs/terminalrc
mkdir -p /userhome/.config/xfce4/terminal
chown -R user:users /userhome/.config/xfce4
ln -svf /wfs/terminalrc /userhome/.config/xfce4/terminal/terminalrc

echo "Finished"

exit 0

