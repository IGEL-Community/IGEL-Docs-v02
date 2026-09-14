=============================================================================
IGEL Cloud Gateway (ICG)
=============================================================================
Version 12.04.100
Release date: 09.04.2024
	
=============================================================================
Supported environment:
=============================================================================

Debian 12
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

======================================================
New features:
======================================================

[ICG Server]

- Added: Support for Debian 12

- Updated: Azul Zulu JRE from version 17.0.8.1+1 to 17.0.10+7

- Updated: Spring Boot to version 3.2.2 (embedded tomcat 10.1.18)

======================================================
Resolved issues:
======================================================

[ICG Server]

- Fixed: In HA environments errors could occur, when the ICG was disconnected and then connected in the UMS console.

- Fixed: Devices did reconnect every 30 minutes.

- Changed: Improved error handling for the management websocket connection between UMS and ICG.

- Changed: When a shadowing/secure terminal action is triggered but the forwarding of the device portforwarding event fails, the UMS closes the portforwarding websocket to the device.
