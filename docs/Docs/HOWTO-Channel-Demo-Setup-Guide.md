# HOWTO Channel Demo Setup Guide

----------

----------

**NOTE:** North America Channel team have UMS / ICG environment in Microsoft Azure that certified IGEL channel partners can leverage to enroll devices with configured profiles. Administrative access to UMS is limited to IGEL Channel team.

----------

----------

## Steps to follow to setup IGEL OS device

1. If device was previously in UMS, contact IGEL Channel team to remove device from IGEL UMS
2. Once IGEL Channel team have removed device from UMS then continue to next steps
3. On IGEL OS device, open a terminal window, remove device license, and reset to factory defaults. [Reset IGEL OS device (shortcut)](https://igel-community.github.io/IGEL-Docs-v02/Docs/HOWTO-Remove-IGEL-Device-License/#reset-igel-os-device-shortcut)
4. Reboot device and reconnect to ICG (remember to enable NTP (pool.ntp.org)) – Make sure to set time / date
5. Select the 90-day eval license

[FAQ - Time Service](https://igel-community.github.io/IGEL-Docs-v02/Docs/HOWTO-COSMOS/#faq-time-service)

[IGEL KB - OS 11 - Getting a Demo License](https://kb.igel.com/licensesmore-igelos11/en/getting-a-demo-license-10334222.html)

[IGEL KB - Overview: First Steps with IGEL OS](https://kb.igel.com/igelos-11.08/en/overview-first-steps-with-igel-os-11-63802221.html)

<!---
This is a comment section
### Steps to get a demo license for OS 12

- Boot device
- Skip -- Let's connect to the company network
- Skip -- Use the one-time password to onboard this device?
- Obtain IGEL OS 12 Evaluation License -- Are you implementing as IGEL solution for your company? (This is 90 a day day evaluation license)
- Reboot
-->

----------

----------


## SHI Connection Settings (IGEL Base)

| Component | Value |
|-----------|-------|
| Address | https://cosmos-icg.igelcloud.com:443 |
| UMS Structure Tag | OS11-SHI-LG-EvalCenter |
| Password | `Contact IGEL Channel for password` |

<!---
| Password | SHI-LG-EvalCenter |
-->

## SHI Connection Settings (IGEL Base + ControlUp)

| Component | Value |
|-----------|-------|
| Address | https://cosmos-icg.igelcloud.com:443 |
| UMS Structure Tag | OS11-SHI-LG-CUP |
| Password | `Contact IGEL Channel for password` |

<!---
| Password | SHI-LG-EvalCenter |
-->

----------

----------
