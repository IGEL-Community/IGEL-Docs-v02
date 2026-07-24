=============================================================================
IGEL Universal Management Suite
=============================================================================
Version 6.08.120
Release date: 27.09.2021

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
Oracle 12c (with Cluster Support)
PostgreSQL 9.6 and 10 - 13
Apache Derby 10.9 - 10.14  





=============================================================================
Resolved issues:
=============================================================================

[Security]
- Fixed: CRITICAL SECURITY ISSUE
UMS Web App can be made to reveal critical information, including the UMS Superuser password.

A critical security vulnerability in UMS Web App affects the following IGEL products:
· UMS 6.8.x with UMS Web App installed
· UMS 6.7.x with UMS Web App installed
· UMS 6.6.x with UMS Web App installed
· UMS 6.5.x with UMS Web App installed

IGEL strongly recommends that all affected users (UMS Web App installed) update/upgrade to UMS 6.08.120. 
If you have reasons not to do that, you can do the following:
1. Make a UMS data backup.
2. Re-run your current installer and re-install UMS without UMS Web App









=============================================================================
Including changes from UMS Versions 6.08.110 
=============================================================================



=============================================================================
IGEL Universal Management Suite
=============================================================================
Version 6.08.110
Release date: 13.09.2021

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
Oracle 12c (with Cluster Support)
PostgreSQL 9.6 and 10 - 13
Apache Derby 10.9 - 10.14  




=============================================================================
New features:
=============================================================================

[Views]
- Added: The Text Mode in the Expert Mode in views can now auto-complete supported operators and recognize unsupported operators as syntax errors.



=============================================================================
Resolved issues:
=============================================================================

[Views]
- Fixed: Views that contain a 'is true' or 'is false' constraint could not be edited in the expert mode


[Console, administration section]
- Fixed: It was not possible to edit a device attribute without also changing the internal identifier
- Fixed: License file registration failed when UMS server and UMS console are not installed on the same machine (UMS Administration -> Global Configuration -> Licenses -> Device Licenses).


[High Availability Feature]
- Fixed: Assigned files of imported Firmware Customizations weren't synchronized within HA network.





=============================================================================
Including changes from UMS Versions 6.08.100 
=============================================================================


=============================================================================
IGEL Universal Management Suite
=============================================================================
Version 6.08.100
Release date: 15.07.2021

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
Oracle 12c (with Cluster Support)
PostgreSQL 9.6 and 10 - 13
Apache Derby 10.9 - 10.14  



=============================================================================
New features:
=============================================================================


[Views]
- Added: Enhanced Expert Mode to create and adjust complex views using a comfortable text input field


[Admin tasks]
- Added: It is possible to specify a custom view export name for the Administrative Task "Export view result via mail" and "Save view results in the file system" (UMS Administration -> Global Configuration -> Administrative Tasks)

[UMS common]
- Updated: Apache Tomcat from version 8.5.61 to 8.5.66


=============================================================================
Resolved issues:
=============================================================================


[UMS common]
- Fixed: Restore of embedded database sometimes fails with database timeout.
- Fixed: Delete actions in UMS Console fail if the used MS SQL Server database is set up in 'contained' mode.
- Fixed: Heavy WebDav access may cause poor AD login performance due to authentication checks.


[Console, common]
- Fixed: Only the UMS superuser was allowed to make changes to Access Control of certain tree nodes


[Devices]
- Fixed: Added missing check for write permission for certain device actions


[Views]
- Changed: Small text changes of view/search criterium 'Configuration Changes pending'


[Jobs]
- Fixed: Some jobs were not executed when the "retry next boot" option was selected


[Automatic License Deployment (ALD)]
- Changed: Created device licenses are now containing only one Unit ID and the license files are stored in the database instead of the file system.  From now on it is no longer possible to create a separate License file backup since the license files are part of the database.


[Console, administration section]
- Fixed: Refresh was needed after adding/removing device attributes in order to see the correct list of attributes.


[AD / LDAP integration]
- Fixed: Improved AD logon performance when option 'Resolve user group dependencies between all configured AD Domains' (UMS Administration -> Global Configuration -> Active Directory/LDAP) is active
- Fixed: In the dialog 'Administrator accounts' the action "Members" now search users for the selected group in all configured ADs, when option 'Resolve user group dependencies between all configured AD Domains' (UMS Administration -> Global Configuration -> Active Directory/LDAP) is active. 


[WebDAV]
- Fixed: WebDAV was no longer accessible after Web server port had been changed.


[IGEL Cloud Gateway (ICG)]
- Fixed: Login to Shared Workplace failed if the password contained certain special characters or umlauts


[IMI, server]
- Fixed: Device network name was not updated when the device name was changed via IMI and option 'Adjust network name if UMS-internal name has been changed' (UMS Administration -> Global Configuration -> Device Network Settings -> Adjust Names of Devices) was active 


[Server, common]
- Changed: Administrative tasks are suspended during database backup task in order to prevent deadlocks.
- Fixed: Some UMS features and services e.g. download of Universal Firmware Updates didn't work properly after an update installation for UMS 6.05.120 (or prior) to UMS 6.06.100 or higher was performed or after restoring a backup with schema 6.5 or lower for UMS 6.06.100 or higher.
- Changed: Because of security reasons, the UMS version information has been removed from the '.../info' page. 
- Fixed: The hostname was not editable in case of Web certificate renewal (UMS Administration -> Global Configuration -> Certificate Management -> Web)


[High Availability Feature]
- Fixed: Internal version number of UMS Load Balancer was shown in the health check.
- Fixed: Adding a new process to a HA network failed if a network token created with UMS 6.05.120 or lower was used for the installation.




=============================================================================
UMS Web App
=============================================================================


=============================================================================
New features:
=============================================================================

[Master Profiles]
- Added: Master Profile Tree 
- Added: Master Profile List 
- Added: Master Profile Details


[Quick Jump]
- Added: Quick Jump from profile and master profile to devices
- Added: Quick Jump from device to the assigned profiles


[Configuration]
- Added: Profile Directory Details in Configuration App
- Added: Filtering of activated settings is now possible.


[Devices]
- Added: Last Contact (last time an endpoint successfully communicated with the UMS) is now displayed in device properties section.


[Misc]
- Changed: New Icon set has been implemented to improve accessibility.

=============================================================================
Resolved issues:
=============================================================================

[Configuration]
- Added: Detach Assign Objects is enabled in Configuration App.
- Added: Quick Assign now available also on 'Enter' after selecting of assignable object with keyboard.
- Changed: Activated Settings Values overwritten by Template Keys are now represented as Template Key Icons.


[Devices]
- Added: If online check is activated, GLOBAL_ONLINE_CHECK_INTERVAL is used for device online status update.
- Added: If online check is disabled, more components are aware of that setting. Server load is reduced. 
- Added: For Activated Setting, that are marked as using a Template Key, but no Template Key was set, a warning icon is shown.
- Changed: If no changes occurred in Edit Profile Dialog then Save button is disabled. (No more empty change requests.)
- Changed: It is now possible to filter Template Key Relations.
- Changed: Template Key Icons in Activated Settings Values are now clickable.
- Changed: Editable Properties are renamed to Custom Properties. 
- Fixed: The Session-Parameters inside the Template-Key-Relation-Tab (Profile) will now show the correct session-instance-number.
- Fixed: Permissions for move and copy device directory now follows the UMS.
- Fixed: Improved styling of Template Key Relation table (alternating rows).


[Misc]
- Changed: Performance updates on various sub-systems.
- Changed: Redesigned "About" dialog
- Changed: Quotation marks for device and directory names and configurations in logs.
- Changed: Quotation marks for object names in confirmation dialogs and logging entries.
- Fixed: Items in Quick Assign list were not restricted for profile rights AssignDevice and AssignFile.
- Fixed: Removed redundant and not translated values inside the logging-app.
- Fixed: Unused actions and categories were shown in the logging app.