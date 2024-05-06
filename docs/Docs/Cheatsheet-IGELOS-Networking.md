# Cheatsheet IGELOS Networking

## ethtool

tool for ethernet configuration

**display standard information about eth0:**

```bash linenums="1"
ethtool eth0
```

```bash linenums="1"
Settings for eth0:
  Supported ports: [ TP ]
  Supported link modes:   10baseT/Half 10baseT/Full
                          100baseT/Half 100baseT/Full
                          1000baseT/Full
  Supported pause frame use: No
  Supports auto-negotiation: Yes
  Advertised link modes:  10baseT/Half 10baseT/Full
                          100baseT/Half 100baseT/Full
                          1000baseT/Full
  Advertised pause frame use: No
  Advertised auto-negotiation: Yes
  Speed: 1000Mb/s
  Duplex: Full
  Port: Twisted Pair
  PHYAD: 0
  Transceiver: internal
  Auto-negotiation: on
  MDI-X: off (auto)
  Supports Wake-on: umbg
  Wake-on: d
  Current message level: 0x00000007 (7)
           drv probe link
  Link detected: yes
```

**show mac address eth0:**

```bash linenums="1"
ethtool -P eth0 | sed 's/^Permanent address: //g'
```

```bash linenums="1"
00:11:22:33:44:55
```

## ftp

start the FTP client

**connect to a (custom) FTP server on igelrmserver:**

```bash linenums="1"
ftp igelrmserver
```

```bash linenums="1"
Connected to igelrmserver.acme.org.
220 IGEL FW + Snapshot
Name (igelrmserver:root): igelums
331 Password required for igelums
Password:
230 Logged on
Remote system type is UNIX.
ftp>
```

## getmyhwaddr

show current MAC

**show current MAC and adds linebreak:**

```bash linenums="1"
getmyhwaddr && echo
```

```bash linenums="1"
00:11:22:33:44:55
```

## getmyip

show current IP address

```bash linenums="1"
getmyip && echo
```

```bash linenums="1"
10.10.10.13
```

## hostname

display current hostname

```bash linenums="1"
hostname
```

```bash linenums="1"
ITC001122334455
```

## ifconfig

show/manage ethernet configuration

**show ethernet configuration:**

```bash linenums="1"
ifconfig
```

```bash linenums="1"
eth0      Link encap:Ethernet  HWaddr 00:11:22:33:44:55  
          inet addr:10.10.10.13  Bcast:10.10.10.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:757 errors:0 dropped:0 overruns:0 frame:0
          TX packets:3253 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:119758 (119.7 KB)  TX bytes:4251876 (4.2 MB)

lo        Link encap:Local Loopback  
          inet addr:127.0.0.1  Mask:255.0.0.0
          inet6 addr: ::1/128 Scope:Host
          UP LOOPBACK RUNNING  MTU:65536  Metric:1
          RX packets:53224 errors:0 dropped:0 overruns:0 frame:0
          TX packets:53224 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:15835535 (15.8 MB)  TX bytes:15835535 (15.8 MB)
```

## iptables

firewall configuration

**print the rules in a all chains:**

```bash linenums="1"
iptables -S
```

```bash linenums="1"
-P INPUT ACCEPT
-P FORWARD ACCEPT
-P OUTPUT ACCEPT
```

OS 12 script launches on boot, blocks all traffic except what is explicitly allowed

```bash linenums="1"
#!/bin/sh
#set -x
#trap read debug

# OS 11 is iptables
# OS 12 is iptables-legacy

iptables-legacy -F

iptables-legacy -P INPUT DROP
iptables-legacy -P FORWARD DROP
iptables-legacy -P OUTPUT DROP
Variable="Network,Resources,needed,for,management" #(DNS names, server names, IP address, etc)
iptables-legacy -A INPUT -s $Variable -j ACCEPT
iptables-legacy -A OUTPUT -d $Variable -j ACCEPT
iptables-legacy -A OUTPUT -p tcp --dport (PORTNUM) -j ACCEPT
iptables-legacy -A OUTPUT -p udp --dport (PORTNUM) -j ACCEPT
```

## iwconfig

configure a wireless network interface

**show wifi configuration of interface wlan0:**

```bash linenums="1"
iwconfig wlan0
```

```bash linenums="1"
wlan0     IEEE 802.11  ESSID:"WLAN123"
          Mode:Managed  Frequency:5.3 GHz  Access Point: C4:21:5A:85:19:72
          Bit Rate=866.7 Mb/s   Tx-Power=22 dBm
          Retry short limit:7   RTS thr:off   Fragment thr:off
          Encryption key:off
          Power Management:off
          Link Quality=68/70  Signal level=-42 dBm
          Rx invalid nwid:0  Rx invalid crypt:0  Rx invalid frag:0
          Tx excessive retries:0  Invalid misc:2   Missed beacon:0
```

## iwevent

display wireless events

```bash linenums="1"
iwevent
```

```bash linenums="1"
Waiting for Wireless Events from interfaces...
09:58:45.411423   wlan0    New Access Point/Cell address:Not-Associated
09:58:51.104234   wlan0    Scan request completed
09:58:51.401358   wlan0    Association Response IEs:01089C129814B048606C2D1ACF011BFFFF00000000000000002C0101000000000000000000003D16300700000000000000000000000000000000000000007F0
09:58:51.401407   wlan0    New Access Point/Cell address:C4:21:5A:85:19:72
09:59:16.644665   wlan0    Scan request completed
09:59:16.653019   wlan0    New Access Point/Cell address:Not-Associated
09:59:16.706971   wlan0    Association Response IEs:01089C129814B048606C2D1AFF0117FFFF0000000000000000000000000000000000000000003D163C0504000000000000000000000000000000000000007F0
09:59:16.707008   wlan0    New Access Point/Cell address:C4:21:5A:85:19:74
```

## iwgetid

report ESSID, NWID or AP/Cell Address of wireless network  

**show ESSID:**

```bash linenums="1"
iwgetid -r
```

```bash linenums="1"
WLAN123
```

**show connected AP/Cell:**

```bash linenums="1"
iwgetid -a
```

```bash linenums="1"
wlan0     Access Point/Cell: C4:21:5A:85:19:72
```

## iwlist

display some additional information from a wireless network interface that is not displayed by iwconfig

**Give the list of Access Points and Ad-Hoc cells in range:**

```bash linenums="1"
iwlist wlan0 scanning
```

```bash linenums="1"
wlan0     Scan completed :
          Cell 01 - Address: C4:21:5A:85:19:72
                    Channel:60
                    Frequency:5.3 GHz (Channel 60)
                    Quality=61/70  Signal level=-49 dBm
                    Encryption key:on
                    ESSID:"WLAN123"
                    Bit Rates:6 Mb/s; 9 Mb/s; 12 Mb/s; 18 Mb/s; 24 Mb/s
                              36 Mb/s; 48 Mb/s; 54 Mb/s
                    Mode:Master
                    ...
```

**List the bit-rates supported by the device:**

```bash linenums="1"
iwlist wlan0 rate
```

```bash linenums="1"
wlan0     unknown bit-rate information.
          Current Bit Rate=866.7 Mb/s
```

## iwspy

get wireless statistics from specific nodes

```bash linenums="1"

```

```bash linenums="1"

```

## nc

Use nc to test IGEL communication (Device, UMS, ICG) -- [LINK](HOWTO-Setup-Lab-Sandbox-Environment.md#ums-tofrom-igel-os-communication-ports-no-icg)

Use nc to test Microsoft Teams communication - Microsoft API URLs and IPs

If Microsoft Teams is not running in optimized mode, then check that the IGEL endpoint can communicate with the Microsoft API URLs and IPs.

Run the following script in a local terminal window on IGEL endpoint:

```bash linenums="1"
#!/bin/bash
nc -u -v -z 13.107.64.21 3478-3481
nc -u -v -z 52.112.0.31 3478-3481
nc -u -v -z 52.120.0.41 3478-3481
nc -v -z teams.microsoft.com 80
nc -v -z teams.microsoft.com 443
nc -v -z compass-ssl.microsoft.com 443
nc -v -z mlccdnprod.azureedge.net 443
nc -v -z aka.ms 443
```

```bash linenums="1"
Connection to 13.107.64.21 port 3478 succeeded!
Connection to 13.107.64.21 port 3479 succeeded!
Connection to 13.107.64.21 port 3480 succeeded!
Connection to 13.107.64.21 port 3481 succeeded!
Connection to 52.112.0.31 port 3478 succeeded!
Connection to 52.112.0.31 port 3479 succeeded!
Connection to 52.112.0.31 port 3480 succeeded!
Connection to 52.112.0.31 port 3481 succeeded!
Connection to 52.120.0.41 port 3478 succeeded!
Connection to 52.120.0.41 port 3479 succeeded!
Connection to 52.120.0.41 port 3480 succeeded!
Connection to 52.120.0.41 port 3481 succeeded!
Connection to teams.microsoft.com port 80 succeeded!
Connection to teams.microsoft.com port 443 succeeded!
Connection to compass-ssl.microsoft.com port 443 succeeded!
Connection to mlccdnprod.azureedge.net port 443 succeeded!
Connection to aka.ms port 443 succeeded!
```

## netstat

display open connections

**display active connections:**

```bash linenums="1"
netstat -anet
```

```bash linenums="1"
Active Internet connections (servers and established)
Proto Recv-Q Send-Q Local Address           Foreign Address         State       User       Inode
tcp        0      0 0.0.0.0:111             0.0.0.0:*               LISTEN      0          13287
tcp        0      0 0.0.0.0:30005           0.0.0.0:*               LISTEN      0          86724
tcp        0      0 127.0.0.1:30006         0.0.0.0:*               LISTEN      0          86719
tcp        0      0 127.0.0.1:7000          0.0.0.0:*               LISTEN      0          14126
tcp        0      0 127.0.0.1:7001          0.0.0.0:*               LISTEN      0          14127
tcp6       0      0 :::111                  :::*                    LISTEN      0          13289
tcp6       0      0 :::22                   :::*                    LISTEN      0          33044
```

## /lib/systemd/system/NetworkManager.service

manage network service

**restart network service:**

```bash linenums="1"
systemctl restart NetworkManager
```

## nmcli

manage network connections via cli

**list available Wi-Fi APs:**

```bash linenums="1"
nmcli device wifi list
```

```bash linenums="1"
*  SSID             MODUS  CHAN  RATE       SIGNAL  BARS  SICHERHEIT
   WLAN123....      Infra  48    54 Mbit/s  90      ▂▄▆█  WPA2 802.1X
   Voice WLAN       Infra  48    54 Mbit/s  90      ▂▄▆█  WPA2
   ...
   WLAN123....      Infra  116   54 Mbit/s  22      ▂___  WPA2 802.1X
   Guest WLAN       Infra  116   54 Mbit/s  19      ▂___  WPA2
```

**show general network device infos:**

```bash linenums="1"
nmcli d
```

```bash linenums="1"
DEVICE  TYPE      STATE      CONNECTION
eth0    ethernet  connected  eth0
wlan0   wifi      connected  wlan0
lo      loopback  unmanaged  --  
```

## ping

test the reachability of a host

**ping host with name igelrmserver continiously:**

```bash linenums="1"
ping igelrmserver
```

```bash linenums="1"
PING igelrmserver (10.10.10.101) 56(84) bytes of data.
64 bytes from igelrmserver (10.10.10.101): icmp_seq=1 ttl=64 time=0.315 ms
64 bytes from igelrmserver (10.10.10.101): icmp_seq=2 ttl=64 time=0.470 ms
64 bytes from igelrmserver (10.10.10.101): icmp_seq=3 ttl=64 time=0.400 ms
```

**ping host with name igelrmserver 4 times:**

```bash linenums="1"
ping -c 4
```

```bash linenums="1"
PING igelrmserver (10.10.10.101) 56(84) bytes of data.
64 bytes from igelrmserver (10.10.10.101): icmp_seq=1 ttl=64 time=0.361 ms
64 bytes from igelrmserver (10.10.10.101): icmp_seq=2 ttl=64 time=0.758 ms
64 bytes from igelrmserver (10.10.10.101): icmp_seq=3 ttl=64 time=0.741 ms
64 bytes from igelrmserver (10.10.10.101): icmp_seq=4 ttl=64 time=0.466 ms


--- igelrmserver ping statistics ---
4 packets transmitted, 4 received, 0% packet loss, time 3053ms
rtt min/avg/max/mdev = 0.361/0.581/0.758/0.173 ms

```

## probeport

test network port on a host

**test connectivity from IGELOS device to UMS server:**

```bash linenums="1"
probeport igelrmserver 30001
```

```bash linenums="1"
Connection successful
```

## route

display/config network routes

```bash linenums="1"
route
```

```bash linenums="1"
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
default         10.10.10.1      0.0.0.0         UG    100    0        0 eth0
10.10.10.0      *               255.255.255.0   U     100    0        0 eth0
```

## udpportrange

UDP port range for Auto ("high port")

```bash linenums="1"
cat /proc/sys/net/ipv4/ip_local_port_range 
```

```bash linenums="1"
32768    60999
```