# HOWTO VPN

-----

## OpenConnect VPN Client

OpenConnect is a cross-platform multi-protocol SSL VPN client which supports a number of VPN protocols:

- Cisco AnyConnect (--protocol=anyconnect)
- Array Networks AG SSL VPN (--protocol=array)
- Juniper SSL VPN (--protocol=nc)
- Pulse Connect Secure (--protocol=pulse)
- Palo Alto Networks GlobalProtect SSL VPN (--protocol=gp)
- F5 Big-IP SSL VPN (--protocol=f5)
- Fortinet Fortigate SSL VPN (--protocol=fortinet)

### [11.08.440](ReleaseNotes/01-OS11/readme11.08.440.txt), released on 16-August-2023, added the following:

```
### OpenConnect VPN

* Added further supported protocols for OpenConnect VPN client by adding
  Fortinet, F5 and Array. OpenConnect VPN is a feature with limited support, and
  the new protocols are not validated by IGEL.

+------------+-----------------------------------------------------------------+
|Setup       |Network>VPN>OpenConnect VPN>Name>Session                         |
+------------+-----------------------------------------------------------------+
|Parameter   |`Protocol`                                                       |
+------------+-----------------------------------------------------------------+
|Registry    |`sessions.openconnect<INST>.vpnopts.protocol`                    |
+------------+-----------------------------------------------------------------+
|Value       |{**}anyconnect{**}/nc/pulse/gp/f5/fortinet/array                 |
+------------+-----------------------------------------------------------------+
```

-----

## Steps to enable OpenConnect VPN Client

IGEL Knowledge Base: [OpenConnect VPN](https://kb.igel.com/igelos-11.08/en/openconnect-vpn-63804977.html)

-----

## OTP (One Time Password) for OpenConnect VPN Client

<a href="../Profiles/HOWTO-Use-OpenConnect-VPN-Client-OTP-profile.xml" download>LINK to OTP Profile for OpenConnect</a>


**Note:** A reboot is needed once profile is applied (firmware update to add OpenConnect, and for script to be applied).

-----

## How to setup for Global Protect VPN via a web portal so that user can enter their MFA pin

```bash linenums="1"
openconnect --protocol=gp IP-address --usergroup=gateway | grep -Eo "(https)://login[a-zA-Z0-9./?=_%:-]*" | xargs /config/sessions/chromium0
```

What it does: it searches for https//login into the stream and send this stream to a chromium browser session.

**Note:** Only the session needs to exist before (but no icon is needed). It is working as user.

-----

## How to setup OpenConnect and Cisco ASA Firewall with untrusted Cert

The profile has environment variables for the certificate hash and authgroup.

The hash of the certificate can be viewed with the following command:

```bash linenums="1"
openssl x509 -fingerprint -noout -in /wfs/zert.pem | sed 's/://g'
```

<a href="../Profiles/HOWTO-Use-OpenConnect-VPN-Trust-Cert-profile.xml" download>LINK to Profile for OpenConnect and Cisco ASA Firewall with untrusted Cert</a>

-----

## [gp-saml-gui](https://github.com/dlenski/gp-saml-gui)

This is a helper script to allow you to interactively login to a GlobalProtect VPN that uses SAML authentication, so that you can subsequently connect with OpenConnect.

Install the gp-saml-gui as a file via UMS. Edit profile to set variable for for FQDN of VPN server - `PANURL`.

<a href="../Profiles/HOWTO-Use-OpenConnect-VPN-gp-saml-gui-profile.xml" download>LINK to Profile for OpenConnect using gp-saml-gui</a>

**NOTES:**

- PANURL FQDN of server and `do not include` https:// in the name since the script adds it automatically.
- Certificate chain may be needed.

-----

## OpenConnect VPN Client Documentation

- [OpenConnect VPN Client](https://www.infradead.org/openconnect/index.html)

----

## OpenVPN

- IGEL Knowledge Base: [OpenVPN](https://kb.igel.com/igelos-11.08/en/openvpn-63804963.html)

- [Reference manual for OpenVPN](https://openvpn.net/community-resources/reference-manual-for-openvpn-2-6/)

- [11.08.440](ReleaseNotes/01-OS11/readme11.08.440.txt), released on 16-August-2023, added the following:

```
### Open VPN

* Updated cipher configuration of Open VPN. Now it is possible to specify the
  data-ciphers list. By default the default cipher list
  AES-256-GCM:AES-128-GCM:CHACHA20-POLY1305 is active. Otherwise a custom list
  can be specified in the Data ciphers parameter. Enter the ciphers separated
  with ':'. The existing parameter 'Cipher' was renamed to 'Cipher (legacy
  parameter)' and now has a new value 'unset' in range, which means that the
  parameter cipher will be omitted in the configuration.

+------------+-----------------------------------------------------------------+
|Setup       |`Network > VPN > Open VPN > Connection > Options`                |
+------------+-----------------------------------------------------------------+
|Parameter   |`Use default data cipher list`                                   |
+------------+-----------------------------------------------------------------+
|Registry    |`sessions.openvpn%.vpnopts.use_default_cipher_list`              |
+------------+-----------------------------------------------------------------+
|Value       |**on** / off                                                     |
+------------+-----------------------------------------------------------------+
|Setup       |`Network > VPN > Open VPN > Connection > Options`                |
+------------+-----------------------------------------------------------------+
|Parameter   |`Data ciphers`                                                   |
+------------+-----------------------------------------------------------------+
|Registry    |`sessions.openvpn%.vpnopts.data_ciphers`                         |
+------------+-----------------------------------------------------------------+
|Value       |empty **Default**                                                |
+------------+-----------------------------------------------------------------+
```

-----

## Other VPN Clients (IGEL Community Custom Partitions on GitHub)

- [AWS VPN Client](https://github.com/IGEL-Community/IGEL-Custom-Partitions/tree/master/CP_Source/Network/AWS_VPN)

- [Check Point SSL Network Extender (SNX)](https://github.com/IGEL-Community/IGEL-Custom-Partitions/tree/master/CP_Source/Network/Check_Point_SSL_Network_Extender)

- `Cisco AnyConnect VPN` - Open a ticket with IGEL support to request the CP

- [F5 VPN](https://github.com/IGEL-Community/IGEL-Custom-Partitions/tree/master/CP_Source/Network/F5_VPN)

- [OpenFortiGUI](https://github.com/IGEL-Community/IGEL-Custom-Partitions/tree/master/CP_Source/Apps/OpenFortiGUI)

- [OpenNAC VPN](https://github.com/IGEL-Community/IGEL-Custom-Partitions/tree/master/CP_Source/Network/OpenNAC_VPN)

- [Pulse Secure VPN](https://github.com/IGEL-Community/IGEL-Custom-Partitions/tree/master/CP_Source/Network/Pulse_VPN)

- [SonicWall NetExtender](https://github.com/IGEL-Community/IGEL-Custom-Partitions/tree/master/CP_Source/Network/SonicWall_NetExtender_V2)

- [Tailscale VPN](https://github.com/IGEL-Community/IGEL-Custom-Partitions/tree/master/CP_Source/Network/Tailscale_VPN)

- [WireGuard VPN](https://github.com/IGEL-Community/IGEL-Custom-Partitions/tree/master/CP_Source/Network/WireGuard_VPN_Client)
