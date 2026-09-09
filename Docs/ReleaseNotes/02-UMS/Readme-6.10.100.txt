=============================================================================
IGEL Universal Management Suite
=============================================================================
Version 6.10.100
Release date: 15.03.2022

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
- Added: Support of Amazon AWS Aurora datasources
- Added: Admin CLI commands to start, stop, restart and end update mode of the UMS Server
- Deprecated: Deprecated the old Admin CLI option 'restart-server'. This is now a subcommand of 'server'.
- Updated: Apache Tomcat from version 8.5.72 to 8.5.75
- Updated: Azul Zulu JRE from version 8u302 to 8u322

[Administrator application] 
- Changed: Postgres datasources with empty database name can now be defined 

[High Availability Feature]
- Added: Communication between UMS Servers in HA environment installed on distributed subnets.

[Custom Device Attributes]
- Changed: Values of device attributes can also be set by devices. It can be configured, whether UMS/UMS Web App/IMI, devices or both are allowed to change the values (UMS Administration -> Global Configuration -> Device Attributes).

[Console, common]
- Added: Information about all available network adapters of a device (lx 11.07.100 or higher) is sent to and displayed in the UMS and UMS Web App. This information can also be accessed via the IMI

[IMI, server]
- Changed: Added more session information to login logging of IMI and UMS Web App

[IGEL Cloud Gateway (ICG)]
- Changed: Updated bundled Zulu JRE from version 8u302 to 8u322
- Changed: Updated Spring Boot to version 2.6.2 (embedded Tomcat version 9.0.56)

=============================================================================
Resolved issues:
=============================================================================

[UMS common]
- Changed: Updated Apache Log4j 2 library to version 2.17.1

[Console, common]
- Fixed: The retrieval of all or some ICG log files could be prevented if one ICG could not be reached while the log files were collected (Help -> Save support information...)

[AD / LDAP integration]
- Changed: Increased maximum password length for imported Active Directory users.

[High Availability Feature]
- Fixed: Windows service 'IGELRMGUIServer' will not be recreated but updated during UMS update installation to preserve service user (service log on account, e.g. required for SQL Server JDBC authentication) and heap size (Xmx).
- Changed: For connections to message broker using SSL only TLSv1.2 is allowed.

[Installer (linux)]
- Fixed: UMS installer failed to install qt5-qtbase dependency on Amazon Linux 2

[IGEL Cloud Gateway (ICG)]
- Changed: Removed unused dependency to log4j (Version 1.2.17)
- Changed: Removed unnecessary logging of temporary file transfers


=============================================================================
UMS Web App
=============================================================================


============================================================================= 
New features: 
============================================================================= 

[Devices]
- Added: Implemented handling of "Device only" Device Attributes. (See new UMS Features)
- Added: New Tab for Network Adapters information (See new UMS Features)


=============================================================================
Resolved issues: 
=============================================================================

[Security]
- Fixed: Fixed Security issue where it was possible to access and manipulate log-messages without proper authorization.
- Changed: Log4j was updated to 2.17.1
- Changed: Export of Device Information as CSV was hardened against DDE injection.

[Common]
- Fixed: Some settings were only initially cached and never updated.


[Logging]
- Fixed: Commands "reboot", "Shutdown" and "Suspend" resulted in misleading log-messages.
- Changed: Clearing (old) data is now possible even if logging itself is disabled.



=============================================================================
=============================================================================
Including features from private builds of Version 6.09.120
=============================================================================


=============================================================================
IGEL Universal Management Suite
=============================================================================
Version 6.09.120
Release date: 22.12.2021

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
Resolved issues:
=============================================================================
[Security]
- Changed: Updated Apache Log4j 2 library to version 2.17.0 to fix critical security vulnerability ISN-2021-11.

IGEL strongly recommends that all users update/upgrade to UMS 6.09.120. 


[Devices]
- Fixed: It was not possible to write almost any key combination with the 'Alt Gr' key in the secure terminal dialog if the UMS was installed on windows.


[UMS common]
- Fixed: An error in certificate distribution to devices could occur when the same IGEL Cloud Gateway certificate was added more than once to UMS in the IGEL Cloud Gateway dialog. Duplicate entries are now supported but should be avoided.


[Automatic License Deployment (ALD)]
- Fixed: Performance issue referring to Automatic License Deployment (ALD) which could occur under certain circumstances.




=============================================================================
UMS Web App
=============================================================================


=============================================================================
Resolved issues:
=============================================================================

[Security]
- Changed: Updated Elastic-Search to 7.16.2 (resolved: log4j-security issue)

