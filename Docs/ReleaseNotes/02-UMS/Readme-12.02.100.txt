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

=============================================================================
=============================================================================
Including changes from UMS Version 12.01.110
=============================================================================


=============================================================================
IGEL Universal Management Suite
=============================================================================
Version 12.01.110
Release date: 18.04.2023

HTML version of this Readme is available at:  https://kb.igel.com/ums/releasenotes


=============================================================================
Supported environment:
=============================================================================
UMS Server:
Microsoft Windows Server 2012 (64 bit) 
Microsoft Windows Server 2012 R2 (64 bit and with Update 2919355)
Microsoft Windows Server 2016 (64 bit) 
Microsoft Windows Server 2019 (64 bit) 
Microsoft Windows Server 2022 (64 bit)
Ubuntu 16.04 (64 bit)
Ubuntu 18.04 (64 bit)
Ubuntu 20.04 (64 bit)
Ubuntu 22.04 (64 bit)
Oracle Linux 7 (64 bit)
Red Hat Enterprise Linux (RHEL) 7 (64 bit)
Red Hat Enterprise Linux (RHEL) 8 (64 bit)
Amazon Linux 2

UMS Client: 
Microsoft Windows 8.1 (64 bit and with Update 2919355) 
Microsoft Windows 10 (64 bit) 	
Microsoft Windows 11 (64 bit) 			
Microsoft Windows Server 2012 (64 bit) 
Microsoft Windows Server 2012 R2 (64 bit and with Update 2919355)
Microsoft Windows Server 2016 (64 bit) 
Microsoft Windows Server 2019 (64 bit) 
Microsoft Windows Server 2022 (64 bit)
Ubuntu 16.04 (64 bit)
Ubuntu 18.04 (64 bit)
Ubuntu 20.04 (64 bit)
Ubuntu 22.04 (64 bit)
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
Amazon Aurora PostgreSQL (Compatible with PostreSQL 10 – 13)   


=============================================================================
New features:
=============================================================================
 
[Unified Protocol]  
- Added: Additional field in Advanced System Information showing for OS 12 devices to which device connector it is connected to.
- Added: OS 12 devices are now listed in the ICG connected devices list.

[Installer (windows)]  
- Added: In HA server installations UMS Console installation is optional.
- Updated: Text of End User License Agreement (EULA)

[Installer (linux)]
- Updated: Text of End User License Agreement (EULA)


=============================================================================
Resolved issues:
=============================================================================

[Devices]  
- Fixed: Improved performance of Advanced Health Status update.  

[Universal Firmware Update]  
- Fixed: DB error importing Honeywell OS Firmware Update zip file in the UMS. 

[Console, common]
- Changed: The behavior to display a service license name from always updating the name whenever a new device is registered to only updating the name when a device with a newer firmware is registered.

[Views]
- Fixed: In the creation dialog of a view with criterion 'Installed Apps' not all available app states were shown. 

[Default Directory Rules]
- Fixed: In the creation dialog of a Default Directory Rule with criterion 'Installed Apps' not all available app states were shown.

[Unified Protocol]  
- Fixed: Pre-Imported devices can now also be registered. 
- Changed: Communication within the UMS server will now always use 'localhost' instead of the configured UMS address. 


============================================================================= 
# UMS WebApp #
=============================================================================

=============================================================================
New features:
=============================================================================

[Configuration] 
- Added: Apps from external developers can now be added to profiles and will be shown as implicit assignments.
- Changed: Profiles for OS11 and OS12 will now be better distinguishable from each other using different icons.
- Changed: Priority Profiles for OS11 and OS12 will now be better distinguishable from each other using different icons.   

[Devices] 
- Added: For OS12-devices a new property called "Connected to" was added, where the user now can see by which device-connector the device reaches the UMS.  

[Misc] 
- Added: It is now possible to generate a configuration for PXE-Boot via the UMS WebApp. 


============================================================================= 
Resolved issues: 
=============================================================================   

[Configuration] 
- Fixed: Deleting of a selected Profile could lead to an endless spinner. 	    

[Apps] 
- Fixed: Apps that do not have an EULA will no longer show the "warning icon" for an unaccepted EULA. 
- Fixed: Versions of apps will now always correctly be compared (from oldest to newest). 
- Changed: The App Portal will be notified about all imported versions - not only the ones with an accepted EULA. 
- Changed: Apps with malformed icons will no longer lead to broken user-interfaces.  

[Devices] 
- Fixed: Different Custom Properties with the same value will now be displayed correctly and are editable again. 
- Fixed: Commands sent to an OS12 endpoint will now be logged via unified logging. 
- Fixed: If Elastic Search was temporarily unavailable the list of devices could not be loaded. 
- Fixed: If Elastic Search was temporarily unavailable the list of assigned objects could not be loaded. 

[Network] 
- Fixed: The sum of all connected devices of an Igel Cloud Gateway will now correctly include OS12 devices. 

[Misc] 
- Changed: The page default (how many objects are loaded) was changed to "100". 

=============================================================================
