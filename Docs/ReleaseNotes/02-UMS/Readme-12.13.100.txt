=============================================================================
IGEL Universal Management Suite
=============================================================================
Version 12.13.100
Release date: 31.07.2026

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
Microsoft SQL Server 2017 (with Cluster Support)
Microsoft SQL Server 2019 (with Cluster Support)
Microsoft SQL Server 2022 (with Cluster Support)
Oracle 19c (with Cluster Support)
Oracle 21c (with Cluster Support)
PostgreSQL 11 - 15
Apache Derby 10.9 - 10.14
Amazon Aurora PostgreSQL (Compatible with PostgreSQL 11 – 15) 
Azure SQL Managed Instance

Regular support for Apache Derby has expired. The support for Apache Derby will end in a later UMS version.
	See also: https://kb.igel.com/en/igel-subscription-and-more/current/support-policies-for-connections-to-third-party-en


Browser:
Microsoft Edge 149.0.+
Mozilla Firefox 152.0.+
Google Chrome 149.0.+


=============================================================================
Important Information:
=============================================================================
- Removed: Windows Server 2016 and Ubuntu 20.04 from supported environments.
- Removed: Microsoft SQL Server 2016 from supported backend databases.
 	See also: https://kb.igel.com/en/igel-subscription-and-more/current/support-policies-for-connections-to-third-party-en
	
[App Proxy]
- Action required: After updating to UMS 12.13.100, environments that require a proxy for Distributed App Repositories (currently via the Cloud Services proxy or a workaround) must configure the new DAR proxy setting under Apps > Settings > UMS > Update Proxy > Manage Binary App Repositories; otherwise, DAR communication may stop working.

=============================================================================
Known issues:
=============================================================================
[UMS]
- The IMH VM license model does currently not support air-gapped scenarios.

=============================================================================
New features:
=============================================================================
[App Proxy] 
- Added: We now have the possibility to configure a Proxy for each App Repository defined in a Distributed App Repository setup.      
- Updated: nimbus-jose-jwt dependency from v9.48 to latest available v10.0.2 

[Cloud IdP / SSO] 
- Added: Possibility to disable 'offline_access' scope for IDP usage.  

[Installer (linux)] 
- Updated: Azul Zulu JDE from version 21.0.10+7 to 21.0.11+10 
- Updated: Apache Tomcat from version 11.0.21 to 11.0.22 

[Installer (windows)] 
- Updated: Azul Zulu JDE from version 21.0.10+7 to 21.0.11+10 
- Updated: Apache Tomcat from version 11.0.21 to 11.0.22 

[UMS common] 
- Updated: Spring Security to version 7.0.5 
- Updated: Spring to version 7.0.6 
- Updated: Spring Boot to version 4.0.5 

[ums] 
- Added: New default directory rule 'is a BC&DR device'.
- Added: New default directory rule 'Active OS'. 
- Added: New default directory rule 'Intended Emergency Mode'. 
- Added: New default directory rule 'Reported Emergency Mode'. Indicates that the last switch to emergency mode was successful. 

=============================================================================
Resolved issues:
=============================================================================
[App Proxy] 
- Changed: Added support for a higher number of concurrent interactions with the database.
- Fixed: Out-of-memory crashes on the applications endpoint under high load by optimizing JSON processing to reduce memory usage.
- Fixed: Missing log entries for app synchronization with binary repositories. When a newly imported app is synced with a repository target, the synchronization activity is now properly logged in the App Proxy logs. 
 
[Cloud IdP / SSO]
- Fixed: UMS Console disconnect behavior. In some customer environments, it could happen that the UMS user was disconnected after 15 minutes.      
- Fixed: Logout behavior now works consistently for both local and SSO users. 

[Console, common] 
- Fixed: Connecting with an older UMS console version to UMS Server version 12.13 or newer resulted in a 'No enum constant ...' error message instead of a message indicating that Server and Console version are not matching. This cannot be fixed for already released versions but is now fixed for UMS Consoles 12.13 and newer. 

[Default Directory Rules] 
- Fixed: In some situations, a deadlock occurred when the default directory rules were applied, and a 'connected via reverse proxy' rule was configured. 
 
[Device Service] 
- Fixed: If a profile with 'overwrite sessions' was assigned, it could happen that some system settings were hidden. 
- Fixed: Standardized all timestamp handling to UTC across services to ensure consistency. 
- Fixed: Parameter 'network.vncserver.secure_mode' was not handled correctly in the configuration dialog.      
- Fixed: Settings from a device were not persisted in the UMS if they are defined on the device and sent to a newly started UMS. 

[IMI, server] 
- Fixed: IMI template assignment responses are now always returned in English and are no longer translated 

[Installer (linux)] 
- Fixed: UMS Installer was delivering wrong error message on some Linux distributions.

[Server, common] 
- Fixed: Resolved an issue preventing email addresses from being used in Subject DN. 

[UMS common] 
- Fixed: Many errors related to license service appeared in the logs when a restricted user logged in to UMS Console. 
- Fixed: In some cases, devices have received both an ISL and a WE license. 

[Unified Protocol] 
- Fixed: In case an OS12 device is offline deleted, the device will now deregister after the next connection. 

[View Service] 
- Fixed: For customers with more than 30 concurrent logged in users it could happen, that devices in Web UMS searches were still visible after removing the read permission for those devices. They were visible for a maximum time of 24 hours (till the elastic search index has been recreated for those devices). 

=============================================================================
# UMS Web App #
=============================================================================

=============================================================================
New features:
=============================================================================

[Apps] 
- Added: Users can now view all profiles that use a selected app version. 
- Added: Support for configuring a dedicated proxy for Distributed App Repository (DAR). 

[Automation] 
- Added: BC&DR criteria are now available in Default Directory Rules: Is BC&DR Device, Current Active OS, Emergency-Mode (intended), and Emergency-Mode (reported). 

[Configuration] 
- Added: Persona Desktop Badge now shown for indirectly assigned Persona Profiles.
- Added: 'Use offline_access scope' checkbox to the IdP Configuration sidebar. This option allows administrators to add or exclude the offline_access scope in OpenID Connect authentication requests. The checkbox is enabled by default.
- Added: Template Keys (TKs) can now be assigned to parameters of type singleParamList in the Web App. 

[Devices] 
- Added: IMC: Device Details now displays all containers on the device and allows users to send commands to start, stop, or update containers while also viewing their current status.
- Added: At Device List we now have a new card variant: medium - all information. 
- Added: UMS Web App Administrators can now remotely manage IGEL Managed Containers directly from the UMS Web App. 
- Added: Device Cards now display a BC&DR Windows badge for BC&DR capable devices currently running Windows OS. 

[Emergency Mode] 
- Added: Business Continuity and Disaster Recovery (BC&DR) is now supported. 

=============================================================================
Resolved issues:
=============================================================================

[Apps] 
- Fixed: Users could not create more than one app repository with a linked proxy.  
- Fixed: In App dependencies section was displayed "null" instead of a digit. 

[Automation] 
- Added: The Administrative Tasks table now includes a Next Execution column.  
- Fixed: Sorting in the Administrative Tasks table did not work correctly. 
- Fixed: The Automation panel could not be collapsed. 
- Fixed: Importing Default Directory Rules failed if the target directory was not available in the device tree. 
- Fixed: The Default Directory Rules page displayed an error message when a user had no permission on Device Attributes and only had access to Default Directory Rules. 
- Fixed: Editing Administrative Tasks did not work properly. 
- Fixed: Unable to select a single Advanced Search when assigning a job. 

[Configuration] 
- Fixed: Deleting a file that was still assigned to a profile could leave an invalid file reference and cause an error in the profile's Contained Files section. 
- Fixed: Deleting a duplicate file from Files could remove the original file instead of the selected duplicate when the Recycle Bin was disabled. 
- Fixed: Folder will be displayed immediately when a profile is assigned to a folder in UMS. 
- Fixed: inconsistency between context menu and toolbar commands, where available actions could differ due to mismatched device data from the backend API. 
- Fixed: File duplicates for Persona Profile with a Corporate Identity Customization after the import. 
- Fixed: CIC Configurator – activation switches showed incorrect state after loading the dialog. 
- Fixed: Problem when an App is installed with a selected version with a Profile that is inside a Persona Profile. 
- Fixed: Issue that taking a screenshot (Print Screen) in a profile editor incorrectly toggled settings to enabled. 

[Devices] 
- Changed: Server Info & Log Files is now the second-to-last step in the Save Support Information dialog.  
- Changed: The Device Card was redesigned to improve responsiveness and display enabled features. 

[System] 
- Fixed: The infrastructure list did not display a scrollbar, causing some entries to be hidden from view. 
- Fixed: The UMS web search did not display the related licensed devices. 

[Search] 
- Fixed: The device list did not automatically scroll to a selected device located further down in a folder with many devices. 
- Fixed: Refreshing the browser while WUMS search indexing was in progress could cause the navigation sections to disappear or the page to become blank. 

[Misc] 
- Fixed: Users could not change their password. 

=============================================================================
=============================================================================
Including changes from UMS Version 12.12.110
=============================================================================
=============================================================================
IGEL Universal Management Suite
=============================================================================
Version 12.12.110
Release date: 02.07.2026

HTML version of this Readme is available at:  https://kb.igel.com/en/universal-management-suite/current/ums-release-notes


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
Oracle Linux 8 (64 bit)
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
Oracle Linux 8 (64 bit)
Red Hat Enterprise Linux (RHEL) 7 (64 bit)
Red Hat Enterprise Linux (RHEL) 8 (64 bit)
Red Hat Enterprise Linux (RHEL) 9 (64 bit)
Amazon Linux 2

Regular support for Windows Server 2016 and Ubuntu 20.04 has expired. Starting with UMS 12.13.100 in Q3 2026, IGEL will no longer support these operating systems.
 	See also: https://kb.igel.com/en/igel-subscription-and-more/current/support-policies-for-connections-to-third-party-en


Backend database (DBMS):
Microsoft SQL Server 2016 (with Cluster Support)
Microsoft SQL Server 2017 (with Cluster Support)
Microsoft SQL Server 2019 (with Cluster Support)
Microsoft SQL Server 2022 (with Cluster Support)
Oracle 19c (with Cluster Support)
Oracle 21c (with Cluster Support)
PostgreSQL 11 - 15
Apache Derby 10.9 - 10.14
Amazon Aurora PostgreSQL (Compatible with PostgreSQL 11 – 15) 
Azure SQL Managed Instance

Regular support for Microsoft SQL Server 2016 and Apache Derby has expired. Starting with UMS 12.13.100 in Q3 2026, IGEL will no longer support Microsoft SQL Server 2016. The support for Apache Derby will end in a later UMS version.
	See also: https://kb.igel.com/en/igel-subscription-and-more/current/support-policies-for-connections-to-third-party-en


Browser:
Microsoft Edge 137.0.+
Mozilla Firefox 139.0.+
Google Chrome 137.0.+


=============================================================================
New features:
=============================================================================

[Device Service] 
- Added: New static template key ${DEVICENAME} for OS12 profiles referencing the UMS name of the device.
         Note: for OS11 profiles you can select the new template key in the UMS Web App, but since this is an OS12 only feature, it will not work for OS11 devices.

=============================================================================
Resolved issues:
=============================================================================

[Cloud IdP / SSO] 
- Fixed: Token refresh performance was improved. User authentication validation is now optimized to run once per refresh, eliminating duplicate AD/LDAP lookups and IDP provider calls.

[UMS common] 
- Fixed: Shadowing failed when the user did not have read permission for the configured ICG server, even though this permission is not required for shadowing.  
- Fixed: Endpoint for checking the current UMS Server state was no longer working. 

=============================================================================
# UMS Web App #
=============================================================================

=============================================================================
Resolved issues:
=============================================================================

[Devices] 
- Fixed: The Shadow Device button was incorrectly enabled for devices that do not support shadow mode. 
- Fixed: The wrong device name was displayed in the shadow confirmation dialog.  
- Fixed: Exporting profile or device settings was not possible via the context menu. 
- Fixed: The "Save Support Information" dialog did not progress correctly for devices and device folders, preventing support information from being saved. 
- Fixed: UMS Web App Support Bundle Export did not collect some TC logs. 

 
=============================================================================