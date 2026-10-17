=============================================================================
IGEL Universal Management Suite
=============================================================================
Version 6.07.100
Release date: 29.03.2021

HTML version of this Readme is available at:  https://kb.igel.com/ums/releasenotes


=============================================================================
Supported environment:
=============================================================================
UMS Server:
Microsoft Windows Server 2012 (64 bit) 
Microsoft Windows Server 2012 R2 (64 bit and with Update 2919355)
Microsoft Windows Server 2016 (64 bit) 
Microsoft Windows Server 2019 (64 bit) 
Ubuntu 16.04 (64 bit)
Ubuntu 18.04 (64 bit)
Ubuntu 20.04 (64 bit)
Oracle Linux 7 (64 bit)
Red Hat Enterprise Linux (RHEL) 7 (64 bit)
Red Hat Enterprise Linux (RHEL) 8 (64 bit)
Amazon Linux 2

UMS Client: 
Microsoft Windows 8.1 (64 bit and with Update 2919355) 
Microsoft Windows 10 (64 bit) 				
Microsoft Windows Server 2012 (64 bit) 
Microsoft Windows Server 2012 R2 (64 bit and with Update 2919355)
Microsoft Windows Server 2016 (64 bit) 
Microsoft Windows Server 2019 (64 bit) 
Ubuntu 16.04 (64 bit)
Ubuntu 18.04 (64 bit)
Ubuntu 20.04 (64 bit)
Oracle Linux 7 (64 bit)
Red Hat Enterprise Linux (RHEL) 7 (64 bit)
Red Hat Enterprise Linux (RHEL) 8 (64 bit)
Amazon Linux 2

Backend database (DBMS):
Microsoft SQL Server 2012
Microsoft SQL Server 2014 (with Cluster Support)
Microsoft SQL Server 2016 (with Cluster Support)
Microsoft SQL Server 2017 (with Cluster Support)
Microsoft SQL Server 2019 (with Cluster Support)
Oracle 12c
PostgreSQL 9.6 and 10 - 13
Apache Derby 10.9 - 10.14  

=============================================================================
Removed Support:
=============================================================================
PostgreSQL 9.5
Oracle 11g R2 


=============================================================================
Added Support:
=============================================================================
PostgreSQL 11 - 13


=============================================================================
Known Issues:
=============================================================================
[UMS common]
- Caution: For Oracle database installations verify the 'open_cursors' setting prior to an upgrade. Recommended setting is 3000 or higher

=============================================================================
New features:
=============================================================================

[UMS common]
- Added: New feature to enable devices to send heartbeat signals in regular intervals (See: https://kb.igel.com/ums/whatsnew for more Details)
- Added: Better integration for Azure & AWS (See: https://kb.igel.com/ums/whatsnew for more Details)
- Updated: Apache Tomcat from version 8.5.58 to 8.5.61
- Updated: Zulu JRE from version 8u265 to 8u282


[Asset Inventory Tracker (AIT)]
- Added: A (global) switch to enable or disable the Asset Inventory Tracker (UMS Administration -> Global Configuration -> UMS Features)


[AD / LDAP integration]
- Added: Extended the Active Directory / LDAP-Service connection test to give better feedback. (UMS Console -> Administration Tree -> Global Configuration -> Active Directory/LDAP)
- Added: Option to resolve AD user group dependency within multiple domains (UMS Administration -> Global Configuration -> Active Directory/LDAP)


[Server, common]
- Added: Active Directory database users for SQL Server Cluster database type
- Changed: The Elasticsearch log files are now also regarded when collecting the log files


[High Availability Feature]
- Added: Much faster upgrade installation sequence for HA installation (See: https://kb.igel.com/ums/whatsnew for more Details)


[Views]
- Added: New view/search criterion:  Configuration changes pending. It's now possible to filter for devices which did not get the newest configuration changes


[UMS Web App]
- Added: Introduced a new global permission "Device Bulk Action". This permission only affects the UMS Web App. Users without this permission cannot perform actions on multiple devices at once
- Added: New section introduced: Configuration Management
- Added: Profile-Tree
- Added: Base information for profiles: settings
- Added: Base information for profiles: template key relations
- Added: Base information for profiles: contained files
- Added: Base information for profiles: assigned devices
- Added: QuickAssignment via Profile Section
- Added: Editing of profile-properties. (not settings!)



=============================================================================
Resolved issues:
=============================================================================

[UMS common]
- Fixed: The size limit of log files on some Windows installation did not affect the log files 
- Fixed: Deadlock occurred when runtime information of devices was updated during copying database to Embedded DB
- Fixed: Some log files did get very big and were not truncated
- Fixed: Upload of Universal Firmware Updates via FTPS was not possible because of a certificate error


[UMS Web App]
- Fixed: The search does no longer crash handling a massive number of devices 
- Fixed: A bug inside the License-Check-Service (UMS Web App) for Windows10 devices resulted in an error that stopped the index-service
- Fixed: The renaming of Windows 10 devices caused an error inside the Web Application
- Fixed: Logging-section inside the UMS Web App was hidden from AD-Group-Users and Superusers
- Fixed: New log messages could sometimes not be deleted if the days-value were set to zero


[Console, common]
- Fixed: In rare scenarios the last tree selection in UMS Console could not be restored and as a result the UMS Console could not start


[Jobs]
- Fixed: Start date field is sometimes not filled when a new scheduled job is created


[Automatic License Deployment (ALD)]
- Fixed: Configuration changes for Automatic License Deployment were not synchronized within HA network


[Configuration Dialog]
- Fixed: The UMS Console Configuration Dialog didn't show correct settings for parameters configured parallel by FWC’s and indirect assigned Master Profiles. The settings of Shared Workplace Users were also affected

[Admin tasks]
- Changed: "Delete administrative execution data" admin task: deleted executions are now saved to multiple csv files for large execution numbers


[AD / LDAP integration]
- Fixed: In an HA environment, LDAPS certificates are now loaded automatically to all HA servers
- Fixed: Change Password for Shared Workplace users with more than one Domain Controller didn't work


[IGEL Cloud Gateway (ICG)]
- Fixed: It is now forbidden to import end-certificates without subject alternative name (UMS Administration -> UMS Network -> IGEL Cloud Gateway -> 'Install new IGEL Cloud Gateway' and 'Update Keystore')
- Fixed: Wildcard certificate host name validation in ICG update keystore dialog (UMS Administration -> UMS Network -> IGEL Cloud Gateway)
- Fixed: Feature 'Send ICG Configuration' (Device -> Context menu -> ICG Configuration -> Send ICG Configuration) always sent the internal ICG Hostname and Port


[Server, common]
- Fixed: Some Global Configuration settings changes were not synchronized within the HA network
- Fixed: Automatic License Deployment mechanism was improved in order to prevent deadlocks
- Fixed: Register device in UMS from the device itself, required the user to have 'Move' permission instead of the correct 'Scan' permission


[High Availability Feature]
- Fixed: Files of a WebDAV subdirectory were not synchronized within a HA environment


[Views]
- Fixed: Devices where "Boot Time" and "Last contact" are empty, are now also considered in views and searches if the criterion is relative and the filter is "Date more than X days ago"


[Notifications]
- Changed: Improved notification messages for expiring licenses, packs and certificates


[Administrator application]
- Fixed: DB Update failed in case of a specific certificate configuration
- Fixed: After changing the password of the database user, the application had to be restarted to change the settings of the UMS superuser


[Installer (windows)]
- Fixed: RMClient.exe and RMAdmin.exe did not have a digital signature
- Fixed: Changed ports (in UMS Administrator -> Settings) are now reflected in the firewall exclusions



=============================================================================
=============================================================================
Including changes from private builds of Version 6.06.100
=============================================================================


=============================================================================
IGEL Universal Management Suite
=============================================================================
Version 6.06.110
Release date: 25.01.2021

HTML version of this Readme is available at:  https://kb.igel.com/ums/releasenotes


=============================================================================
Supported environment:
=============================================================================
UMS Server:
Microsoft Windows Server 2012 (64 bit) 
Microsoft Windows Server 2012 R2 (64 bit and with Update 2919355)
Microsoft Windows Server 2016 (64 bit) 
Microsoft Windows Server 2019 (64 bit) 
Ubuntu 16.04 (64 bit)
Ubuntu 18.04 (64 bit)
Ubuntu 20.04 (64 bit)
Oracle Linux 7 (64 bit)
Red Hat Enterprise Linux (RHEL) 7 (64 bit)
Red Hat Enterprise Linux (RHEL) 8 (64 bit)
Amazon Linux 2

UMS Client: 
Microsoft Windows 8.1 (64 bit and with Update 2919355) 
Microsoft Windows 10 (64 bit) 				
Microsoft Windows Server 2012 (64 bit) 
Microsoft Windows Server 2012 R2 (64 bit and with Update 2919355)
Microsoft Windows Server 2016 (64 bit) 
Microsoft Windows Server 2019 (64 bit) 
Ubuntu 16.04 (64 bit)
Ubuntu 18.04 (64 bit)
Ubuntu 20.04 (64 bit)
Oracle Linux 7 (64 bit)
Red Hat Enterprise Linux (RHEL) 7 (64 bit)
Red Hat Enterprise Linux (RHEL) 8 (64 bit)
Amazon Linux 2

Backend database (DBMS):
Microsoft SQL Server 2012
Microsoft SQL Server 2014 (with Cluster Support)
Microsoft SQL Server 2016 (with Cluster Support)
Microsoft SQL Server 2017 (with Cluster Support)
Microsoft SQL Server 2019 (with Cluster Support)
Oracle 11g R2 
Oracle 12c
PostgreSQL 9.5 - 9.6 and 10.1
Apache Derby 10.9 - 10.14  


=============================================================================
Resolved issues:
=============================================================================

[UMS Web App]
- Fixed: The search does no longer crash handling a massive number of devices. 
- Fixed: A bug inside the License-Check-Service (UMS Web App) for Windows10 devices resulted in an error that stopped the index-service.
- Fixed: The renaming of Windows 10 devices threw an error inside the Web Application.
- Fixed: Logging-section inside the Ums WebApp was hidden from AD-Group-Users and Superusers.
- Fixed: The device online check was incorrect if the user had insufficient permissions for the corresponding Cloud Gateway.
- Fixed: New log messages could sometimes not be deleted if the days-value was set to zero.

[Views]
- Fixed: Possible errors in views with license criterion combination.

[UMS common]
- Fixed: The size limit of log files on some Windows installation did not affect the log files. 
- Fixed: Deadlock occurred when runtime information of devices was updated during copying database to Embedded DB.
- Fixed: Some log files get very big and are not truncated.


[Universal Firmware Update]
- Fixed: Universal Firmware Updates are no longer deleted from UMS WebDAV if protocol is changed from HTTP(S) (UMS WebDAV) to another protocol.


[AD / LDAP integration]
- Fixed: Shared workplace login was not possible if the user had no settings assigned.
- Added: Extended the Active Directory / LDAP-Service connection test to give better feedback. (UMS Console -> Administration Tree -> Global Configuration -> Active Directory/LDAP)


[IGEL Cloud Gateway (ICG)]
- Fixed: Wildcard certificates were not selectable in the ICG Update KeyStore dialog.


[Server, common]
- Fixed: Automatic license deployment mechanism was improved to prevent deadlocks.


[High Availability Feature]
- Added: Upgrade installation sequence for HA installations with big databases.

[Default Directory Rules]
- Fixed: Default Directory Rules with a IGEL Cloud Gateway criterion could, if applied while registering the device, provide wrong results.