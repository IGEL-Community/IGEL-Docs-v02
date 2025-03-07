=============================================================================
IGEL Universal Management Suite
=============================================================================
Version 12.07.100
Release date: 06.03.2025

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


=============================================================================
=============================================================================
Including changes from UMS Version 12.06.120
=============================================================================
=============================================================================
IGEL Universal Management Suite
=============================================================================
Version 12.06.120
Release date: 16.01.2025

HTML version of this Readme is available at:  https://kb.igel.com/ums/releasenotes


=============================================================================
Supported environment:
=============================================================================
UMS Server:
Microsoft Windows Server 2016 (64 bit) 
Microsoft Windows Server 2019 (64 bit) 
Microsoft Windows Server 2022 (64 bit)
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
# UMS WebApp #
=============================================================================

=============================================================================
Resolved issues:
=============================================================================

[Devices]
- Changed: Improved logging for shadowing of devices.

[Configuration]
- Changed: Accelerated check of profile compatibility. This results in a faster assignment workflow.

[Search]
- Fixed: Devices missing in search result if permissions were granted through UMS groups.


=============================================================================
=============================================================================
Including changes from UMS Version 12.06.110
=============================================================================
=============================================================================
IGEL Universal Management Suite
=============================================================================
Version 12.06.110
Release date: 10.12.2024

HTML version of this Readme is available at:  https://kb.igel.com/ums/releasenotes


=============================================================================
Supported environment:
=============================================================================
UMS Server:
Microsoft Windows Server 2016 (64 bit) 
Microsoft Windows Server 2019 (64 bit) 
Microsoft Windows Server 2022 (64 bit)
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

[App Proxy] 
- Added: Data is uploaded to App Binary Repositories immediately if the Repository configuration is changed or a new one is created. 

[UMS common] 
- Added: OS11 devices get ICG addresses even if they are directly connected to the UMS. 


============================================================================= 
Resolved issues: 
============================================================================= 

[App Proxy] 
- Fixed: URL of load balancer for Binary App Repository is not sent to device. 

[Device Connector] 
- Fixed: Logging of OS12 commands didn't work if web port was changed. 

[Device Service] 
- Fixed: Some parameters were not fully copied when a profile was copied in the WebApp. 
- Fixed: URL of load balancer for Binary App Repository is not sent to device. 

[IGEL Cloud Gateway (ICG)] 
- Fixed: SSH-Key input field does not grow outside the dialog window. 

[UMS common] 
- Fixed: Devices didn't receive the license with the latest expiration date when several licenses for the device including unlimited licenses were registered in UMS. 


============================================================================= 
# UMS WebApp # 
============================================================================= 

============================================================================= 
Resolved issues: 
============================================================================= 

[Apps] 
- Fixed: Manual update check sometimes did not work. 
- Fixed: "Search for updates"-button was not displayed. 

[Devices] 
- Fixed: Wrong permission checked for "Edit Configuration"-button. 
- Fixed: Files were not filtered by display name (quick assign control for "Profile contained files"-tab). 
- Fixed: Installed Apps state was not correctly shown. 

[Configuration] 
- Fixed: User without rights could sometimes move profiles. 
- Fixed: Users could sometimes see entities in the Recycle Bin they should not have seen. 
- Fixed: "Delete"-button on files was enabled for users that have denied Write permissions on the folder. 
- Fixed: No logs when modifying profile/priority profile. 
- Fixed: It was not possible to move some items to the Recycle bin, regardless of permission. 
- Fixed: It was possible to move directories to Recycle bin without Write permission. 

[Logging] 
- Fixed: No logs were generated when modifying a profile / priority profile. 
- Fixed: Log message indexing was broken for some fields. 

[Network] 
- Fixed: Tree keyboard navigation in the tree did not work. 

[Search] 
- Fixed: Search was not working after update on some installations. 
- Fixed: Issue with search permissions when updating to a newer version. 
- Fixed: Wrong icon was used for “Edit Search”-button. 
- Fixed: No French translation for search input field. 

[Others] 
- Changed: Optimized usage of database connections and transactions. 
