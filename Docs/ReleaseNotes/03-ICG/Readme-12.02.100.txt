=============================================================================
IGEL Cloud Gateway (ICG)
=============================================================================
Version 12.02.100
Release date: 31.07.2023
	
=============================================================================
Supported environment:
=============================================================================

Debian 11
Debian 10
Ubuntu 22.04
Ubuntu 20.04
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

- Changed: Updated bundled Zulu JRE from version 8u326 to 17.0.6+10-LTS.

- Changed: Updated Spring Boot to version 2.7.12 (embedded Tomcat version 9.0.75).

- Changed: Updated HSQL DB from 2.5.2 to 2.7.2.

- Changed: If no UMS is connected to ICG, existing device connections are disconnected after a grace period and no new connections are accepted until the UMS has reconnected.

=============================================================================
Resolved issues:
=============================================================================

[ICG Server]

- Fixed: In some situations, the ICG was not fully connected after updating it remotely.

- Fixed: Improved session handling for OS11 UMS connections to prevent session timeouts after 30 minutes.

- Fixed: The revoked certificates were loaded before UMS connection was established.


[ICG Installer]

- Fixed: "Error opening terminal: xterm-256color." on Ubuntu 22.04 when manually installing via ssh terminal.

- Fixed: The ICG installer removes the parameter "server.servlet.session.timeout" from the file "[icg.installation.path]/icg/usg/conf/application-prod.yml", if it was added to avoid session timeout problems with ICG 12.01.100.

