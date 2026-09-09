=============================================================================
IGEL Cloud Gateway (ICG)
=============================================================================
Version 2.05.100
Release date: 15.03.2022

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

- Changed: Updated bundled Zulu JRE from version 8u302 to 8u322.

- Changed: Updated Spring Boot to version 2.6.2 (embedded Tomcat version 9.0.56).

=============================================================================
Resolved issues:
=============================================================================

[ICG Server]

- Changed: Removed unused dependency to log4j (Version 1.2.17).

- Changed: Removed unnecessary logging of temporary file transfers.

