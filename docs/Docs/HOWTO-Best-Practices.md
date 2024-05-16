# HOWTO Best Practices

<!---
This is a comment section
-->

----------

----------

## OS 12

### Initial Testing without UMS

- [Want to test out OS 12 with App Portal without UMS12?](https://igel-community.github.io/IGEL-Docs-v02/Docs/HOWTO-Add-Applications/#want-to-test-out-os-12-with-app-portal-without-ums12)

### Security / Password


- [Password](https://kb.igel.com/base_system/12.4/en/password-122896143.html)

    This article provides details on the user types and their roles in IGEL OS. You can configure passwords for the user types to protect your endpoint devices against unwanted changes. 

- [Logon Settings](https://kb.igel.com/base_system/12.4/en/logon-122896147.html)

    Provides options for logon settings are available in IGEL OS.

- [Active Directory/Kerberos](https://kb.igel.com/base_system/12.4/en/active-directory-kerberos-122896163.html)

    This article shows how to configure the options for Active Directory with Kerberos in IGEL OS.

- [Single Sign On (SSO)](https://igel-community.github.io/IGEL-Docs-v02/Docs/HOWTO-COSMOS/#faq-single-sign-on-sso)

    IGEL SSO will work with identity provider (IdP) that supports [OpenID Connect](https://openid.net/developers/how-connect-works/).

-----

## UMS

Initial setup for UMS can be done with embedded database with plans to migrate the embedded database to external database once devices reach a certain number.

**NOTE:** For small installations, a single UMS Server instance (standard UMS) with an embedded database is usually sufficient. If required, a single-instance installation can be easily extended anytime to a Distributed UMS installation by installing additional servers (and in the case of an embedded database, by switching preliminarily to an external data source).

- [UMS Sizing Guidelines](https://kb.igel.com/endpointmgmt-12.04/en/igel-ums-sizing-guidelines-architecture-diagrams-122457702.html)

-----

## ICG vs. Reverse Proxy

- [IGEL Cloud Gateway vs. Reverse Proxy for the Communication between UMS 12 and IGEL OS Devices](https://kb.igel.com/endpointmgmt-12.04/en/igel-cloud-gateway-vs-reverse-proxy-for-the-communication-between-ums-12-and-igel-os-devices-122457741.html)

With the launch of IGEL Universal Management Suite (UMS) 12, the Unified Protocol used for all communication between the UMS and IGEL OS 12 devices was introduced. The Unified Protocol is a secure protocol that uses TCP 8443. However, depending on the structure of your UMS environment, company's security policies, etc., it may be insufficient, and the use of the IGEL Cloud Gateway (ICG) or reverse proxy may be required.