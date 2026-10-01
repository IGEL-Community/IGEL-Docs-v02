=============================================================================
IGEL Universal Management Suite
=============================================================================
Version 6.04.110
Release date: 12.03.2020

HTML version of this Readme is available at:  https://kb.igel.com/ums/releasenotes


=============================================================================
Supported environment:
=============================================================================
UMS Server:
Microsoft Windows Server 2008 (64 bit and with SP2)
Microsoft Windows Server 2008 R2 (64 bit and with SP1)
Microsoft Windows Server 2012 (64 bit) 
Microsoft Windows Server 2012 R2 (64 bit and with Update 2919355)
Microsoft Windows Server 2016 (64 bit) 
Microsoft Windows Server 2019 (64 bit) 
Ubuntu 16.04 (64 bit)
Ubuntu 18.04 (64 bit)
Oracle Linux 7 (64 bit)
Red Hat Enterprise Linux (RHEL) 7 (64 bit)
Red Hat Enterprise Linux (RHEL) 8 (64 bit)

UMS Client: 
Microsoft Windows 7 (64 bit and with SP1)
Microsoft Windows 8.1 (64 bit and with Update 2919355) 
Microsoft Windows 10 (64 bit) 				
Microsoft Windows Server 2008 (64 bit and with SP2)
Microsoft Windows Server 2008 R2 (64 bit and with SP1)
Microsoft Windows Server 2012 (64 bit) 
Microsoft Windows Server 2012 R2 (64 bit and with Update 2919355)
Microsoft Windows Server 2016 (64 bit) 
Microsoft Windows Server 2019 (64 bit) 
Ubuntu 16.04 (64 bit)
Ubuntu 18.04 (64 bit)
Oracle Linux 7 (64 bit)
Red Hat Enterprise Linux (RHEL) 7 (64 bit)
Red Hat Enterprise Linux (RHEL) 8 (64 bit)

Backend database (DBMS):
Microsoft SQL Server 2012
Microsoft SQL Server 2014 (with Cluster Support)
Microsoft SQL Server 2016 (with Cluster Support)
Microsoft SQL Server 2017 (with Cluster Support)
Microsoft SQL Server 2019 (with Cluster Support)
Oracle 11g R2 
Oracle 12c
PostgreSQL 9.4 - 9.6 and 10.1
Apache Derby 10.9 - 10.14  


=============================================================================
Resolved issues:
=============================================================================


[Jobs]
- Fixed: Jobs could not be edited/selected. (Error Message was "Error Unable to load details for the tree nodes. Original error message: null")
- Fixed: A missing library could lead to failing jobs on headless installations.


[Automatic License Deployment (ALD)]
- Fixed: Devices did not receive a renewal license automatically if the renewed subscription pack was assigned to the UMS Licensing ID and the pack had no ALD Token.


[Universal Firmware Update]
- Fixed: The check for available firmware updates failed with a null pointer message if one of the downloaded firmware properties was invalid.


[Searches]
- Fixed: Search History used lifetime settings of views instead of its own lifetime settings.


[Database schema]
- Fixed: The UMS could not be updated if the used schema name contained dashes. (Only for Microsoft SQL Server databases)







=============================================================================
IGEL Universal Management Suite
=============================================================================
Version 6.04.100
Release date: 14.02.2020

HTML version of this Readme is available at:  https://kb.igel.com/ums/releasenotes


=============================================================================
Supported environment:
=============================================================================
UMS Server:
Microsoft Windows Server 2008 (64 bit and with SP2)
Microsoft Windows Server 2008 R2 (64 bit and with SP1)
Microsoft Windows Server 2012 (64 bit) 
Microsoft Windows Server 2012 R2 (64 bit and with Update 2919355)
Microsoft Windows Server 2016 (64 bit) 
Microsoft Windows Server 2019 (64 bit) 
Ubuntu 16.04 (64 bit)
Ubuntu 18.04 (64 bit)
Oracle Linux 7 (64 bit)
Red Hat Enterprise Linux (RHEL) 7 (64 bit)
Red Hat Enterprise Linux (RHEL) 8 (64 bit)

UMS Client: 
Microsoft Windows 7 (64 bit and with SP1)
Microsoft Windows 8.1 (64 bit and with Update 2919355) 
Microsoft Windows 10 (64 bit) 				
Microsoft Windows Server 2008 (64 bit and with SP2)
Microsoft Windows Server 2008 R2 (64 bit and with SP1)
Microsoft Windows Server 2012 (64 bit) 
Microsoft Windows Server 2012 R2 (64 bit and with Update 2919355)
Microsoft Windows Server 2016 (64 bit) 
Microsoft Windows Server 2019 (64 bit) 
Ubuntu 16.04 (64 bit)
Ubuntu 18.04 (64 bit)
Oracle Linux 7 (64 bit)
Red Hat Enterprise Linux (RHEL) 7 (64 bit)
Red Hat Enterprise Linux (RHEL) 8 (64 bit)

Backend database (DBMS):
Microsoft SQL Server 2012
Microsoft SQL Server 2014 (with Cluster Support)
Microsoft SQL Server 2016 (with Cluster Support)
Microsoft SQL Server 2017 (with Cluster Support)
Microsoft SQL Server 2019 (with Cluster Support) (NEW)
Oracle 11g R2 
Oracle 12c
PostgreSQL 9.4 - 9.6 and 10.1
Apache Derby 10.9 - 10.14  

=============================================================================
New features:
=============================================================================

[UMS common]
- Added: Shared Workspace can be deactivated
- Added: Support for Secure Terminal via IGEL Cloud Gateway (ICG 2.01.100 or higher and IGEL OS 11.02.100 or higher are required)
- Added: Installer and UMS Administrator perform database version check when a database is selected
- Changed: It is possible to log in to the UMS Server via the UMS Console if the UMS Server is in HA update mode
- Added: 'Manual Licenses Dialog' – Table with licensable devices shows list of licensing pack IDs in the comment, if the information is available in the UMS
- Updated: Apache Tomcat from version 8.5.45 to 8.5.50
- Updated: Java from version 8u222 to 8u242


[Universal Customization Builder (UCB)]
- Added: Universal Customization Builder (for Windows) is now available for free (No license required)
- Removed: Obsolete Linux part of Customization Builder


[Jobs]
- Added: New Job command 'Send Message' added


[Universal Firmware Update]
- Added: The UMS Server supports FTP passive mode for Universal Firmware Upload
- Added: Check for free disk space on file system before downloading firmware update


[Console, administration section]
- Added: Show UMS License ID fingerprint in UMS Console (UMS Administration -> Global Configuration -> Licenses -> UMS Licensing ID)
- Changed: Option to enable Master Profiles, Template Profiles and Recycle Bin moved to new node UMS Features (UMS Administration -> Global Configuration -> UMS Features)
- Changed: It is now possible to choose a specific port for the online check (UMS Administration -> Server Network Settings -> Online Check Parameters -> Specify online check port (UDP))


[Administrator application]
- Added: Show UMS License ID fingerprint in UMS Administrator (Administrator application -> UMS Licensing ID Backup)
- Added: Multiselect option for cipher selection (IGEL UMS Administrator -> Settings -> Cipher -> Configure Ciphers)
- Added: Confirmation dialog after database password change


[Notifications]
- Added: Notifications for expiring and expired certificates (Help -> Notifications)
- Added: Notifications for expiring and expired packs (Help -> Notifications)
- Added: Option to show archived notifications (Help -> Notification)
- Added: Option to restore archived notifications
- Changed: Replaced the "Do not show again" checkbox for multiple notification selection with a dropdown action selector in the Notification dialog (Help -> Notifications)
- Changed: Notifications are automatically restored from archive when the Info Type is updated to a higher level (from warning to error)


[Devices]
- Added: Device file location can now be edited before sending a file to a device (Device context menu -> Other commands -> 'File UMS -> Device')


[Views]
- Added: If 'Send view result as mail' ('View' context menu) fails, an error message is displayed in the 'Messages' area
- Added: It is now possible to send view results as mail even if the result is not loaded in the detail view


[VNC]
- Added: Secure Terminal confirmation dialog shows whether terminal feature is enabled for each device


[IGEL Cloud Gateway (ICG)]
- Added: The Events table in the UMS Administration view is always visible in the management tree. ICG events will be logged in the table (UMS Administration -> UMS Network -> Events)


[Installer (windows)]
- Updated: Bundled Microsoft Visual C++ 2017 Redistributable from version 14.15 to 14.16



=============================================================================
Resolved issues:
=============================================================================

[UMS common]
- Changed: Activation/Deactivation of template profiles/master profiles has to be confirmed now when at least one key value/master profile exists
- Fixed: Several file choosers did not remember the last selected directory


[Console, common]
- Fixed: 'Messages' area sometimes forgot its previous size
- Fixed: Various windows did not remember their last size, position or had an unfavorable default size
- Fixed: Save support Information could sometimes not be generated due to unnecessary size check
- Added: Cross check of user and group name when adding a new administrator account


[Devices]
- Fixed: 'Runtime since last Boot', 'Total Operating Time' and 'Battery Level' were not always refreshed on Refresh/F5
- Fixed: Changes to a device or profile were lost when switching to UMS Administrator in UMS Console
- Fixed: Update on network name (DNS) was not triggered if name was changed via system information


[Firmware Customization]
- Fixed: Files or folders with spaces in the name could not be used in Firmware Customizations or file upload


[Jobs]
- Fixed: Log messages for jobs were not displayed


[Universal Firmware Update]
- Changed: Snapshot upload in 'Universal Firmware Update' only allows files with .snp filename extension


[Searches]
- Fixed: Changes to the Search result page behavior ('Misc' -> 'Settings' -> 'Views and Searches' -> 'Page Behavior') were not applied immediately after saving the settings and selecting a search result


[Configuration Dialog]
- Fixed: "Always apply settings on reboot ..." checkbox was missing in Update time dialog when saving Device/Profile configuration


[Console, administration section]
- Fixed: The split position of the panels in the detail view of a server (UMS Administration -> UMS Network -> Server) was not persistent
- Fixed: Connect/Disconnect operation of ICGs to UMS HA had inconsistent behavior
- Changed: Online Check Response Timeout input restricted to 100ms up to 10.000ms (UMS Administration -> Global Configuration -> Server Network Settings)


[AD / LDAP integration]
- Changed: For an administrator account import of users from an AD/LDAP directory (System -> Administrator account -> Import), the selection for 'Add user/group' was improved
- Fixed: Inherited permissions of an imported AD user were not displayed correctly in the 'Effective Rights' section of the 'Administrator accounts' window (System -> Administrator accounts -> Effective Rights)


[Console, web start]
- Fixed: An issue introduced in UMS 6.03.120 prevented execution of UMS Console via Java Web Start


[VNC]
- Fixed: VNC-Viewer always started on the primary screen instead of last screen (multi display environment)
- Fixed: The VNC Certificate Dialog could be off-screen and so blocked the user from interactions


[IGEL Cloud Gateway (ICG)]
- Removed: Misleading log message during ICG installation


[Mobile Device Management (MDM)]
- Fixed: Synchronization with ICG failed, if MDM push certificate was expired


[Administrator application]
- Fixed: Backup sizes smaller than 1KB were not displayed correctly
- Added: Additional check for existing database schema before activating a database connection
- Added: Check for supported database versions


[High Availability Feature]
- Fixed: Misc settings configurations (UMS Administration -> Global Configuration -> Misc Settings) were not synchronized with all HA servers
- Fixed: WebDAV subfolders were not synchronized to other HA servers
- Fixed: Adding a HA server after adding an ICG server to the environment caused ICG connection problems
- Fixed: The created support file, from triggering 'Save support information' (Help -> Save support information), did not always contain the information of remote components


[UI / Look&Feel]
- Fixed: Visibility of various (disabled) menu-icons
- Removed: Deprecated bevelbar from legacy themes


[Notifications]
- Fixed: Notification dialog did sometimes not show notifications when global notifications were enabled


[Server, common]
- Fixed: Removed misleading logging-information on updating network name for linux clients (network.interfaces.ethernet.use_igel_setup)



=============================================================================
=============================================================================
Including features from private builds of Version 6.03.100
=============================================================================

=============================================================================
IGEL Universal Management Suite
=============================================================================
Version 6.03.130
Release date: 2019-12-10

HTML version of this Readme is available at:  https://kb.igel.com/ums/releasenotes
=============================================================================
New features:
=============================================================================

CARE !!!: 
[UMS common]
- Changed: All IGEL services and resources like
		   the firmware update server (which was fwu.igel.com and is now fwus.igel.com) and 
           the IGEL Knowledge Base (kb.igel.com) are now contacted via HTTPS.
		   It is now important to allow the https port (default 443) and the new address (fwus.igel.com) in the firewall rules and the proxy rules.
		   (Please see https://kb.igel.com/endpointmgmt-6.03/en/ums-cannot-contact-download-server-any-more-24388160.html)



=============================================================================
Resolved issues:
=============================================================================


[IGEL Cloud Gateway (ICG)]
- Fixed: ICG root certificates created with UMS version 6.01.130 or 
         with an older version can be used again for creating a signed certificate.


=============================================================================
IGEL Universal Management Suite
=============================================================================
Version 6.03.120
Release date: 2019-11-04

HTML version of this Readme is available at:  https://kb.igel.com/ums/releasenotes
=============================================================================
Resolved issues:
=============================================================================

[UMS common]
- Changed: All IGEL services and resources like
		   the firmware update server (which was fwu.igel.com and is now fwus.igel.com), 
           the IGEL Knowledge Base (kb.igel.com), the IGEL licensing server (susi.igel.com) and 
		   the IGEL web site (www.igel.com)) are now contacted via HTTPS.
		   It is now important to allow the https port (default 443) and the new address (fwus.igel.com) in the firewall rules and the proxy rules.

[Console, common]
- Fixed: The file transfer status of firmware customizations without read permission were not displayed in the device detail window


[Firmwares]
- Fixed: Generic commands could not be triggered by the UMS Console.


=============================================================================
IGEL Universal Management Suite
=============================================================================
Version 6.03.110
Release date: 2019-10-30

HTML version of this Readme is available at:  https://kb.igel.com/ums/releasenotes

=============================================================================
Resolved issues:
=============================================================================

[UMS common]
- Fixed: Files are now applied correctly when assigned to multi-level device folders


[Console, common]
- Fixed: Removed unnecessary log entries which occurred if the user had no permission set
- Fixed: Issue where the 'configuration changed' indicator (blue exclamation mark) was not updated correctly if shared workplace assignments existed 


[Views]
- Fixed: Number of hidden devices did not get refreshed if devices where added by another console
