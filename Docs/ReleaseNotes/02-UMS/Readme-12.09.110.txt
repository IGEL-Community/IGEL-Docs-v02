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
=============================================================================
Including changes from UMS Version 12.09.100
=============================================================================
=============================================================================
IGEL Universal Management Suite
=============================================================================
Version 12.09.100
Release date: 26.08.2025

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

[Administrator application]
- Added: UMS Admin CLI Commands
	- ums-license state
	- ums-license register -f=<path to .lic file>
	- ums-license deleteall

[Cloud IdP / SSO] 
- Added: Content Security Policy (CSP) to enhance browser security to protect against cross-site scripting (XSS).
- Added: Translations for Authorization failed message in UMS Console.

[Default Directory Rules] 
- Added: New default directory rule 'Connected via Reverse Proxy'.

[UMS common] 
- Updated: Apache Tomcat from version 10.1.41 to 10.1.43 
- Added: New feature to enable the UMS to act as a CA Proxy, allowing devices to request client certificates directly through UMS. These certificates will be signed by an external CA via the EST protocol. 


============================================================================= 
Resolved issues: 
============================================================================= 

[AD / LDAP integration]
- Fixed: AD logon support in an environment where the Domain Name System (DNS) cannot map to Key Distribution Centers (KDCs).

[Administrator application]
- Fixed: umsadmin-cli.sh now works.

[Cloud IdP / SSO] 
- Fixed: Effective Rights Dialog doesn't show Permissions for currently logged on AD/IDP user.
- Fixed: Support for external IdP role claims that may return either a single String or a List of Strings. 
  
[Console, common] 
- Fixed: Memento feature was not working when the user logged out.

[IGEL Cloud Gateway (ICG)]
- Fixed: Input field in ICG installer no longer overflows the dialog window.

[Installer (linux)]
- Fixed: umsadmin-cli.sh now working.

[Jobs] 
- Fixed: Job Execution for OS12 device connected to an ICG in a distributed UMS environment. 

[UMS common] 
- Fixed: The profile settings for assigned objects could not be opened initially after starting the UMS Console.
- Fixed: Device list “Show unlicensed devices” displayed incorrect devices. 
- Fixed: Public Web port was not used for initial UMS ID sync if public address was set for existing servers.
- Fixed: Devices with low memory entered into an infinite boot loop if they got a firmware update.

[Unified Protocol] 
- Fixed: Job Execution for OS12 device connected to an ICG in a distributed UMS environment. 

[ums]
- Fixed: Superadmin could be attached to a group in administrative accounts UI.

============================================================================
# UMS Web App #
=============================================================================

=============================================================================
New features:
=============================================================================

[Configuration Dialog]
- Changed: The modal dialogs are no longer closed and reopened on profile creation. The content of the dialogs is updated instead.
- Changed: Replaced badge with chip for adjustments to make it accessible via keyboard.

[Users]
- Added: Button to create a user was added to the Users tree toolbar.
- Added: Button to create a group was added to the Groups tree toolbar.
- Added: Button to create an Identity Provider Role was added to the IDP Roles tree toolbar. 

[Misc]
- Added: CSP Header Filter to WUMS-UI (security improvement)
- Updated: Angular was updated from v18 to v19 to include the latest security patches. 


=============================================================================
Resolved issues:
=============================================================================


[Apps]
- Fixed: Versions in app details card were not properly aligned.

[Devices]
- Changed: Due to recent implementation changes, the following actions for IGEL Managed Hypervisor Devices have been temporarily removed from the UI: Backup, Restore, Re-Image, and Wipe.
- Changed: The device details section has a single scroll bar that affects the entire height of the component.   
- Changed: The UI for the First Authentication Keys was improved.
- Changed: Global Permission for the Save Support Information workflow is now checked before UI is opened. 
- Fixed: Date-type fields in device attributes, accessed through the "Edit custom properties" button, 
  were previously all labeled as "Date input" instead of displaying their actual field names.
- Fixed: It was not possible to edit or create a device attribute of list type. 
- Fixed: Check for global permissions in recycle bin was added.
- Fixed: The Save Support Information command for a device directory could be executed when the directory did not contain OS12 devices. 
- Fixed: After the deletion of a device the tree is now properly reloaded.
- Fixed: Added missing translations for scheduler commands.
- Fixed: Mass deployment key is now still properly focused after opening its details.
- Fixed: Assigned object tab information was not aligned. 
- Fixed: First Authentication Keys tab was not shown in the settings if user had no permission for device attributes.

[Configuration]
- Changed: The display name of a file is now shown in all places, instead of the technical name.
- Fixed: Incorrect message was displayed in the dialog for confirming the assignment of a device to a profile. 
- Fixed: Template-key assignment errors occasionally blocked profile assignment.

[Configuration Dialog]
- Fixed: Changes indicators in Device Configuration were shown for some cases when no changes were made.
- Fixed: Unnecessary parameter "Multiple images" was removed from the CIC screensaver (custom partition) use case.
- Fixed: Dependent parameters were not enabled when a template key was set for a parameter.

[Devices]
- Fixed: Broken "Save Support Information" workflow.

[Network]
- Changed: UI for Redirect URIs now recognizes http://hostname as valid input. 

[Search]
- Changed: Instead of a popup, now a clear message is presented on the top of the result-table.
- Fixed: Reindex messages were not always properly translated.
- Fixed: Users without permission could close the EPR Settings sidebar. 
- Fixed: Some columns broke the Search export.
- Fixed: Regression bug causing unauthorized access in AD user search results.

[Users]
- Fixed: Information about effective permissions was not updated on My User page without refreshing the page or logging out and logging in.
- Fixed: The order of displayed columns in Groups and Users overview was not consistent.
- Fixed: Breadcrumbs and links in User Management were not visually intuitive and accessible.

[Logging]
- Changed: Logging-UI was updated to utilize new components.
- Fixed: Origin field on logging table displayed "Webapp" instead of "Web App". 
- Fixed: Log entries could be added to the table without a message parameter. 

[Misc]
- Changed: All dialogs are now closable via "ESC".
- Changed: Expired license dates now display in red for quick identification.
- Changed: In all applicable dialogs the primary action button is now focused. 
- Changed: Added spinner for better login experience. 
- Fixed: Fixed an issue where the user was logged out (both at the UMS Web App and at the Legacy Console) if the refresh token (Web App) was expired.
- Fixed: Removed unnecessary calls for a faster login-experience.
- Fixed: Highlight style was overlapping with the next column for tables with sorting.
- Fixed: Checkbox column was not fixed for tables with fixed first text column.

=============================================================================