=============================================================================
IGEL Universal Management Suite
=============================================================================
Version 6.06.100
Release date: 16.11.2020

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
Oracle 11g R2 
Oracle 12c
PostgreSQL 9.5 - 9.6 and 10.1
Apache Derby 10.9 - 10.14  

=============================================================================
Known Issues:
=============================================================================

[UMS Web App]
- UMS Superuser does not have the permission to access the Logging application

=============================================================================
New features:
=============================================================================

[UMS common]
- Added: Management for the Web Certificate. This Certificate is used for transferring files to the devices, all WebDav-actions, inter-server communication, 
	 the IMI and the UMS WebApplication. Own certificates can be created and managed, as well as third-party certificates, including those from public CAs 
	 (See : https://kb.igel.com for more Details)
- Added: Ability to exchange the IGEL Cloud Gateway root certificate (IGEL Cloud Gateway version 2.02.100 or later) via the 'Update Keystore' dialog  (UMS Administration -> UMS Network -> IGEL Cloud Gateway). 
  The dialog now contains an extra page to give the possibility to create and automatically navigate to views showing the affected devices. 
  WARNING: For all UMS installations with a legacy ICG Certificate: After updating devices to OS 11.04.100 and higher, the devices will no longer be manageable because the new firmware’s do not accept the legacy ICG certificate anymore! (See https://kb.igel.com/igelos-11.04/en/device-does-not-connect-to-icg-after-update-to-igel-os-11-04-or-higher-37279482.html)
- Added: New device commands were added to define the device ICG configuration remotely from the UMS (Device version OS 11.04.240 and OS 11.05.100 or later) (See : https://kb.igel.com/igelicg-2.02/en/moving-an-endpoint-device-to-an-icg-37285231.html for more Details) 
- Added: New column "Send-by" in events view with filter option(UMS console -> UMS Administration -> UMS Network -> Events -> e.g. Today)
- Added: The permission to use the UMS HA Health Check feature can be set  under System > Administrator accounts
- Updated: Apache Tomcat from version 8.5.56 to 8.5.58
- Updated: Bundled Zulu JRE from version 8u252 to 8u265


[UMS Web App]
- Changed: UMS Web App login is filled with the current UMS console user, when opening it via the toolbar link
- Added: Support for several new commands (Send settings to device, Receive settings from device, Reset to factory defaults, Update, Update on shutdown, Refresh system information, 
	 Refresh license information)
- Added: Device commands can be executed on directory level
- Added: Support of custom device attributes
- Added: Presentation of all assigned objects (Profiles, Master Profiles, Files, Firmware Customizations, Template Keys, Value Groups and Universal Firmware Updates) 
	 of a device or a device directory
- Added: Possibility to assign or detach objects to or from a device or a device directory
- Added: Responsive design (Minimum supported width: 768px)


[Unified Logging]
- Added: New application to log all user events in the UMS Webapp (only if feature is activated in UMS Console -> UMS Administration -> Global Configuration -> Logging)
- Added: New page in UMS Webapp to search and filter all log events


[Template keys and groups]
- Added: Template key option for Citrix StoreFront setup parameter: server location settings, application autostart, quick start and display filter settings


[Views]
- Added: New operators "not beneath" and "not in" for the directory criterion
- Added: New criterion 'Indirect Profile Assignment' and renamed existing 'Profile Assignment' criterion to 'Direct Profile Assignment'
- Added: New criterion 'Feature'
- Added: New criterion 'Has ICG Certificate with SHA1 fingerprint'


[Universal Firmware Update]
- Added: Option to synchronize downloaded Universal Firmware Updates in all UMS WebDAV directories in HA networks
	 (UMS Administration -> Global Configuration -> Universal Firmware Update) 


[Asset Inventory Tracker (AIT)]
- Added: Devices with a 'Starter License' are licensed for the Asset Inventory Tracker feature in the UMS


[Installer (windows)]
- Added: Firewall Ports preselection depending on installation type


[Default Directory Rules]
- Added: New operators "not beneath" and "not in" for the directory criterion
- Added: New criterion 'Indirect Profile Assignment' and renamed existing 'Profile Assignment' criterion to 'Direct Profile Assignment'
- Added: New criterion 'Feature'


=============================================================================
Resolved issues:
=============================================================================

[UMS common]
- Changed: Improved third party license information dialog (UMS Console -> Help -> Third party licenses)
- Changed: Improved device communication check for manipulated commands
- Fixed: Config change flag was not set for file and firmware update assignments
- Fixed: Config change flag was often not set on object in the device's assigned/indirect assigned objects table
- Fixed: Sometimes template values were missing in template groups if both were restored from the recycle bin at the same time
- Fixed: In rare cases it could happen, that some administrator accounts, except the UMS Superuser, were not editable


[UMS Web App]
- Fixed: Devices were not displayed on a screen with 1200px resolution
- Fixed: 'Runtime since last Boot' and 'Total Operating Time' are presented in a human readable format (Device -> System information)
- Fixed: The Elastic Search Service stopped due to an error on certain machines


[Console, common]
- Fixed: "Check template definition" can flood the server if activated in parallel
- Changed: SQL-Console output as HTML-file now always with white background and black text color
- Fixed: Issues with the filename extension of the saved result files from SQL Console (UMS Console -> Misc -> SQL Console -> Save Result)


[Template keys and groups]
- Fixed: Template Keys and Groups could not be changed under certain conditions (Oracle-Database only)


[Universal Firmware Update]
- Fixed: In rare instances the Firmware-Update-Server was overwritten by old settings


[Configuration Dialog]
- Fixed: After editing the page permission pages in a configuration dialog/profile, all other profiles/TC configurations showed not their own but the previous configuration
- Fixed: Sometimes it was not possible to remove all page permissions in a configuration dialog or profile


[Console, administration section]
- Changed: Events views are now refreshed automatically (UMS Administration -> UMS Network -> Events)
- Fixed: The 'Generate a new key pair' dialog inside the Device Communication section could only successfully be finished by the UMS Superuser 
	 (UMS Administration -> Global Configuration -> Certificate Management -> Device Communication)
- Fixed: Added missing ICG Certificate permission check for Remote ICG install and ICG Update Keystore dialog (UMS Administration -> UMS Network -> IGEL Cloud Gateway)


[Admin tasks]
- Fixed: Renamed views were shown with old name in admin task configuration (delete devices)
- Fixed: Deleted views/views moved to bin are no longer present in admin task configuration (delete devices)


[AD / LDAP integration]
- Fixed: In HA environments and for multiple Domains, AD certificates were sometimes not loaded


[Firmware]
- Changed: Improved the GUI workflow of Firmware import / registration (UMS Console -> System -> Import -> Import Firmwares)


[WebDAV]
- Removed: Tomcat version in directory listing
- Changed: Improved security for WebDav communication between UMS components


[SSH]
- Fixed: Reconnecting a failed Secure Terminal session over ICG failed


[High Availability Feature]
- Fixed: Upgraded HA messaging to newest version of ActiveMQ to resolve security issues


[Installer (windows)]
- Fixed: "install.log" file was not created, if only UMS Console was installed
- Fixed: Silent installation with Console-only selection always installed the UMS Web App
- Fixed: Installer offered automatic Embedded Database backup after previous uninstallation
- Fixed: Deselecting UMS Web App in the Windows installer also deselected UMS Standard Server, including subcomponents
- Fixed: UMS Web App will no longer be pre-selected on Console-only update installation (Windows installer)
- Fixed: Previous selection of UMS Web App was not taken into account during update installation
- Fixed: UMS Web App was re-selected upon selection of standard or HA server component


[Installer (linux)]
- Fixed: "install.log" file was not created, if only UMS Console was installed
- Changed: Replaced SysVinit scripts with systemd unit files for UMS Server, Load Balancer and Watchdog during Update to 6.06.100 (Linux only)
- Fixed: Database passwords with special characters were misformatted during database setup, leading to password mismatch when used in UMS Console login (Linux only)
- Changed: Improved support for special characters (e.g. umlauts) in all input dialogs in Linux installer
- Fixed: UMS Web App did not start on Ubuntu 20.04 due to missing library in Tomcat configuration


[Notifications]
- Fixed: When all licenses of a pack are used up a warning notification is shown not an error notification
- Changed: Notification classification and management was improved
- Changed: Improved notification messages for expiring licenses, packs and certificates


[UI / Look&Feel]
- Changed: Button order for Access Control dialog is now: Apply, OK, Cancel


[Default Directory Rules]
- Fixed: Rules with a Device License criterion did not generate the correct results


=============================================================================
=============================================================================
Including changes from private builds of Version 6.05.100
=============================================================================

=============================================================================
IGEL Universal Management Suite
=============================================================================
Version 6.05.110
Release date: 07.10.2020

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

