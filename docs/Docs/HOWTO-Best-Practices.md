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


- [Password](https://kb.igel.com/en/igel-os-base-system/12.4/change-password-in-igel-os-12)

    Provides details on the user types and their roles in IGEL OS. You can configure passwords for the user types to protect your endpoint devices against unwanted changes. 

- [Logon Settings](https://kb.igel.com/en/igel-os-base-system/12.4/logon-settings-in-igel-os-12)

    Provides options for logon settings are available in IGEL OS.

- [Active Directory/Kerberos](https://kb.igel.com/en/igel-os-base-system/12.4/active-directory-kerberos)

    Shows how to configure the options for Active Directory with Kerberos in IGEL OS.

- [Single Sign On (SSO)](https://igel-community.github.io/IGEL-Docs-v02/Docs/HOWTO-COSMOS/#faq-single-sign-on-sso)

    IGEL SSO will work with identity provider (IdP) that supports [OpenID Connect](https://openid.net/developers/how-connect-works/).

-----

## UMS

Initial setup for UMS can be done with embedded database with plans to migrate the embedded database to external database once devices reach a certain number.

**NOTE:** For small installations, a single UMS Server instance (standard UMS) with an embedded database is usually sufficient. If required, a single-instance installation can be easily extended anytime to a Distributed UMS installation by installing additional servers (and in the case of an embedded database, by switching preliminarily to an external data source).

- [UMS Sizing Guidelines](https://kb.igel.com/en/universal-management-suite/current/sizing-guidelines-for-igel-ums-12-and-igel-os-12)

-----

## ICG vs. Reverse Proxy

- [IGEL Cloud Gateway vs. Reverse Proxy for the Communication between UMS 12 and IGEL OS Devices](https://kb.igel.com/en/universal-management-suite/12.07.100/igel-cloud-gateway-vs-reverse-proxy-for-the-commun)

    With the launch of IGEL Universal Management Suite (UMS) 12, the Unified Protocol used for all communication between the UMS and IGEL OS 12 devices was introduced. The Unified Protocol is a secure protocol that uses TCP 8443. However, depending on the structure of your UMS environment, company's security policies, etc., it may be insufficient, and the use of the IGEL Cloud Gateway (ICG) or reverse proxy may be required.

-----

## Remote Security Logging in IGEL

The remote security logging feature for the IGEL Universal Management Suite (UMS), the IGEL Cloud Gateway (ICG) and the IGEL Management Interface (IMI). The remote security logging feature logs security relevant events in a separate log files that can be picked up by a configured log collector/SIEM.

- [IGEL KB: Remote Security Logging in IGEL](https://kb.igel.com/en/universal-management-suite/12.07.100/remote-security-logging-in-igel)

-----

## Collect IGEL information for input into CMDB

Instead of installing a 3rd party agent onto IGEL OS, use data collected by UMS to feed into your [CMDB](https://en.wikipedia.org/wiki/Configuration_management_database).

If the data needed is not currently being collected, then use IGEL UMS Device Attributes to collect the information.

- [IGEL KB: How to Manage IGEL OS Devices by Device Specific Data - What Device Attributes Can Do for You](https://kb.igel.com/en/universal-management-suite/12.07.100/how-to-manage-igel-os-devices-by-device-specific-d)

Now that you have the information in the IGEL UMS, create view and administrative task that will generate data file used in [ETL Job](https://en.wikipedia.org/wiki/Extract,_transform,_load).

- [IGEL KB: Views - Filtering for Devices in the IGEL UMS](https://kb.igel.com/en/universal-management-suite/12.07.100/views-filtering-for-devices-in-the-igel-ums)

- [IGEL KB: Export View or Advanced Search Result via Mail as an Administrative Task in the IGEL UMS](https://kb.igel.com/en/universal-management-suite/12.07.100/export-view-or-advanced-search-result-via-mail-as-)

Now use the data file as input for your ETL job into your CMDB. Follow guidance from your CMDB vendor for setting up ETL job.
