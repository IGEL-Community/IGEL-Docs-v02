=============================================================================
IGEL Cloud Gateway (ICG)
=============================================================================
Version 2.04.100
Release date: 15.11.2021

NOTE:
- ICG requires UMS 5.06.100 or higher - it is not compatible with lower UMS versions
- ICG requires IGEL OS firmware 10.02.100 or higher on the endpoints - it is not compatible with lower firmware versions
	
=============================================================================
Supported environment:
=============================================================================

Debian 10
Debian 9
Ubuntu 20.04
Ubuntu 18.04
Ubuntu 16.04
Oracle Linux 8
Oracle Linux 7
Red Hat Enterprise Linux (RHEL) 8
Red Hat Enterprise Linux (RHEL) 7
SUSE Enterprise Server 15
SUSE Enterprise Server 12	
Amazon Linux v2

=============================================================================
New features:
=============================================================================

[ICG Server]

- Changed: ICG sends now keep-alive packages to the devices (only for IGEL OS firmware 11.05.131 and higher) to detect and close dead websockets and forward the offline state of the device to UMS.

- Added: REST endpoint to test the status of the ICG.

- Changed: Updated bundled Zulu JRE from version 8u282 to 8u302.

- Changed: Updated Spring Boot to version 2.5.6 (embedded Tomcat version 9.0.54).


=============================================================================
Resolved issues:
=============================================================================


[ICG Server]

- Fixed: HTTP 404 errors on client requests for files after long online time of ICG server.

- Fixed: Some endpoints were accessible without authentication.
