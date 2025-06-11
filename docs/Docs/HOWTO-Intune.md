# HOWTO Intune

-----

-----

## Intune App

- [IGEL BLOG: Available now! Microsoft Intune Agent for IGEL OS](https://www.igel.com/blog/available-now-microsoft-intune-agent-for-igel-os/)

The release of the Microsoft Intune Agent for IGEL OS provides visibility of IGEL OS devices within the Intune console giving admins a single place to asset track and apply security checks and policies.

The Microsoft Intune Agent for IGEL OS will allow registering the IGEL OS into EntraID, run Device Compliance checks and based on the compliance checks, apply conditional access policies to Azure Virtual Desktop and Windows 365. optionally running Microsoft Edge browser (also available now in the IGEL App Portal) allows device compliance checks and conditional access policies to Microsoft 365 SaaS apps.

Out of the box Device Compliance policies can be applied to IGEL OS endpoints based on the following conditions:

- OS Type
- OS Min Version
- OS Max Version

Need a more granular approach? No problem, there is an option to create custom scripts to really apply granular device compliance controls on IGEL OS.

-----

-----

## IGEL BLOG: Microsoft Intune on IGEL App Portal – Custom Compliance Scripts for Entra Conditional Access with IGEL OS

**NOTE:** Content based on post by Fredrik Brattstig @virtualbrat

- [IGEL BLOG: Microsoft Intune on IGEL App Portal – Custom Compliance Scripts for Entra Conditional Access with IGEL OS](https://www.igel.com/blog/microsoft-intune-on-igel-app-portal-custom-compliance-scripts-for-entra-conditional-access-with-igel-os/)

The Microsoft Intune Agent is now available in the IGEL App Portal, joining the Microsoft Edge app and the IGEL AVD app. The Intune Conditional Access app enables Entra conditional access capabilities with IGEL OS 12 to control access to Azure Virtual Desktop and Windows 365. It provides visibility of IGEL OS devices within the Intune console giving admins a single place to track assets and apply security checks and policies.

By using this method we know that:

- Device has to be enrolled in the company Intune (A trusted user needs to enroll the device)
- The device has to be managed by the company UMS (We determine that it is not a random Intune enrolled device, it is a device that is managed by the company UMS)

- Compliance script that checks the devices assigned UMS certificate has a certain sha256 fingerprint

```bash linenums="1"
#!/bin/bash
#set -x
#trap read debug

#
# Updated script from BLOG post
# https://www.igel.com/blog/microsoft-intune-on-igel-app-portal-custom-compliance-scripts-for-entra-conditional-access-with-igel-os/
#

logger “Starting compliance discovery script”
logger ” – Checking UMS fingerprint”
estcacertfile="/wfs/igel-rmagent/trust-store/est/est-ca.pem"
ums_fingerprint_sha256=$(openssl x509 -in ${estcacertfile} -noout -fingerprint -sha256 | cut -d "=" -f2)
printf ‘{“ums_fingerprint_sha256″:”%s”}\n’ “$ums_fingerprint_sha256”
logger “Ending compliance script”
```

- Compliance policy setting in Intune admin portal

```json linenums="1"
{
"Rules":[
    {
       "SettingName":"ums_fingerprint_sha256",
       "Operator":"IsEquals",
       "DataType":"String",
       "Operand":"80:20:EF:F6:61:DA:7E:54:23:FE:FF:74:CC:41:66:47:62:6E:E3:4C:36:14:17:4A:1B:17:81:AF:6D:81:BF:20",
       "MoreInfoUrl":"https://www.igel.com",
       "RemediationStrings":[
          {
              "Language": "en_US",
              "Title": "Enrolled to a wrong UMS",
              "Description": "Please ensure that your IGEL OS is managed by the correct UMS."
          },
          {
              "Language": "de_DE",
              "Title": "Von einer falschen UMS verwaltet",
              "Description": "Bitte stellen Sie sicher, dass Ihr IGEL-Betriebssystem von der richtigen UMS verwaltet wird."
          }
       ] }
  ]
}
```