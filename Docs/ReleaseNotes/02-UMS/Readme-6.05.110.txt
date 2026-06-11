==================================================================
IGEL Universal Management Suite
==================================================================
Version 6.05.110
Release date: 07.10.2020

HTML version of this Readme is available at:  https://kb.igel.com/ums/releasenotes


==================================================================
Supported environment:
==================================================================
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
Oracle 11g R2 
Oracle 12c
PostgreSQL 9.5 - 9.6 and 10.1
Apache Derby 10.9 - 10.14  


=============================================================================
Resolved issues:
=============================================================================


[UMS common]
- Fixed: Plain messages (sent to the device) are not visible. (UMS Console -> Global Configuration -> Messages to Devices)


[UMS Web App]
- Fixed: Shadowing not working with Internet Explorer (UMS Webapp -> Device -> Shadowing)


[Devices]
- Fixed: Under rare circumstances manual licence deployement did not work via Java Web Start. (Device context menu -> License manually...)


[AD / LDAP integration]
- Fixed: If multiple Active Directories with LDAP-Service configuration were used only one of the Domains was working correctly (UMS Console -> Global Configuration -> Active Directory / LDAP)


[Server, common]
- Fixed: Having multiple device certificates could result in a 5 seconds delay for all commands. (UMS Console -> Global Configuration -> Certificate Management)


[Administrator application]
- Fixed: Database ports for SQL Server AD connections are not editable. (UMS Administrator -> Datasource)


[Notifications]
- Fixed: When all licenses of a pack are in use, a warning notification will be shown instead of an error notification (UMS Console -> Help -> Notifications)
- Changed: Improved notification messages for expiring licenses, packs and certificates. (UMS Console -> Help -> Notifications)
- Changed: Notification classification and management was improved. (UMS Console -> Help -> Notifications)


=============================================================================
Including changes from UMS Versions 6.05.100 
=============================================================================


==================================================================
IGEL Universal Management Suite
==================================================================
Version 6.05.100
Release date: 15.07.2020

HTML version of this Readme is available at:  https://kb.igel.com/ums/releasenotes


==================================================================
Supported environment:
==================================================================
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
Oracle 11g R2 
Oracle 12c
PostgreSQL 9.5 - 9.6 and 10.1
Apache Derby 10.9 - 10.14  

==================================================================
Removed Support :
==================================================================

UMS Server:
Microsoft Windows Server 2008 (64 bit and with SP2) -> EOL 14.01.2020
Microsoft Windows Server 2008 R2 (64 bit and with SP1) -> EOL 14.01.2020

UMS Client: 
Microsoft Windows Server 2008 (64 bit and with SP2) -> EOL 14.01.2020
Microsoft Windows Server 2008 R2 (64 bit and with SP1) -> EOL 14.01.2020
Microsoft Windows 7 (64 bit and with SP1) -> EOL 14.01.2020

Backend database (DBMS):
PostgreSQL 9.4 -> EOL Feb 2020

==================================================================
Added Support :
==================================================================

UMS Server:
Amazon Linux 2
Ubuntu 20.04 (64 bit)

UMS Client: 
Amazon Linux 2
Ubuntu 20.04 (64 bit)

=============================================================================
Known issues:
=============================================================================

[UMS Web App] 
- Shadowing is not working with Internet Explorer

==================================================================
New features:
==================================================================


[UMS common] 
- Added: Support of Active Directory authentication for MS SQL Server database.
- Added: New UMS superuser for initial UMS setup. This 'UMS superuser' is automatically created during installation and receives the same username and password as the database user. 
         DB user has no longer the rights for accessing UMS, UMS Web App, IMI, UMS superuser has to be used instead. The UMS superuser can be configured with IGEL UMS Administrator (Settings).   
- Updated: Apache Tomcat from version 8.5.50 to 8.5.56
- Updated: Java from version 8u242 to 8u252


[UMS Web App] 
- Added: Web-based user interface for managing IGEL OS endpoints (early feature set)
 * Managing device tree
 * See device details (System information, License information, User login history)
 * Sending power control commands (Reboot, Shutdown, Suspend, Wakeup)
 * Shadow devices
 * Powerful search
 * Network and server overview

See https://kb.igel.com/ums/webapp/en for more details.


[Console, common] 
- Added: Toolbar in UMS Console provides link for the UMS Web App.


[Console, administration section] 
- Changed: The '-' sign is now optional and editable in the prefix of the network name (UMS Administration -> Global Configuration -> Device Network Settings -> Naming Convention). Prefixes that generate a non-standard network name are not allowed if 'Adjust Names of Devices -> Adjust network name if UMS-internal name has been changed' is selected.


[IGEL Cloud Gateway (ICG)] 
- Added: It is possible to run ICG on port 443 now (ICG 2.02.100 and higher).
- Added: A limit for possible device connections can be defined for an ICG (ICG with version 2.02.100 or higher needed) (UMS Administration -> UMS Network -> IGEL Cloud Gateway -> 'Edit Connection Limit')


[High Availability Feature] 
- Added: Tool to check the status of an HA environment (Help -> 'UMS HA Health Check')


[Installer (Windows)] 
- Added: New Setup Page to configure Firewall port exclusions (only incoming connections)
- Added: New option to select the UMS Web App component for installation 
- Changed: Installer shows information and weblinks for UMS Web App if it is selected for installation.



=============================================================================
Resolved issues:
=============================================================================


[UMS common] 
- Removed: Command Devices –> Other commands –> Delete file from device
- Changed: Import of keystore files supports also JKS keystores (UMS Administration -> Global Configuration -> Certificate Management)
- Changed: Certificate chains could be imported although they are not supported. An import is prevented now. (UMS Administration -> Global Configuration -> Certificate Management)
- Fixed: The user manual couldn't be opened with the UMS internal PDF viewer (Help -> User Manual (offline))
- Added: Option for choosing the PDF viewer used for the offline manual (Misc -> Settings -> General)


[Console, common] 
- Fixed: Universal Firmware Update assignments of devices were not visible in some cases.
- Fixed: Some scrollbars, mostly horizontal ones, were extremely slow.
- Fixed: Missing German translations in request chart dialog of a selected IGEL Cloud Gateway ('Show History')
- Fixed: Rich Message Editor had wrong background color in 'Information/Help' tab
- Fixed: 'Save device files for support' (Help menu) and 'Export Device Settings' (System -> Export...) dialogs opened very slowly when no device was selected and therefore all devices were loaded.
- Fixed: In rare circumstances the device specific command list was not complete.
- Changed: Online check interval (Misc -> Settings -> Online check) has valid range between 100 ms and 1 hour.  For existing installations, values outside this range will be adjusted to the closest valid value.
- Changed: Modified permissions. A 'Deny' can't be overwritten by an 'Allow'. (Please see https://kb.igel.com/ums/no-permissions-after-ums-update)


[Devices]
- Fixed: License model information was not updated on up-/downgrade, affecting legacy licenses for ICG, HA and AIT. Information is now updated on each boot. 
- Changed: ICG administrated devices without valid IGEL Enterprise Management Pack license are now shown with the 'device isn't licensed' icon.


[Firmware Customization]
- Fixed: Some exported Firmware Customizations could not be imported if they were created with Oracle Database


[Profiles] 
- Fixed: Error occurred when executing 'Take over settings from ...' for devices.


[Views] 
- Fixed: Update time of views and searches was not displayed in localized format.
- Fixed: Error occurred when a view with a relative date criterion was created and a value of 0 days was specified.
- Changed: 'Device license' criterion now contains the possibility to search for all license types
- Changed: Special characters in MAC-Address search are ignored


[Jobs] 
- Fixed: A missing library could lead to failing jobs on headless installations.
- Fixed: Jobs could not be edited/selected (Error Message was 'Error Unable to load details for the tree nodes. Original error message: null')


[Automatic License Deployment (ALD)] 
- Fixed: Devices don't receive a renewal license automatically if the renewed subscription pack is assigned to the UMS Licensing ID and the pack has no ALD Token.


[Universal Firmware Update] 
- Fixed: The check for available firmware updates does no longer fail if some of the firmware properties files are invalid.
- Fixed: User name could be edited in the settings of Universal Firmware Updates for special system users


[Searches] 
- Fixed: User was not told to do a necessary restart of UMS Console if certain configurations changed.
- Fixed: Search History used lifetime settings of views instead of its own lifetime settings.


[Admin tasks] 
- Changed: Exported views are split into multiple files if the file size exceeds 25 MB. This affects the Administrative Tasks 'Save view results in the file system' 
		   and 'Export view result via mail' (UMS Administration -> Global Configuration -> Administrative Tasks) and the context menu action 'Send view result as mail' of views.
- Added: Context menu action 'Save as...' offers the option to save views or searches as ZIP file now.


[VNC] 
- Fixed: No confirmation dialog was displayed if multiple VNC session tabs were about to be closed.


[IGEL Cloud Gateway (ICG)] 
- Fixed: Shadowing over ICG failed if a proxy server was configured.
- Fixed: Selection of a configured IGEL Cloud Gateway took very long when it was not reachable (UMS Administration -> UMS Network -> IGEL Cloud Gateway)
- Fixed: Shadowing/Secure terminal over ICG didn't regard proxy configuration
- Fixed: ICG was displayed online, when it was running, but the websocket connection wasn't established yet
- Fixed: Job option 'Retry next boot' was ignored if device is connected via ICG (requires firmware LX 11.03.500 or newer)
- Fixed: Not all HA Servers were connected to a newly registered ICG
- Changed: Hostname/IP text field is now disabled if 'CA Certificate' is selected as certificate type (UMS Administration -> Global Configuration -> Cloud Gateway Options -> Create signed certificate).
- Changed: Information about last contact of an IGEL Cloud Gateway is shown in UMS Administration -> UMS Network -> IGEL Cloud Gateway -> Gateway details


[Asset Inventory Tracker (AIT)] 
- Changed: Improved the loading of Asset Information


[Administrator application] 
- Changed: Reduced the list of available cipher suites for GUI server port (default: 8443)(IGEL UMS Administrator -> Settings -> Cipher (Server-side) -> Configure Ciphers)
- Fixed: Shortcut for IGEL UMS Administrator didn't work after update of UMS installation.


[Database schema] 
- Fixed: No upgrade possible if the MS SQL Server database has a schema name with dashes.


[High Availability Feature] 
- Fixed: Special characters '.' and '-' in database user name caused problems during HA update.
- Fixed: In some cases database configuration was not synchronized within HA network depending on the available UMS servers.
- Fixed: Deletions of files in WebDAV folder were not synchronized in UMS HA network.
- Changed: Changes referring to the configured certificates are now automatically synchronized within an HA network and no longer require a restart of the IGEL RMGUIServer (UMS Administration -> Global Configuration -> Certificate Management)


[Installer (Linux)] 
- Fixed: On some dialogs the installation couldn't be aborted with [ESC] key


[Notifications] 
- Added: When the available amount of licenses of a License Pack is below the limit or when it exceeds the total amount, a notification is shown.


=============================================================================
=============================================================================
Including features from private builds of Version 6.04.100
=============================================================================

=============================================================================
IGEL Universal Management Suite
=============================================================================
Version 6.04.130
Release date: 25.05.2020


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
Oracle Linux 7 (64 bit)
Red Hat Enterprise Linux (RHEL) 7 (64 bit)
Red Hat Enterprise Linux (RHEL) 8 (64 bit)

UMS Client: 
Microsoft Windows 8.1 (64 bit and with Update 2919355) 
Microsoft Windows 10 (64 bit) 				
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
PostgreSQL 9.5 - 9.6 and 10.1
Apache Derby 10.9 - 10.14  

=============================================================================
Resolved issues:
=============================================================================


[Asset Inventory Tracker (AIT)]
- Changed: Improved the loading of Asset Information



=============================================================================
IGEL Universal Management Suite
=============================================================================
Version 6.04.120
Release date: 06.05.2020

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
Oracle Linux 7 (64 bit)
Red Hat Enterprise Linux (RHEL) 7 (64 bit)
Red Hat Enterprise Linux (RHEL) 8 (64 bit)

UMS Client: 
Microsoft Windows 8.1 (64 bit and with Update 2919355) 
Microsoft Windows 10 (64 bit) 				
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
PostgreSQL 9.5 - 9.6 and 10.1
Apache Derby 10.9 - 10.14  


=============================================================================
Removed Support:
=============================================================================

UMS Server:
Microsoft Windows Server 2008 (64 bit and with SP2) -> EOL 14.01.2020
Microsoft Windows Server 2008 R2 (64 bit and with SP1) -> EOL 14.01.2020

UMS Client: 
Microsoft Windows Server 2008 (64 bit and with SP2) -> EOL 14.01.2020
Microsoft Windows Server 2008 R2 (64 bit and with SP1) -> EOL 14.01.2020
Microsoft Windows 7 (64 bit and with SP1) -> EOL 14.01.2020 

Backend database (DBMS):
PostgreSQL 9.4  ->EOL Feb 2020


=============================================================================
New features:
=============================================================================

- Support of OSCW

=============================================================================
Resolved issues:
=============================================================================

[Console, common]
- Fixed: Universal Firmware Update assignments of devices were not visible in some cases.
- Fixed: In rare circumstances the device specific command list was not complete. 


[IGEL Cloud Gateway (ICG)]
- Fixed: Shadowing/SecureTerminal via ICG always used the internal ICG address and port instead of the external address and port (if available).



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
- Fixed: Jobs could not be edited/selected. (Error message was 'Error Unable to load details for the tree nodes. Original error message: null')
- Fixed: A missing library could lead to failing jobs on headless installations.


[Automatic License Deployment (ALD)]
- Fixed: Devices did not receive a renewal license automatically if the renewed subscription pack was assigned to the UMS Licensing ID and the pack had no ALD Token.


[Universal Firmware Update]
- Fixed: The check for available firmware updates failed with a null pointer message if one of the downloaded firmware properties was invalid.


[Searches]
- Fixed: Search History used lifetime settings of views instead of its own lifetime settings.


[Database schema]
- Fixed: The UMS could not be updated if the used schema name contained dashes. (Only for Microsoft SQL Server databases)

