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


======================================================
New features:
======================================================

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


======================================================
Resolved issues:
======================================================

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


=============================================================================
=============================================================================
Including changes from UMS Version 12.03.110
=============================================================================
=============================================================================
IGEL Universal Management Suite
=============================================================================
Version 12.03.110
Release date: 05.02.2024

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
Resolved issues:
=============================================================================

[UMS common]
- Fixed: View performance in UMS-Console improved.

[Console, administration section]
- Fixed: Export of Web certificates chain failed when private key of end certificate was not known.

[Device Service]
- Fixed: Some passwords could not be reset in the WebApp config dialog.

[Automatic License Deployment (ALD)]
- Fixed: Error occurred in ums-server.log when an OEM license was deployed.

[Misc] 
- Changed: New Igel logos. 


=============================================================================
# UMS WebApp #
=============================================================================

============================================================================= 
 New features: 
============================================================================= 

[Configuration Dialog]  
- Added: Change Indicator is now added to the Registry tree and Adjustments.  
- Added: Pages that show the selected parameter are listed in Registry.  
- Added: The current parameter is shown above variable expression in the Template Key sidebar. 
- Changed: More User Interface elements of the Configuration Dialog are now using the new unified design. 
 
=============================================================================
Resolved issues:
============================================================================= 
  

[Configuration] 
- Fixed: Group-Permission were not respected when calculating permissions for files. 
- Fixed: Error message was incorrectly shown when assigning a file to a profile. 
- Fixed: Permission Calculation for editing and creating a profile were not correct. (Help-Desk Use case) 
  
[Devices] 
- Changed: Properties for devices and device-folders are now collapsible. 
- Changed: Assigned objects tab content in app details is now scrollable. 
- Fixed: In the assigned object tab the wrong version of an app was sometimes shown. 
- Fixed: Parts of the device details were loaded and calculated twice. 
- Fixed: Minor performance improvement: Refactored database-calls for calculating the content of a device folder. 

[Network] 
- Fixed: Malformed entries in the Browser-Cache could lead to unreadable entries in the Network-Section. 

[Search] 
- Changed: The "app with error"-filter will no longer be shown on installations with embedded Databases, since the database does not currently support this feature. 
- Fixed: A bug was present that showed complex queries in the simple UI-state. 
- Fixed: A bug was present where Device Attributes filter froze the frontend in some cases. 
- Fixed: Device attributes with names with whitespaces work now. 
- Fixed: Malformed saved searches could lead to a state where no saved search was loaded. 
- Fixed: The query-string was not readable in Dark Mode. 

[Misc] 
- Changed: New Igel logos. 
- Fixed: Layout-Bug causing errors in console 
- Fixed: For most objects, the content of the parent folder was additionally calculated. 
- Fixed: Incorrect labels. 
- Fixed: Lower part of labels was cut off. 
- Fixed: Pagination and filters not working correctly. 
- Fixed: Bug where streams were unintentionally closed. 
- Fixed: A bug was present where log messages were saved twice.

[Configuration Dialog] 
- Fixed: Password value of the "custom_partition.source%.password" parameter was stored as plain text in the database and on profile export. 
- Fixed: Wrong Change Indicator was shown in some cases. 
- Fixed: Change Indicator was not shown in the Device Configuration. 
- Fixed: Empty container was shown for some tree nodes in Registry. 
- Fixed: Template parameters were not found when searching in Registry. 
- Fixed: Some parameters on the Default Wi-Fi network page could not be edited. 
- Fixed: Citrix StoreFront Sessions could not be added to autostart. 
