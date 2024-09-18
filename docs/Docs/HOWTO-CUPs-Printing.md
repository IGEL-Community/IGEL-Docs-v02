# HOWTO CUPs Printing

## [IGEL KB - CUPs Printing](https://kb.igel.com/en/igel-os/11.10/cups)
## [IGEL Community GitHub - Work from home with network printer](https://github.com/IGEL-Community/IGEL-Custom-Partitions/tree/master/CP_Source/Tools_Drivers/WFH-Add-Network-Printers)
## [IGEL Community GitHub - Work from office with network printer](https://github.com/IGEL-Community/IGEL-Custom-Partitions/tree/master/CP_Source/Tools_Drivers/WFO-Add-Assigned-Printers)

-----

## USB attached printers - Use PPD file

If printer is not network attached, then follow IGEL note on setting up CUPs printer with USB connection with PPD file.

### [Installing a Custom CUPS Driver](https://kb.igel.com/en/igel-os/11.10/installing-a-custom-cups-driver)

-----

### Methods to obtain PPD file for printer

- Download PPD from vendor web site and edit PPD file to remove / comment out the **\*cupsFilter:** line by adding "%" after the "*"

``` linenums="1"
*%cupsFilter:
```

- Connect printer to the network and create PPD file from IGEL OS.  

```bash linenums="1"
driverless ipp://IP-address-of-printer/ipp/print | sed -e '/IP-address-of-printer/d' -e 's/drvless/printer-name/' > /tmp/printer-name.PPD
```

-----

### FInd the name of the driver for your printer model that has 1536 in name

```bash linenums="1"
lpinfo --make-and-model '1536' -m
```

-----

## USB always on (Printer, Scanner, etc.)

System > Firmware Customization > Custom Commands > Desktop

```bash linenums="1"
echo on | tee /sys/bus/usb/devices/*/power/level > /dev/null
```

-----

## Add USB attached Printer

```bash linenums="1"
#!/bin/bash

USBDEVICE=$(/usr/lib/cups/backend/usb 2>/dev/null | cut -d " " -f 2)

lpadmin -p USBPRINTER -E -v "${USBDEVICE}" -m /wfs/USBPRINTER.ppd
```

-----

## How to query paper size and set default paper size

Determine default paper size

```bash linenums="1"
driverless ipp://IP-ADDRESS-of-PRINTER/ipp/print | grep -i paperdimension
```

Output from query:

```bash linenums="1"
*DefaultPaperDimension: Letter
*PaperDimension 215x345mm: "609.448818897638 977.952755905512"
*PaperDimension 3x5: "216 360"
*PaperDimension A4: "595.275590551181 841.889763779528"
*PaperDimension A5: "419.527559055118 595.275590551181"
*PaperDimension A6: "297.637795275591 419.527559055118"
*PaperDimension Env10: "296.985826771654 684"
*PaperDimension EnvC5: "459.212598425197 649.133858267717"
*PaperDimension EnvDL: "311.811023622047 623.622047244094"
*PaperDimension EnvMonarch: "278.985826771654 540"
*PaperDimension Executive: "522 756"
*PaperDimension FanFoldGermanLegal: "612 936"
*PaperDimension ISOB5: "498.897637795276 708.661417322835"
*PaperDimension Legal: "612 1008"
*PaperDimension Letter: "612 792"
*PaperDimension Oficio: "612 964.8"
```

-----

## Registry key to change settings

IGEL OS registry key `print.cups.printer%.lpoptions:`

The expected format is like so:

`-o InputSlot=Tray3 -o HPOption_Tray3=HP550SheetInputTray -o OutputBin=FrontBin -o DefaultPaperDimension=Legal` 

To test by using use the browser's print dialog (and choose the systems dialog).

-----

## Add Network attached Printer

- Query printer to confirm communication

```bash linenums="1"
driverless ipp://ip_address_of_printer/ipp/print
```

- Add printer

```bash linenums="1"
lpadmin -p wifiprinter1 -E -v ipp://ip_address_of_printer/ipp/print -m everywhere && lpoptions -d wifiprinter1
```

- Make default printer

```bash linenums="1"
lpoptions -d wifiprinter1
```

-----

## CUPs Printer Admin

- Open browser and connect to:

```bash linenums="1"
http://localhost:631/printers
```