=============================================================================
IGEL Universal Management Suite
=============================================================================
Version 6.03.110
Release date: 2019-10-30

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
Oracle Linux  7 (64 bit)
Red Hat Enterprise Linux (RHEL) 7 (64 bit)
Red Hat Enterprise Linux (RHEL) 8 (64 bit)

UMS Client: 
Microsoft Windows 7  (64 bit and with SP1 )
Microsoft Windows 8.1  (64 bit and with Update 2919355) 
Microsoft Windows 10 (64 bit) 				
Microsoft Windows Server 2008 (64 bit and with SP2)
Microsoft Windows Server 2008 R2 (64 bit and with SP1)
Microsoft Windows Server 2012 (64 bit) 
Microsoft Windows Server 2012 R2 (64 bit and with Update 2919355)
Microsoft Windows Server 2016 (64 bit) 
Microsoft Windows Server 2019 (64 bit) 
Ubuntu 16.04 (64 bit)
Ubuntu 18.04 (64 bit)
Oracle Linux  7 (64 bit)
Red Hat Enterprise Linux (RHEL) 7 (64 bit)
Red Hat Enterprise Linux (RHEL) 8 (64 bit)

Backend database (DBMS):
Microsoft SQL Server 2012
Microsoft SQL Server 2014 (with Cluster Support)
Microsoft SQL Server 2016 (with Cluster Support)
Microsoft SQL Server 2017 (with Cluster Support)
Oracle 11g R2 
Oracle 12c
PostgreSQL 9.4 - 9.6 and 10.1
Apache Derby 10.9 - 10.14 


=============================================================================
Resolved issues:
=============================================================================

[UMS common]
- Fixed: Files are now applied correctly when assigned to multi-level device folders


[Console, common]
- Fixed: Removed unnecessary log entries which occured if the user had no permission set
- Fixed: Issue where the 'configuration changed' indicator (blue exclamation mark) was not updated correctly if shared workplace assignments existed 


[Views]
- Fixed: Amount of hidden devices did not get refreshed if devices where added by another console



=============================================================================
=============================================================================
Including
=============================================================================

=============================================================================
IGEL Universal Management Suite
=============================================================================
Version 6.03.100
Release date: 2019-10-15

HTML version of this Readme is available at:  https://kb.igel.com/ums/releasenotes

=============================================================================
Known Issues:
=============================================================================

Updating IGEL Windows 10 devices via UMS webdav folder can result in an endless update loop of the devices.
Please contact our support in this case.
To avoid this problem, we recommend to distribute the Windows 10 firmware updates via an external FTP or HTTPS server.


=============================================================================
New features:
=============================================================================

[UMS common]
- Added: New display of legend of UMS icons (UMS Console -> Help -> Legend)
- Added: Support of MS SQL Server Always On Availability Groups
- Added: Allow TLS protocol version 1.1 or 1.2 selection for SMTP server communication in UMS
- Changed: UMS with external Derby database supports only Derby versions 10.9 up to 10.14
- Changed: Increased the maximum memory usage of UMS Console (1024mb -> 3072mb), UMS Server (2048mb -> 4096mb) and RM Admin (512mb -> 1024mb)
- Changed: Redesign of the UMS Cache. The cache is now always switched on. The corresponding configuration dialogs were removed.
- Updated: Apache Tomcat from version 8.5.43 to 8.5.45
- Updated: Azul Zulu JRE from version 1.8.0_212 to 1.8.0_222


[Console, common]
- Added: Configuration dialog for Views and Searches (Misc -> Settings -> Views and Searches)
- Added: Digit grouping to improve the readability of large numbers (eg. amount of devices in a folder)
- Added: When creating a new administrator account the user name or group name is checked for duplicate names prior to saving (System -> Administrator accounts -> New)


[Devices]
- Added: Option to copy device information to clipboard in ASCII-format (Device -> Detail View -> Bottom -> 'Copy to Clipboard (ASCII)')
- Changed: 'Import Devices' uses the Unit ID instead of the MAC address as the client descriptor for the long and short format import
- Changed: States of Device information lists ("open" or "close") are now saved
 

[Views]
- Added: Option to cache View results for more convenience


[Universal Firmware Update]
- Changed: Windows Firmware Updates are now provided with https
- Added: Universal Firmware Update supports FTPS and SFTP (UMS Administration -> Global Configuration -> Universal Firmware Update)


[Searches]
- Added: New View/Search criterion 'Structure Tag'
- Added: Option to save Searches as CSV, XML, HTML & XSL
- Added: Option to cache Search results for more convenience


[Console, administration section]
- Added: Choice between rich and plain text messages to a device (UMS Administration -> Global Configuration -> Messages to Devices)
- Changed: Available filter criteria for registered device licenses (UMS Administration -> Global Configuration -> Licenses -> Device's Licenses)
- Changed: It is now possible to create/import certificates in the remote icg installer/updater. (UMS Console -> Administration Tree -> UMS Network -> IGEL Cloud Gateway)


[High Availability Feature]
- Added: 'Stop Service' option in process detail view (UMS Administration -> UMS Network -> Server/Load Balancer)


[Installer (linux)]
- Added: UMS can be installed on Red Hat Enterprise Linux 8
- Added: Installer will now also check for a running instance of UMS Administrator during an update installation
- Added: New wizard page after component selection, displaying the memory(RAM) requirements for the selected components


[Installer (windows)]
- Added: New wizard page after component selection, displaying the memory(RAM) requirements for the selected components


=============================================================================
Resolved issues:
=============================================================================


[UMS common]
- Fixed: Deleting a firmware update snapshot also deleted the ums_filetransfer folder (Only occurred if the firmware update has been stored directly in the UMS webdav folder without parent folder)


[Console, common]
- Fixed: Indicator that the device settings have changed (blue exclamation mark) did not always appear when an assigned profile was changed or indirectly assigned to a device
- Fixed: When using an Oracle database, after moving files/views to a subfolder the file/view count display of the subfolder was not updated.
- Fixed: The "Show Message"-Button (UMS Console -> Bottom right hand corner) in "smart contrast" behaves now analogously to the other themes
- Fixed: The UMS firmware statistics overview (Misc -> Firmware Statistics) could display a wrong number of devices when UD Pocket devices were managed in the UMS
- Fixed: When a firmware customization has been assigned to a device, this device and all other already assigned devices got a notification that the settings have changed. Now only the new device will get the notification
- Fixed: Overwriting an existing zip file when exporting firmware, fw customizations, template keys/groups and device settings created an unusable file (System -> Export...)


[Devices]
- Changed: The value of 'Last IP' in 'System Information' of a device is no longer editable and was moved from the editable section to the non-editable section
- Fixed: Possible problems with the File Transfer Status if the device is connected via ICG
- Changed: Renamed the field 'Expiration Date of Maintenance Subscription' to 'Expiration Date of OS10-Maintenance Subscription' in the device detail view to avoid confusion (Device -> Detail View -> Advanced System Information)


[Firmware Customization]
- Fixed: Importing a Firmware Customization without assigned files resulted in a 'permission denied'-warning


[Profiles]
- Fixed: 'New Profile' dialog did not resize if expert mode was closed (UMS Console -> Profiles context menu -> New Profile)


[Views]
- Fixed: Creating a view with criterion 'Monitor size' caused an error with the SQL Server database


[Configuration Dialog]
- Fixed: In the configuration dialog of a device on the Security -> Password page, the "Change Password" buttons are now properly enabled/disabled to match the enable states of the corresponding parameters
- Fixed: In profile configuration dialog (Devices -> Storage Hotplug), the "Storage Hotplug" selection was not saved


[Console, administration section]
- Fixed: Display of wrong status after renaming a server (UMS Administration -> UMS Network -> Server)
- Added: Syntactic check of EMail address before sending EMail in Cloud Gateway Options (UMS Administration -> Global Configuration -> Cloud gateway options -> First -authentications keys -> Send first Email authentications keys by Email)


[Mobile Device Management (MDM)]
- Fixed: MDM is working again with LDAP users


[Server, common]
- Changed: Server details (UMS Administration -> Server) will now show the actual name of the Linux operating system if it provides the file /etc/os-release.


[High Availability Feature]
- Fixed: Support information for HA feature no longer generates error-entry on other servers
- Fixed: Issue with data directory in HA update. HA update changed the data directory (ums_filetransfer) to c:\programData\igel without notice. All files were automatically moved to the new directory. On linux systems the issue could lead to loss of files in ums_filetransfer folder.


[UI / Look&Feel]
- Fixed: Console used wrong tooltip-color after sending RichMessages


[Installer (linux)]
- Fixed: After an upgrade installation of the UMS Loadbalancer, it did not talk to the UMS Server anymore



=============================================================================
=============================================================================
Including features from private builds of Version 6.02.100
=============================================================================

=============================================================================
IGEL Universal Management Suite
=============================================================================
Version 6.02.110
Release date: 2019-08-14

HTML version of this Readme is available at:  https://kb.igel.com/ums/releasenotes 

=============================================================================
New features:
=============================================================================


[Server, common]
- Updated Apache Tomcat from version 8.5.40 to 8.5.43


[IGEL Cloud Gateway (ICG)]
- Added: Support for Shadowing via IGEL Cloud Gateway (ICG 2.01.100 or higher and IGEL OS 11.02.100 or higher are required)


=============================================================================
Resolved issues:
=============================================================================


[AD / LDAP integration]
- Fixed: AD authentication was not possible in a mixed domain/sub domain environment.


[Thin clients]
- Fixed: Firmware update settings of a device shown in UMS differed from the settings the device received when an Universal Firmware Update and a profile with configured firmware update settings were assigned to the device.


[Views]
- Added: The timeout for the online check of devices that is set in UMS Administration -> Global Configuration ->Server Network Settings -> Online Check Parameters will be used for the Online criterion in Views.


[IGEL Cloud Gateway (ICG)]
- Changed: Due to structural changes between ICG 1.04 and ICG 2.01 a downgrade is not possible. It is also disabled in the ICG remote installer.
- Fixed: Changing the name of an ICG or an UMS Server does no longer result in an error message. 


[DB command line tools]
- Fixed: The embackup command line tool didn't find the backup file in restore mode although it existed.


[Server, common]
- Fixed: Downloading global notifications (by UMS itself or via the "Send notification information via mail" administrative task) failed with Microsoft databases.


[Installer (windows)]
- Fixed: Updating an UMS installation (4.09.x or older ) directly to versions between 5.09.100 and 6.02.100 (inclusive) did not work completely. In these cases the installer asked for the data directory (which already existed) and even if the user entered the same path as the UMS used before, the folder was completely overwritten. Additionally, if the UMS used an embedded database before the update, a manual reactivation was sometimes required after the update.


