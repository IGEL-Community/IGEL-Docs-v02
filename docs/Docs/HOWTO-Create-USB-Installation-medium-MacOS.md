# HOWTO Create USB installation medium (MacOS)

## IGEL OS Creator Manual

### [Create USB installation medium (Windows)](https://kb.igel.com/igelos-11.08/en/create-usb-installation-medium-windows-63805122.html)

### [Create USB installation medium (Linux)](https://kb.igel.com/igelos-11.08/en/create-usb-installation-medium-linux-63805129.html)

-----

## Create USB installation medium (Appe MacOS)

### Steps

1) Install USB drive

2) Open Terminal

3) Find device mount point (`diskutil list`)

```bash
   % diskutil list
   /dev/disk0 (internal, physical):
      #:                       TYPE NAME                    SIZE       IDENTIFIER
      0:      GUID_partition_scheme                        *1.0 TB     disk0
      1:                        EFI EFI                     314.6 MB   disk0s1
      2:                 Apple_APFS Container disk1         1.0 TB     disk0s2

   /dev/disk1 (synthesized):
      #:                       TYPE NAME                    SIZE       IDENTIFIER
      0:      APFS Container Scheme -                      +1.0 TB     disk1
                                    Physical Store disk0s2
      1:                APFS Volume Macintosh HD            11.2 GB    disk1s1
      2:                APFS Volume Macintosh HD - Data     493.3 GB   disk1s2
      3:                APFS Volume Preboot                 81.5 MB    disk1s3
      4:                APFS Volume Recovery                528.9 MB   disk1s4
      5:                APFS Volume VM                      2.1 GB     disk1s5

   /dev/disk2 (external, physical):
      #:                       TYPE NAME                    SIZE       IDENTIFIER
      0:     Apple_partition_scheme                        *30.6 GB    disk2
      1:        Apple_partition_map                         4.1 KB     disk2s1
      2:                  Apple_HFS                         2.5 MB     disk2s2
```

4) Unmount USB drive (`diskutil unmount /dev/diskX`)

```bash
   % diskutil unmountdisk /dev/disk2
   Unmount of all volumes on disk2 was successful
```

```bash
   % ls
   DiscUtils.dll
   IGEL OS Creator Manual-v1-20200401_200841.pdf
   License.txt
   Readme.txt
   Readme_3.3.1.0.txt
   dd.exe
   licenses_osc.zip
   osc11.04.100.iso
   preparestick.exe
   readme11.04.100.txt
```

5) Copy ISO image to USB drive (`sudo dd if=OSC-file.iso of=/dev/rdiskX bs=1m`)

```bash
   % sudo dd if=osc11.04.100.iso of=/dev/rdisk2 bs=1m
   Password:

   2502+1 records in
   2502+1 records out
   2623733760 bytes transferred in 94.942156 secs (27635077 bytes/sec)
```
