=============================================================================
IGEL Cloud Gateway (ICG)
=============================================================================
Version 12.09.100
Release date: 26.08.2025	
=============================================================================
Supported environment:
=============================================================================

Debian 12
Debian 11
Ubuntu 24.04
Ubuntu 22.04
Ubuntu 20.04
Oracle Linux 8
Oracle Linux 7 
Red Hat Enterprise Linux (RHEL) 9
Red Hat Enterprise Linux (RHEL) 8
Red Hat Enterprise Linux (RHEL) 7
SUSE Enterprise Server 15
SUSE Enterprise Server 12	
Amazon Linux v2

======================================================
New features:
======================================================

[ICG Server]

- Updated: Azul Zulu JRE from version 17.0.13+11 to 17.0.15+6

- Updated: Spring Boot to version 3.5.3 (embedded tomcat 10.1.42)

- Added: In some cases, for old devices (base_system ≤ 12.4.0) the Client Certificate renewal could fail. 
	A configuration to switch off the Client Certificate Expiration check to further manage the devices and start reenrollment was added.