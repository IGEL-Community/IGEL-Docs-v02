# HOWTO VPN

-----

## OS 11 and 12 VPN

### [OS 12: NCP Secure Enterprise Client](https://app.igel.com/ncp/5.10.40552+2)

### [OS 11: NCP Secure Enterprise Client](https://kb.igel.com/en/igel-os/current/ncp-vpn-client)

- The [NCP Secure Enterprise Client](https://www.ncp-e.com/en/) is a component of NCP’s Network Access Technology” the holistic NCP Secure Enterprise Solution. Highly secure data connections to VPN gateways from all well-known suppliers can be established using IPsec standards. The teleworker works transparently and securely at any location (mobile or stationary) in the same manner as he works at his office within his corporate environment.

-----

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

IGEL Knowledge Base: [OpenConnect VPN](https://kb.igel.com/en/igel-os/current/openconnect-vpn)

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

## Smart Card / PKCS#11 support

- OpenConnect supports the use of X.509 certificates and keys from smart cards. See the following document: [OpenConnect: Smart Card / PKCS#11 support](https://www.infradead.org/openconnect/pkcs11.html).

- IGEL App Portal: [SafeNet Authentication Client](https://app.igel.com/safenet)
- IGEL App Portal: [SafeSign Identity Client](https://app.igel.com/safesign)
- IGEL App Portal: [Cryptovision - SCinterface](https://app.igel.com/cryptovision)
- IGEL App Portal: [Pointsharp Net iD Enterprise](https://app.igel.com/netid_enterprise)

**NOTE:** Your version of IGEL OS 12 may not have `p11tool`.  <a href="../Scripts/p11tool.zip" download>p11tool.zip Download</a> |

- Identifying the token

```bash linenums="1"
p11tool --list-tokens
```

```bash linenums="1"
Token 0:
	URL: pkcs11:model=p11-kit-trust;manufacturer=PKCS%2311%20Kit;serial=1;token=System%20Trust
	Label: System Trust
	Type: Trust module
	Flags: uPIN uninitialized
	Manufacturer: PKCS#11 Kit
	Model: p11-kit-trust
	Serial: 1
	Module: p11-kit-trust.so
```

- Locating the certificate

```bash linenums="1"
p11tool --list-all-certs 'URL-FROM p11tool --list-tokens'
```

```bash linenums="1"
Object 107:
	URL: pkcs11:model=p11-kit-trust;manufacturer=PKCS%2311%20Kit;serial=1;token=System%20Trust;id=%09%CB%59%7F%86%B2%70%8F%1A%C3%39%E3%C0%D9%E9%BF%BB%4D%B2%23;object=Microsoft%20RSA%20Root%20Certificate%20Authority%202017;type=cert
	Type: X.509 Certificate (RSA-4096)
	Expires: Fri Jul 18 17:00:23 2042
	Label: Microsoft RSA Root Certificate Authority 2017
	Flags: CKA_CERTIFICATE_CATEGORY=CA; CKA_TRUSTED; 
	ID: 09:cb:59:7f:86:b2:70:8f:1a:c3:39:e3:c0:d9:e9:bf:bb:4d:b2:23
```

- Searching for the key manually

```bash linenums="1"
p11tool --list-privkeys --login pkcs11:manufacturer=piv_II
```

- Run OpenConnect with the full longhand specification of both certificate and key with Palo Alto Networks GlobalProtect SSL VPN (--protocol=gp)


```bash linenums="1"
openconnect --protocol=gp -c 'URL-CERT` -k 'URL-KEY' vpn.example.com
```

-----

## OpenConnect VPN Client Documentation

- [OpenConnect VPN Client](https://www.infradead.org/openconnect/index.html)

----

## OpenVPN

- IGEL Knowledge Base: [OpenVPN](https://kb.igel.com/en/igel-os/current/openvpn)

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

Use the following command to list ciphers:

```bash linenums="1"
openvpn --show-ciphers
```

-----

-----

## OS 12 - Other VPN Clients (IGEL Community App Recipes on GitHub)

- [Cisco Secure Client - AnyConnect VPN](https://github.com/IGEL-Community/IGEL-OS-APP-RECIPES/tree/main/APP_Source/Network/cisco_secure_client)

    - **NOTE:** Edit recipe to update Cisco secure client app version number in file `install.json`

- [F5 VPN](https://github.com/IGEL-Community/IGEL-OS-APP-RECIPES/tree/main/APP_Source/Network/f5_vpn)

- [Ivanti Secure Access Client for Linux VPN (Pulse Secure)](https://github.com/IGEL-Community/IGEL-OS-APP-RECIPES/tree/main/APP_Source/Network/pulsesecure)

- [Sonicwall Netextender](https://github.com/IGEL-Community/IGEL-OS-APP-RECIPES/tree/main/APP_Source/Network/sonicwall_netextender)

- [Tailscale](https://github.com/IGEL-Community/IGEL-OS-APP-RECIPES/tree/main/APP_Source/Network/tailscale)

-----

## OS 11 - Other VPN Clients (IGEL Community Custom Partitions on GitHub)

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
