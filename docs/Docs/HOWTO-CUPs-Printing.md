# HOWTO CUPs Printing

## [IGEL KB - CUPs Printing](https://kb.igel.com/en/igel-os/11.10/cups)
## [IGEL Community GitHub - Work from home with network printer](https://github.com/IGEL-Community/IGEL-Custom-Partitions/tree/master/CP_Source/Tools_Drivers/WFH-Add-Network-Printers)
## [IGEL Community GitHub - Work from office with network printer](https://github.com/IGEL-Community/IGEL-Custom-Partitions/tree/master/CP_Source/Tools_Drivers/WFO-Add-Assigned-Printers)

-----

## Horizon clients for Linux use integrated printing (switch on vmware.view.integrated-printing in the IGEL Registry)

**NOTE:** Make sure that `cups_printing` is installed on OS 12

With `vmware.view.integrated-printing` enabled, all locally defined printers on IGEL OS are carried over to the remote session if the Horizon agent there is also installed with integrated printing support.

The specific drivers for the printers must be chosen on IGEL OS side.

On the windows desktop only the generic support for the integrated printing is needed.

-----

## 18 December 2024 - 11.10.210 and derived builds have CUPS start up issue

- 11.10.210 and derived builds have a starting problem with the CUPS printing service. Only PB 11.10.219 has currently a fix for it.

- Work-around by adding this line in System > Registry > Custom Commands > Desktop > Final Desktop Commands:

```bash linenums="1"
systemctl restart cups 
```

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

-----

## Add Driver files to /wfs/ppd folder

Add CUPS Drivers to `/wfs/ppd/` folder and this folder will be linked into the CUPS folder. Drivers will be available after a 2nd reboot or after restarting CUPS.

-----

## Adding Network Printer to IGEL OS 12: Brother MFC-L2750DW

Steps from command line:

- Install `cups_printing` app:

```bash linenums="1"
igelpkgctl install cups_printing -y
```

- Query for printer:

```bash linenums="1"
/services/cups/lib/cups/backend/snmp
```

```bash linenums="1"
network lpd://BRWB068E696FC10/BINARY_P1 "Brother MFC-L2750DW series" "Brother MFC-L2750DW series"
"MFG:Brother;CMD:PJL,PCL,PCLXL,URF;MDL:MFC-L2750DW series;CLS:PRINTER;CID:Brother Laser Type1;URF:W8,CP1,IS4-1,MT1-3-4-5-8,OB10,PQ3-4-5,RS300-600-1200,V1.4,DM1;" ""
```

- Add printer:

```bash linenums="1"
lpadmin -p brother-mfc-l2750DW -E -v ipp://BRWB068E696FC10/ipp/print -m everywhere && lpoptions -d brother-mfc-l2750dw
```

- Print `/etc/os-release` file:

```bash linenums="1"
lpr /etc/os-release
```

- Show status of printers

```bash linenums="1"
lpstat -t
```

```bash linenums="1"
scheduler is running
system default destination: brother-mfc-l2750DW
device for brother-mfc-l2750DW: ipp://BRWB068E696FC10/ipp/print
brother-mfc-l2750DW accepting requests since Thu 06 Mar 2025 02:33:23 PM MST
printer brother-mfc-l2750DW is idle.  enabled since Thu 06 Mar 2025 02:33:23 PM MST
```

- Show driver details

```bash linenums="1"
driverless ipp://BRWB068E696FC10/ipp/print
```

```bash linenums="1"
*PPD-Adobe: "4.3"
*FormatVersion: "4.3"
*FileVersion: "1.28.17"
*LanguageVersion: English
*LanguageEncoding: ISOLatin1
*PSVersion: "(3010.000) 0"
*LanguageLevel: "3"
*FileSystem: False
*PCFileName: "drvless.ppd"
*Manufacturer: "Brother"
*ModelName: "Brother MFC-L2750DW series"
*Product: "(Brother MFC-L2750DW series)"
*NickName: "Brother MFC-L2750DW series, driverless, cups-filters 1.28.17"
*ShortNickName: "Brother MFC-L2750DW series"
*DefaultOutputOrder: Normal
*ColorDevice: False
*cupsVersion: 2.4
*cupsSNMPSupplies: False
*cupsLanguages: "en"
*APSupplies: "http://BRWB068E696FC10/net/net/airprint.html"
*cupsJobPassword: "1111"
*cupsFilter2: "image/urf image/urf 0 -"
*cupsManualCopies: True
*OpenUI *PageSize/Media Size: PickOne
*OrderDependency: 10 AnySetup *PageSize
*DefaultPageSize: Letter
*PageSize 215x345mm: "<</PageSize[609.448818897638 977.952755905512]>>setpagedevice"
*PageSize 3x5/3 x 5″: "<</PageSize[216 360]>>setpagedevice"
*PageSize A4/A4: "<</PageSize[595.275590551181 841.889763779528]>>setpagedevice"
*PageSize A5/A5: "<</PageSize[419.527559055118 595.275590551181]>>setpagedevice"
*PageSize A6/A6: "<</PageSize[297.637795275591 419.527559055118]>>setpagedevice"
*PageSize Env10/Envelope #10: "<</PageSize[296.985826771654 684]>>setpagedevice"
*PageSize EnvC5/CEnvelope 5: "<</PageSize[459.212598425197 649.133858267717]>>setpagedevice"
*PageSize EnvDL/Envelope DL: "<</PageSize[311.811023622047 623.622047244094]>>setpagedevice"
*PageSize EnvMonarch/Envelope Monarch: "<</PageSize[278.985826771654 540]>>setpagedevice"
*PageSize Executive/Executive: "<</PageSize[522 756]>>setpagedevice"
*PageSize FanFoldGermanLegal/Foolscap: "<</PageSize[612 936]>>setpagedevice"
*PageSize ISOB5/Envelope B5: "<</PageSize[498.897637795276 708.661417322835]>>setpagedevice"
*PageSize Legal/US Legal: "<</PageSize[612 1008]>>setpagedevice"
*PageSize Letter/US Letter: "<</PageSize[612 792]>>setpagedevice"
*PageSize Oficio/8.5 x 13.4″: "<</PageSize[612 964.8]>>setpagedevice"
*CloseUI: *PageSize
*OpenUI *PageRegion/Media Size: PickOne
*OrderDependency: 10 AnySetup *PageRegion
*DefaultPageRegion: Letter
*PageRegion 215x345mm: "<</PageSize[609.448818897638 977.952755905512]>>setpagedevice"
*PageRegion 3x5/3 x 5″: "<</PageSize[216 360]>>setpagedevice"
*PageRegion A4/A4: "<</PageSize[595.275590551181 841.889763779528]>>setpagedevice"
*PageRegion A5/A5: "<</PageSize[419.527559055118 595.275590551181]>>setpagedevice"
*PageRegion A6/A6: "<</PageSize[297.637795275591 419.527559055118]>>setpagedevice"
*PageRegion Env10/Envelope #10: "<</PageSize[296.985826771654 684]>>setpagedevice"
*PageRegion EnvC5/CEnvelope 5: "<</PageSize[459.212598425197 649.133858267717]>>setpagedevice"
*PageRegion EnvDL/Envelope DL: "<</PageSize[311.811023622047 623.622047244094]>>setpagedevice"
*PageRegion EnvMonarch/Envelope Monarch: "<</PageSize[278.985826771654 540]>>setpagedevice"
*PageRegion Executive/Executive: "<</PageSize[522 756]>>setpagedevice"
*PageRegion FanFoldGermanLegal/Foolscap: "<</PageSize[612 936]>>setpagedevice"
*PageRegion ISOB5/Envelope B5: "<</PageSize[498.897637795276 708.661417322835]>>setpagedevice"
*PageRegion Legal/US Legal: "<</PageSize[612 1008]>>setpagedevice"
*PageRegion Letter/US Letter: "<</PageSize[612 792]>>setpagedevice"
*PageRegion Oficio/8.5 x 13.4″: "<</PageSize[612 964.8]>>setpagedevice"
*CloseUI: *PageRegion
*DefaultImageableArea: Letter
*DefaultPaperDimension: Letter
*ImageableArea 215x345mm: "12.245669291339 12.245669291339 597.203149606299 965.707086614173"
*PaperDimension 215x345mm: "609.448818897638 977.952755905512"
*ImageableArea 3x5: "12.245669291339 12.245669291339 203.754330708661 347.754330708661"
*PaperDimension 3x5: "216 360"
*ImageableArea A4: "12.245669291339 12.245669291339 583.029921259842 829.644094488189"
*PaperDimension A4: "595.275590551181 841.889763779528"
*ImageableArea A5: "12.245669291339 12.245669291339 407.28188976378 583.029921259842"
*PaperDimension A5: "419.527559055118 595.275590551181"
*ImageableArea A6: "12.245669291339 12.245669291339 285.392125984252 407.28188976378"
*PaperDimension A6: "297.637795275591 419.527559055118"
*ImageableArea Env10: "12.245669291339 12.245669291339 284.740157480315 671.754330708661"
*PaperDimension Env10: "296.985826771654 684"
*ImageableArea EnvC5: "12.245669291339 12.245669291339 446.966929133858 636.888188976378"
*PaperDimension EnvC5: "459.212598425197 649.133858267717"
*ImageableArea EnvDL: "12.245669291339 12.245669291339 299.565354330709 611.376377952756"
*PaperDimension EnvDL: "311.811023622047 623.622047244094"
*ImageableArea EnvMonarch: "12.245669291339 12.245669291339 266.740157480315 527.754330708661"
*PaperDimension EnvMonarch: "278.985826771654 540"
*ImageableArea Executive: "12.245669291339 12.245669291339 509.754330708661 743.754330708661"
*PaperDimension Executive: "522 756"
*ImageableArea FanFoldGermanLegal: "12.245669291339 12.245669291339 599.754330708661 923.754330708661"
*PaperDimension FanFoldGermanLegal: "612 936"
*ImageableArea ISOB5: "12.245669291339 12.245669291339 486.651968503937 696.415748031496"
*PaperDimension ISOB5: "498.897637795276 708.661417322835"
*ImageableArea Legal: "12.245669291339 12.245669291339 599.754330708661 995.754330708661"
*PaperDimension Legal: "612 1008"
*ImageableArea Letter: "12.245669291339 12.245669291339 599.754330708661 779.754330708661"
*PaperDimension Letter: "612 792"
*ImageableArea Oficio: "12.245669291339 12.245669291339 599.754330708661 952.554330708661"
*PaperDimension Oficio: "612 964.8"
*HWMargins: "12.245669291339 12.245669291339 12.245669291339 12.245669291339"
*ParamCustomPageSize Width: 1 points 216 612
*ParamCustomPageSize Height: 2 points 360 1008
*ParamCustomPageSize WidthOffset: 3 points 0 0
*ParamCustomPageSize HeightOffset: 4 points 0 0
*ParamCustomPageSize Orientation: 5 int 0 3
*CustomPageSize True: "pop pop pop <</PageSize[5 -2 roll]/ImagingBBox null>>setpagedevice"
*OpenUI *InputSlot/Media Source: PickOne
*OrderDependency: 10 AnySetup *InputSlot
*DefaultInputSlot: Auto
*InputSlot Auto/Automatic: "<</MediaPosition 0>>setpagedevice"
*InputSlot Manual/Manual: "<</MediaPosition 4>>setpagedevice"
*InputSlot Tray1/Tray 1: "<</MediaPosition 20>>setpagedevice"
*CloseUI: *InputSlot
*OpenUI *MediaType/Media Type: PickOne
*OrderDependency: 10 AnySetup *MediaType
*DefaultMediaType: Stationery
*MediaType Stationery/Stationery: "<</MediaType(Stationery)>>setpagedevice"
*MediaType StationeryLightweight/Lightweight Paper: "<</MediaType(StationeryLightweight)>>setpagedevice"
*MediaType StationeryHeavyweight/Heavyweight Paper: "<</MediaType(StationeryHeavyweight)>>setpagedevice"
*MediaType StationeryCover: "<</MediaType(StationeryCover)>>setpagedevice"
*MediaType Envelope/Envelope: "<</MediaType(Envelope)>>setpagedevice"
*MediaType EnvelopeHeavyweight/Heavyweight Envelope: "<</MediaType(EnvelopeHeavyweight)>>setpagedevice"
*MediaType EnvelopeLightweight/Lightweight Envelope: "<</MediaType(EnvelopeLightweight)>>setpagedevice"
*MediaType StationeryRecycled: "<</MediaType(StationeryRecycled)>>setpagedevice"
*MediaType Labels/Labels: "<</MediaType(Labels)>>setpagedevice"
*MediaType StationeryBond: "<</MediaType(StationeryBond)>>setpagedevice"
*MediaType Com.brother.thicker: "<</MediaType(Com.brother.thicker)>>setpagedevice"
*MediaType Com.brother.recycled: "<</MediaType(Com.brother.recycled)>>setpagedevice"
*CloseUI: *MediaType
*% ColorModel from urf-supported
*OpenUI *ColorModel/Print Color Mode: PickOne
*OrderDependency: 10 AnySetup *ColorModel
*ColorModel Gray/Monochrome: "<</cupsColorSpace 18/cupsBitsPerColor 8/cupsColorOrder 0/cupsCompression 0>>setpagedevice"
*DefaultColorModel: Gray
*CloseUI: *ColorModel
*OpenUI *Duplex/2-Sided Printing: PickOne
*OrderDependency: 10 AnySetup *Duplex
*DefaultDuplex: None
*Duplex None/Off: "<</Duplex false>>setpagedevice"
*Duplex DuplexNoTumble/On (Portrait): "<</Duplex true/Tumble false>>setpagedevice"
*Duplex DuplexTumble/On (Landscape): "<</Duplex true/Tumble true>>setpagedevice"
*CloseUI: *Duplex
*cupsBackSide: Normal
*OpenUI *OutputBin/Output Tray: PickOne
*OrderDependency: 10 AnySetup *OutputBin
*DefaultOutputBin: FaceDown
*OutputBin FaceDown/Face Down: ""
*PageStackOrder FaceDown: Normal
*CloseUI: *OutputBin
*DefaultResolution: 1200dpi
*OpenUI *cupsPrintQuality/Print Quality: PickOne
*OrderDependency: 10 AnySetup *cupsPrintQuality
*DefaultcupsPrintQuality: Normal
*cupsPrintQuality Draft/Draft: "<</HWResolution[300 300]>>setpagedevice"
*cupsPrintQuality Normal/Normal: "<</HWResolution[1200 1200]>>setpagedevice"
*cupsPrintQuality High/High: "<</HWResolution[1200 1200]>>setpagedevice"
*CloseUI: *cupsPrintQuality
*OpenUI *print-scaling/Print Scaling: PickOne
*OrderDependency: 10 AnySetup *print-scaling
*Defaultprint-scaling: auto
*print-scaling auto/Automatic: ""
*print-scaling auto-fit/Auto-fit: ""
*print-scaling fill/Fill: ""
*print-scaling fit/Fit: ""
*print-scaling none/None: ""
*CloseUI: *print-scaling
```