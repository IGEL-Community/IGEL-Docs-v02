=============================================================================
IGEL Universal Management Suite
=============================================================================
Version 12.03.100
Release date: 13.12.2023

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
Oracle Linux 7 (64 bit)
Red Hat Enterprise Linux (RHEL) 7 (64 bit)
Red Hat Enterprise Linux (RHEL) 8 (64 bit)
Amazon Linux 2

UMS Client: 
Microsoft Windows 10 (64 bit) 	
Microsoft Windows 11 (64 bit) 			
Microsoft Windows Server 2016 (64 bit) 
Microsoft Windows Server 2019 (64 bit) 
Microsoft Windows Server 2022 (64 bit)
Ubuntu 20.04 (64 bit)
Ubuntu 22.04 (64 bit)
Oracle Linux 7 (64 bit)
Red Hat Enterprise Linux (RHEL) 7 (64 bit)
Red Hat Enterprise Linux (RHEL) 8 (64 bit)
Amazon Linux 2

Backend database (DBMS):
Microsoft SQL Server 2014 (with Cluster Support)
Microsoft SQL Server 2016 (with Cluster Support)
Microsoft SQL Server 2017 (with Cluster Support)
Microsoft SQL Server 2019 (with Cluster Support)
Microsoft SQL Server 2022 (with Cluster Support)
PostgreSQL 11 - 15
Apache Derby 10.9 - 10.14
Amazon Aurora PostgreSQL (Compatible with PostgreSQL 11 – 15) 


=============================================================================
New features:
=============================================================================

[UMS common]
- Added: UMS-Console and ICG log security relevant events in a separate log file.
- Changed: Updated spring boot to version 3.1.4 in all services.
- Changed: Updated spring to version 6.0.10
- Updated: Microsoft SQL driver version to 11.2.1 to support MS SQL Server 2022
- Updated: Azul Zulu JRE from version 17.0.7 to 17.0.8
- Updated: Apache Tomcat from version 8.5.89 to 10.1.15

[Console, common]
- Changed: The user name of a UMS administrator is modifiable now.

[Jobs]
- Added: The OS12 Specific Device Commands can also be executed via jobs in the UMS Console. See UMS WebApp [Apps] for more information about Specific Device Commands.

[Permissions]
- Added: New service to unify permission calculation.

[Unified Protocol]
- Added: Management of Device Attributes for OS 12 devices (base_system 12.3.0 or higher needed).
- Added: Support of User Login History for OS12 devices.
- Added: Support of Specific Device Commands for OS12 devices (base_system 12.3.0 or higher needed).

[Installer (windows)]
- Added: Now it is possible to manually edit the maximum memory consumption of the UMS-Console and Tomcat during installation with the installer wizard
- Updated: Apache Tomcat from version 8.5.89 to 10.1.15

[Installer (linux)]
- Updated: Apache Tomcat from version 8.5.89 to 10.1.15

[Custom Device Attributes]
- Added: Device attributes, which are used in a default directory rule and therefore cannot be deleted, are marked with a hook (UMS Administration -> Global Configuration -> Device Attributes).

[Administrator application]
- Added: Option for automatic cipher adjustment on update. (New secure ciphers are activated, weak ciphers are removed) (IGEL UMS Administrator -> Settings -> Cipher (Server-side))

=============================================================================
Resolved issues:
=============================================================================

[UMS common]
- Fixed: Network adapter information of the device was only updated on boot, but not during settings transfer.
- Fixed: Stdout and stderr log files are now cleared upon restart of UMS Server on Linux.
- Fixed: Error log messages were not written to device authentication log in some cases.

[Security]
- Updated: ActiveMQ to version 5.18.3 to fix critical security vulnerability ISN-2023-27.

[Console, administration section]
- Fixed: The edit dialog of an Active Directory Service that is using the LDAPS connection, always showed the default port (UMS Administration -> Active Directory/LDAP).

[Firmwares]
- Fixed: Some firmwares were not deleted when the "Remove unused firmwares" action was performed.

[Unified Protocol]
- Fixed: Errors after OS12 upgrade of an OS11 device which is managed via ICG.
- Fixed: Error log messages were not written to device authentication log in some cases.

[Device Service]
- Fixed: Group permissions for Template Keys were not considered.
- Fixed: Password reset in ConfigDialog for Devices was not possible.

[Device Connector]
- Fixed: The OS12 management connection logged entries with "ICG connected" even if it was not connected.

[IGEL Cloud Gateway (ICG)]
- Fixed: If no public port was configured for an ICG and the internal port was not set to the default (8443) the wrong port was sent to OS12 devices.

[Views]
- Fixed: Result of views with last boot time criterion (absolute and relative) did not contain OS12 devices.

[Console, web start]
- Changed: Removed Java Web Start support.


============================================================================= 
# UMS WebApp # 
============================================================================= 

=============================================================================
Known Issues:
=============================================================================

[Configuration]
Password value of the "custom_partition.source%.password" parameter is stored as plain text in the database and on profile export

=============================================================================
New features: 
============================================================================= 

[Configuration] 
- Added: Files: It is now possible to manage, add and configure files via the WebApp. For images and certificates a preview will be shown. 
    

[Apps] 
- Added: Base Systems (OS12) as well as other apps can now register Specific Device Commands, that this specific app or Base System understands, to the UMS. 
- Added: Profiles from Version Tab. It is now possible to create a profile specifically based on the selected version from the app version tab. 


[Devices] 
- Added: Specific Device Commands. It is now possible to send Specific Device Commands via the WebApp, both for a single Device as well as for all devices within a folder. (OS12 only) 

  
[Network] 
- Added: UMS Features: It is now possible to manage specific "UMS Features" from the WebApp: Priority Profiles and Parametrization (Support for Template Keys) can be activated here. (Network -> Settings -> UMS Features) 


[Search] 
- Added: Device Attributes. It is now possible to search for (user generated) Device Attributes. 
- Added: 30+ Filters, including 'Last logged on user', Devices where (at least) one App reports an error, Devices with App installed, Devices with directly assigned App. 
- Added: 30+ Columns 
- Added: Manual Reindex. It is now possible for the user to start the re-index-process manually. 


[Misc] 
- Added: New lightweight and modern UI design to optimize the usability and user experience of the UMS WebApp.
- Added: Light & Dark Mode: It is now possible to switch between a light and a dark mode. 

[Configuration] 
- Added: Support for Light & Dark Mode in the new unified design. 
- Added: Change Indicator in the navigation tabs and in the navigation tree. 
- Added: The path of the parameter is shown on the Registry page. 
- Added: The activation toggle is implemented for parameters on the Registry page. 
- Added: Switch to show only enabled parameters in Registry for Profile Configuration is implemented. 
- Added: The Template Key functionality is provided for parameters on the Registry page. 
- Added: Registry can now be included in the Search. 
- Added: It is now possible to edit an item with a double click of the table row. 
- Changed: Boolean values are now displayed as read-only checkboxes in tables in Config dialog. 


============================================================================= 
Resolved issues: 
============================================================================= 

[Configuration] 
- Fixed: Priority Profiles now show included Apps. 
- Fixed: AD group members are now able to see their template keys. 


[Apps] 
- Changed: Increased the maximum file size for apps to be prepared for bigger OS 12 Versions 
- Fixed: Error in calculation of usage: The number "how often a base system version is used" was sometimes too low. Devices that had the OS-Version installed but had not fully registered were not considered. 
- Fixed: The version info of some apps showed contradictory information (the list vs. the details section). 


[Devices] 
- Fixed: It was possible to assign multiple values of a (Boolean) Template Key. 


[Search] 
- Changed: Additional WQL autocompletion support: Customers will now get autocompletion support if they edit the middle of a WQL-query string. 
- Changed: Additional WQL autocompletion support: The autocompletion feature for the query language now has a better handling for whitespaces during autocomplete. 
- Changed: Add Renderer: "Runtime since last Boot" & "Total Uptime" - values in column is now human readable.
- Fixed: For embedded Databases numeric-only values were not found using the "any-field".
- Fixed: Last Boot Time was not shown for OS12 Devices.
- Fixed: For embedded Databases pre-registered devices were not searchable. 
- Fixed: Users could be present in the database twice. 
- Fixed: Installations using "SQL Server AD Native" were not able to use the search function in the WebApp. 


[Misc] 
- Fixed: Various typos 

[Configuration] 
- Fixed: Some parameters could not be configured in the dialog. 
- Fixed: The translated values are now shown in tables for range parameters.


=============================================================================
=============================================================================
Including changes from UMS Version 12.02.130
=============================================================================

=============================================================================
IGEL Universal Management Suite
=============================================================================
Version 12.02.130
Release date: 10.11.2023

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
Oracle Linux 7 (64 bit)
Red Hat Enterprise Linux (RHEL) 7 (64 bit)
Red Hat Enterprise Linux (RHEL) 8 (64 bit)
Amazon Linux 2

UMS Client: 
Microsoft Windows 10 (64 bit) 	
Microsoft Windows 11 (64 bit) 			
Microsoft Windows Server 2016 (64 bit) 
Microsoft Windows Server 2019 (64 bit) 
Microsoft Windows Server 2022 (64 bit)
Ubuntu 20.04 (64 bit)
Ubuntu 22.04 (64 bit)
Oracle Linux 7 (64 bit)
Red Hat Enterprise Linux (RHEL) 7 (64 bit)
Red Hat Enterprise Linux (RHEL) 8 (64 bit)
Amazon Linux 2

Backend database (DBMS):
Microsoft SQL Server 2014 (with Cluster Support)
Microsoft SQL Server 2016 (with Cluster Support)
Microsoft SQL Server 2017 (with Cluster Support)
Microsoft SQL Server 2019 (with Cluster Support)
PostgreSQL 11 - 15
Apache Derby 10.9 - 10.14
Amazon Aurora PostgreSQL (Compatible with PostgreSQL 11 – 15) 

=============================================================================
Resolved issues:
=============================================================================
[Security]
- Updated: ActiveMQ to version 5.16.7 to fix critical security vulnerability ISN-2023-27.

[Unified Protocol]
- Fixed: Errors after OS12 upgrade of an OS11 device which is managed via ICG

[UMS common]
- Fixed: Stdout and stderr log files are now cleared upon restart of IGEL UMS Server on Linux.


=============================================================================
=============================================================================
Including changes from UMS Version 12.02.120
=============================================================================

=============================================================================
IGEL Universal Management Suite
=============================================================================
Version 12.02.120
Release date: 19.09.2023

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
Oracle Linux 7 (64 bit)
Red Hat Enterprise Linux (RHEL) 7 (64 bit)
Red Hat Enterprise Linux (RHEL) 8 (64 bit)
Amazon Linux 2

UMS Client: 
Microsoft Windows 10 (64 bit) 	
Microsoft Windows 11 (64 bit) 			
Microsoft Windows Server 2016 (64 bit) 
Microsoft Windows Server 2019 (64 bit) 
Microsoft Windows Server 2022 (64 bit)
Ubuntu 20.04 (64 bit)
Ubuntu 22.04 (64 bit)
Oracle Linux 7 (64 bit)
Red Hat Enterprise Linux (RHEL) 7 (64 bit)
Red Hat Enterprise Linux (RHEL) 8 (64 bit)
Amazon Linux 2

Backend database (DBMS):
Microsoft SQL Server 2014 (with Cluster Support)
Microsoft SQL Server 2016 (with Cluster Support)
Microsoft SQL Server 2017 (with Cluster Support)
Microsoft SQL Server 2019 (with Cluster Support)
PostgreSQL 11 - 15
Apache Derby 10.9 - 10.14
Amazon Aurora PostgreSQL (Compatible with PostgreSQL 11 – 15) 

=============================================================================
Known Issues:
=============================================================================
Errors after OS12 upgrade of an OS11 device which is managed via ICG
 
Environment
•	IGEL UMS 12.02.120
•	IGEL ICG 12.xx
 
Symptom
An OS11 device which is managed via ICG is upgraded to OS12 and the device is not fully manageable after the upgrade. It is not possible to send commands or configurations to the device.
 
Solution
Please open the SQL Console and execute the statement "update THINCLIENT set USG_PROCESS_ID = null where PROTOCOL = 'UNIFIED'" after the upgrade. Afterwards the device will be immediately fully manageable.
 
This issue will be fixed with the next UMS release.


=============================================================================
New features:
=============================================================================

[Unified Protocol]
- Added: OS 11 migration support - Support for the OS11 -> OS12 upgrade process (only for devices with version 11.09.100, triggered via device specific command).

[UMS common]
- Changed: The serial number of a device is now stored on registration (Device with version 11.08.440 / 12.2.0 or higher needed).

[Console, administration section]
- Added: The Device Naming Convention is more flexible now. Also the Unit ID and serial number can be configured as identifier and additionally a suffix can be specified (UMS Administration -> Global Configuration -> Device Network Settings). 

[Automatic License Deployment (ALD)]
- Added: Support for hardware-bundled IGEL license deployment (UMS Administration -> Global Configuration -> Licenses -> Deployment).
- Added: Check, whether UMS ID is registered on IGEL Licensing Portal (ILP) (UMS Administration -> Global Configuration -> Licenses -> Deployment).


=============================================================================
Resolved issues:
=============================================================================

[Unified Protocol]
- Fixed: Network name was not updated if UMS-internal name of a device changed and the corresponding feature is activated in UMS.


=============================================================================
# UMS WebApp #
=============================================================================

=============================================================================
Resolved issues:
=============================================================================

[Main] 
- Fixed: UMS WebApp login didn't work, when password contained non ASCII characters.

[Configuration] 
- Fixed: Sessions (in Profiles) sometimes got broken names.
- Fixed: Opening of configuration tree was slow and consumed a lot of CPU.
- Fixed: Some parameters could not be changed on the Registry Page in the Configuration Dialog.
- Fixed: Settings with special characters were not stored correctly by the WebApp Config Dialog.


=============================================================================
=============================================================================
Including changes from UMS Version 12.02.110
=============================================================================

=============================================================================
IGEL Universal Management Suite
=============================================================================
Version 12.02.110
Release date: 16.08.2023

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
Oracle Linux 7 (64 bit)
Red Hat Enterprise Linux (RHEL) 7 (64 bit)
Red Hat Enterprise Linux (RHEL) 8 (64 bit)
Amazon Linux 2

UMS Client: 
Microsoft Windows 10 (64 bit) 	
Microsoft Windows 11 (64 bit) 			
Microsoft Windows Server 2016 (64 bit) 
Microsoft Windows Server 2019 (64 bit) 
Microsoft Windows Server 2022 (64 bit)
Ubuntu 20.04 (64 bit)
Ubuntu 22.04 (64 bit)
Oracle Linux 7 (64 bit)
Red Hat Enterprise Linux (RHEL) 7 (64 bit)
Red Hat Enterprise Linux (RHEL) 8 (64 bit)
Amazon Linux 2

Backend database (DBMS):
Microsoft SQL Server 2014 (with Cluster Support)
Microsoft SQL Server 2016 (with Cluster Support)
Microsoft SQL Server 2017 (with Cluster Support)
Microsoft SQL Server 2019 (with Cluster Support)
PostgreSQL 11 - 15
Apache Derby 10.9 - 10.14
Amazon Aurora PostgreSQL (Compatible with PostgreSQL 11 – 15) 

=============================================================================
Known Issues:
=============================================================================

[UMS common]
- If an external database (e.g. PostgreSQL) is used, the default value of the max number of connections may not be sufficient and needs to be increased. We do recommend considering this in case you use a HA or Distributed UMS. 

Please see KB for more info (PostgreSQL: https://kb.igel.com/endpointmgmt-12.02/en/postgresql-90236047.html 

Microsoft SQL Server: https://kb.igel.com/endpointmgmt-12.02/en/microsoft-sql-server-90235996.html 

Oracle: https://kb.igel.com/endpointmgmt-12.02/en/oracle-90235994.html)

=============================================================================
New features:
=============================================================================

[UMS common]
- Added: A Standalone UMS can now be upgraded to a Distributed UMS.

=============================================================================
Resolved issues:
=============================================================================

[UMS common]
- Fixed: Update installation to 12.1 of Distributed UMS deleted the Distributed UMS configuration.


[Console, administration section]
- Fixed: The edit dialog of an Active Directory Service that is using the LDAPS connection, always showed the default port (UMS Administration -> Active Directory/LDAP).


[Installer (windows)]
- Fixed: Tomcat startup on Windows after installation could fail due to missing Java options.
- Fixed: Service user for UMS Server was reset to SYSTEM during update installation.


=============================================================================
# UMS WebApp #
=============================================================================

=============================================================================
Resolved issues:
=============================================================================

[Configuration] 
- Fixed: Under certain circumstances profiles showed malformed labels in German. (Affected Apps need to be re-imported to be fixed.) 


[Search] 
- Fixed: Duplicate MAC-Address entries no longer break the search functionality. (The problem could arise when for example, UD Pockets were used.) 
- Fixed: Some typos in the search section ("MAC Address" & "Onboarded by"). 
- Changed: The filter-fields "Department" and "Site" were accidentally set as input-fields instead of "select".


=============================================================================