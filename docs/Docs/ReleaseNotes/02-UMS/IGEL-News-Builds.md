# IGEL News: UMS

**NOTE:**

----

## 2025-01-16 - [12.06.120](Readme-12.06.120.txt)

```
=============================================================================
# UMS WebApp #
=============================================================================

=============================================================================
Resolved issues:
=============================================================================

[Devices]
- Changed: Improved logging for shadowing of devices.

[Configuration]
- Changed: Accelerated check of profile compatibility. This results
           in a faster assignment workflow.

[Search]
- Fixed: Devices missing in search result if permissions were granted
         through UMS groups.
```

## 2024-12-10 - [12.06.110](Readme-12.06.110.txt)

```
=============================================================================
New features:
=============================================================================

[App Proxy] 
- Added: Data is uploaded to App Binary Repositories immediately
         if the Repository configuration is changed or a new one is created.

[UMS common] 
- Added: OS11 devices get ICG addresses even if they are directly
         connected to the UMS.

============================================================================= 
Resolved issues: 
============================================================================= 

[App Proxy] 
- Fixed: URL of load balancer for Binary App Repository was not
         sent to the device.

[Device Connector] 
- Fixed: Logging of OS12 commands didn't work if web port was changed. 

[Device Service] 
- Fixed: Some parameters were not fully copied when a profile was
         copied in the WebApp.
- Fixed: URL of load balancer for Binary App Repository was not
         sent to the device.

[IGEL Cloud Gateway (ICG)] 
- Fixed: SSH-Key input field does not grow outside the dialog window. 

[UMS common] 
- Fixed: Devices didn't receive the license with the latest expiration
         date when several licenses for the device including unlimited
         licenses were registered in UMS.

============================================================================= 
# UMS WebApp # 
============================================================================= 

============================================================================= 
Resolved issues: 
============================================================================= 

[Apps] 
- Fixed: Manual update check sometimes did not work. 
- Fixed: "Search for updates"-button was not always displayed.

[Devices] 
- Fixed: Wrong permission checked for "Edit Configuration"-button. 
- Fixed: Files were not filtered by display name (quick assign
         control for "Profile contained files"-tab).
- Fixed: Installed Apps state was not correctly shown. 

[Configuration] 
- Fixed: User without rights could sometimes move profiles. 
- Fixed: Users could sometimes see entities in the Recycle Bin they
         should not have seen.
- Fixed: "Delete"-button on files was enabled for users that have
         denied Write permissions on the folder.
- Fixed: No logs when modifying profile/priority profile. 
- Fixed: It was not possible to move some items to the Recycle bin,
         regardless of permission.
- Fixed: It was possible to move directories to Recycle bin without
         Write permission.

[Configuration Dialog]
- Changed: The default printer parameter can now also be activated
           in a profile configuration and overwrite the device configuration.

[Logging] 
- Fixed: No logs were generated when modifying a profile / priority
         profile.
- Fixed: Log message indexing was broken for some fields. 

[Network] 
- Fixed: Tree keyboard navigation did not work. 

[Search] 
- Fixed: Search was not working after update on some installations.
- Fixed: Issue with search permissions when updating to a newer
         version.
- Fixed: Wrong icon was used for “Edit Search”-button. 
- Fixed: No French translation for search input field. 

[Others] 
- Changed: Optimized usage of database connections and transactions. 
```

## 2024-10-24 - [12.06.100](Readme-12.06.100.txt)

```
=============================================================================
New features:
=============================================================================

[Admin tasks] 
- Added: Administrative task for cleaning up expired licenses and
         / or license duplicates. (UMS Administration -> Global Configuration
         -> Administrative Tasks)

[IGEL Cloud Gateway (ICG)] 
- Added: Option to authenticate to ICG Server with SSH key for ICG
         install / uninstall / update / keystore update / restart.

[UMS common] 
- Updated: Apache Tomcat to Version 10.1.28 
- Added: Now a device license is only registered when it doesn't
         already exist.
- Updated: Spring Security to version 6.3.1 
- Updated: Spring to version 6.1.10. 
- Updated: Spring Boot to version 3.3.3 

[Unified Protocol] 
- Added: Support for OS12 Wake on LAN Proxies. 

[ums] 
- Added: Support of Red Hat Linux version 9.
- Added: Option to specify the delimiter when the results of a view
 .       are saved/sent by e-mail.
- Added: Support of Oracle DB version 21. 

============================================================================= 
Resolved issues: 
============================================================================= 

[AD / LDAP integration] 
- Fixed: In special cases the UMS Console did not respond when the
         Test of an AD configuration was done.

[Device Connector] 
- Fixed: ICG connected devices could not communicate with the UMS
         after a 30 day connection to the ICG without reconnect.
* Workaround: disconnect and connect the ICG 

[Device Service] 
- Fixed: Import of profile sometimes resulted in wrong configuration. 

[Files] 
- Fixed: File upload via Webapp did not support different data directory. 
  
[IGEL Cloud Gateway (ICG)] 
- Fixed: In some cases, the ICG was not reconnected after UMS/ICG restart. 
- Fixed: UMS console was frozen if ICG was disconnected, and several
          UMS servers were offline.
- Fixed: Devices were able to re-register via ICG after deletion. 

[IGEL Management Interface (IMI)] 
- Fixed: Creation of template keys and assignment of key values to
         devices and device directories via IGEL Management Interface (IMI)
         worked only for the superuser.

[UMS common] 
- Fixed: Wake up command was not working properly in some cases. 
- Fixed: Security Logging Data was missing for LDAP/AD Users
         (Information of user who performed action was missing).

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
- Added: File size is now shown in files properties in CIC dialog
         when available.

[Devices] 
- Added: Option to manage Device Attributes is now available in the
         Web App.
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
- Fixed: The app was not imported properly if the app dependency
         version was empty.
- Fixed:  The first downloaded app did not appear in the apps list.

[Configuration] 
- Added: Tooltips for Create New Profile button and Set Default
         Version button.
- Fixed: The tooltip remained displayed on the "Clear All Filters"
         icon in Assigned Devices.
- Fixed: The edit file dialog was broken when opened from File details.
- Fixed: Items in the file root directory were counted even if the
         user had no Browse rights.
- Fixed: Assign file permissions were not handled properly in all cases.

[Configuration Dialog] 
- Changed: Removed the possibility to set template keys on special
           parameters with combined parameters set as dependency because it
           resulted in confusing behavior (e.g. Wi-Fi Domain and Location).
	       It is still possible to set template keys in Registry for such cases.

[Devices] 
- Added: Message if there are no assigned objects in Assigned Object tab.
- Changed: Shadowing works via Tyrus instead of Jetty.
- Changed: Previous scan settings are now saved.
- Fixed: The filter icons in the Assign Objects search did not work
         properly.
- Fixed: The "All selected" option in the Scan Dialog did not
         function correctly.
- Fixed: The number of devices handled was not correct after multiple
         scans.

[Logging] 
- Fixed: Filtering for Logtime "Between" did not work correctly.
- Fixed: File and CIC actions were logged even when logging was not
         enabled.

[Search] 
- Changed: The 'go to settings' button has been removed.
- Changed: The warning about stacking reindexing has been altered.
- Fixed: Value for broken comma was incorrect.
- Fixed: Case sensitivity did not work for any field.
- Fixed: Cost Center filter did not work correctly.
- Fixed: Content of the dialog when the "show terms" button was
         clicked was not displayed.
- Fixed: Wrong data was shown for the filter "within last"+"1"+"min".
- Fixed: Combo box values were not sorted alphabetically.
- Fixed: Export of the search result included all elements, not
 .       just the search results.
- Fixed: Filter "Version" did not function correctly.
- Fixed: Two or more device attributes with multiple selected items
         returned incorrect values.
- Fixed: Device attribute of the date type did not work correctly.
```

## 2024-08-27 - [12.05.130](Readme-12.05.130.txt)

```
=============================================================================
New features:
=============================================================================

[ums]
- Updated: Java JDK from version 17.0.11+9 to 17.0.12+7

======================================================
Resolved issues:
======================================================

[ums]
- Fixed: View results that were exported with an adminstrative task
         didn't contain any monitor information.

=============================================================================
# UMS WebApp #
=============================================================================
======================================================
Resolved issues:
======================================================

[WebApp]
- Fixed: Some App-Versions where not importable due to a mismatch
         of expected and provided values of dependend apps. (Full fix will
 .       be provided with UMS 12.06.100)
```