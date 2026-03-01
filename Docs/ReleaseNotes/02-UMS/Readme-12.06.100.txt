=============================================================================
IGEL Universal Management Suite
=============================================================================
Version 12.06.100
Release date: 24.10.2024

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
Red Hat Enterprise Linux (RHEL) 9 (64 bit)
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
Red Hat Enterprise Linux (RHEL) 9 (64 bit)
Amazon Linux 2

Backend database (DBMS):
Microsoft SQL Server 2016 (with Cluster Support)
Microsoft SQL Server 2017 (with Cluster Support)
Microsoft SQL Server 2019 (with Cluster Support)
Microsoft SQL Server 2022 (with Cluster Support)
Oracle 21c (with Cluster Support)
PostgreSQL 11 - 15
Apache Derby 10.9 - 10.14
Amazon Aurora PostgreSQL (Compatible with PostreSQL 11 – 15)
Azure SQL Managed Instance 


=============================================================================
New features:
=============================================================================

[Admin tasks] 
- Added: Administrative task for cleaning up expired licenses and / or license duplicates. (UMS Administration -> Global Configuration -> Administrative Tasks)   

[IGEL Cloud Gateway (ICG)] 
- Added: Option to authenticate to ICG Server with SSH key for ICG install / uninstall / update / keystore update / restart. 

[UMS common] 
- Updated: Apache Tomcat to Version 10.1.28 
- Added: Now a device license is only registered when it doesn't already exist.  
- Updated: Spring Security to version 6.3.1 
- Updated: Spring to version 6.1.10. 
- Updated: Spring Boot to version 3.3.3 

[Unified Protocol] 
- Added: Support for OS12 Wake on LAN Proxies. 

[ums] 
- Added: Support of Red Hat Linux version 9.
- Added: Option to specify the delimiter when the results of a view are saved/sent by e-mail. 
- Added: Support of Oracle DB version 21. 

============================================================================= 
Resolved issues: 
============================================================================= 

[AD / LDAP integration] 
- Fixed: In special cases the UMS Console did not respond when the Test of an AD configuration was done. 

[Device Connector] 
- Fixed: ICG connected devices could not communicate with the UMS after a 30 day connection to the ICG without reconnect.
* Workaround: disconnect and connect the ICG 

[Device Service] 
- Fixed: Import of profile sometimes resulted in wrong configuration. 

[Files] 
- Fixed: File upload via Webapp did not support different data directory. 
  
[IGEL Cloud Gateway (ICG)] 
- Fixed: In some cases, the ICG was not reconnected after UMS/ICG restart. 
- Fixed: UMS console was frozen if ICG was disconnected, and several UMS servers were offline. 
- Fixed: Devices were able to re-register via ICG after deletion. 

[IGEL Management Interface (IMI)] 
- Fixed: Creation of template keys and assignment of key values to devices and device directories via IGEL Management Interface (IMI) worked only for the superuser.  

[UMS common] 
- Fixed: Wake up command was not working properly in some cases. 
- Fixed: Security Logging Data was missing for LDAP/AD Users (Information of user who performed action was missing). 

  
============================================================================= 
# UMS WebApp # 
============================================================================= 
============================================================================= 
New features: 
============================================================================= 

[Configuration] 
- Added: Recycle Bin for Regular Profiles is now available in the Web App.
- Added: Recycle Bin for Priority Profiles is now available in the Web App.
- Added: Recycle Bin for CICs is now available in the Web App.
- Added: Recycle Bin for Files is now available in the Web App.
- Changed: All selected use cases are now shown in CIC details and cards.
- Added: Assigned CICs tab is shown.
- Added: Navigation to the assigned CIC from device and file.


[Configuration Dialog] 
- Added: File size is now shown in files properties in CIC dialog when available. 


[Devices] 
- Added: Option to manage Device Attributes is now available in the Web App.
- Added: New Device property "Born on Date" (time of registration).

[Search] 
- Added: New filter related to the time of registration.

[Misc] 
- Added: Support for French language.
- Updated: Angular to Version 18.

============================================================================= 
Resolved issues: 
============================================================================= 

[Login] 
- Changed: Tooltips removed from Username and Password fields.
- Fixed: "Remember me" function did not save login data.

[Apps] 
- Changed: Apps can be searched by Display name.
- Fixed: The app was not imported properly if the app dependency version was empty.
- Fixed:  The first downloaded app did not appear in the apps list.

[Configuration] 
- Added: Tooltips for Create New Profile button and Set Default Version button.
- Fixed: The tooltip remained displayed on the "Clear All Filters" icon in Assigned Devices.
- Fixed: The edit file dialog was broken when opened from File details.
- Fixed: Items in the file root directory were counted even if the user had no Browse rights.
- Fixed: Assign file permissions were not handled properly in all cases.


[Configuration Dialog] 
- Changed: Removed the possibility to set template keys on special parameters with combined parameters set as dependency because it resulted in confusing behavior (e.g. Wi-Fi Domain and Location).
	It is still possible to set template keys in Registry for such cases.


[Devices] 
- Added: Message if there are no assigned objects in Assigned Object tab.
- Changed: Shadowing works via Tyrus instead of Jetty.
- Changed: Previous scan settings are now saved.
- Fixed: The filter icons in the Assign Objects search did not work properly.
- Fixed: The "All selected" option in the Scan Dialog did not function correctly.
- Fixed: The number of devices handled was not correct after multiple scans.

[Logging] 
- Fixed: Filtering for Logtime "Between" did not work correctly.
- Fixed: File and CIC actions were logged even when logging was not enabled.

[Search] 
- Changed: The 'go to settings' button has been removed.
- Changed: The warning about stacking reindexing has been altered.
- Fixed: Value for broken comma was incorrect.
- Fixed: Case sensitivity did not work for any field.
- Fixed: Cost Center filter did not work correctly.
- Fixed: Content of the dialog when the "show terms" button was clicked was not displayed.
- Fixed: Wrong data was shown for the filter "within last"+"1"+"min".
- Fixed: Combo box values were not sorted alphabetically.
- Fixed: Export of the search result included all elements, not just the search results.
- Fixed: Filter "Version" did not function correctly.
- Fixed: Two or more device attributes with multiple selected items returned incorrect values.
- Fixed: Device attribute of the date type did not work correctly.

=============================================================================
=============================================================================
Including features from UMS Version 12.05.130
=============================================================================

=============================================================================
IGEL Universal Management Suite
=============================================================================
Version 12.05.130
Release date: 27.08.2024

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

[ums]
- Updated: Java JDK from version 17.0.11+9 to 17.0.12+7

======================================================
Resolved issues:
======================================================

[ums]
- Fixed: View results that were exported with an adminstrative task didn't contain any monitor information.


=============================================================================
# UMS WebApp #
=============================================================================
======================================================
Resolved issues:
======================================================

[WebApp]
- Fixed: Some App-Versions where not importable due to a mismatch of expected and provided values of dependend apps. (Full fix will be provided with UMS 12.06.100)


=============================================================================
=============================================================================
Including changes from UMS Version 12.05.120
=============================================================================
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
