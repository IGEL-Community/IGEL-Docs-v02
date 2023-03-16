# HOWTO Write config files to IGEL OSC ISO file from Linux

## Determine mount point in ISO image

```bash linenums="1"
fdisk -l osc<version>.iso

Disk osc<version>.iso: 2.6 GiB, 2726674432 bytes, 5325536 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x74f4d8a3

Device              Boot Start     End Sectors  Size Id Type
osc<version>.iso1 *        0   5325535 5325536  2.6G  0 Empty
osc<version>.iso2        300    102699  102400   50M ef EFI (FAT-12/16/32)
```

**Note:** iso2 start is **300** and will be used with sector size of **512** as the offset in the mount command in next step.

## Mount iso2 file system

iso2 is the second partition and is writeable.

```bash linenums="1"
mkdir /tmp/IGEL
mount -o loop,offset=$((300*512)) osc<version>.iso /tmp/IGEL
```

## Create wfs template folder and copy files

Create wfs_template directory and copy files that will go into /wfs (such as setup.init, .ovpn files, ca-certs, etc.)

```bash linenums="1"
mkdir -p /tmp/IGEL/igel/wfs_template  
cp files /tmp/IGEL/igel/wfs_template
```

## Unmount file system  

```bash linenums="1"
umount /tmp/IGEL
```

## Create bootable USB of OSC ISO  

```bash linenums="1"
dd if=osc<version>.iso of=<USB device> bs=4M status=progress  
```

-----  

## Where to get setup.ini file

There are two options:

- Copy the local setup.ini file from IGEL endpoint (/wfs/setup.ini)
- If using UMS to deploy config file to the IGEL endpoint, then copy the group.ini (wfs/group.ini) file from the IGEL endpoint and rename it to setup.ini
