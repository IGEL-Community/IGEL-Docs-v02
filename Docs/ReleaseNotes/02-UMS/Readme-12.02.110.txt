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
=============================================================================
Including changes from UMS Version 12.02.100
=============================================================================


=============================================================================
IGEL Universal Management Suite
=============================================================================
Version 12.02.100
Release date: 31.07.2023

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
Removed Support:
=============================================================================
UMS Server:
Microsoft Windows Server 2012 (64 bit) 
Microsoft Windows Server 2012 R2 (64 bit and with Update 2919355)
Ubuntu 16.04 (64 bit)
Ubuntu 18.04 (64 bit)

UMS Client:
Microsoft Windows Server 2012 (64 bit) 
Microsoft Windows Server 2012 R2 (64 bit and with Update 2919355)
Microsoft Windows 8.1 (64 bit and with Update 2919355)
Ubuntu 16.04 (64 bit)
Ubuntu 18.04 (64 bit)

Backend database (DBMS): 
PostgreSQL 9.6, 10.12
Oracle 12c 

=============================================================================
Added Support:
=============================================================================
Backend database (DBMS): 
PostgreSQL 14, 15
Amazon Aurora PostgreSQL (Compatible with PostgreSQL 14, 15)


=============================================================================
Known Issues:
=============================================================================

[Unified Protocol]
- If the command logging for OS12 devices is activated the UMS Webapp needs to be installed on each UMS server.
- In an HA environment with installed UMS Load Balancer the scan and register command for OS 12 Thin Clients might not be successful. This problem occurs with OS 12 versions previous to 12.2.100.

=============================================================================
New features:
=============================================================================

[UMS common]
- Added: Direct assignment of OS12 profiles to OS11 devices is not allowed (and vice versa).
- Changed: The proxy server usage for "Deployment (ALD)" has been renamed to "IGEL Cloud Services (ICS)". A proxy set under Global Configuration -> Licenses -> Deployment -> Edit Proxy Configuration is now used for all IGEL Cloud Services.
- Added: MS SQL Server option 'trustServerCertificate' (default is false, on upgrade set to true).
- Changed: 'Allow SSL connection only' setting (IGEL UMS Administrator -> Settings) is now checked by default.
- Updated: Azul Zulu JRE from version 8u352 to 17.0.7.
- Updated: Apache Tomcat from version 8.5.84 to 8.5.89.

[Console, administration section]
- Removed: UDC2 Deployment. (UMS Administration -> Global Configuration -> Licenses -> UDC2 Deployment).

[Admin tasks]
- Added: Administrative task for detaching objects from view results.

[Unified Protocol]
- Added: Log messages for commands sent by a device are now displayed in the UMS Web App logging section.
- Added: Proxies for management of OS 12 devices via ICG are now supported.

[Server, common]
- Changed: For each service only the registered license with the latest expiration date is transferred to a device.

[Administrator application]
- Added: Admin CLI commands to show, set and delete UMS cluster FQDN.

[Universal Customization Builder (UCB)]
- Removed: "Universal Customization Builder" feature from UMS.

[Installer (windows)]
- Added: During the installation process, the user can now create a desktop icon for the UMS administrator.
- Changed: Now it is possible to upgrade from an "UMS Standardserver (stand-alone)" installation to a "Distributed UMS".

[Installer (linux)]
- Updated: Added Distributed UMS as additional install option into Linux Installer.

[Device Service]
- Added: Export and import of OS12 profiles.
- Added: Export and import of OS12 app metadata.

[Device Connector]
- Added: Support for SSL offloading on reverse proxy with optional mTLS.

=============================================================================
Resolved issues:
=============================================================================

[Console, common]
- Changed: The following characters are no longer allowed, when a new administrator account is created: "/ \ [ ] : ; | = , + * ? < >

[Views]
- Fixed: In the csv export of 'Send view result as mail...' (View context menu -> Send view result as mail...) entries with special characters were not correctly formatted.
- Fixed: View export via mail (view context menu -> Send view result as mail...) was missing all monitor information.
- Removed: View criterion 'Has Web certificate with SHA256 fingerprint' from list of selectable view criteria.
- Removed: View criterion 'Unified Protocol Device' from list of selectable view criteria.

[Admin tasks]
- Changed: Improvements in Administrative Tasks wizard dialogs.

[AD / LDAP integration]
- Fixed: Shared Workplace via ICG change Password problem.

[Firmwares]
- Fixed: It was not possible to assign IGEL OS Honeywell's firmware updates.

[Unified Protocol]
- Fixed: Rolling of unified protocol logs (OS12)
	Details can be found in <installation directory>/rmguiserver/logs/README.md.
- Fixed: Proxy support for validation of Onboarding Service token.
- Fixed: In case an ECS certificate was used as UMS Web or ICG certificate OS 12 devices can't be registered.

[High Availability Feature]
- Updated: HA Health check handles Distributed UMS correctly.

[Device Service]
- Fixed: Session order in the device configuration dialog was different in UMS Web App and Device.

[Installer (linux)]
- Fixed: For a 'client only' installation on Linux, the shortcut icons are now placed in the correct folder so that they can be displayed correctly.


=============================================================================
# UMS WebApp #
=============================================================================

=============================================================================
Known Issues:
=============================================================================

- The Search in the UMS WebApp will not work if UD Pockets are used in the UMS. 
	Customers who use UD Pockets need to either use Views/Searches in the UMS Console or should not update before the issue has been fixed.

=============================================================================
New features:
=============================================================================
	   
[Apps]
- Added: Export of all/some/one version of an app (Metadata): App versions can be exported as '*.iam'. 
         This file contains all necessary data to be imported into another UMS. 
		 The artefacts needed for the device are not included and need to be retrieved by the device via the App Portal.
		 (The UMS does not handle these artifacts unless the 'use UMS as Update Proxy'-mode is activated.
		 If this update-proxy-mode is enabled please use the *.ipkg-data and workflow instead.)
- Added: Import of Apps (Metadata) via '*.iam'-packages as well as via *.ipkg-packages.

[Configuration]
- Added: Export of OS12 Profile: It is now possible to export an OS12 profile as well as priority profiles (*.ipm). 
         All apps (-versions) configured in this profile are automatically included.
- Added: Export of OS12 Profiles: It is now possible to export all/some OS12 profiles (or priority profiles) within a folder (including all subfolders). (*.ipm)
- Added: Import of OS12 Profiles: It is now possible to import OS12 profiles as '*.ipm'-packages. 
         The user can decide to import the profile in the selected folder or recreate the original folder structure.
		 Profiles can be imported as priority profiles and vice versa. If the folder structure needs to be recreated the path will begin with the new selected object root. (profile/priority profile)
- Added: Added a new tab to the profiles where the user can see which apps are configured within a profile (including the version of the used app).
- Added: Added functionality to open the configuration dialog by double-clicking on a profile (or priority profile).
- Added: Template Key functionality is now provided for Profile Configuration.

[Devices]
- Added: Scan & Register: It is now possible to scan for devices within the network (or certain IP-ranges) and register selected devices.
- Added: Additional information to Installed Apps Tab: It is now possible to see the state of all registered/downloaded/activated apps as reported by the device. (State and message)
- Added: Export OS12 device settings as profile. It is now possible to export an OS12 device "as a Profile". All activated settings will be saved as a Profile. (*.ipm)
- Added: Added functionality to open the device-settings by double-clicking on the device.

[Search]
- Added: A completely new search functionality was added:
         Searches can be saved, edited, and reused.
         Complex searches can be used utilizing a SQL-like query language. (Activatable under "Advanced search")
         Simple searches will be translated into the query language to give the user insight into the structure. (If Advanced search is activated)
		 Please note: Time-based searches are currently not available on installation using a Derby-database. 
- Added: First implementation of autocompletion for the query language.

[Settings]
- Added: Logging settings to the Logging section: It is now possible to activate/deactivate the logging from within the UMS Web App.
         This includes the option to activate the logging via the unified protocol.

[Misc.]
- Added: Context menu for Devices.
- Added: User can now see how many objects (devices, profiles, ...) are inside a folder, and combined with its sub-folders separately (x from y).

=============================================================================
Resolved issues:
=============================================================================

[COMMON]
- Fixed: Removed unnecessary certificate-check for the subject alternative name on "localhost" for inter-service communication.
- Fixed: UMS-WebApp login fails when password contains paragraph character.
- Changed: Upgraded Node to version 18 and Angular to version 15.
- Changed: Closed an endpoint for unauthenticated users exposing the UMS WebApp version.
	
[Apps]
- Fixed: For communication with the App Portal (e.g., downloading Apps) the Proxy configuration is now taken into account.
- Fixed: Changing the Default Version of Apps will now trigger the update on the device.
- Fixed: A bug was present that caused database issues if the categories delivered by the app portal only differed in terms of case-sensitivity. 
- Fixed: Apps will now use the image from the latest version in database.
- Fixed: The automatic update of the standard version was not done after the automatic app import (if configured).
- Fixed: App version usages are now calculated correctly. 
- Fixed: Available versions showed wrong information if the version is not standard conform.
- Changed: The Installed Apps will now show the display version instead of the technical version.

[Configuration]
- Fixed: Not all base system versions were shown in the Assign Object dialog.

[Devices]
- Fixed: Devices with non-transferred changes will now be marked with an exclamation mark again.
- Fixed: Last Boot Time was not shown for OS12 Devices.

[Misc.]
- Changed: the root directory is now expanded by default.
- Added: More tooltips.
- Changed: Various translations and labels for better understanding.
