=============================================================================
IGEL Universal Management Suite
=============================================================================
Version 6.09.100
Release date: 15.11.2021

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


=============================================================================
New features:
=============================================================================

[UMS common]  
- Added: Support for Microsoft Windows Server 2022. See [https://docs.microsoft.com/en-us/windows/release-health/windows-server-release-info]  
- Added: Monitoring endpoint for requesting status of UMS server/ICG. 
- Updated: Apache Tomcat from version 8.5.66 to 8.5.72  
- Updated: Azul Zulu JRE from version 8u282 to 8u302 

 
[Console, common]  
- Added: Microsoft Windows 11 to supported environment for UMS Client.  
- Added: Basic information of used ICG certificates is now part of the support information (Help -> Save support information...)  

 
[IGEL Cloud Gateway (ICG)]  
- Added: It is now possible to add existing ICGs to newly installed UMS when the messaging is not working.  

 
[Administrator application]  
- Added: Command-line interface for UMS Administrator with full feature set (except SQL console) 
Note: The functionality of the command line tools 'embackup', 'installNetworkToken' and 'ksbackup' is completely included in the new tool 'umsadmin-cli'. Therefore, these tools will no longer be available in future UMS releases.

=============================================================================
Resolved issues:
=============================================================================

[UMS common]  
- Fixed: No message templates available for Postgres installations.  
- Fixed: Heavy WebDav access may cause poor AD login performance due to authentication checks.  
- Fixed: In some circumstances the directory's information for Firmware Customizations and Files in the UMS-Cache could be out of date.  
- Changed: Improved performance of online check.  

 
[Console, common]  
- Fixed: Log Message dialog did not show any results if the 'Selected Objects' option was left empty (System -> Logging -> Log Messages)  
 

[Views]  
- Changed: Improved execution of views with condition 'device (NOT) IN directory'.  
 

[Console, administration section]  
- Fixed: License file registration failed when UMS server and UMS console are not installed on the same machine (UMS Administration -> Global Configuration -> Licenses -> Device Licenses).  
 

[Permissions]  
- Changed: Passwords saved in the database are hashed with SHA-512 for optimal security.  
 

[IGEL Cloud Gateway (ICG)] 
- Fixed: ICG with display name with more than 200 characters can no longer be installed. 
 

[Server, common]  
- Fixed: Devices were displayed offline after the used network adapter had been changed.  
- Fixed: Internal issue that resulted in redundant error log-entries of inability to parse asset inventory events.  
 

[High Availability Feature]  
- Fixed: Load balancer on Linux does not show the full OS version.  
- Fixed: Assigned files of imported Firmware Customizations weren't synchronized within HA network.  
 

[Installer (linux)]  
- Fixed: Upgrade from non-HA to HA installation on Linux servers. 




=============================================================================
UMS Web App
=============================================================================


=============================================================================
New features:
=============================================================================

[Security]
- Added: Login Brute-Force Protection.
A1. Multiple failed login-attempts will lead to a temporary ban for the user account.
A2. This includes accounts that do not exist to prevent probing.
B1. Inserted dynamic login delay (milliseconds) to prevent probing.
(Response-time could otherwise be an indicator for the (non-)existence of an account.)


=============================================================================
Resolved issues:
=============================================================================

[Configuration]
- Changed: Folders in the configuration tree now show the amount of contained profiles.
- Fixed: Wrong naming for number of contained profiles for a profile directory.
- Fixed: Wrong German translation for 'Site'.
- Fixed: Device-icon not aligned in filter.


[Devices]
- Changed: German translations for detaching objects.
- Changed: The order of assigned objects is improved.
- Fixed: Color and text of attachment cards is incorrect during drag operation.


[Misc]
- Changed: Assign Object Icon now persistent throughout the Web App.
- Changed: Values are now checked before the creation of a new directory.
- Fixed: Gaps in the header.
- Fixed: Header alignment.
- Fixed: Missing icons in various dropdown components. 



=============================================================================
=============================================================================
Including features from private builds of Version 6.08.130
=============================================================================


=============================================================================
IGEL Universal Management Suite
=============================================================================
Version 6.08.130
Release date: 25.10.2021



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
Oracle 12c (with Cluster Support)
PostgreSQL 9.6 and 10 - 13
Apache Derby 10.9 - 10.14  





=============================================================================
Resolved issues:
=============================================================================

[Console, web start]
- Fixed: UMS Console couldn't be started via Java Web Start





=============================================================================
Including changes from UMS Versions 6.08.120 
=============================================================================



=============================================================================
IGEL Universal Management Suite
=============================================================================
Version 6.08.120
Release date: 27.09.2021

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
Oracle 12c (with Cluster Support)
PostgreSQL 9.6 and 10 - 13
Apache Derby 10.9 - 10.14  





=============================================================================
Resolved issues:
=============================================================================

[Security]
- Fixed: CRITICAL SECURITY ISSUE
UMS Web App can be made to reveal critical information, including the UMS Superuser password.

A critical security vulnerability in UMS Web App affects the following IGEL products:
· UMS 6.8.x with UMS Web App installed
· UMS 6.7.x with UMS Web App installed
· UMS 6.6.x with UMS Web App installed
· UMS 6.5.x with UMS Web App installed

IGEL strongly recommends that all affected users (UMS Web App installed) update/upgrade to UMS 6.08.120. 
If you have reasons not to do that, you can do the following:
1. Make a UMS data backup.
2. Re-run your current installer and re-install UMS without UMS Web App









=============================================================================
Including changes from UMS Versions 6.08.110 
=============================================================================



=============================================================================
IGEL Universal Management Suite
=============================================================================
Version 6.08.110
Release date: 13.09.2021

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
Oracle 12c (with Cluster Support)
PostgreSQL 9.6 and 10 - 13
Apache Derby 10.9 - 10.14  




=============================================================================
New features:
=============================================================================

[Views]
- Added: The Text Mode in the Expert Mode in views can now auto-complete supported operators and recognize unsupported operators as syntax errors.


=============================================================================
Resolved issues:
=============================================================================

[Views]
- Fixed: Views that contain a 'is true' or 'is false' constraint could not be edited in the expert mode


[Console, administration section]
- Fixed: It was not possible to edit a device attribute without also changing the internal identifier
- Fixed: License file registration failed when UMS server and UMS console are not installed on the same machine (UMS Administration -> Global Configuration -> Licenses -> Device Licenses).


[High Availability Feature]
- Fixed: Assigned files of imported Firmware Customizations weren't synchronized within HA network.



