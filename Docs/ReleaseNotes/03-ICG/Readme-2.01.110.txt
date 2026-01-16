=============================================================================
IGEL Cloud Gateway (ICG)
=============================================================================
Version 2.01.110
Release date: 15.10.2019

NOTE:
- ICG requires UMS 5.06.100 or higher - it is not compatible with lower UMS versions.
- ICG requires IGEL OS firmware 10.02.100 or higher on the endpoints - it is not compatible with lower firmware versions.
- Due to structural changes between ICG 1.04 and ICG 2.01, a downgrade is not possible.
- ICG 2.01 does NOT support the following UMS functionalities yet:
	- Universal Firmware Update
	
=============================================================================
Supported environment:
=============================================================================

Debian 9 (64 bit)
Debian 8 (64 bit)
Ubuntu 18.04 (64 bit)
Ubuntu 16.04 (64 bit)
Oracle Linux  7 (64 bit)
Red Hat Enterprise Linux (RHEL) 7 (64 bit)
Red Hat Enterprise Linux (RHEL) 6 (64 bit)
SUSE Enterprise Server 12 (64 bit)

=============================================================================
Resolved issues:
=============================================================================

[ICG Server]
- Added: The IGEL MDM solution does now support Apple iOS 12 devices
- Fixed: Temporary files are now deleted after 15 minutes


[ICG Installer]
- Changed: Increased maximum used memory (RAM) to 2048 MB


=============================================================================
IGEL Cloud Gateway (ICG)
=============================================================================
Version 2.01.100
Release date: 14.08.2019

HTML version of this readme is available at https://kb.igel.com/icg/releasenotes


NOTE:
- ICG requires UMS 5.06.100 or higher - it is not compatible with lower UMS versions.
- ICG requires IGEL OS firmware 10.02.100 or higher on the endpoints - it is not compatible with lower firmware versions.
- Due to structural changes between ICG 1.04 and ICG 2.01, a downgrade is not possible.
- ICG 2.01 does NOT support the following UMS functionalities yet:
	- Universal Firmware Update
	
=============================================================================
Supported environment:
=============================================================================

Debian 9 (64 bit)
Debian 8 (64 bit)
Ubuntu 18.04 (64 bit)
Ubuntu 16.04 (64 bit)
Oracle Linux  7 (64 bit)
Red Hat Enterprise Linux (RHEL) 7 (64 bit)
Red Hat Enterprise Linux (RHEL) 6 (64 bit)
SUSE Enterprise Server 12 (64 bit)
		
=============================================================================
New features:
=============================================================================

[ICG Server]

- Added: Support for Shadowing and Secure Shadowing from UMS (UMS version 6.02.110 or higher and IGEL OS firmware 11.02.100 or higher required)

- Changed: The bundled Oracle JRE has been replaced with Azul Zulu JRE 8 Update 212

- Changed: Migrated from standalone Tomcat to Spring Boot application with embedded Tomcat (Tomcat version 9.0.14)

- Changed: Files and credentials are now stored in an integrated HyperSQL Database (HSQLDB)

=============================================================================
Resolved issues:
=============================================================================

[ICG Installer]

- Fixed: Update from 1.03.120 or lower to 1.04.100 or higher was not possible

- Fixed: Added missing logfile symlink /var/log/icg

- Changed: ICG installer does now support python 2 and python 3
 
[ICG Server]

- Fixed: Removed logging of hashed passwords

