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


=============================================================================
=============================================================================
Including changes from UMS Version 12.04.100
=============================================================================
=============================================================================
IGEL Universal Management Suite
=============================================================================
Version 12.04.100
Release date: 09.04.2024

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

[Administrator application]
- Added: Commands to the IGEL UMS Administrator Command-Line Interface to manage Web certificates. The following actions are supported:
 * Creation of root of signed certificates.
 * Renewal of certificates.
 * Import of root certificates, signed certificates, decrypted private keys and certificate chains.
 * Export of certificates and certificate chains.
 * Deletion of certificates.
 * Assigning a certificate to current server or to all UMS servers.
 * Listing existing certificates, details of a certificate or assigned server of a certificate.

[Console, administration section]
- Added: Advanced Searches (created in UMS Web App) are assignable to Administrative Tasks.

[Jobs]
- Added: Advanced Searches (created in UMS Web App) are assignable to Jobs.

[Security]
- Added: Notification is created when a device communication certificate uses a weak signature algorithm.

[UMS common]
- Added: "App Signing Certificate" as new file class to be able to roll out certificates specifically used for custom app signing.
- Updated: Azul Zulu JRE from version 17.0.8.1+1 to 17.0.10+7
- Updated: Apache Tomcat from version 10.1.15 to 10.1.18

[Unified Protocol]
- Added: Possibility to export the "Client certificate chain".
- Added: Compatibility for F5 BigIP to manage OS12 devices (IGEL OS with version 12.3.2 or higher required).

[ums]
- Added: Improved import of Web Certificates and Web Certificate Chains:
 * When a signed certificate is imported, which is signed by a public certificate, such public CA certificates can be additionally imported automatically.
 * When a keystore is imported, the certificate chain can be built automatically.
 * It is no longer possible to import a certificate when a certificate with the same fingerprint is already present.
 * Additional checks referring to validity, signature verification, subject alternative names and private keys have been added.
- Added: Support for Azure SQL Managed Instance via SQL login.


=============================================================================
Resolved issues:
=============================================================================

[Files]
- Fixed: File cache for OS11 devices is now updated if a file was changed in UMS Webapp.
- Fixed: A folder with 'NOT-SET' of 'BROWSE'-Right was not visible in the file tree, although the subfolder had an 'ALLOW' of 'BROWSE'-Right and although the folder contained a file with an 'ALLOW' of 'READ'-Right. 
- Fixed: In a distributed UMS new files were not synchronized to the WebDAV directory of each UMS server.

[Installer (windows)]
- Changed: It is no longer allowed to define only blank characters as a password.
- Changed: The wizard-pages for memory allocations are swapped: first UMS Server (tomcat), second UMS Console and added additional text info on the wizard-pages how and where the user can change the memory allocation later on.

[UMS common]
- Fixed: The SQL Console could not handle multi-line statements.
- Fixed: The function to send an e-mail works again with UMS running on Ubuntu 20.04 or 22.04.

[Unified Protocol]
- Fixed: App installation state time is only changed when the state has changed.
- Changed: Improved error handling for the management WebSocket connection between UMS and ICG.
- Changed: When a shadowing/secure terminal action is triggered but the forwarding of the device port forwarding event fails, the UMS closes the port forwarding WebSocket to the device.
- Fixed: Device Last Boot Time was not updated with every reconnect.
- Fixed: Devices did reconnect every 30 minutes.


============================================================================= 
 # UMS WebApp # 
============================================================================= 

=============================================================================  
 New features:  
============================================================================= 

[Apps]
- Added: Dependencies of Apps: A new tab will show the dependencies for each version. Old versions will sync over time.

[Configuration]
- Added: Support for dynamic file classification.
- Added: It is now possible to drag and drop files from one directory to another.

[Configuration Dialog]   
- Added: Pages that show the selected parameter are listed in Registry. 
- Added: Indicator for Sessions configured via a Profile is added in Device Configuration. 
- Added: Input validation for the Template Key Directory name. 
- Added: Input validation for the Template Key name. 
- Added: It is now possible to add all available values for the selected parameter to the Template Key values. 
- Changed: More UI elements are redesigned for the new light and dark modes. 

[Search]
- Added: Case sensitive searches: To give the user more control over search terms it is now possible to mark a search as case-sensitive or insensitive.
- Added: The user can now switch from the apps view to the search view on a new tab to see on which devices the app (or app version) is installed.
- Added: Custom Device Attributes are now available as columns.
- Added: Added filter "firmware id".
- Added: Added filter "app version id".
- Added: Added filter for devices with app version directly assigned.
- Added: Warning message when you leave the unsaved search.
- Added: Security logging for deleting views.

[Misc]
- Added: Security logging for user action (profile, master profile, devices, etc.)
  

============================================================================= 
 Resolved issues: 
=============================================================================  
     
[Apps]
- Fixed: Wrong label in German for Automatic Updates.
- Fixed: App version state badge behaves properly without the text protruding from the badge.
- Fixed: Assigned objects tab content in app details in not scrollable.
- Fixed: Issue creating the pxe-config.json with non-base-system apps.

[Configuration]
- Fixed: Files - assigned objects list does not update after new assign or detach.
- Fixed: File tree was not reloaded after the file was uploaded.
- Fixed: File edit dialog opens correctly from toolbar as well from settings accordion.
- Fixed: Certificate content starts with space.
- Fixed: Lower part of letters is chopped in profile names.
- Fixed: Template keys and activated settings filter and pagination not working.
- Changed: Tooltip is added to create directory button for files tree.
- Changed: Enabled keyboard navigation for files-list.
- Changed: Redesign Update Time dialog after saving Changes in Configuration Dialog.
- Changed: The file classification display is now more user-friendly.
- Changed: Minor performance update.

[Configuration Dialog]   
- Fixed: Search input overlay broke layout in some cases.
- Fixed: Wrong behavior of showing dependent parameters on the Network / Proxy page.
- Fixed: Template Key button was shown when the Template Key feature was not enabled.

[Devices]
- Fixed: Login History did not display correctly in Dark mode.
- Fixed: Commands on the toolbar of the device-details are executed on the correct device after selecting a different one on the list. 
- Fixed: Filter could result in an endless loop.
- Fixed: Removed strange characters in comment of device.
- Fixed: The Default Version now is correctly shown and saved when it is assigned to a device.
- Fixed: The current folder is now always pre-selected as the value in the dropdown of the Scan-dialog.
- Changed: Properties for devices and device-folders are now collapsible.
- Changed: Assign-Dialog got more height.
- Changed: The assign dialog version field now shows first the Default Version.
- Changed: Minor performance update.

[Network]
- Changed: To create a better onboarding experience the "Communication Token" is now a separate field on the server and ICG page.
- Changed: Network page was redesigned according to our Unified Design System.
- Changed: Add copy option on each row in fingerprints accordion.

[Logging]
- Fixed: Search filter cannot be reset in certain situations.
- Fixed: Parameter is cut off at special char.
- Changed: It is no longer necessary to deploy the UMS Web App to use the feature "Unified Logging".

[Search]
- Fixed: UMS users could see devices in the search that they should not see - AD Group permission issue.
- Fixed: Search button now aligned properly on Firefox browser.
- Fixed: Bug that didn’t allow search with filter for device attributes with whitespace.
- Fixed: Paginator now opens in right position;
- Changed: Autocomplete is now also available in Dark Mode.
- Changed: Improved stability for indexing.
- Changed: Filters in autocomplete are sorted alphabetically.
- Changed: Saved searches are now shown in alphabetical order.
- Changed: Removed unnecessary log-entries.
- Changed: Button for reindexing disabled until response from backend arrives, info message is shown.

[Misc]
- Fixed: Error on UMS WebApp-login when web certificate is FQDN only.
- Fixed: Various labels and colors.
- Changed: Various dialogs are now moved to the Unified Design System.
- Changed: Font size in 'About' dialog is increased.
- Changed: Collapse functionality for tree area is now easier to use and state is remembered by the browser.