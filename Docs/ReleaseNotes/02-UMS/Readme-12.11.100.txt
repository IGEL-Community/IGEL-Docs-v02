=============================================================================
IGEL Universal Management Suite
=============================================================================
Version 12.11.100
Release date: 31.03.2026

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
PostgreSQL 11 - 18
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
Security Fix:
=============================================================================

Fixed: - An HTTPS endpoint in UMS disclosed multiple files without authentication.


=============================================================================
New features:
=============================================================================

[Installer (linux)]
- Updated: Apache Tomcat from version 10.1.48 to 10.1.52
- Updated: Azul Zulu JDK from version 21.0.8+9 to 21.0.10+7

[Installer (windows)]
- Updated: Apache Tomcat from version 10.1.48 to 10.1.52
- Updated: Azul Zulu JDK from version 21.0.8+9 to 21.0.10+7

[UMS common]
- Added: UMS now supports PostgreSQL versions 16, 17 and 18.

[App Proxy]
- Changed: UMS is used as App update proxy by default on new installations.


=============================================================================
Resolved issues:
=============================================================================

[Administrator application]
- Fixed: JDBC Parameters dialog in UMS Administrator now stays in front and is clickable when adding a SQL Server data source. 

[Advanced Search]
- Fixed: Advanced Searches were not available in UMS Console for assignments (e.g. for jobs or administrative tasks) when not the UMS Superuser was logged in.

[App Proxy] 
- Fixed: Private apps which are deleted in the Web App were not removed from the cache. 

[Cloud IdP / SSO] 
- Changed: If a user was disconnected from the UMS console due to expired access token, previously a warning dialog was shown. To avoid confusion, this is now changed to an info dialog prompting the user to reconnect. 
- Changed: Prevent access for external (AD/IDP) users without permission.
- Fixed: Issue caused by simultaneous writes to the AD/LDAP keystore. 
- Fixed: LDAP request cancellations during browse-user group lookups.

[Console, administration section] 
- Fixed: Incomprehensive exception was shown when a user with no read permission selected a node at the UMS Administration section. 

[Console, common] 
- Fixed: Shadowing of OS 12 devices which are connected over an ICG with Proxy wasn't possible.
- Fixed: The offline documentation could no longer be displayed with the UMS internal PDF viewer. 
  
[Device Service] 
- Fixed: App repository for Cluster URL needs separate certificate uploaded, even if the cluster address is a local UMS address. 
- Fixed: Template key values did overwrite priority profiles. 
- Fixed: Some app repositories were not sent to the device, in particular, if additional repositories were defined by profiles. 
- Fixed: Local settings of profile could not be deleted if the profile was unassigned from device. Settings were removed from the database when the device sent its local setting to the UMS. 
- Fixed: Non-configurable apps were marked as configurable when they were entered by the device.

[IGEL Cloud Gateway (ICG)] 
- Fixed: The IGEL Cloud Gateway (ICG) can now be uninstalled even when the connection to the server is lost. 
- Fixed: Incorrect ICG connection status was shown in event logs. 
  
[Shared Workplace Feature] 
- Fixed: Failed UMS as Identity Broker logons could result in a locked user in AD. 
  
[UMS common] 
- Fixed: In some cases, sessions (Citrix, Horizon, ...) which are defined by a profile but refined with settings on the device are not deleted if the device is moved to another folder or the underlying profile is deleted. 
- Fixed: In the UMS console, some features may not be available even if a sufficient license was present, if multiple UMS licenses were registered. 
- Fixed: Save support information and save device files for support checked for the not needed permission for mail settings. 
- Fixed: Asset history entries in the database used a wrong ID generator. 

[Unified Protocol] 
- Fixed: Shadowing of OS 12 devices which are connected over an ICG with Proxy wasn't possible. 


=============================================================================
# UMS Web App #
=============================================================================

=============================================================================
New features:
=============================================================================

[Automation] 
- Added: Immediate execution of Jobs from WebApp. 

[Devices] 
- Added: If multiple backups are configured and present, the user can now select a specific beackup when restoring a virtual machine. (Igel Managed Hypervisor) 

[Misc]
- Added: Option to disable the feature to "Stay logged in for 30 days". (User Management -> Settings -> Login Options) 

[User Management] 
- Added: Option to set Administrative permissions (Administration tree in UMS Console) for users and groups in UMS Web App. 

=============================================================================
Resolved issues:
=============================================================================

[Apps] 
- Fixed: Performance issue when a new base system was registered. 

[Automation]
- Changed: Added new button in the Job details header to execute a job. 
- Fixed: License calculation for Jobs was not completely correct. 
- Fixed: Filter functionality in Execution History dialog was not working. 
- Fixed: While creating a job it was possible to advance to next step without name and command fields filled.
- Fixed: Non-Imported AD users were not able to create a Job.

[Configuration] 
- Fixed: A filter button was shown even though there was only one object type. 

[Devices]
- Changed: While shadowing a device, the zoom-rate will no longer be fixed. The user can zoom in and out via standard browser functionality.  
	   For multi-monitor setups, the user can also scroll to all available monitors. 
- Fixed: Password prompt was not always shown during shadowing via ICG. 
- Fixed: Shadowing over ICG with proxy did not use proxy configuration.
- Fixed: Shadowing over ICG did not work for OS11 devices if proxy was configured.
- Fixed: Did not scroll to selected device in the list. 
- Fixed: Device attributes could not be created in some cases. 
- Fixed: HA Support bundle did not include logs of devices connected to other servers.

[System]
- Changed: Paths in License Pack Rules tab are now clickable links for quick navigation to rule locations. 
- Changed: Path for Hardware is clickable now. 
- Changed: Better visual indication for expired License-Packs. 

[Search] 
- Fixed: Filtering with a device attribute of type "List" did not work. 
- Fixed: Device registration date column was sometimes empty after update. 
- Fixed: When clicking the "Show devices for version" link in App page, the request was not displayed.
- Fixed: Searches could not be executed when at least one device was in the recycle bin. 

[Unified Logging] 
- Fixed: Indexer error with oversized log lists. 

[Configuration Dialog] 
- Fixed: Display position was not applied when the second screen was aligned to the bottom.
- Fixed: Leading and trailing spaces were not displayed for saved parameter values that allow these spaces.

 
