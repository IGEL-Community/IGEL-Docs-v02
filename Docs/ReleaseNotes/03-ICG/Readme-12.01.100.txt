=============================================================================
IGEL Cloud Gateway (ICG)
=============================================================================
Version 12.01.100
Release date: 01.03.2023
	
=============================================================================
Supported environment:
=============================================================================

Debian 11
Debian 10
Ubuntu 22.04
Ubuntu 20.04
Ubuntu 18.04
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

- Added: The ICG does now also support management of OS12 devices via Unified Protocol. 

- Added: Support of TLSv1.3

- Added: Support for Ubuntu 22.04

- Added: Support for Debian 11

- Changed: The ICG service requires now 4 GB RAM.

- Changed: Updated bundled Zulu JRE from version 8u322 to 8u362.

- Changed: Updated Spring Boot to version 2.7.8 (embedded Tomcat version 9.0.71).

=============================================================================
Resolved issues:
=============================================================================

[ICG Server]

- Fixed: Sessions do now expire after 30 minutes

