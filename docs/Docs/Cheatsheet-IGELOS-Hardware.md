# Cheatsheet IGELOS Hardware

## dmidecode

DMI (SMBIOS) table decoder

**get serialnumber:**

```bash linenums="1"
dmidecode -s system-serial-number
```

```bash linenums="1"
10D3G1004B10130C2A
```

**get system manufacturer:**

```bash linenums="1"
dmidecode -s system-manufacturer
```

```bash linenums="1"
IGEL Technology GmbH
```

**get product name:**

```bash linenums="1"
dmidecode -t system | grep 'Product Name' | cut -c 16-
```

```bash linenums="1"
M350C
```

## lsusb

list USB devices

```bash linenums="1"
lsusb
```

```bash linenums="1"
Bus 002 Device 002: ID 174c:3074 ASMedia Technology Inc. ASM1074 SuperSpeed hub
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 001 Device 006: ID 04d9:1603 Holtek Semiconductor, Inc. Keyboard
Bus 001 Device 005: ID 067b:23a3 Prolific Technology, Inc.
Bus 001 Device 004: ID 093a:2510 Pixart Imaging, Inc. Optical Mouse
Bus 001 Device 003: ID 174c:2074 ASMedia Technology Inc. ASM1074 High-Speed hub
Bus 001 Device 002: ID 8087:0025 Intel Corp.
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hu
```
