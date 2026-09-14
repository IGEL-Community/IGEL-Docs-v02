=============================================================================
IGEL Universal Management Suite
=============================================================================
Version 12.14.100
Release date: 09.09.2026

HTML version of this Readme is available at:  https://kb.igel.com/en/universal-management-suite/current/ums-release-notes


=============================================================================
Supported environment:
=============================================================================
UMS Server: 
Microsoft Windows Server 2019 (64 bit) 
Microsoft Windows Server 2022 (64 bit)
Microsoft Windows Server 2025 (64 bit)
Ubuntu 22.04 (64 bit)
Ubuntu 24.04 (64 bit)
Oracle Linux 7 (64 bit)
Oracle Linux 8 (64 bit)
Red Hat Enterprise Linux (RHEL) 7 (64 bit)
Red Hat Enterprise Linux (RHEL) 8 (64 bit)
Red Hat Enterprise Linux (RHEL) 9 (64 bit)
Amazon Linux 2

UMS Client: 
Microsoft Windows 10 (64 bit) 	
Microsoft Windows 11 (64 bit) 
Microsoft Windows Server 2019 (64 bit) 
Microsoft Windows Server 2022 (64 bit)
Microsoft Windows Server 2025 (64 bit)
Ubuntu 22.04 (64 bit)
Ubuntu 24.04 (64 bit)
Oracle Linux 7 (64 bit)
Oracle Linux 8 (64 bit)
Red Hat Enterprise Linux (RHEL) 7 (64 bit)
Red Hat Enterprise Linux (RHEL) 8 (64 bit)
Red Hat Enterprise Linux (RHEL) 9 (64 bit)
Amazon Linux 2


Backend database (DBMS):
Microsoft SQL Server 2017 (with cluster support)
Microsoft SQL Server 2019 (with cluster support)
Microsoft SQL Server 2022 (with cluster support)
Oracle 19c (with cluster support)
Oracle 21c (with cluster support)
PostgreSQL 11–18
Apache Derby 10.9–10.14
Amazon Aurora PostgreSQL (compatible with PostgreSQL 11–18)
Azure SQL Managed Instance

Regular support for Apache Derby has expired. The support for Apache Derby will end in a later UMS version.
	See also: https://kb.igel.com/en/igel-subscription-and-more/current/support-policies-for-connections-to-third-party-en


Browser:
Microsoft Edge 151.0+
Mozilla Firefox 154.0+
Google Chrome 151.0+


=============================================================================
New features:
=============================================================================

[Installer (linux)]
- Updated: Apache Tomcat from version 11.0.22 to 11.0.24
- Updated: Azul Zulu JDE from version 21.0.11+10 to 21.0.12+8

[Installer (windows)]
- Updated: Apache Tomcat from version 11.0.22 to 11.0.24
- Updated: Azul Zulu JDE from version 21.0.11+10 to 21.0.12+8

[UMS common]
- Added: Enhanced logging during upload apps process.
- Added: Mitigation logic for burst bulk requests (e.g., full application/binary-repository refreshes triggered in quick succession are now merged into a single run), preventing redundant load on the App Portal.
- Added: Coordination between synchronization jobs in multi-node UMS deployments, so only one node performs a given sync at a time, reducing load on the database.
- Added: Automatic retry for transient network errors and temporary portal unavailability (HTTP 429/502/503/504) on read requests, reducing sync failures.


=============================================================================
Resolved issues:
=============================================================================

[AD / LDAP integration]
- Fixed: Permission calculation of template keys for IdP users.

[Automatic License Deployment (ALD)]
- Fixed: When an IMH 2.0 license was deployed and several valid packs were present, it could be that not the correct pack was used in accordance with the defined order.

[Cloud IdP / SSO]
- Fixed: Improved AD group resolution in large multi-domain forests via LDAP connection reuse.

[Device Service]
- Fixed: App partition size is included in app export. App metadata imports now show the correct app size.
- Fixed: Online devices were shown as offline.

[License Service]
- Fixed: Deployment of IMH 2.0 licenses failed when a PostgreSQL database was configured.

[UMS common]
- Fixed: Security issues.

[UMS common]
- Fixed: IMH 2.0 licensing failed in air-gapped scenario when vmid was in lower case.

[auth]
- Fixed: Improved AD group resolution in large multi-domain forests via LDAP connection reuse.



=============================================================================
# UMS Web App #
=============================================================================

=============================================================================
New features:
=============================================================================

[Devices]
- Added: The "Update on Shutdown" command is now available for IGEL OS 12 devices.

[Unified Logging]
- Added: All actions performed in BC&DR Emergency Mode are now logged.

=============================================================================
Resolved issues:
=============================================================================

[Automation]
- Fixed: The application froze when expanding default directory rules with a large amount of data.
- Fixed: Job schedules with day-of-week repetition were not saved or displayed correctly.
- Fixed: The Active toggle for jobs was inverted, so creating an active job resulted in an inactive job and vice versa.

[Configuration]
- Fixed: The Recycle Bin dialog did not display all information correctly.

[Devices]
- Changed: The Shadow button is now disabled for devices that are currently running Windows.
- Changed: The badge on a device now reads "New settings available" instead of "Update available".
- Fixed: The Recycle Bin dialog did not display all information correctly.
- Fixed: The "Restore Virtual Machines" dialog in the IGEL Managed Hypervisor (IMH) did not show any available backups.
- Fixed: The label for total usage time was displayed incorrectly.

[Dual Boot]
- Fixed: Animations on the BC&DR dashboard were rendered incorrectly.


=============================================================================
=============================================================================
Including changes from UMS 12.13.110
=============================================================================
=============================================================================
IGEL Universal Management Suite
=============================================================================
Version 12.13.110
Release date: 20.08.2026

HTML version of this Readme is available at:  https://kb.igel.com/en/universal-management-suite/current/ums-release-notes

=============================================================================
Supported environment:
=============================================================================
UMS Server:
Microsoft Windows Server 2019 (64 bit)
Microsoft Windows Server 2022 (64 bit)
Microsoft Windows Server 2025 (64 bit)
Ubuntu 22.04 (64 bit)
Ubuntu 24.04 (64 bit)
Oracle Linux 7 (64 bit)
Oracle Linux 8 (64 bit)
Red Hat Enterprise Linux (RHEL) 7 (64 bit)
Red Hat Enterprise Linux (RHEL) 8 (64 bit)
Red Hat Enterprise Linux (RHEL) 9 (64 bit)
Amazon Linux 2

UMS Client:
Microsoft Windows 10 (64 bit) 	
Microsoft Windows 11 (64 bit)
Microsoft Windows Server 2019 (64 bit)
Microsoft Windows Server 2022 (64 bit)
Microsoft Windows Server 2025 (64 bit)
Ubuntu 22.04 (64 bit)
Ubuntu 24.04 (64 bit)
Oracle Linux 7 (64 bit)
Oracle Linux 8 (64 bit)
Red Hat Enterprise Linux (RHEL) 7 (64 bit)
Red Hat Enterprise Linux (RHEL) 8 (64 bit)
Red Hat Enterprise Linux (RHEL) 9 (64 bit)
Amazon Linux 2

Backend database (DBMS):
Microsoft SQL Server 2017 (with cluster support)
Microsoft SQL Server 2019 (with cluster support)
Microsoft SQL Server 2022 (with cluster support)
Oracle 19c (with cluster support)
Oracle 21c (with cluster support)
PostgreSQL 11–18
Apache Derby 10.9–10.14
Amazon Aurora PostgreSQL (compatible with PostgreSQL 11–18)
Azure SQL Managed Instance

Regular support for Apache Derby has expired. Support for Apache Derby will end in a later UMS version.
	See also: https://kb.igel.com/en/igel-subscription-and-more/current/support-policies-for-connections-to-third-party-en

Browser:
Microsoft Edge 149.0+
Mozilla Firefox 152.0+
Google Chrome 149.0+


=============================================================================
Resolved issues:
=============================================================================

[App Proxy]
- Fixed: Out-of-memory crashes on the applications endpoint under high load by optimizing JSON processing to reduce memory usage.

[Automatic License Deployment (ALD)]
- Fixed: Improved performance of automatic license deployment.

[Server, common]
- Fixed: Resolved an issue that prevented JavaMelody from generating and collecting performance metrics in some backend services.

[Unified Protocol]
- Fixed: An update of system information is only written to the DB if the checksum is different from the stored one for the pushsysinfo command.


=============================================================================
# UMS Web App #
=============================================================================

=============================================================================
Resolved issues:
=============================================================================

Configuration:
- Fixed: An issue where CUPS printer manufacturer and model lists were displayed with a delay in TC Setup.

[Misc]
- Changed: The "Open Knowledge Base" link now opens in English regardless of the application language.
- Fixed: A misconfigured class was preventing the successful use of JavaMelody (debugging/monitoring tool).


=============================================================================