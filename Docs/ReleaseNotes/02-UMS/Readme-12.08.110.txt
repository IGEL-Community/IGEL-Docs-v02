=============================================================================
IGEL Universal Management Suite
=============================================================================
Version 12.08.110
Release date: 17.06.2025

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
Amazon Aurora PostgreSQL (Compatible with PostreSQL 11 – 15) 
Azure SQL Managed Instance

Browser:
Microsoft Edge 137.0.+
Mozilla Firefox 139.0.+
Google Chrome 137.0.+


=============================================================================
Important Notice:
=============================================================================

With UMS 12.08.100, the login process has changed, which entails new requirements for your environment. 

Before upgrading to UMS 12.08.X please read the related Knowledge Base article:
UMS Login Requirements: https://kb.igel.com/en/universal-management-suite/current/ums-login-requirements


=============================================================================
New features:
=============================================================================

[Installer (windows)] 
- Added: Additional information about new SSO functionality to the Windows installer. 

[UMS common] 
- Updated: Apache Tomcat from version 10.1.39 to 10.1.41 

=============================================================================
Resolved issues:
=============================================================================

[AD / LDAP integration] 
- Fixed: AD login could fail when an UPN suffix was used for an AD user and with that the logon with user@domain name was not possible. 

[Cloud IdP / SSO] 
- Fixed: UMS console login with hostname (without domain) no longer worked.  
- Fixed: Allow FQDN with uppercases. 
- Changed: Integrate umsstarter into RMClient.exe (updating installer and protocol registration) to eliminate the separate JAR. 

[Console, common] 
- Fixed: UMS Console only installations could run into a login/connect error if they were never connected to the UMS server. 
- Fixed: The use of a hostname to connect to the console was not possible.

[Devices] 
- Fixed: Timeout issues while saving settings of a device. 

[Installer (linux)]
- Fixed: Installer could not register mimetype for console login when package desktop-file-utils was missing on some Linux Systems.
- Fixed: Linux installation took a very long time on some systems.
- Fixed: On Ubuntu 22.04 and 24.04 when UMS was installed as a non-root service, the error "Wrong password" was always shown.

[Server, common] 
- Fixed: OS 11 devices could not download assigned CICs. (OS 11 devices connected via ICG and OS 12 devices were not affected) 

[UMS common]
- Fixed: Null pointer exception when reading a configuration file.

[WebDAV] 
- Fixed: In Distributed UMS or HA environments, the WebDAV file synchronization failed. 

=============================================================================
# UMS Web App #
=============================================================================

=============================================================================
New features:
=============================================================================

[Misc]
- Added: Ability to add Redirect URIs to the installation, to be able to use these URIs for login.

============================================================================= 
Resolved issues: 
============================================================================= 

[Misc]
- Fixed: Login to the UMS Web App failed if the UMS Server is not listening on the default port (8443)
- Fixed: Removed unused dependency org.apache.httcomponents.client5:httpclient5:5.4.2
- Fixed: Igel-rest-libs version 12.8.2 was removed from the build. 
- Fixed: Several dialogs were wrongfully displayed in full width in Chromium-based browsers. 

[Users]
- Fixed: When a user is reassigned to a different group while logged in, the UI did not consistently reflect the change.


[Configuration]
- Fixed: Additional timeout issues while saving settings of a device.


[Search]
- Fixed: Permissions for a device-record were not properly calculated if the device was in bin on server-start and restored afterwards. 
- Fixed: Not all received changes were correctly flushed into the index. 


=============================================================================
=============================================================================
Including changes from UMS Version 12.08.100
=============================================================================
=============================================================================
IGEL Universal Management Suite
=============================================================================
Version 12.08.100
Release date: 27.05.2025

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
Amazon Aurora PostgreSQL (Compatible with PostreSQL 11 – 15) 
Azure SQL Managed Instance

Browser (Web App):
Microsoft Edge 137.0.+
Mozilla Firefox 139.0.+
Google Chrome 137.0.+

=============================================================================
Known issues:
=============================================================================

[UMS common]
- Discovery of Cloud IDPs does not use the configured proxy.
- With a “console only” new installation, the login does not work because the rmconsole.truststore has not been created in the user directory.
	Workaround: A full installation creates the rmconsole.truststore, copy this trust store to the user directory or keep it there.

[Installer (linux)]
- Due to a bug in the password authentication process, the installation can currently only be completed using the 'root' user.
	This issue affects new installations only and does not impact update installations.

=============================================================================
New features:
=============================================================================

[App Proxy] 
- Added: Enabled proxy functionality for Distributed App Repository.

[UMS common] 
- Updated: Java JDK from version 17.0.13+11 to 17.0.15+6
- Updated: Apache Tomcat from version 10.1.34 to 10.1.39
- Added: Some indexes to improve performance. 
- Added: Support of single sign on via Cloud Identity Provider (Entra ID, Ping Identity, Okta) incl. MFA.
- Changed: Unified and centralized login for UMS Web App and UMS Console incl. single sign on within the different UMS applications.

[Unified Protocol] 
- Added: Support for Asset Inventory Tracker (AIT) for OS12 devices (base_system 12.6.1 or higher needed).

[ums] 
- Added: Additional umsadmin-cli shell script, that provides the same functionality as umsadmin-cli.bin on Linux machines, but without the QT dependency. It can be used whenever QT dependencies are not available or not wished, like on headless Linux machines or containers. 


============================================================================= 
Resolved issues: 
============================================================================= 

[AD / LDAP integration] 
- Fixed: When editing global permissions for an LDAP user, the username was not displayed in the Edit dialog. When the Edit dialog was saved in this state, the username was changed to empty, and the user was broken. 

[Administrator application] 
- Fixed: Restoring a database backup of an embedded Derby database failed sometimes.

[App Proxy] 
- Changed: Improved error handling for the Distributed App Repository.

[Unified Protocol] 
- Fixed: In specific scenarios no UTC time was used when the TC connection state was set to offline. 
- Fixed: If a big number of OS12 devices was connected to a single device-connector, the devices were shown as offline, but were still manageable.

[Devices]
- Fixed: Timeout-issues while saving settings of a device.

[IGEL Management Interface (IMI)] 
- Fixed: Requesting all devices via IGEL Management Interface (IMI) was very slow when the database contained a large number of devices.  

[UMS common] 
- Changed: Usage of counters for id generation in file transfer use cases.
- Fixed: App status timestamp in App Information was not correctly displayed. 
- Fixed: Automatic download of UMS license didn't work when proxy was configured. 
- Fixed: Last boot time was not updated if "Adjust Internal Name if network name has changed" is selected.

=============================================================================
# UMS WebApp #
=============================================================================

=============================================================================
New features:
=============================================================================

[Devices]
- Added: First-authentication keys can now be administrated in the UMS WebApp. (Devices -> settings sidebar -> First Authentication Keys)
- Added: Functionality to get Logfiles from a Device (OS12+ only) for Support via the Web App, including System Info (incl. ICG), Profiles and Apps.
         Command is now accessible from the command toolbar for devices and device directories.

[Configuration]
- Added: Quick Setup mode is now available for apps that support this feature.
- Added: "Explore Quick Start Configurations" button for users with completely empty Profiles, Priority-Profiles, or CIC trees.

[Configuration Dialog] 
- Added: Additional parameters are available in the CIC Configurator to enable screensaver with custom data partition for OS12 devices.

[Search]
- Added: Complete overhaul of the index functionality:
         Changes to devices are now reported to the index "on the fly" and will therefore be included in the search results "near live".
		 A complete re-index of all devices and permissions will now occur "once a day" (default) as a fallback - interval and time can be configured.
		 (Search -> settings sidebar -> Index Configuration)

[Users]
- Added: Local users and groups can now be managed in the UMS Web App.
- Added: "Change password" functionality is now available in the Web App.
- Added: Global permissions can now be managed in the UMS Web App.
- Added: Identity Provider (IDP) client configuration and IDP roles can now be managed in the UMS Web App.


=============================================================================
Resolved issues:
=============================================================================

[Configuration]
- Changed: Added File ID to the details section for easier identification.
- Fixed: Keep displaying the selected tree section after object drag & drop.
- Fixed: Incorrect icons displayed for OS11 profiles in the Recycle Bin
- Fixed: Profile duplication failure.
- Fixed: The paginator’s memento was not working correctly for all tabs in item details.
- Fixed: Device tree layout glitched when folder names were too long, causing folder entity counts to move out of view.
- Fixed: Incorrect tooltip displayed for the Create Profile/Master Profile button when the user lacked permission.
- Fixed: Incorrect tooltips displayed on the expand/collapse tree.
- Fixed: Scroll to selected profile did not always work in the profile list.
- Fixed: The header of some empty directory lists was not displayed.
- Fixed: Performance issues with the Recycle Bin.
- Fixed: Incorrect icons shown for devices and CICs in the Recycle Bin.
- Fixed: Restoring a file from recycle bin in the web-app could not be done, if the user had no 'write' - permission on the target folder. UMS console was not affected.

[Configuration Dialog]
- Changed: The navigation tree in the Profile Configurator that contains only one app is now expanded by default.
- Fixed: An error was thrown in App Selector for a device exported as profile that contained non-configurable apps.

[Devices]
- Changed: The "Save Support Information" command (without logfiles & configuration from devices) is now accessible from the main sidebar.
- Changed: Device directory command buttons on the toolbar are now grouped into dropdowns.
- Changed: Device command buttons on the toolbar are now grouped into dropdowns.
- Changed: Asset Information Tracking is now also enabled for OS 12+ devices.
- Changed: Added Manage Igel Hypervisor commands: Restore, Backup
- Changed: Capability to execute commands for all VMs simultaneously.
- Changed: Button to execute data refresh for all VMs.
- Fixed: Randomly closing shadowing connections for OS12 devices and OS11 ICG connections.
- Fixed: Performance issues during shadowing sessions.
- Fixed: Timeout-issues while saving settings of a device.
- Fixed: The Device Attributes table now scrolls to the selected item if it is not visible.
- Fixed: Added German translations for filter dropdowns and table values.
- Fixed: Performance issues with the Recycle Bin.
- Fixed: The "Show Keys" tooltip did not display the correct message when the user lacked write permissions.
- Fixed: Device monitor information was not displayed correctly.
- Fixed: Incorrect icons were shown for devices and CICs in the Recycle Bin.
- Fixed: Sometimes the scroll bar was not displayed in the assigned object dialog.

[Search]
- Changed: Deleted devices are now removed from the index immediately.
- Changed: Added Keyboard navigation for the search tree.
- Changed: Added "Onboarding user" column.
- Changed: Added "Logged user" column filter.
- Changed: Search results now update automatically when filter values change.
- Changed: The "Share Option" button has been renamed to "Sharing" (English).
- Changed: Option to trigger a manual re-index moved to settings. (Search -> settings sidebar -> Index Configuration)
           The trigger is now shielded with a permission against mis-use. (Write permission for Node: Server Network Settings)
- Fixed: Missing translations for scheduler commands.
- Fixed: "Last Logged in User" did not show the correct data.
- Fixed: Reset and Save buttons overlapped with the dropdown menu for selecting the time when scheduling re-indexing.
- Fixed: Sorting by the "Last logged in user," "App on Device reports error," and "Onboarded by" columns could cause the app to break.
- Fixed: Columns selected in the table were not preselected in the export.
- Fixed: "Any fields" was not working for "Last logging user."
- Fixed: The reindex window appeared multiple times.
- Fixed: Criteria of a saved search were not displayed correctly if the criterion option was not present in the database.

[Logging]
- Fixed: Added missing tooltips to settings.
- Fixed: Missing translations for scheduler commands.
- Fixed: Log entries could be added to the table without a message parameter.
 
[Network]
- Changed: Tooltips are now available for settings.
- Fixed: Users without permission could close the settings sidebar.
- Fixed: The settings sidebar was closing before an option was chosen in the confirmation dialog.
 
[Others]
- Changed: The heap size for Elastic has been set back to 1 GB.

=============================================================================