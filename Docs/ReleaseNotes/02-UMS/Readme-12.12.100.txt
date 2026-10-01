=============================================================================
IGEL Universal Management Suite
=============================================================================
Version 12.12.100
Release date: 10.06.2026

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
Oracle Linux 9 (64 bit)
Oracle Linux 10 (64 bit)
Red Hat Enterprise Linux (RHEL) 7 (64 bit)
Red Hat Enterprise Linux (RHEL) 8 (64 bit)
Red Hat Enterprise Linux (RHEL) 9 (64 bit)
Amazon Linux 2

Regular support for Windows Server 2016 and Ubuntu 20.04 has expired. Starting with UMS 12.13.100 in Q3 2026, IGEL will no longer supports these operating systems.
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
Important Information:
=============================================================================

[ums]
- Changed: Passwords of local UMS users are now hashed with a more secure hash algorithm. Existing user passwords are re-hashed after successful login of the users.
	Important: Please backup the database before updating to this version.
	

=============================================================================
New features:
=============================================================================

[Cloud IdP / SSO]
- Added: Configuration support for enabling or disabling the 'Remember Me' option and defining its duration in days. 

[Devices]
- Added: New Persona Profiles mapped to IDP roles which allow the administrator to configure a granular desktop for different personas. 

[Installer (linux)] 
- Updated: Azul Zulu JRE version 21.0.10+7 (minor update) 
- Updated: Apache Tomcat from version 10.1.52 to 11.0.21 

[Installer (windows)] 
- Updated: Azul Zulu JRE version 21.0.10+7 (minor update) 
- Updated: Apache Tomcat from version 10.1.52 to 11.0.21 

[UMS common]
- Added: Configuration flag to force BCrypt password hashing for OS12 device settings instead of SHA512. 
- Updated: Spring Security to version 7.0.5 
- Updated: Spring to version 7.0.6 
- Updated: Spring Boot to version 4.0.5 
- Added: Support for backend database Oracle 19c (with Cluster Support)
- Added: Support of SCEP CAs for feature UMS as CA Proxy (base_system 12.9.0 or higher required). 
- Added: UMS Support for Oracle Linux 8


=============================================================================
Resolved issues:
=============================================================================

[App Proxy]
- Fixed: Exceptions were not properly logged 
- Fixed: AppProxy now validates applications at the file level instead of relying solely on application folder existence. Validation includes checks for both file existence and file size, ensuring that missing or incomplete application files are correctly detected and synchronized. 
- Changed: AppProxy improved performance by reducing memory consumption during endpoint call with App Portal 

[Console, common]
- Fixed: Wrong formatting of labels in the login dialog. 

[Device Connector] 
- Fixed: In case a Reverse Proxy forwards empty Client Certificate Header to the UMS the device onboarding would fail.

[IGEL Management Interface (IMI)]
- Fixed: Deleting IGEL OS 12 devices via IMI could intermittently fail, leaving devices in the UMS database. 

[UMS common] 
- Fixed: In some environments, errors occurred during certificate generation (Web, Cloud Gateway). 

[ums]
- Changed: Passwords of local UMS users are now hashed with a more secure hash algorithm. Existing user passwords are re-hashed after successful login of the users.
 	Important: Please backup the database before updating to this version. 
- Fixed: Under certain circumstances too many device license requests were created. 




=============================================================================
# UMS Web App #
=============================================================================

=============================================================================
New features:
=============================================================================

[Automation] 
- Added: Configure Admin tasks is now available in the Web App. 
- Added: Default Directory Rules in UMS Web App. 

[Configuration] 
- Added: Profile export now supports starting the path from the selected folder. 
- Added: Option to enable Persona Profiles in UMS Features (System -> Settings -> UMS Features). 

[Devices] 
- Added: Users can now switch shadowing modes between automatic window fit and browser-controlled zoom/navigation. 
- Added: SCEP protocol support is now available in CA Proxy.

=============================================================================
Resolved issues:
=============================================================================

[Apps] 
- Changed: The system prevents importing a new app version if its type does not match the existing version. 
- Fixed: Certain buttons were incorrectly clickable for users without necessary permissions. 
- Fixed: Send and Receive actions in Jobs appeared in the wrong order. 
- Fixed: The tooltip in Job Details was not displayed. 

[Automation] 
- Changed: The "Used Mass-Deployment Keys" option was removed from the First Authentication Key filter, as it is no longer used. 

[Configuration] 
- Fixed: Web UMS would get stuck when assigning a profile. 
- Fixed: The Configuration tab displayed folders that users did not have permission to view. 
- Fixed: Synchronization of added files in a distributed UMS. 
- Fixed: Using a Template Key for an instance parameter resulted in the creation of a double instance. 
- Fixed: The left navigation list did not refresh when using the header navigation. 
- Fixed: Template Key icon was not shown correctly for changes in Config Dialog. 

[Devices] 
- Fixed: When deleting folders, folder that has been vetoed where shown to also be able to be deleted and could be deleted. 
- Fixed: When scrolling through the list of directories, it was not possible to see the last items. 
- Fixed: The shadowing button for a device was not consistently enabled, even when permitted. 
- Fixed: The confirmation dialog was not displayed when exiting CA Proxy without saving changes.
- Fixed: The device scanning dialog did not always display the results. 
- Fixed: The Send Message dialog was displayed incorrectly. 
- Fixed: When scrolling through the list of directories, it was not possible to see the last items. 

[Search]
- Fixed: The UI did not display newly added filters correctly.


[System] 
- Changed: The permission check to configure the Automatic License Deployment and test the connection to the License Portal is now on the nodes directly instead of the parent node.
- Fixed: Folder entries in Automated Targets are anonymized for users without read permission. 
- Fixed: The system page did not allways check user permissions correctly for the Infrastructure and Licenses tabs. 

[Unified Logging] 
- Changed: Performance improvement while indexing log messages. 

[Misc] 
- Added: Configuration option to define the duration of the "Stay logged in" session (1–90 days) in User Management Settings.
- Changed: Login notification is shown if resolved groups exceed 50. 
- Added: Configuration option to define the duration of the "Stay logged in" session (1–90 days) in User Management Settings.
- Updated: Angular was updated to v21. 

 
=============================================================================
=============================================================================
Including changes from UMS Version 12.11.110
=============================================================================
=============================================================================
IGEL Universal Management Suite
=============================================================================
Version 12.11.110
Release date: 15.04.2026

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

Regular support for Windows Server 2016 and Ubuntu 20.04 has expired. Starting with UMS 12.13.100 in Q3 2026, IGEL will no longer supports these operating systems.
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

Regular support for Microsoft SQL Server 2016 has expired. Starting with UMS 12.13.100 in Q3 2026, IGEL will no longer supports these operating systems.
	See also: https://kb.igel.com/en/igel-subscription-and-more/current/support-policies-for-connections-to-third-party-en


Browser:
Microsoft Edge 137.0.+
Mozilla Firefox 139.0.+
Google Chrome 137.0.+



=============================================================================
Important:
=============================================================================

Please make sure to perform the following steps before updating to the new version:
HTTP redirect URIs are no longer added automatically to the database.  
If your application requires HTTP redirect URIs, please add them using the following path in the Webapp: System → Settings → Network -> Allowed Redirect URIs → Manage → “+”  
Enter the required HTTP redirect URIs and save your changes. 

=============================================================================
New features:
=============================================================================

[Cloud IdP / SSO] 
- Added: Validation of OAuth redirect URIs to the login and logout flows to prevent unauthorized redirects. 

=============================================================================
Resolved issues:
=============================================================================

[Auth Service]
- Fixed: HTTP redirect URIs are no longer added automatically to the database.

=============================================================================