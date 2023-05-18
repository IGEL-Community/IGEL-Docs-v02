# HOWTO Dynabook Setup

-----

## Product: TECRA A40-J (PMM10U) || Version: PMM10U-00101U

### Tested with [IGEL OS 11.07.170+](https://www.igel.com/software-downloads/workspace-edition/)

### Dynabook: [Demo Video](https://www.linkedin.com/posts/dynabookeurope_igel-igelos-vdisec-activity-6879395877476147200-XU6L)

-----

|  Type        | Description           |
|--------------|-----------------------|
| IGEL Type | Laptop |
| Use Case  | Cloud access, 4K Video Playback, Demanding Workloads |
| Chipset | 11th Gen Intel(R) Core(TM) i5-1135G7 @ 2.40GHz |
| CPU Cores | 4 |
| RAM | 8GB |
| Flash Storage | 256GB |
| Graphics - Chipset | Intel Iris Xe Graphics |
| Graphics - Ports | 1 x USB-C, 1 x HDMI |
| Graphics - Max Resolution | 14" HD (1366 x 768) or FHD (1920 x 1080), HDMI 4096 x 2304 @ 60Hz |
| Ethernet | 10/100/1000 Ethernet (RJ-45) |
| Wireless | Intel 802.11ax with Bluetooth 5.0 (AX201 family). Optional 3G/4G LTE Sierra EM7455 |
| Interfaces - USB Type C | 2 |
| Interfaces - USB 3.2 | 2, 1 port 3G/4G LTE model |
| Interfaces - Serial | 0 |
| Interfaces - Audio | 3.5mm TRRS |
| Interfaces - Security Lock | Yes |
| Interfaces - Smartcard | Available (not tested on IGEL) |
| Fanless | No |
| Warranty | 1 Year |
| Vendor Link US | [Dynabook Tecra A40G - US](https://us.dynabook.com/computers-tablets/laptops/tecra/A40) |
| Vendor Link Europe | [Dynabook Tecra A40G - Europe](https://emea.dynabook.com/laptops/tecra/tecra-a40/) |

-----

#### BIOS settings:

1. Power up the device while pressing the [F2] button repeatedly in rapid succession.
2. If a password prompt is shown, enter the BIOS password.
3. Select Setup Utility.
4. Select Security tab.
5. Set Secure Boot to \<Disabled>.
6. Select Boot tab.
7. Set Boot Option \# 1 to `<USB Memory>`.
8. Set Boot Option \# 2 to `<HDD/SSD>`.
9. Save the settings and exit [F10].
10. Connect the IGEL OSC USB stick to the device.
11. Reboot the device.
12. You can continue with the [IGEL OS installation procedure](https://kb.igel.com/igelos-11.08/en/installation-procedure-63805133.html)

-----

#### Set action for display lid closing:

1. Open up IGEL Setup.
2. Select System > Registry.
3. Select system.actions.lid.ac.
4. Select lid close action while plugged in set to \<Turn off display>.
5. Select system.actions.lid.battery.
4. lid close action while not plugged in set to \<Suspend>.

-----

#### Improve sound quality for internal speakers or HDMI / DP

Setting to improve sound quality:

System > Registry > multimedia.pulseaudio.daemon.resample-method > speex-float-3

-----

#### (Optional) To disable touch pad and use external mouse:

1. Open up IGEL Setup.
2. User Interface > Input > Touchpad > Uncheck \<Enable Touchpad>.

As root, xinput --list

``` linenums="1"
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

Sample command to disable Touchpad:

``` linenums="1"
#!/bin/bash

xinput set-prop "3830303142534F54:00 06CB:CE46 Touchpad" "Device Enabled" 0
```

----
