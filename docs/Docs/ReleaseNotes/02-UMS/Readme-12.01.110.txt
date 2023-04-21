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
=============================================================================
Including changes from UMS Version 12.01.100
=============================================================================


=============================================================================
IGEL Universal Management Suite
=============================================================================
Version 12.01.100
Release date: 01.03.2023

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

[UMS common]
- Added: By default, OS11 profiles are not regarded for OS12 devices and vice versa.
- Added: UMS cluster public address for load distribution of specific device calls.
- Changed: The logging file names now follow a common schema. See README.md in the logs folder of the UMS Server.
- Updated: Azul Zulu JRE from version 8u345 to 8u352.
- Updated: Apache Tomcat from version 8.5.82 to 8.5.84.
- Changed: Updated Spring Framework library to the latest LTS version.

[High Availability Feature]
- Added: A message dialog is shown if an HA installation is recognized during an upgrade installation.

[Profiles]
- Changed: Renamed Master Profiles to Priority Profiles.
- Added: Profiles based on the OS12 firmware can only be created and changed in the UMS Web App. The assignment is still possible in the UMS console.

[Automatic License Deployment (ALD)]
- Added: Pack comments created on the IGEL License Portal are shown at the registered packs overview and the details of a pack (UMS Administration -> Global Configuration -> Licenses -> Deployment).
- Changed: Hardware removal actions are now also logged and are shown in the 'Executed actions' area like license deployment actions. (UMS Administration -> Global Configuration -> Licenses -> Deployment)
- Changed: Automatic License Deployment can now deploy evaluation licenses to OS11 and OS12 devices.

[Configuration Dialog]
- Removed: Obsolete Log4j version 1.2.17 from TCSetup.

[Console, common]
- Added: New installer page informing the user about the removal of the MDM feature during an update installation if devices are managed via MDM.
- Added: Installed app information section in device detail information area.
- Removed: IGEL Mobile Device Management Essentials.

[Server, common]
- Added: Propagate change of UMS server port on next server start.

[Console, administration section]
- Changed: Renamed UMS Licensing ID to UMS ID and the node was moved to beneath 'Global Configuration' (UMS Administration -> Global Configuration -> UMS ID)
- Changed: Item 'Cloud Gateway Options' in the administration tree was renamed to 'First-authentication keys' and received a new icon (UMS Administration -> Global Configuration -> 'First-authentication keys')

[Console, web start]
- Added: Warnings about Webstart no longer being supported are displayed when starting UMS Console via Java Webstart and on the start_rm.html page.

[Unified Protocol]
- Introduced new scalable, stateless, websocket-based communication protocol for OS12 devices
 * Works with any enterprise loadbalancers (SSL passthrough and websocket support required)
 * Secured by client certificates
 * Communication over UMS Web-Port
- Added: Devices are now informed about new root certificates to support the exchange of the web certificate chain.
- Added: Payload compression to reduce bandwidth in customer environment. 
- Added: New logfile to log communication of device and UMS. Can be activated in logback.xml.
- Added: UMS Firmware Customizations can now also be deployed to OS12 devices.
- Added: Support for unified protocol via IGEL Cloud Gateway (ICG 12.01.100 or higher needed).

[IGEL Cloud Gateway (ICG)]
- Added: ICG Support for Debian 11 environment.

[Administrator application]
- Added: Warning message is shown when OS12 devices would no longer be manageable after change of web server port.
- Added: New subcommand "umsadmin-cli db show" to show all details of a data source.
- Added: Admin CLI prints more details upon unexpected errors.

[Devices]
- Added: Two options for the device settings export, to either include all passwords or replace them with a placeholder.

[Views]
- Added: New view criteria for installed apps.

[AD / LDAP integration]
- Added: It is not possible to display the settings of OS12 devices for Shared Workplace Users.

[Installer (windows)]
- Added: New precondition check during update installation will identify running UMS servers in a distributed environment and warn about the possibility for data loss.
- Updated: Updated text of End User License Agreement (EULA).

[Installer (linux)]
- Added: New precondition check during update installation will identify running UMS servers in a distributed environment and warn about the possibility for data loss.
- Updated: Updated text of End User License Agreement (EULA).
- Added: New configuration dialog for entering or confirming UMS server IP address in Linux installer.


=============================================================================
Resolved issues:
=============================================================================

[UMS common]
- Changed: Updated driver for MS SQL Server datasources.
- Fixed: Failed device requests were not always counted in the request statistics of the process.
- Fixed: The automatic registration of devices was not working.
- Changed: Fallback for HTTPS requests to the UMS Server is now the last known IP. Formerly it was the host.
- Fixed: 'On-the-fly' changes of logging during runtime works for all UMS components.
- Fixed: Last boot-time in GUI now shows the last boot-time stored in the database table of the device.
- Fixed: Last boot-time in the database table of device now contains correct boot-time.
- Fixed: Server performance dropped if scanning for devices ran into an error.
- Fixed: Device import from CSV file via command line didn't work anymore.

[Console, common]
- Fixed: Save icon was not enabled for devices if the user has the access right to 'Edit System Information'
- Fixed: The number of deployed licenses was not shown correctly when devices were licensed manually.
- Fixed: 'Save support information..' (Help -> Save support information...) failed if ICG certificates in the used certificate chain have the same display name.
- Fixed: When the shift key was held while clicking 'Delete' in a devices context menu, the device was not deleted directly but moved in the bin.
- Fixed: Collection of the console log files via 'Save Support Information..' did not take the selected 'days back' into account (Help -> Save Support Information...).

[Console, administration section]
- Changed: UMS Licensing ID certificate files are now exported with the ".crt" extension.
- Changed: It is no longer possible to create more than one first authentication key with the same password (UMS Administration -> Global Configuration -> 'First-authentication keys').

[IGEL Cloud Gateway (ICG)]
- Fixed: Primary key violation occurred while processing connection status information of ICG managed devices.
- Fixed: ICG Gateways are not removed from UMS when installed on the same host with different ports

[Server, common]
- Fixed: A device which is connected via ICG to the UMS no longer receives settings and other messages once the TC Key has changed or is lost.
- Fixed: Secure Terminal/Secure shadowing failed for devices connected over ICG when the devices were configured to send periodic heartbeat signal.

[Devices]
- Fixed: Under certain circumstances the result dialog was not shown when a device was removed offline.

[Profiles]
- Fixed: The profile setting 'OpenVPN - Set Auto' did not persist after copying or importing a profile, where the setting was enabled

[Device Service]
- Fixed: Configuration dialog of WebApp for profiles showed predefined firmware settings for OS11 devices in some cases.

[Views]
- Fixed: It was not possible to go back to the panel of the 'Installed Apps' criterion after it was combined with another criterion in the view creation dialog
- Fixed: The auto-completion popup was not displayed when 'in' was typed as the beginning of a criterion.
- Fixed: Criteria in views are not always properly converted from Text Mode to Graphical Mode
- Fixed: Syntax error visualization (red squiggly underline) in View Queries were always displayed at unrelated text in the first line when entering multi-line queries.
- Fixed: Error occurred for views consisting of several device license criteria combined with AND and OR.

[Installer (windows)]
- Fixed: UMS-Server now starts only, if DB exists.
- Fixed: A high-availability token file was not created on a first HA installation when a path was provided for this file but did not exist.
- Fixed: The version number in the Windows start menu program group is never updated on update installations and has been stripped to conform to Windows guidelines.

[Installer (linux)]
- Fixed: UMS Console and Administrator applications did not show proper application name in Gnome Shell taskbar
- Fixed: UMS-Server now starts only, if DB exists.

[Administrator application]
- Fixed: Enabling and disabling SSL-only connections via 'umsadmin-cli' showed '-1' for the Java Webstart port when ports are listed afterwards.
- Fixed: Copying an embedded database to any external type (e.g. SQL, Postgre) via Administrator CLI was broken.


=============================================================================
# UMS WebApp #
=============================================================================

=============================================================================
New features:
=============================================================================
[Configuration]
- Added: Profiles (and Priority Profiles) can now be opened and edited in the WebApp via the new Config-Dialog.
- Added: Profiles (and Priority Profiles) can now be created within the WebApp.
- Added: OS12 Support: Profiles (and Priority Profiles) based on OS12 are now fully supported within the WebApp.
- Added: It is now possible to change the "scope of a OS12 profile" (or Priority Profiles) after its creation. (Apps can be added or removed).
	   
[Apps]
- Added: Global Permission "App Management" (System -> Administrator accounts -> (select Administrator) -> Edit -> General - WebApp).  Without this permission an admin can not import new apps, new versions of an app or configure the update-stream.
- Added: App-Section: New section to import and manage apps, based on the needs of the customer.
- Added: Default Version for Apps: It is now possible to set a certain version of an app as "Default Version", to mark it as production-ready.
- Added: Automatic Update Stream: It is now possible to mark an app in a way that all upcoming versions are automatically imported into the WebApp.
- Added: Automatic Update Stream: It is now possible to mark an app in a way that all upcoming versions are automatically used as "Default Version".
- Added: It is now possible to create a profile based on the "Default Version" of an app. The profile will automatically follow the "Default Version", if updated.
- Added: It is now possible to import apps, or new versions of an app via cross-tab-communication with the App-Portal.
- Added: The EULA of an app can now be accepted via the Web App.
- Added: UMS as an Update Proxy: It is now possible to configure your UMS-Network as a download source, where your devices can download apps, including the new OS base system. (Defined as default)
- Added: UMS as an Update Proxy: It is now possible to upload "private" apps into your UMS-System for distribution. This is currently meant for private builds or use cases where the UMS has no internet connection but will be expanded to company-specific apps.
- Added: Apps. It is now possible to configure the capabilities of a device separately from the Base System (firmware).

[Devices]
- Added: The device configuration can now be opened and edited in the WebApp via the Config-Dialog.
- Added: Apps can now be assigned to a folder or a device directly. This is possible as "Default Version" or as a specific version of an app.
- Added: If a profile is assigned to a device (or a device folder) that contains an app, the app will also be implicitly assigned to the device/folder. This can be overwritten by an explicit assignment.
- Added: It is now possible to send simple messages (plain text) to OS12 devices.
- Added: Demo state of an license is shown in the license information.

[Network]
- Added: You can add an "Alias" (or nickname) to your installation. This will be shown in the header and in the browser tab. - The permission for "Server Network Settings" is needed to change the value.

[Settings]
- Added: A new overlay for NETWORK and APPS where settings, specific for each section, can be retrieved and edited. This is planned for all sections. 
- Added: Settings: Apps: UMS as an Update Proxy (see above) - The permission for "UMS Features" is needed.
- Added: Settings: Apps: App Portal - It is now possible to specify the URL of the AppPortal. - The permission for "Server Network Settings" is needed.
- Added: Settings: Apps: Automatic Updates - It is now possible to tell the UMS-network when to check for new updates of apps/base-systems.  - The permission for "Server Network Settings" is needed.
- Added: Settings: Network: Automatic Onboarding Information - Routing information (calculated - read only)
- Added: Settings: Network: Automatic Onboarding Information - Download Certificate-Chain of selected server as *.crt-file. (PEM-format)

[Misc]
- Added: Icons got an overhaul to be able to improve the separation for "colors with meaning" (e.g. "Warning", "Error", "Offline", etc.) from "design".
- Added: First improvements for visually impaired users.
- Added: Support for the IGEL Insight central service.


=============================================================================
Resolved issues:
=============================================================================

[Configuration]
- Fixed: A bug was present that showed values in profiles, which consist of an URL, incorrectly.

[Network]
- Fixed: The fingerprint of the certificate of a server will now be shown correctly.
- Added: The fingerprint of the root certificate of a server will also be shown, if known to the system.

[Devices]
- Changed: Area for Command-Buttons is now better used.
- Fixed: Public address (if defined) will now be used for shadowing via unified protocol. 
- Fixed: The tooltip for the disabled edit button for Custom Properties was not shown.
- Fixed: If the certificate is missing for a shadow session, the UMS WebApp will now be able to retrieve it automatically.

[Logging]
- Fixed: Commands "Reboot", "Shutdown" and "Suspend" resulted in missleading log-messages.

[Misc]
- Fixed: Certain Errors resulted in Stacktrace being shown to the end user.
- Fixed: Name of devices/profiles/folders was not fully visible in the header even if there was enough space.
- Changed: A filter term with space in the beginning or end produces the same result as without spaces.
- Changed: To give cleaner optics the splitter is no longer visible, but will keep its function.
- Changed: The design of dialogs was improved.
- Changed: Some dialogs can now be closed with the "X" icon and by hitting "Esc".

=============================================================================
