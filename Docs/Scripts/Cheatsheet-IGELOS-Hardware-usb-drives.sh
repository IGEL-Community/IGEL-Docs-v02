#!/bin/bash
#
# usb-drives.sh — list and monitor USB-attached block devices
#
# Usage:
#   ./usb-drives.sh            # one-time list
#   ./usb-drives.sh --watch    # live monitor & refresh on add/remove
#   ./usb-drives.sh --help     # help
#
# Dependencies: bash, lsblk, udevadm (for --watch)
set -euo pipefail

print_help() {
  cat <<'EOF'
usb-drives.sh — show USB-attached drives (disks & partitions)

Options:
  --watch        Monitor for add/remove events and refresh the list
  --help         Show this help

Notes:
  * The listing shows only devices whose transport is USB.
  * In --watch mode, udevadm is required (present on most Linux distros).
EOF
}

have() { command -v "$1" >/dev/null 2>&1; }

# Pretty list of current USB drives/partitions
list_usb() {
  # Try to use lsblk's TRAN column (works on modern util-linux)
  if lsblk -o NAME,TYPE,SIZE,TRAN,MOUNTPOINT,LABEL,MODEL,SERIAL &>/dev/null; then
    # Filter rows where TRAN == usb, keep parent->child hierarchy
    # We'll produce a tree but drop non-USB transports.
    # Use JSON to filter reliably, then format.
    if have jq && lsblk -J &>/dev/null; then
      # JSON path filter when jq is available (best formatting)
      lsblk -J -O \
        | jq -r '
          def walkblk:
            . as $n
            | if ($n | has("children")) and ($n.children|length>0)
              then [$n, ($n.children[]|walkblk[])]
              else [$n]
              end;
          .blockdevices
          | map(walkblk[]) | .[]
          | select((.tran // "") == "usb")
          | "\(.name)\t\(.type)\t\(.size)\t\(.mountpoint // "-")\t\(.label // "-")\t\(.model // "-")\t\(.serial // "-")"
        ' \
        | awk 'BEGIN{printf("%-20s %-10s %-8s %-20s %-20s %-25s %-20s\n","NAME","TYPE","SIZE","MOUNTPOINT","LABEL","MODEL","SERIAL");
                      line=sprintf("%130s",""); gsub(/ /,"-",line); print line}{
                      printf("%-20s %-10s %-8s %-20s %-20s %-25s %-20s\n",$1,$2,$3,$4,$5,$6,$7)}'
    else
      # Fallback: rely on columns, then awk filter by TRAN
      printf "%-20s %-10s %-8s %-20s %-20s %-25s %-20s\n" "NAME" "TYPE" "SIZE" "MOUNTPOINT" "LABEL" "MODEL" "SERIAL"
      printf "%0*s\n" 130 "-" | tr ' ' '-'
      lsblk -r -o NAME,TYPE,SIZE,TRAN,MOUNTPOINT,LABEL,MODEL,SERIAL \
        | awk '$4=="usb"{
                 printf("%-20s %-10s %-8s %-20s %-20s %-25s %-20s\n",$1,$2,$3, ($5==""?"-":$5), ($6==""?"-":$6), ($7==""?"-":$7), ($8==""?"-":$8))
               }'
    fi
  else
    # Very old util-linux: fall back to sysfs scan
    echo "lsblk without required columns; falling back to sysfs…" >&2
    printf "%-20s %-10s %-8s %-20s %-20s %-25s %-20s\n" "NAME" "TYPE" "SIZE" "MOUNTPOINT" "LABEL" "MODEL" "SERIAL"
    printf "%0*s\n" 130 "-" | tr ' ' '-'
    for b in /sys/block/*; do
      dev=$(basename "$b")
      # Check if device is under a USB bus
      if readlink -f "$b" | grep -q '/usb'; then
        size_blocks=$(<"$b/size")
        # 512-byte logical sectors are common; handle missing too
        if [[ -r "$b/queue/logical_block_size" ]]; then
          lbs=$(<"$b/queue/logical_block_size")
        else
          lbs=512
        fi
        bytes=$(( size_blocks * lbs ))
        # human size
        if have numfmt; then
          sz=$(numfmt --to=iec --suffix=B "$bytes")
        else
          sz="${bytes}B"
        fi
        mp=$(lsblk -no MOUNTPOINT "/dev/$dev" 2>/dev/null | head -n1)
        lbl=$(lsblk -no LABEL "/dev/$dev" 2>/dev/null | head -n1)
        mdl=$(cat "$b/device/model" 2>/dev/null || echo "-")
        ser=$(cat "$b/device/serial" 2>/dev/null || echo "-")
        printf "%-20s %-10s %-8s %-20s %-20s %-25s %-20s\n" "$dev" "disk" "$sz" "${mp:--}" "${lbl:--}" "$mdl" "$ser"
        # partitions
        for p in "$b"/"$dev"[0-9]*; do
          [[ -e "$p" ]] || continue
          part=$(basename "$p")
          mp=$(lsblk -no MOUNTPOINT "/dev/$part" 2>/dev/null | head -n1)
          lbl=$(lsblk -no LABEL "/dev/$part" 2>/dev/null | head -n1)
          psz=$(lsblk -no SIZE "/dev/$part" 2>/dev/null)
          printf "%-20s %-10s %-8s %-20s %-20s %-25s %-20s\n" "$part" "part" "${psz:--}" "${mp:--}" "${lbl:--}" "-" "-"
        done
      fi
    done
  fi
}

banner() {
  echo
  echo "USB-attached block devices @ $(date '+%Y-%m-%d %H:%M:%S %Z')"
  echo "----------------------------------------------------------------------------------------------------------------------------------"
}

watch_mode() {
  if ! have udevadm; then
    echo "Error: --watch requires 'udevadm' (not found in PATH)." >&2
    exit 1
  fi

  # Start monitor; parse ACTION/DEVNAME/ID_BUS blocks and refresh on USB add/remove
  udevadm monitor --udev --subsystem-match=block --property \
  | awk -v RS= -v ORS="" '
      function refresh() { system("clear"); print ""; system("printf \"Change detected: refreshing...\\n\""); system("bash -c \"'"$0"' list\""); }
      /(^|\n)ACTION=/ {
        action=""; devname=""; idbus=""; devtype="";
        n=split($0, lines, "\n");
        for (i=1; i<=n; i++) {
          if (lines[i] ~ /^ACTION=/)   { sub(/^ACTION=/,"",lines[i]); action=lines[i]; }
          else if (lines[i] ~ /^DEVNAME=/){ sub(/^DEVNAME=/,"",lines[i]); devname=lines[i]; }
          else if (lines[i] ~ /^ID_BUS=/) { sub(/^ID_BUS=/,"",lines[i]); idbus=lines[i]; }
          else if (lines[i] ~ /^DEVTYPE=/){ sub(/^DEVTYPE=/,"",lines[i]); devtype=lines[i]; }
        }
        if ((action=="add" || action=="remove") && idbus=="usb") {
          # trigger a refresh
          system("bash -c \"clear; echo; echo \\\"Event: " action " " devname " (" devtype ")\\\";\"");
          system("bash -c \"'"$0"' list\"");
          print "\n";
        }
      }' list="$0 list"
}

# Subcommand shim so awk can call back into this script in watch mode
if [[ "${1-}" == "list" ]]; then
  banner
  list_usb
  exit 0
fi

case "${1-}" in
  --help|-h)
    print_help
    ;;
  --watch)
    banner
    list_usb
    echo
    echo "Monitoring for USB add/remove events (Ctrl-C to quit)…"
    watch_mode
    ;;
  "" )
    banner
    list_usb
    ;;
  * )
    echo "Unknown option: $1" >&2
    print_help
    exit 2
    ;;
esac
