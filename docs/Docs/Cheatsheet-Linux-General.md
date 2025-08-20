# Cheatsheet Linux General

## cat

display the content of a file

**show contents of group.ini:**

```bash linenums="1"
cat group.ini
```

```bash linenums="1"
<services>
        <cisco_vxme_client>
                enabled=<true>
        </cisco_vxme_client>
        <ica_client>
                enabled=<true>
...
```
## cd

change folder

**change folder to /wfs/:**

```bash linenums="1"
cd /wfs/
```

## chmod

change file attributes

**make new.sh executable:**

```bash linenums="1"
chmod +x new.sh
```

## comm

compare two sorted files line by line

**Simple method to determine command line to run (such as IGEL setup or IGEL About):**

```bash linenums="1"
# what processes are running BEFORE item is run?
ps -ef | sort > /tmp/ps1.txt

# what processes are running AFTER item is run?
ps -ef | sort > /tmp/ps2.txt

# what are the new processes?
# comm only showing processes in /tmp/ps2.txt
comm -1 -3 /tmp/ps1.txt /tmp/ps2.txt
```

**Start IGEL setup:** `/bin/bash /config/bin/start_setup`

**Start IGEL About:** `applauncher -style gtk2 --aboutOnly`

## compgen

list all the linux commands (including bash shell aliases and functions)

**list all igel and remotemanager related commands**:

```bash linenums="1"
compgen -c | egrep "igel|_rm" | sort | more
```

```bash linenums="1"
get_rmdirlist
get_rmsettings
get_rmsettings_boot
...
igel_showsplash
igel-shutdown-debug
igel-shutdown-inhibitor
--More--
```

## conky

system monitor

[KB: Conky](https://kb.igel.com/en/igel-os/11.10/conky-system-monitor)

[Conky Reference with Examples](http://www.ifxgroup.net/conky.htm#about)

**NOTE:** To remove black rectangle on OS 12, enable the registry key `windowmanager.wm0.variables.usecompositing` in the registry part of your profile, and add a custom setting `config name = own_window_argb_value` and `config value = 0` to Conky profile.

## cp

copy files and folders

**create backup of setup.ini:**

```bash linenums="1"
cp setup.ini setup.ini.bck
```

## date

date tool

**show date:**

```bash linenums="1"
date
```

```bash linenums="1"
Mi 19. Mai 19:26:59 CEST 2020
```

## dig

DNS lookup utility

```bash linenums="1"
#!/bin/bash

MACHINE="goober.mydomainname.com"

# use the dig command to resolve an IP only on client network
if [ "$(dig $MACHINE +short)" ]; then
  echo "On the client network"
  echo "do some on network work now"
else
  echo "Not on client network"
  echo "do some off network work now"
fi
```

## echo

output strings

**outputs "hello world" to console:**

```bash linenums="1"
echo "hello world"
```

```bash linenums="1"
hello world
```

## find

search for all files in the `/services` folder that have `snmp` in the name

```bash linenums="1"
find /services -type f -name "*snmp*" | less
```

```bash linenums="1"
/services/cups/lib/cups/backend/snmp
/services/cups/share/cups/doc-root/help/man-cups-snmp.html
/services/cups/share/cups/snmp.conf.default
```

copy all files in `/userhome` that end in .log to /tmp/foo folder

```bash linenums="1"
mkdir /tmp/foo; find /userhome -name "*.log" | xargs cp -t /tmp/foo
```

find all files with `vnc` in the name and exclude searching the `/media` folder

```bash linenums="1"
find . -path "./media" -prune -o -type f -name "*vnc*" -print | less
```

## grep

search for regular expression

**search for configured UMS server name:**

```bash linenums="1"
more /wfs/setup.ini | grep "ip="
```

```bash linenums="1"
ip=<igelrmserver.int.acme.org>
```

## kill

kill a running task by process id

**kill process with PID 48:**

```bash linenums="1"
kill 48
```

## killall

kill a running task by name

**kill process with name pnlogin:**

```bash linenums="1"
killall pnlogin 2>/dev/null
```

## less

less is more and allows backward movement (hit "b" key) in the file, as well as forward movement (hit "f" key), search for string (hit "/" key and enter string to search for), or to quit (hit "q" key)

**show contents of group.ini, hit key "f" to go forward, hit key "b" to go backward, hit key "/"  and the text to search for:**

```bash linenums="1"
less /wfs/group.ini
```

## ls

show directory content

**long list current directory:**

```bash linenums="1"
ls -l
```

```bash linenums="1"
total 96
drwxr-xr-x  3 root root     60 Mai 20 13:49 apparmor
drwxr-xr-x  2 root root     40 Mai 20 13:49 asset.events
-rw-r--r--  1 root root   2765 Mai 20 13:50 asset.ini
drwxr-xr-x  2 root root    100 Mai 20 13:50 ca-certs
drwxr-xr-x  2 root root     60 Mai 20 13:49 chrony
...
-rw-------  1 root root    106 Mai 20 13:50 systemkey
-rw-r--r--  1 root root     49 Mai 20 13:50 systemmd5
-rw-------  1 root root     32 Mai 20 13:49 tckey
-rw-------  1 root root    214 Mai 20 13:49 updateconf.ini
drwxr-xr-x 14 user users   440 Mai 20 13:50 user
drwxr-xr-x  2 root root     40 Mai 20 13:49 zoneinfo
```

## lshw

list hardware

```bash linenums="1"
lshw -short
```

## mkdir

create a folder

**create folder with name newdir:**

```bash linenums="1"
mkdir newdir
```

**create folder dir3 and make parent directories dir2 and dir1 if they do not exist**

```bash linenums="1"
mkdir -p /tmp/dir1/dir2/dir3
```

## mkfs

make file system on USB device

- Enable Storage Hotplug (Devices > Storage Devices > Storage Hotplug)
- Plug USB thumb drive in IGEL OS device (auto mounted in /media folder)
- Determine `/dev` mount point (lsblk -p)
- Unmount disk (umount /dev/diskname)

```bash linenums="1"
setparam devices.hotplug.usb-storage.numdevices 1
kill_postsetupd
sleep 5
lsblk -p
```

- Unmount file system

```bash linenums="1"
umount /dev/devicename
```

- Make F32 file system

```bash linenums="1"
mkfs.vfat -I -F 32 -n IGELF32 /dev/devicename
```

- Make btrfs file system

```bash linenums="1"
mkfs.btrfs -f -L IGELBTRFS /dev/devicename
```

## more

display the content of a file page by page

**show contents of group.ini, hit space to continue to next page:**

```bash linenums="1"
more group.ini
```

```bash linenums="1"
<services>
        <cisco_vxme_client>
                enabled=<true>
        </cisco_vxme_client>
        <ica_client>
                enabled=<true>
...
```

## mount

mount a partition

**mount license folder writeable:**

```bash linenums="1"
mount -o remount,rw /license
```

## openssl

OpenSSL command line tool

**Find end date on certificates**

```bash linenums="1"
cd /etc; find . -type f \( -name "*.cer" -o -name "*.crt" -o -name "*.pem" \) -exec echo "FILE NAME: ==> " {} \; -exec openssl x509 -enddate -noout -in {} \;
```

- [How to Check Certificate with OpenSSL](https://linuxhandbook.com/check-certificate-openssl/)

## pkexec

- The following command can be added to a profile to start a program as root:

```bash linenums="1"
pkexec -u root env DISPLAY=$DISPLAY XAUTHORITY=$XAUTHORITY program_to_run_as_root
```

## ps

show running tasks

```bash linenums="1"
ps -aef
```

```bash linenums="1"
UID        PID  PPID  C STIME TTY          TIME CMD
root         1     0  0 13:49 ?        00:00:03 /sbin/init 3
root         2     0  0 13:49 ?        00:00:00 [kthreadd]
root         3     2  0 13:49 ?        00:00:00 [rcu_gp]
root         4     2  0 13:49 ?        00:00:00 [rcu_par_gp]
root         6     2  0 13:49 ?        00:00:00 [kworker/0:0H-kb]
root         8     2  0 13:49 ?        00:00:00 [mm_percpu_wq]
root         9     2  0 13:49 ?        00:00:00 [ksoftirqd/0]
root        10     2  0 13:49 ?        00:00:00 [rcu_sched]
root        11     2  0 13:49 ?        00:00:00 [rcu_bh]
...
```

## pwd

print working directory

```bash linenums="1"
pwd
```

```bash linenums="1"
/root
```

## rm

delete a file

**delete file with name new.sh:**

```bash linenums="1"
rm new.sh
```

## rmdir

delete a folder

**delete folder with name newdir:**

```bash linenums="1"
rmdir newdir
```

## sleep

wait

**wait for 5 seconds:**

```bash linenums="1"
sleep 5
```

## su

change to root

```bash linenums="1"
su
```

## systemctl

service handler

**restart network:**

```bash linenums="1"
systemctl restart network-manager
```

## tee

read from standard input and write to standard output and files

**Run a program to redirect standard error to standard output and standard output to /tmp/debug.txt and print it to standard output.**

```bash linenums="1"
program_to_run 2>&1 | tee -a /tmp/debug.txt
```

## top

task monitor

```bash linenums="1"
top
```

```bash linenums="1"
top - 14:15:59 up 26 min,  2 users,  load average: 0,05, 0,01, 0,01
Tasks: 236 total,   1 running, 168 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0,1 us,  0,1 sy,  0,0 ni, 99,8 id,  0,0 wa,  0,0 hi,  0,0 si,  0,0 st
KiB Mem :  1891000 total,   351040 free,   481452 used,  1058508 buff/cache
KiB Swap:  1134592 total,  1134592 free,        0 used.  1183616 avail Mem

  PID USER      PR  NI    VIRT    RES    SHR S  %CPU %MEM     TIME+ COMMAND
18620 root      20   0   79776   4276   3520 R   0,3  0,2   0:00.02 top
    1 root      20   0  205624   9980   5812 S   0,0  0,5   0:03.88 systemd
    2 root      20   0       0      0      0 S   0,0  0,0   0:00.00 kthreadd
    3 root       0 -20       0      0      0 I   0,0  0,0   0:00.00 rcu_gp
    4 root       0 -20       0      0      0 I   0,0  0,0   0:00.00 rcu_par
...
```

## touch

create a file

**create file with name new.sh:**

```bash linenums="1"
touch new.sh
```

## tr

convert a file from windows to linux (strip out the \r characters)

```bash linenums="1"
tr -d '\r' < windowsfile.txt > linuxfile.txt
```

translates, deletes, and squeezes characters

**Print $PATH directories on a separate line**

```bash linenums="1"
echo $PATH | tr  ':' '\n'
```

```bash linenums="1"
/bin
/sbin
/usr/bin
/usr/sbin
```

**Remove the repeated space characters**

```bash linenums="1"
ps -ef | tr -s ' ' | grep terminal
```

```bash linenums="1"
user 23850 23849 0 10:30 ? 00:00:00 /usr/bin/xfce4-terminal -T Local Terminal -e check_passwd --disable-server --geometry 90x38
user 23915 23860 0 10:44 pts/0 00:00:00 grep --color=auto terminal
```

**Remove all non-numeric characters**

```bash linenums="1"
echo "IGEL support for Priority or Plus support phone number for US and Canada is 415-813-3933" | tr -cd [:digit:]
```

```bash linenums="1"
4158133933
```
**Print strings with `; ` separator on separate lines**

```bash linenums="1"
echo "this; is; a; test" | tr -d ' ' | tr ';' '\n'
```

```bash linenums="1"
this
is
a
test
```

## uname

show linux details

```bash linenums="1"
uname
```

```bash linenums="1"
Linux
```

## user_shutdown

shutdown the system

```bash linenums="1"
user_shutdown
```

## user_reboot

reboot the system

```bash linenums="1"
user_reboot
```

- [How to Perform an Emergency Reboot with IGEL UMS](https://www.igelcommunity.com/post/how-to-perform-an-emergency-reboot-with-igel-ums)

## vi

texteditor

**open setup.ini in vi:**

```bash linenums="1"
vi setup.ini
```

```bash linenums="1"
<system>
        <remotemanager>
                <server0>
                        ip=<igelrmserver.int.acme.org>
                </server0>
        </remotemanager>
        <icg>
                <server0>
                        host=<icg.acme.org>
                        uuid=<d8d43ff7a4274b8f96fb6ec96c4948>
....
        <drivers>
                currentdriver=<intel>
                currentconnectors=<lvds1,Seiko Epson Corporation,,1366,768,1366,768,0,0,,;>
        </drivers>
</x>
```

## watch

repeat periodic a command

**probe tcp port 8443 on igelrmserver every 2 seconds:**

```bash linenums="1"
watch probeport igelrmserver 8443
```

```bash linenums="1"
Every 2,0s: probeport igelrmserver 8443                                                                                                                       ITCA44CC8C90000: Wed May 20 14:24:08 2020

Connection successful
```

## wget

non-interactive network downloader

- Obtain internet IP address for device

```bash linenums="1"
wget -qO- http://ipv4.icanhazip.com; echo
```

- Download IGEL OS 12.3.2 OSC installer

```bash linenums="1"
wget https://az743625.vo.msecnd.net/files/IGEL_OS_12/OSC/osc-12.3.2.zip
```

- Download a file from UMS

```bash linenums="1"
wget https://<server:port>/ums_filetransfer/file_name --no-check-certificate --user=username --password=password
```

## which

locate command

**locate command nmcli:**

```bash linenums="1"
which nmcli
```

```bash linenums="1"
/usr/bin/nmcli
sleep 1; xset dpms force on;  # dpms screen ON after a delay of one second.
```

## wmctrl

List windows managed by the window manager

```bash linenums="1"
wmctrl -l  
```  

Close VMware window

```bash linenums="1"
wmctrl -c VMware
```

- OS 11 - Execute the VMware Horizon client as maximized or full screen using wmctrl command

```bash linenums="1"
#!/bin/bash
/config/sessions/vdm_client0 &
sleep 2 &&

#uncomment for maximized
wmctrl -r vmware-view -b add,maximized_vert,maximized_horz
#uncomment for fullscreen
#wmctrl -r vmware-view -b add,fullscreen
```

- OS 12 - Change the Omnissa Horizon window size using wmctrl command

```bash linenums="1"
#!/bin/bash
#set -x
#trap read debug

PATTERN="Omnissa Horizon Client"

# Loop until the application window is open
while ! wmctrl -l | grep -q "$PATTERN" ; do
  echo "$PATTERN not running, checking again..."
  sleep 5
done

echo "Pattern '$PATTERN' found!"
#uncomment below item for fullscreen or maximized
#wmctrl -r "$PATTERN" -b add,fullscreen
#wmctrl -r "$PATTERN" -b add,maximized_vert,maximized_horz
```

Bring IGEL UMS Console to the foreground

- List the windows

```bash linenums="1"
wmctrl -l
```

```bash linenums="1"
0x02000003 -1 ITC08002792DECB xfce4-panel
0x02200069 -1 ITC08002792DECB Desktop
0x03200003  0 ITC08002792DECB X11
0x03400401  0       igelums12 IGEL Universal Management Suite 12
0x03800003  0 ITC08002792DECB Local Terminal
```

- Raise UMS Console to the foreground

```bash linenums="1"
wmctrl -i -a $(wmctrl -l | grep igelums | cut -f 1)
```

## xev xmodmap

- Find and disable a key. Run `xev` to find keycode for key (such as Control(CTRL)) and `xmodmap` to disable it

```bash linenums="1"
xev | grep --line-buffered keycode
```

```bash linenums="1"
state 0x10, keycode 37 (keysym 0xffe3, Control_L), same_screen YES,
state 0x14, keycode 37 (keysym 0xffe3, Control_L), same_screen YES,
```

```bash linenums="1"
xmodmap -e 'keycode 37 = NoSymbol'
```

- Return use of Control

```bash linenums="1"
xmodmap -e 'keycode 37 = Control_L'
```

## xdotool

command-line X11 automation tool

- [Automating X11 with xdotool (with examples)](https://commandmasters.com/commands/xdotool-linux/)

## xinput

utility to configure and test X input devices

**list all input devices:**

```bash linenums="1"
xinput --list
```
```bash linenums="1"
⎡ Virtual core pointer                    	id=2	[master pointer  (3)]
⎜   ↳ Virtual core XTEST pointer              	id=4	[slave  pointer  (2)]
⎜   ↳ 3830303142534F54:00 06CB:CE46 Mouse     	id=11	[slave  pointer  (2)]
⎜   ↳ Logitech USB-PS/2 Optical Mouse         	id=9	[slave  pointer  (2)]
⎜   ↳ 3830303142534F54:00 06CB:CE46 Touchpad  	id=12	[slave  pointer  (2)]
⎣ Virtual core keyboard                   	id=3	[master keyboard (2)]
    ↳ Virtual core XTEST keyboard             	id=5	[slave  keyboard (3)]
    ↳ Toshiba input device                    	id=14	[slave  keyboard (3)]
    ↳ Video Bus                               	id=6	[slave  keyboard (3)]
    ↳ Power Button                            	id=7	[slave  keyboard (3)]
    ↳ Sleep Button                            	id=8	[slave  keyboard (3)]
    ↳ AT Translated Set 2 keyboard            	id=13	[slave  keyboard (3)]
    ↳ Web Camera - HD: Web Camera - H         	id=10	[slave  keyboard (3)]
```

**disable touchpad:**

```bash linenums="1"
xinput set-prop "3830303142534F54:00 06CB:CE46 Touchpad" "Device Enabled" 0
```

## xset

user preference utility for X

[Screen Blanking](https://shallowsky.com/linux/x-screen-blanking.html)

**testing dpms signal for monitor to turn off, waiting 15 seconds, then signal monitor to turn on**

```bash linenums="1"
sleep 1; xset dpms force off; sleep 15; xset dpms force on;
```
**commands to trigger the various states**

```bash linenums="1"
sleep 1; xset s activate;  # will blank the screen (or activate the screensaver program, if you're using one) after a delay of one second
sleep 1; xset dpms force off;  # dpms turn the screen OFF after a delay of one second.
sleep 1; xset dpms force standby;  # dpms screen standby after a delay of one second.
sleep 1; xset dpms force suspend;  # dpms screen suspend after a delay of one second.
```

## zenity

Display dialog window, and return (either in the return code, or on standard output) the users input

```bash linenums="1"
#!/bin/bash
Zenity_String=$(zenity --forms --title="Create user" --text="Add new user" \
  --add-entry="First Name" \
  --add-entry="Last Name" \
  --add-entry="Username" \
  --add-password="Password" \
  --add-password="Confirm Password" \
  --add-calendar="Expires")

First_Name=$(echo $Zenity_String | cut -d "|" -f 1)
Last_Name=$(echo $Zenity_String | cut -d "|" -f 2)

echo "Zenity String: " $Zenity_String
echo "First Name: " $First_Name
echo "Last Name: " $Last_Name
```

Suspend system dialog window

```bash linenums="1"
#!/bin/bash
(
echo "10" ; sleep 1
echo "# Suspending countdown" ; sleep 1
echo "20" ; sleep 1
echo "# Suspending countdown" ; sleep 1
echo "50" ; sleep 1
echo "# Suspending countdown" ; sleep 1
echo "75" ; sleep 1
echo "# Suspending countdown" ; sleep 1
echo "100" ; sleep 1
auto_suspend
) |
zenity --progress \
  --title="Suspending system" \
  --text="Suspending system..." \
  --percentage=0

if [ "$?" = -1 ] ; then
  zenity --error \
  --text="Suspending canceled."
fi
```