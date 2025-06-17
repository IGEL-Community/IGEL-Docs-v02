# IGEL News: UMS

**NOTE:**

----

## 2025-06-17 - [12.08.110](Readme-12.08.110.txt)

```
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
```

----

## 2025-05-27 - [12.08.100](Readme-12.08.100.txt)

```
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
```

----

## 2025-04-24 - [12.07.110](Readme-12.07.110.txt)

```
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


============================================================================= 
Resolved issues: 
============================================================================= 

[UMS common]
- Fixed: Wake up command was not working properly in some cases.
- Fixed: Messages between UMS Servers were not processed.
- Fixed: In some cases, the UMS license was not evaluated correctly, which could result in issues such as being unable to log in to the UMS when using an external database.

[App Proxy]
- Fixed: SSL configuration for Distributed App Repository was not working out of the box.

[Device Service]
- Added: Additional debug log output for TC Connection States.


=============================================================================
# UMS WebApp #
=============================================================================

=============================================================================
Resolved issues:
=============================================================================

[Configuration] 
- Fixed: On the network page sometimes an error, related to duplicate keys, was displayed, rendering the page unusable.

[Devices] 
- Fixed: A bug was found impacting the Shadow-functionality for servers in certain time zones. 
         Secure Shadowing tokens — though properly generated and distributed — were consistently rejected during validation, as they appeared to fall outside their valid time window. 
		 
[Logging] 
- Fixed: The internal counter for unified logging misused the global counter. This change is important for large installations.
```

----

## 2025-03-06 - [12.07.100](Readme-12.07.100.txt)

```
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


=============================================================================
New features:
=============================================================================

[UMS common] 
- Added: Support for Microsoft Windows Server 2025. 
- Updated: Java JDK from version 17.0.12+7 to 17.0.13+11 
- Updated: Apache Tomcat from version 10.1.28 to 10.1.34 

[Administrator application] 
- Added: Options for automatic download and manual registration of UMS license. (Settings -> UMS License) 
- Added: Option to UMS Administrator application to export UMS ID. (UMS Administrator application -> UMS ID Backup) 

[IGEL Cloud Gateway (ICG)] 
- Updated: End-user license agreement 

[Installer (linux)] 
- Added: Option to select a user during a new installation to run the UMS tomcat and other IGEL Services without root privileges. 

[Installer (windows)] 
- Added: Option to select a user during a new installation to run the UMS tomcat and other IGEL Services without system user privileges.

[Unified Protocol] 
- Added: Possibility to use the UMS as Identity Broker for OS12 devices. The devices can login via UMS to the company AD even if they are outside of the company network. (IGEL OS 12.6.1 or higher needed) 
 
[ums] 
- Added: New licensing model for UMS with different levels of feature sets. Please refer to the IGEL knowledge base for more information about the licensing levels and included features.

=============================================================================
Resolved issues:
=============================================================================

[Configuration Dialog] 
- Fixed: When changing the "Authentication type" setting on the Citrix StoreFront Login page in the profile configuration dialog the settings below were not correctly disabled. 

[Console, administration section] 
- Changed: The permission “first authentication” is not required any more to restart, update or remove the ICG server. The permission ”WebDAV access” is required to install and update the ICG. READ permission of Proxy Server, Cloud Gateway is required to install. WRITE permission of Server is required to install the ICG. 

[Device Service] 
- Fixed: Some parameters were lost when an app was removed from an OS12 profile. 
- Fixed: Parameters of deleted profiles were sent to the devices. 

[UMS common] 
- Fixed: The error 'no provider jakarta.mail' has been fixed for UMS under Ubuntu 20.04 or 22.04. 

[Unified Protocol] 
- Fixed: Update of device system information resulted in an SQL error if the data was too long. 

[ums] 
- Changed: Removed outdated certificate. 
- Fixed: User logins in the UMS Console and WebApp did block database connections for a brief time, leading to long login times.  


=============================================================================
# UMS WebApp #
=============================================================================

=============================================================================
New features:
=============================================================================

[UMS WebApp common] 
- Updated: Bundled Elasticsearch from version 7.17.7 to 7.17.27 and increased the used heap space from 1GB to 2GB
	   
[Apps] 
- Added: App Binary Repositories available in the Web App. 

[Configuration] 
- Added: CIC import and export functionality. 
- Added: Option to duplicate a Profile and a Priority Profile via a button in the profile details or with context menu directly on the profile card. 
- Added: Notifications and messages about the final deletion process. 
- Changed: Moved the button for CIC renaming to the action buttons toolbar. 

[Configuration Dialog] 
- Added: The file upload is now also possible in the CIC dialog. 
- Changed: Progress spinners have been added to the profile, device, and CIC configuration dialogs to provide visual feedback during loading times. 

[Devices] 
- Added: Recycle Bin for Devices is now available in the Web App. 
- Added: Support Information is now available in the Web App. 
- Added: Option to follow Default Directory Rules in Device Scan Dialog. 

[Misc] 
- Added: The feature-based licensing model is now available in the Web App. It includes Priority Profiles, Template Keys and Custom Device Attributes 

[Others] 
- Added: Link to Quick Start Configurations in the Help menu. 
- Added: License information in Info dialog. 


=============================================================================
Resolved issues:
=============================================================================

[Apps] 
- Added: Context menu for Apps list.  
- Fixed: Version deletion was not possible. 
- Fixed: When importing an App not via the App Portal, the "import by" field failed to display the user who performed the import. 
- Changed: Apps details toolbar is responsive. 

[Configuration] 
- Fixed: Newly created CIC was not automatically selected after creation. 
- Fixed: Wrong permissions were set in Profile/Priority Profile lists. 
- Fixed: Context menu options were enabled if there was no read permission for CICs. 
- Fixed: Sometimes files could not be loaded. 
- Fixed: It was not possible to select Detach "Now" or "On reboot" options when detaching an assigned object from a CIC. 
- Fixed: Wrong icon was shown for OS11 Profiles/Priority Profiles in "Move to recycle bin" dialog 
- Fixed: Incorrect icon displayed when moving profiles to recycle bin.  
- Fixed: Not assigned Profile incorrectly displayed the "Update Time" dialog when a file was assigned to it. 
- Fixed: When importing a profile not via the App Portal, the "import by" did not show the user who imported it. 
- Fixed: "Update time" dialog now appears when changing Apps in the App Selector or Use cases in the Use Case Selector dialogs. 
- Fixed: Users with write permission on files but not on folders could delete files but could not restore them from the Recycle Bin. 
- Changed: The Read-only label and icon in the "Edit configuration" dialog now have a warning color style. 
- Changed: The "Edit Properties" button for Profiles has been repositioned to Action buttons. 
- Changed: The Recycle Bin now sorts alphabetically, listing folders first, followed by devices. 

[Configuration Dialog] 
- Fixed: It was not possible to set Template Keys for instances in Registry. 

[Devices] 
- Added: Context menu for the Device list. 
- Added: Toggle to hide empty device system information entries. 
- Added: Delete license option to device deletion dialog. 
- Added: Logging for bulk command to security log. 
- Fixed: Device attribute list items could not be deleted. 
- Fixed: The "Assigned Devices" section of the Webapp was not updating properly when switching between different files. 
- Fixed: Wrong permission checked on Edit Configuration button. (UI only) 
- Fixed: Scrollbar was missing for small window-sizes in device details. 
- Fixed: In "Edit custom properties" dialog was wrong validation message for numeric input, visibility of focused element and width of input for comment. 
- Fixed: Long loading time for Assign Object windows. 
- Fixed: Device attribute sorting was not working correctly. 
- Fixed: Screen fitting issue within visible area before shadowing. 
- Fixed: Config_change flag for devices was sometimes not updated upon device changes. 
- Fixed: Device selection was not retained when refreshing the page or navigating between sections. 
- Fixed: Incorrect disabling of "Scan for devices" button. 
- Fixed: Assign dialog could not load objects when user lacked read CIC permission but device had assigned CIC(s). 
- Fixed: "Send settings", "Reboot" commands did not contain corresponding message in logging. 
- Changed: Used Tyrus instead of Jetty as client for shadowing. 
- Changed: The Read-only label and icon in the Edit configuration dialog now has a warning color style. 
- Changed: Previous scan settings are saved. 
- Changed: The "Rename" button for devices has been repositioned to the Action buttons. 
- Changed: The "Edit Properties" button for Profiles has been repositioned to the Action buttons. 
- Changed: The "Update Settings" dialog is now accessible via a button in the Action toolbar. 

[Settings] 
- Changed: EPR settings "Enable Priority Profile" update now takes effect immediately. 

[Search] 
- Added: New devices are now indexed immediately.
```

----

## 2025-01-16 - [12.06.120](Readme-12.06.120.txt)

```
=============================================================================
# UMS WebApp #
=============================================================================

=============================================================================
Resolved issues:
=============================================================================

[Devices]
- Changed: Improved logging for shadowing of devices.

[Configuration]
- Changed: Accelerated check of profile compatibility. This results
           in a faster assignment workflow.

[Search]
- Fixed: Devices missing in search result if permissions were granted
         through UMS groups.
```

## 2024-12-10 - [12.06.110](Readme-12.06.110.txt)

```
=============================================================================
New features:
=============================================================================

[App Proxy] 
- Added: Data is uploaded to App Binary Repositories immediately
         if the Repository configuration is changed or a new one is created.

[UMS common] 
- Added: OS11 devices get ICG addresses even if they are directly
         connected to the UMS.

============================================================================= 
Resolved issues: 
============================================================================= 

[App Proxy] 
- Fixed: URL of load balancer for Binary App Repository was not
         sent to the device.

[Device Connector] 
- Fixed: Logging of OS12 commands didn't work if web port was changed. 

[Device Service] 
- Fixed: Some parameters were not fully copied when a profile was
         copied in the WebApp.
- Fixed: URL of load balancer for Binary App Repository was not
         sent to the device.

[IGEL Cloud Gateway (ICG)] 
- Fixed: SSH-Key input field does not grow outside the dialog window. 

[UMS common] 
- Fixed: Devices didn't receive the license with the latest expiration
         date when several licenses for the device including unlimited
         licenses were registered in UMS.

============================================================================= 
# UMS WebApp # 
============================================================================= 

============================================================================= 
Resolved issues: 
============================================================================= 

[Apps] 
- Fixed: Manual update check sometimes did not work. 
- Fixed: "Search for updates"-button was not always displayed.

[Devices] 
- Fixed: Wrong permission checked for "Edit Configuration"-button. 
- Fixed: Files were not filtered by display name (quick assign
         control for "Profile contained files"-tab).
- Fixed: Installed Apps state was not correctly shown. 

[Configuration] 
- Fixed: User without rights could sometimes move profiles. 
- Fixed: Users could sometimes see entities in the Recycle Bin they
         should not have seen.
- Fixed: "Delete"-button on files was enabled for users that have
         denied Write permissions on the folder.
- Fixed: No logs when modifying profile/priority profile. 
- Fixed: It was not possible to move some items to the Recycle bin,
         regardless of permission.
- Fixed: It was possible to move directories to Recycle bin without
         Write permission.

[Configuration Dialog]
- Changed: The default printer parameter can now also be activated
           in a profile configuration and overwrite the device configuration.

[Logging] 
- Fixed: No logs were generated when modifying a profile / priority
         profile.
- Fixed: Log message indexing was broken for some fields. 

[Network] 
- Fixed: Tree keyboard navigation did not work. 

[Search] 
- Fixed: Search was not working after update on some installations.
- Fixed: Issue with search permissions when updating to a newer
         version.
- Fixed: Wrong icon was used for “Edit Search”-button. 
- Fixed: No French translation for search input field. 

[Others] 
- Changed: Optimized usage of database connections and transactions. 
```

## 2024-10-24 - [12.06.100](Readme-12.06.100.txt)

```
=============================================================================
New features:
=============================================================================

[Admin tasks] 
- Added: Administrative task for cleaning up expired licenses and
         / or license duplicates. (UMS Administration -> Global Configuration
         -> Administrative Tasks)

[IGEL Cloud Gateway (ICG)] 
- Added: Option to authenticate to ICG Server with SSH key for ICG
         install / uninstall / update / keystore update / restart.

[UMS common] 
- Updated: Apache Tomcat to Version 10.1.28 
- Added: Now a device license is only registered when it doesn't
         already exist.
- Updated: Spring Security to version 6.3.1 
- Updated: Spring to version 6.1.10. 
- Updated: Spring Boot to version 3.3.3 

[Unified Protocol] 
- Added: Support for OS12 Wake on LAN Proxies. 

[ums] 
- Added: Support of Red Hat Linux version 9.
- Added: Option to specify the delimiter when the results of a view
 .       are saved/sent by e-mail.
- Added: Support of Oracle DB version 21. 

============================================================================= 
Resolved issues: 
============================================================================= 

[AD / LDAP integration] 
- Fixed: In special cases the UMS Console did not respond when the
         Test of an AD configuration was done.

[Device Connector] 
- Fixed: ICG connected devices could not communicate with the UMS
         after a 30 day connection to the ICG without reconnect.
* Workaround: disconnect and connect the ICG 

[Device Service] 
- Fixed: Import of profile sometimes resulted in wrong configuration. 

[Files] 
- Fixed: File upload via Webapp did not support different data directory. 
  
[IGEL Cloud Gateway (ICG)] 
- Fixed: In some cases, the ICG was not reconnected after UMS/ICG restart. 
- Fixed: UMS console was frozen if ICG was disconnected, and several
          UMS servers were offline.
- Fixed: Devices were able to re-register via ICG after deletion. 

[IGEL Management Interface (IMI)] 
- Fixed: Creation of template keys and assignment of key values to
         devices and device directories via IGEL Management Interface (IMI)
         worked only for the superuser.

[UMS common] 
- Fixed: Wake up command was not working properly in some cases. 
- Fixed: Security Logging Data was missing for LDAP/AD Users
         (Information of user who performed action was missing).

============================================================================= 
# UMS WebApp # 
============================================================================= 
============================================================================= 
New features: 
============================================================================= 

[Configuration] 
- Added: Recycle Bin for Regular Profiles is now available in the Web App.
- Added: Recycle Bin for Priority Profiles is now available in the Web App.
- Added: Recycle Bin for CICs is now available in the Web App.
- Added: Recycle Bin for Files is now available in the Web App.
- Changed: All selected use cases are now shown in CIC details and cards.
- Added: Assigned CICs tab is shown.
- Added: Navigation to the assigned CIC from device and file.

[Configuration Dialog] 
- Added: File size is now shown in files properties in CIC dialog
         when available.

[Devices] 
- Added: Option to manage Device Attributes is now available in the
         Web App.
- Added: New Device property "Born on Date" (time of registration).

[Search] 
- Added: New filter related to the time of registration.

[Misc] 
- Added: Support for French language.
- Updated: Angular to Version 18.

============================================================================= 
Resolved issues: 
============================================================================= 

[Login] 
- Changed: Tooltips removed from Username and Password fields.
- Fixed: "Remember me" function did not save login data.

[Apps] 
- Changed: Apps can be searched by Display name.
- Fixed: The app was not imported properly if the app dependency
         version was empty.
- Fixed:  The first downloaded app did not appear in the apps list.

[Configuration] 
- Added: Tooltips for Create New Profile button and Set Default
         Version button.
- Fixed: The tooltip remained displayed on the "Clear All Filters"
         icon in Assigned Devices.
- Fixed: The edit file dialog was broken when opened from File details.
- Fixed: Items in the file root directory were counted even if the
         user had no Browse rights.
- Fixed: Assign file permissions were not handled properly in all cases.

[Configuration Dialog] 
- Changed: Removed the possibility to set template keys on special
           parameters with combined parameters set as dependency because it
           resulted in confusing behavior (e.g. Wi-Fi Domain and Location).
	       It is still possible to set template keys in Registry for such cases.

[Devices] 
- Added: Message if there are no assigned objects in Assigned Object tab.
- Changed: Shadowing works via Tyrus instead of Jetty.
- Changed: Previous scan settings are now saved.
- Fixed: The filter icons in the Assign Objects search did not work
         properly.
- Fixed: The "All selected" option in the Scan Dialog did not
         function correctly.
- Fixed: The number of devices handled was not correct after multiple
         scans.

[Logging] 
- Fixed: Filtering for Logtime "Between" did not work correctly.
- Fixed: File and CIC actions were logged even when logging was not
         enabled.

[Search] 
- Changed: The 'go to settings' button has been removed.
- Changed: The warning about stacking reindexing has been altered.
- Fixed: Value for broken comma was incorrect.
- Fixed: Case sensitivity did not work for any field.
- Fixed: Cost Center filter did not work correctly.
- Fixed: Content of the dialog when the "show terms" button was
         clicked was not displayed.
- Fixed: Wrong data was shown for the filter "within last"+"1"+"min".
- Fixed: Combo box values were not sorted alphabetically.
- Fixed: Export of the search result included all elements, not
 .       just the search results.
- Fixed: Filter "Version" did not function correctly.
- Fixed: Two or more device attributes with multiple selected items
         returned incorrect values.
- Fixed: Device attribute of the date type did not work correctly.
```

## 2024-08-27 - [12.05.130](Readme-12.05.130.txt)

```
=============================================================================
New features:
=============================================================================

[ums]
- Updated: Java JDK from version 17.0.11+9 to 17.0.12+7

======================================================
Resolved issues:
======================================================

[ums]
- Fixed: View results that were exported with an adminstrative task
         didn't contain any monitor information.

=============================================================================
# UMS WebApp #
=============================================================================
======================================================
Resolved issues:
======================================================

[WebApp]
- Fixed: Some App-Versions where not importable due to a mismatch
         of expected and provided values of dependend apps. (Full fix will
 .       be provided with UMS 12.06.100)
```