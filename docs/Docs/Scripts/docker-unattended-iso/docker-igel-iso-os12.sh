#!/bin/bash
#set -x
#trap read debug

# Called by run-docker.sh

cd newiso

genisoimage -r -U -V 'IGEL_OSC_TO' \
  -o "../OSC_version.unattended.iso" \
  -c boot/isolinux/boot.cat -b boot/isolinux/isolinux.bin \
  -boot-load-size 4 -boot-info-table -no-emul-boot \
  -eltorito-alt-boot -e igel_efi.img -no-emul-boot .

cd ..

isohybrid --uefi OSC_version.unattended.iso
