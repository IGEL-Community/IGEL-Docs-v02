=============================================================================
IGEL Universal Management Suite
=============================================================================
Version 12.05.120
Release date: 31.07.2024

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
Amazon Linux 2

Backend database (DBMS):
Microsoft SQL Server 2016 (with Cluster Support)
Microsoft SQL Server 2017 (with Cluster Support)
Microsoft SQL Server 2019 (with Cluster Support)
Microsoft SQL Server 2022 (with Cluster Support)
PostgreSQL 11 - 15
Apache Derby 10.9 - 10.14
Amazon Aurora PostgreSQL (Compatible with PostreSQL 11 – 15)
Azure SQL Managed Instance

=============================================================================
New features:
=============================================================================

[Server, common]
- Updated: Apache Tomcat from version 10.1.24 to 10.1.26


=============================================================================
# UMS WebApp #
=============================================================================
======================================================
Resolved issues:
======================================================

[Config Dialog]
- Fixed: Navigation to "apps.cups_printing.print.cups" in Registry caused the browser window to freeze due to a large instance number.
- Fixed: Parameters based on combo box component (e.g. post-session command option) were not shown in the Configuration Dialog.
- Fixed: Select file button was disabled on CIC creation.

[WebApp]
- Fixed: Entries for generic commands were missing in security log due to a NPE. 
- Fixed: Automatic update of Default Version sometimes did not take place when triggered manually.
- Fixed: Case sensitive checkbox in the search was broken, in some cases checkbox could not be checked.


=============================================================================
=============================================================================
Including changes from UMS Version 12.05.110
=============================================================================
=============================================================================
IGEL Universal Management Suite
=============================================================================
Version 12.05.110
Release date: 22.07.2024

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
Amazon Linux 2

Backend database (DBMS):
Microsoft SQL Server 2016 (with Cluster Support)
Microsoft SQL Server 2017 (with Cluster Support)
Microsoft SQL Server 2019 (with Cluster Support)
Microsoft SQL Server 2022 (with Cluster Support)
PostgreSQL 11 - 15
Apache Derby 10.9 - 10.14
Amazon Aurora PostgreSQL (Compatible with PostreSQL 11 – 15)
Azure SQL Managed Instance

=============================================================================
Important information:
=============================================================================

[UMS Web App]
A bug was identified where commands executed on a device folder could be sent with the wrong folder ID, resulting in actions being sent to incorrect devices. 
This issue affects only the UMS Web App and is not present in the UMS Console.


Issue Details:
Impact: Commands (e.g., reboot, update) could be sent to an unintended selection of devices, potentially impacting a large number of devices, and in some cases, all devices.
Affected Versions: All UMS versions since 12.03.110.
Resolution: This bug is fixed in UMS version 12.05.110. 

Please update to UMS version 12.05.110 to resolve this issue.



Mitigation Steps (for all affected versions):
To ensure commands are sent to the correct selection of devices, apply the following mitigation:

Remove Permission for All Users to Execute Commands on Device Folders:
1. Create a new user group in the UMS Console.
2. Set the "Bulk action" permission to "Deny."
3. Add every user to this group.

By implementing these steps, you can prevent the incorrect execution of commands on devices for all non-superusers until you are able to update to the fixed version, 12.05.110.


======================================================
Resolved issues:
======================================================

[WebApp]
- Fixed: A bug where commands on a folder were send to a different folder.
- Fixed: "0 System Error", which occurs randomly
- Fixed: An unused package was deliverd with the elastic search installation to customers. (package was deactivated and inactive.)


=============================================================================
=============================================================================
Including changes from UMS Version 12.05.100
=============================================================================
=============================================================================
IGEL Universal Management Suite
=============================================================================
Version 12.05.100
Release date: 15.07.2024

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
Amazon Linux 2

Backend database (DBMS):
Microsoft SQL Server 2016 (with Cluster Support)
Microsoft SQL Server 2017 (with Cluster Support)
Microsoft SQL Server 2019 (with Cluster Support)
Microsoft SQL Server 2022 (with Cluster Support)
PostgreSQL 11 - 15
Apache Derby 10.9 - 10.14
Amazon Aurora PostgreSQL (Compatible with PostreSQL 11 – 15)
Azure SQL Managed Instance

=============================================================================
Important information:
=============================================================================

[ICG]
- Due to changes in certificate handling you must restart your ICGs after completing UMS installation.

=============================================================================
New features:
=============================================================================

[Console, administration section] 
- Added: Additional checks for web certificate import; a warning message is shown when a subject alternative name has the wrong type.

[Default Directory Rules] 
- Added: Views and default directory rules for onboarding user name / user role and user mail domain.

[IGEL Cloud Gateway (ICG)] 
- Added: “Restart ICG Service” button to ICG overview panel toolbar to restart an ICG service.

[IGEL Management Interface (IMI)] 
- Added: IMI extension to manage template keys. 
	There are 5 new Rest calls: reading template keys and values, creating new template key, assigning values to a key, device and directory. 

[Installer (linux)] 
- Added: Information that the customer has to restart any existing ICG after an update installation of the UMS from version 12.4 (or lower) to 12.5 (or higher).

[Installer (windows)] 
- Added: Information that the customer has to restart any existing ICG after an update installation of the UMS from version 12.4 (or lower) to 12.5 (or higher).

[Template keys and groups] 
- Added: Additional static template key: SERIALNUMBER (for the serial number of the device)

[ums] 
- Updated: Java JDK from version 17.0.10+7 to 17.0.11+9 
- Updated: Apache Tomcat from version 10.1.18 to 10.1.24
- Added: Support for Ubuntu 24.04

=============================================================================
Resolved issues:
=============================================================================

[Configuration Dialog] 
- Fixed: Local User password was not saved when set in profile (page Security / Logon / Local User).

[Console, administration section]
- Fixed: If a mass license was registered several licenses with the same content were shown at 'Device Licenses' (UMS Administration -> Global Configuration -> Licenses -> Device Licenses).

[Device Connector] 
- Fixed: Reconnecting the ICG management connection to an ICG could end up in an endless loop, blocking an attempt to manually connect. 
- Fixed: In installations with multiple load balanced ICGs or UMSs on different ports, shadowing sometimes did not select the correct port. 
- Fixed: In some cases, the ICG was not fully connected, ICG was shown as online but device commands were not processed. 

[Devices] 
- Fixed: Issue with export of device settings in case of several configured network cards. 

[Files] 
- Changed: File-Service checks the source directory for WRITE permission. If the source directory has no WRITE permission, a file cannot be moved. 
- Changed: Upload of a file with an already existing filename is now allowed. Filename will be changed to filename(x).

[IGEL Cloud Gateway (ICG)] 
- Fixed: Improved ICG connect/disconnect overview calculation for offline UMS Servers.  
- Fixed: In the upgrade process from OS11 to OS12 an Endpoint is called to get Configuration Settings. This request failed. 
- Changed: The ICG connection state is now divided into OS11 and OS12 connection states.  
- Fixed Device got a NOTALLOWED error message when the ICG was disconnected and connected again to the UMS.

[Installer (windows)] 
- Changed: To avoid subsequent errors, we will no longer allow spaces in passwords. This also corresponds to the generally used convention in the IT environment. 

[UMS common]
- Fixed: Logfiles were sometimes not archived every day.

[Unified Protocol] 
- Fixed: The device registration with UMS one-time keys and newer OS12 devices did not work. The usage count of the one-time key was increased by one, but the device could not be registered. The registration with mass-deployment keys worked, but the usage count was two instead of the expected one.  
- Fixed: In case the Device Network adapter was changed the MAC address and Hardware Information was not updated correctly.

[ums] 
- Changed: Consent text of Insight Service. Now the Insight Service is enabled by default if the Insight Service has not been configured yet. The Insight Service can be enabled/disabled at UMS Administration > Global Configuration > UMS Features. 


=============================================================================
# UMS WebApp #
=============================================================================

=============================================================================
Known Issues:
=============================================================================

[Configuration]
- Using the same image for multiple use cases in single Corporate Identity Customization (CIC) might result in only one of the use cases applied correctly. To avoid it, please either upload the image again or use single use case CICs in such situations.

=============================================================================
New features:
=============================================================================

[Configuration]
- Added: Corporate Identity Customizations (former Firmware Customizations) are now available in the Web App for OS11 and OS12 devices. Existing Firmware Customizations are now also available as Corporate Identity Customizations in the UMS Web App.
- Added: It is now possible to add multiple use cases to one Corporate Identity Customization in the Web App.

[Network]
Added: Additional information to network page.

[Search]
Added: It is now possible to mark a Search as "public" and therefore share it with all other users within the UMS cluster.
Added: Time Relative Searches: Filters that work on timestamps can now be used to do "relative" searches (before, after, ...).
Added: The Search section now shows both types of saved Searches: The own ones (private) and public ones.

=============================================================================
Resolved issues:
=============================================================================
	   
[Apps]
Changed: Renamed "App Proxy" to "Update Proxy".
Changed: UMS as an Update Proxy tooltips and label for checkbox.
Fixed: Esc closing did not work for settings.

[Configuration]
Changed: Introduced tabs for Configuration Section (Profiles, [Priority Profiles,] CICs, Files).
Changed: If a file has no thumbnail, a proper message is shown in the content file section.
Changed: Close config dialog via ESC and close button on top right corner.
Changed: If a new directory is created it appears at the top of the list until it is renamed/saved.
Changed: Unified representation of "Number of contained profiles/files/..." for all objects.
Fixed: Profile tree performance issues.
Fixed: Drop down menu for Assign object to directory/device was shown shortly in the wrong place.
Fixed: Display of file size when information is not available.
Fixed: Detach assigned directory from profile, priority profile, file is possible for users without bulk permission.
Fixed: After creating a new profile, icon in list card was wrong.
Fixed: Changing the name of a profile did not update the name in the card.
Fixed: Long filenames broke the layout of the upload-dialog (Files, Profiles, Priority Profiles & Apps).
Fixed: Logging action for files was carried out regardless of settings.
Fixed: Save-Button was not activated on file name change for some types of classifications.
Fixed: It was not possible to go to the profile's details clicking on its name in the list of assigned objects of a device.
Fixed: Now the file name is used in case the file display name is an empty string.
Fixed: Wrong view was shown in Content tab after file selection.
Fixed: Tooltip for deleting icon for Files.
Fixed: Priority profiles options did pop up and disappear on creating folder for regular profiles.

[Config Dialog]
- Changed: More user-friendly save workflow was implemented for Template Keys.
- Fixed: Parameters on Appliance Mode page were shown for OS11 in the Configuration Dialog in the Web App.
- Fixed: The option to include Registry in the search is now shown without the switch.
- Fixed: Change highlight was not shown for some parameters.
- Fixed: Change highlight was not removed on reverting changes for some parameters.

[Devices]
Changed: Close config dialog via ESC and close button on top right corner.
Changed: New directory created appear at the top of his parent children until is renamed/saved.
Fixed: Installed Apps date format.
Fixed: Registration for multiple devices.
Fixed: Edit Custom Properties dialog has missing "Date Input" property.
Fixed: Assign object button for folders was active when permission Device Bulk Action was not set for the user.
Fixed: German translation was missing in the Scan device table column.
Fixed: Dialog "apply now/on next boot" was not shown properly when devices were moved from one folder to another.
Fixed: Wrong format of date/time for "Installed App" tab.
Fixed: Filtering in devices.
Fixed: Sorting for Installed apps on devices.
Fixed: Move device directory dialog did not display correctly.
Fixed: Error on trying to assign an app to a device by selecting the default version.

[Logging]
Changed: Paging dropdown is opened on top, instead of below.
Fixed: Some commands were logged twice.
Fixed: Added missing translations.
Fixed: Datetime control was not visible.
Fixed: Filters in logging did not work.
Fixed: Category column was not sorted properly.

[Misc]
Changed: Updated to hibernate-search 7.1.0

[Network]
Changed: Order of labels in Network Information page.
Fixed: Added "Not set" flag in case specified fields have no data in database.

[Search]
Changed: Added option to copy public searches into private ones.
Changed: The list filters shown for a new search ("Default Filters") was changed to: [All Fields], App Installed, Last Boot Time, Name.
Changed: Export button is disabled while export is in process.
Changed: Wait indicator was added for the list of saved Searches.
Changed: Search is now disabled while mass indexing is happening.
Changed: Validation for IP address.
Changed: Animation for opening advanced search is faster.
Fixed: Search for device attributes was not working.
Fixed: Jump functionality did not work.
Fixed: Scrollbar in active filter was not displayed properly.
Fixed: Data filter is not disabled when query is complex.
Fixed: "Last IP"-dropdown filter did not work.
Fixed: Case sensitive was disabled when query is complex.
Fixed: Search was sometimes no longer working when using a Linux based UMS.
Fixed: Filter for the last know IP-Adress was misbehaving when used in query language.
Fixed: Case sensitive checkbox was not toggled properly.
Fixed: Autocompletion was not working properly.
Fixed: Case sensitive for index-only search did not work.
Fixed: Column for last logged in user sometimes did not show any values.
Fixed: Indexing failed if Db contained more than one onboarding token for a device.
Fixed: Scrollbar for filters did not move to the bottom automatically.
Fixed: Select column disappeared when there was an error in search.


=============================================================================
=============================================================================
Including features from UMS Version 12.04.120
=============================================================================

=============================================================================
IGEL Universal Management Suite
=============================================================================
Version 12.04.120
Release date: 21.05.2024

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
Amazon Aurora PostgreSQL (Compatible with PostreSQL 11 – 15) 


=============================================================================
New features:
=============================================================================

[ums]
- Added: Option to force setting the network name of a device from UMS-internal name.


=============================================================================
Resolved issues:
=============================================================================

[Console, common]
- Fixed: Delete action in context menu and toolbar didn't consider if recycle bin was active.

[Device Service]
- Fixed: Partition password for OS11 partitions was stored encrypted by the WebApp configuration.


[Profiles]
- Fixed: Some profile settings were lost if the underlying version of the apps was changed.


[Unified Protocol]
- Fixed: In some cases, a duplicate key error occurred when a license request event was written.
- Changed: Type of device-connector (UMS or ICG) is transferred to device with settings.


[ums]
- Changed: The heartbeat signal offset is configurable now and for the heartbeat interval greater values can be specified.


=============================================================================
# UMS WebApp #
=============================================================================

=============================================================================
Known Issues:
=============================================================================

[Search]
- The "Contains Text" search field (UMS WebApp -> Search) currently excludes all hardware information fields.
	Hardware information (e.g. bios-vendor, boot-mode, CPU type) need to be filtered for by their respected filter-fields.

[Devices]
- Shadowing via the UMS Web App does sometimes not work if 
	a) the UMS is installed on a Linux server and b) the browser is installed on the same machine.
	Workaround: 1) Use a browser that is installed on a different machine.
	Workaround: 2) Substitute “localhost” in the URL with the IP of the machine.

=============================================================================
New features:
=============================================================================  
	   
[Apps]
- Added: The administrator can now see for each App Version if only the Metadata is present, or if the complete binaries are also stored in the UMS.
- Added: Option to block devices from using public App Portal as download source. (For "Air-gapped-Systems")
- Added: Option to block the cleanup-job that runs inside the Update Proxy. (If the job is activated, the binaries of unused app versions are regularly deleted. Manually imported apps are never deleted by the clean-up job.)


=============================================================================
Resolved issues:
=============================================================================
	   
[Apps]
- Changed: If the Update Proxy is enabled, newly imported Metadata will automatically trigger the download of the corresponding binaries.
- Changed: The upload-buttons inside the app-section are now unified: 
         Users can upload both ipgk-files and iam-files via the same workflow, and the system will respond accordingly.


[Configuration]
- Fixed: Long filenames broke the layout of the upload-dialog. (Files, Profiles, Priority Profiles & Apps)
- Changed: Upload-Button in files has now the same icon as the other upload-buttons in UMS Web App.


[Configuration Dialog]   
- Fixed: Profile and Device Configuration Dialogs could not be closed by hitting ESC key or using the X button.
- Fixed: It was possible to save an invalid configuration in some cases.


[Devices]
- Fixed: Shadowing via the UMS WebApp didn´t work when Security Logging was enabled.
- Changed: Disabled constant connection check for shadowing via the Web UMS.
	This will lead to a more stable shadowing experience but will result in a timeout after some minutes after the connection is idle.


[Search]
- Fixed: Search for AD-Group-Users was broken.


=============================================================================
=============================================================================
Including changes from UMS Version 12.04.110
=============================================================================
=============================================================================
IGEL Universal Management Suite
=============================================================================
Version 12.04.110
Release date: 23.04.2024

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
Amazon Aurora PostgreSQL (Compatible with PostreSQL 11 – 15) 

=============================================================================
Resolved issues:
=============================================================================

[Installer (linux)]
- Fixed: Error importing Certificate Private Keys.

[UMS common]
- Fixed: MS SQL Server database connection with DB type ‘SQL Server AD Native’ or ‘SQL Server Cluster AD Native’.

