=============================================================================
IGEL Cloud Gateway (ICG)
=============================================================================
Version 2.02.100
Release date: 15.07.2020

HTML version of this readme is available at https://kb.igel.com/icg/releasenotes


NOTE:
- ICG requires UMS 5.06.100 or higher - it is not compatible with lower UMS versions.
- ICG requires IGEL OS firmware 10.02.100 or higher on the endpoints - it is not compatible with lower firmware versions.
	
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


- Added: Possibility to limit the maximum number of device connections. This limit can be administrated with UMS 6.05.100 or higher.

- Added: ICG now reports the real name of the underlying Linux distribution to the UMS for display in the UMS Console.

- Changed: Limited TLS version to 1.2 and updated cipher suite list

- Changed: Updated Spring Boot to version 2.2.8.RELEASE (embedded Tomcat version 9.0.36)

- Changed: Updated bundled Zulu JRE from version 8u212 to 8u252


[ICG Installer]

- Added: Support for Debian 10, Ubuntu 20.04, Red Hat Enterprise Linux 8, Oracle Linux 8 and Amazon Linux 2.

- Added: ICG can now be installed with port 443 (or any other privileged port)

=============================================================================
Resolved issues:
=============================================================================

[ICG Server]

- Fixed: The first authentication password of an UMS server was reactivated after reboot (ISN-2020-06)

- Fixed: Reworked authorization concept (ISN-2020-06)

- Fixed: Secured handling of websocket messages (ISN-2020-06)

- Fixed: List of connected UMS servers was false under certain circumstances. This led to a wrong view of connected UMS in UMS UI.

- Fixed: Device connections are not accepted if no UMS is connected to the ICG.

- Fixed: Improved performance on UMS <-> ICG synchronisation

- Fixed: UMS Webdav synchronisation caused errors with deleted files

- Changed: Removed sensitive data from server status response (ISN-2020-06)

- Changed: Removed sensitive data from log files (ISN-2020-06)

- Changed: Replaced caching layer to reduce memory consumption




