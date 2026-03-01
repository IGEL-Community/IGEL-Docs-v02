=============================================================================
IGEL Universal Management Suite
=============================================================================
Version 12.10.100
Release date: 15.01.2026

HTML version of this Readme is available at:  https://kb.igel.com/ums/releasenotes


=============================================================================
Supported environment:
=============================================================================
UMS Server:
Microsoft Windows Server 2016 (64 bit) 
Microsoft Windows Server 2019 (64 bit) 
Microsoft Windows Server 2022 (64 bit)
Microsoft Windows Server 2025 (64 bit)
Ubuntu 20.04 (64 bit)
Ubuntu 22.04 (64 bit)
Ubuntu 24.04 (64 bit)
Oracle Linux 7 (64 bit)
Red Hat Enterprise Linux (RHEL) 7 (64 bit)
Red Hat Enterprise Linux (RHEL) 8 (64 bit)
Red Hat Enterprise Linux (RHEL) 9 (64 bit)
Amazon Linux 2

UMS Client: 
Microsoft Windows 10 (64 bit) 	
Microsoft Windows 11 (64 bit) 
Microsoft Windows Server 2016 (64 bit)			
Microsoft Windows Server 2019 (64 bit) 
Microsoft Windows Server 2022 (64 bit)
Microsoft Windows Server 2025 (64 bit)
Ubuntu 20.04 (64 bit)
Ubuntu 22.04 (64 bit)
Ubuntu 24.04 (64 bit)
Oracle Linux 7 (64 bit)
Red Hat Enterprise Linux (RHEL) 7 (64 bit)
Red Hat Enterprise Linux (RHEL) 8 (64 bit)
Red Hat Enterprise Linux (RHEL) 9 (64 bit)
Amazon Linux 2

Regular support for Windows Server 2016 and Ubuntu 20.04 has expired. Starting with UMS 12.12.100 in Q3 2026, IGEL will no longer supports these operating systems.
 	See also: https://kb.igel.com/en/igel-subscription-and-more/current/support-policies-for-connections-to-third-party-en


Backend database (DBMS):
Microsoft SQL Server 2016 (with Cluster Support)
Microsoft SQL Server 2017 (with Cluster Support)
Microsoft SQL Server 2019 (with Cluster Support)
Microsoft SQL Server 2022 (with Cluster Support)
Oracle 21c (with Cluster Support)
PostgreSQL 11 - 15
Apache Derby 10.9 - 10.14
Amazon Aurora PostgreSQL (Compatible with PostgreSQL 11 – 15) 
Azure SQL Managed Instance

Regular support for Microsoft SQL Server 2016 has expired. Starting with UMS 12.12.100 in Q3 2026, IGEL will no longer supports these operating systems.
	See also: https://kb.igel.com/en/igel-subscription-and-more/current/support-policies-for-connections-to-third-party-en


Browser:
Microsoft Edge 137.0.+
Mozilla Firefox 139.0.+
Google Chrome 137.0.+


=============================================================================
New features:
=============================================================================

[Admin tasks] 
- Added: Administrative task for device license deployment / device license exchange. 

[Administrator application] 
- Added: UMS Admin CLI Commands  
	- enc encrypt -p “testExample“
	- enc encode -f "/home/IGEL/test.user/Downloads/test/test.ksbak" 

[IGEL Cloud Gateway (ICG)] 
- Added: Support for ED25519 keys in ICG remote installations. 

[Installer (linux)] 
- Updated: Apache Tomcat from version 10.1.46 to 10.1.48 
- Updated: Azul Zulu JDK from version 17.0.15+6 to 21.0.8+9 
- Updated: Elasticsearch version from 7.17.27 to 8.19.5 

[Installer (windows)] 
- Updated: Apache Tomcat from version 10.1.46 to 10.1.48 
- Updated: Azul Zulu JDK from version 17.0.15+6 to 21.0.8+9 
- Updated: Elasticsearch version from 7.17.27 to 8.19.5 

[Unified Protocol] 
- Added: Support for restoring backup for IMH feature. 

=============================================================================
Resolved issues:
=============================================================================

[AD / LDAP integration] 
- Fixed: No permissions were shown for an AD user which logs on with different cases. The case sensitivity for logon was updated to case insensitive how it is expected.

[Cloud IdP / SSO] 
- Fixed: AD group lookup always relies on the browse user account 
- Fixed: When a default proxy is enabled in the UMS proxy server, all outgoing external communication — including IdP discovery and IdP login — is automatically routed through this proxy. 
- Fixed: Users are now correctly forwarded to the information page after login instead of seeing a blank page.

[Device Service] 
- Fixed: CICs with Wallpaper used in Multi-CIC sometimes caused problems to send settings to the device. 
- Fixed: Setting values for unlocked parameters in a profile session on a device leads to duplicate sessions.

[Jobs] 
- Fixed: In some cases, it was possible to send device commands via jobs or admin tasks to devices for which the job/admintask creator had no rights to execute the device commands.  

[License Service] 
- Fixed: UMS license was already displayed as expired on the day of the expiration date. 

[UMS common] 
- Fixed: Updating UMS with Azure Managed Instance database initially failed and needed manual database activation. 


=============================================================================
# UMS Web App #
=============================================================================

=============================================================================
New features:
=============================================================================

[Automation] 
- Added: Jobs are available in the Web App. 

[System]
- Added License-Management to the Network Section (System -> Licenses):
        It is now possible to manage UMS Licenses and Devices Packs in the UMS Web App, as well as the Automatic Deployment.
        Additionally, it is now possible to check and export the main UMS ID, to streamline the license process.

[User Management] 
- Added: It is now possible to manage permissions for object directories, including devices, profiles, priority profiles, CICs, files and jobs. 



=============================================================================
Resolved issues:
=============================================================================

[Configuration] 
- Changed: Display names are shown instead of numeric values for special cases in slider parameters.
- Fixed: The profile export from the Web App could fail, when the browser window was in low resolution. 
- Fixed: Starting "Edit Configuration" was not possible using the context menu. 
- Fixed: Profile was imported to the recycle bin when the parent folder was in the Recycle bin. 
- Fixed: Profile creation dialogs were not responsive.

[Devices] 
- Changed: The online state check for OS12 devices is no longer done via UMS call. 
- Changed: A new configsettings key, MAX_PARALLEL_DEVICE_ONLINE_CHECKS, has been introduced to restrict the number of parallel UMS calls for device online checks. 
- Fixed: Starting "Edit Configuration" was not possible using the context menu. 
- Fixed: IP addresses were not being sorted correctly. 

[Network/System]
- Changed: Renamed section from "Network" to "System" and separated into "Infrastructure" and "Licenses" 
- Fixed: The unsaved changes dialog in the Network Nickname field appeared and disappeared too quickly when leaving an unsaved change. 

[Search] 
- Changed: Users, that are in more than 50 (AD) groups, are not supported.
- Changed: After server-startup, the first login of an user, or after a nightly re-index run, it may take some time before the user can use the search.
- Fixed: Core components of the device- and permission indexing algorithm have been rewritten for greater reliability and efficiency.
- Fixed: Multiple Active Directory–related search issues.
- Fixed: Requests had too many parameters.

[Logging] 
- Fixed: The format for the Logtime column was incorrect. 

[Misc] 
- Updated: Angular version was updated to v20. Node version was updated to v22. 
- Changed: Background image was replaced with background color and accent colors were changed to improve contrast and address the accessibility requirements.
- Changed: Dropdown button behaviour for choosing to apply settings now or on reboot has changed. An additional click is added for the confirmation. 
- Fixed: An issue that caused users to be unexpectedly logged out. 


=============================================================================
=============================================================================
Including changes from UMS Version 12.09.110
=============================================================================
=============================================================================
IGEL Universal Management Suite
=============================================================================
Version 12.09.110
Release date: 23.09.2025

HTML version of this Readme is available at:  https://kb.igel.com/ums/releasenotes


=============================================================================
Supported environment:
=============================================================================
UMS Server:
Microsoft Windows Server 2016 (64 bit) 
Microsoft Windows Server 2019 (64 bit) 
Microsoft Windows Server 2022 (64 bit)
Microsoft Windows Server 2025 (64 bit)
Ubuntu 20.04 (64 bit)
Ubuntu 22.04 (64 bit)
Ubuntu 24.04 (64 bit)
Oracle Linux 7 (64 bit)
Red Hat Enterprise Linux (RHEL) 7 (64 bit)
Red Hat Enterprise Linux (RHEL) 8 (64 bit)
Red Hat Enterprise Linux (RHEL) 9 (64 bit)
Amazon Linux 2

UMS Client: 
Microsoft Windows 10 (64 bit) 	
Microsoft Windows 11 (64 bit) 			
Microsoft Windows Server 2016 (64 bit) 
Microsoft Windows Server 2019 (64 bit) 
Microsoft Windows Server 2022 (64 bit)
Microsoft Windows Server 2025 (64 bit)
Ubuntu 20.04 (64 bit)
Ubuntu 22.04 (64 bit)
Ubuntu 24.04 (64 bit)
Oracle Linux 7 (64 bit)
Red Hat Enterprise Linux (RHEL) 7 (64 bit)
Red Hat Enterprise Linux (RHEL) 8 (64 bit)
Red Hat Enterprise Linux (RHEL) 9 (64 bit)
Amazon Linux 2

Backend database (DBMS):
Microsoft SQL Server 2016 (with Cluster Support)
Microsoft SQL Server 2017 (with Cluster Support)
Microsoft SQL Server 2019 (with Cluster Support)
Microsoft SQL Server 2022 (with Cluster Support)
Oracle 21c (with Cluster Support)
PostgreSQL 11 - 15
Apache Derby 10.9 - 10.14
Amazon Aurora PostgreSQL (Compatible with PostgreSQL 11 – 15) 
Azure SQL Managed Instance

Browser:
Microsoft Edge 137.0.+
Mozilla Firefox 139.0.+
Google Chrome 137.0.+


=============================================================================
New features:
=============================================================================

[Admin tasks] 
- Added: Admin task to export / delete OS12 logging messages. 

[DB commandline tools] 
- Added: Export of the UMS ID is now possible with a new command in the IGEL UMS Administrator command-line interface. 

[Devices] 
- Added: Advanced System Information section now shows the information whether a device is currently routed through a reverse-proxy connector. 
  
[IGEL Management Interface (IMI)] 
- Added: IMI / Device Details: the response now contains a new field connectedViaReverseProxy that indicates whether the device is currently routed through a reverse-proxy connector. 

[Installer (windows)] 
- Added: Option to manually search for a user during installation to run the services with.

[Unified Protocol] 
- Added: The CA Proxy Feature now supports a CA Label as defined in RFC 7030. 
- Tested: Compatibility with AWS ALB. 
- Added: New configuration option to support the encoding type of client certificates forwarded by AWS ALB. 

[Views]
- Added: New view criterion 'Connected via Reverse Proxy'.

[ums] 
- Added: Admin task to export/delete OS12 logging messages. 

=============================================================================
Resolved issues:
=============================================================================
 
[AD / LDAP integration] 
- Fixed: AD group membership stored in database could cause problems if an AD user creates a job. 

[Administrator application] 
- Changed: Misleading message when an external database is activated and no valid Enterprise license is present. 

[DB commandline tools] 
- Fixed: The import of Web Certificates via IGEL UMS Administrator command-line interface was no longer possible.  

[Device Service] 
- Fixed: Custom values for instances defined in profiles not applied to device.
- Fixed: OS12 configurations with template key HOSTNAME used device name instead of network name as value. Now OS12 uses the network name as OS11 does.      

[Views] 
- Fixed: Superfluous errors were logged during calculation of view results. 

[UMS common] 
- Fixed: Issue where ICG installation could fail if the UMS web port was set to something other than the default (8443). 



=============================================================================
# UMS Web App #
=============================================================================

=============================================================================
New features:
=============================================================================

[Devices]
- Added: Device connection via reverse proxy is now displayed in the device details.
- Added: Optional CA Label for CA Configuration


[Search]
- Added: Reverse Proxy Connection is now available for the search in the UMS Web App.


[Automation]
- Added: New Admin task: "Delete logging data (OS 12 and Web App)".


=============================================================================
Resolved issues:
=============================================================================

[Devices]
- Fixed: The icon in CA Proxy settings showed an incorrect state for the configuration and the uploaded keystore.
- Fixed: Devices could not be unassigned from a profile via the profile page.


[Search]
- Fixed: Message was delayed or not shown immediately when clicking the "Reindex all" button.

=============================================================================