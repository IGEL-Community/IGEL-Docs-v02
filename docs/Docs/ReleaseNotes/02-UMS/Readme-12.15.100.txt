=============================================================================
IGEL Universal Management Suite
=============================================================================
Version 12.15.100
Release date: 16.11.2026

HTML version of this Readme is available at:  https://kb.igel.com/en/universal-management-suite/current/ums-release-notes


=============================================================================
Supported environment:
=============================================================================
UMS Server: 
Microsoft Windows Server 2022 (64 bit)
Microsoft Windows Server 2025 (64 bit)
Ubuntu 22.04 (64 bit)
Ubuntu 24.04 (64 bit)
Oracle Linux 7 (64 bit)
Oracle Linux 8 (64 bit)
Red Hat Enterprise Linux (RHEL) 7 (64 bit)
Red Hat Enterprise Linux (RHEL) 8 (64 bit)
Red Hat Enterprise Linux (RHEL) 9 (64 bit)
Amazon Linux 2

UMS Client: 
Microsoft Windows 10 (64 bit) 	
Microsoft Windows 11 (64 bit) 
Microsoft Windows Server 2022 (64 bit)
Microsoft Windows Server 2025 (64 bit)
Ubuntu 22.04 (64 bit)
Ubuntu 24.04 (64 bit)
Oracle Linux 7 (64 bit)
Oracle Linux 8 (64 bit)
Red Hat Enterprise Linux (RHEL) 7 (64 bit)
Red Hat Enterprise Linux (RHEL) 8 (64 bit)
Red Hat Enterprise Linux (RHEL) 9 (64 bit)
Amazon Linux 2


Backend database (DBMS):
Microsoft SQL Server 2017 (with cluster support)
Microsoft SQL Server 2019 (with cluster support)
Microsoft SQL Server 2022 (with cluster support)
Oracle 19c (with cluster support)
Oracle 21c (with cluster support)
PostgreSQL 11–18
Apache Derby 10.9–10.14
Amazon Aurora PostgreSQL (compatible with PostgreSQL 11–18)
Azure SQL Managed Instance

Regular support for Apache Derby has expired. The support for Apache Derby will end in a later UMS version.
	See also: https://kb.igel.com/en/igel-subscription-and-more/current/support-policies-for-connections-to-third-party-en


Browser:
Microsoft Edge 154.0+
Mozilla Firefox 154.0+
Google Chrome 155.0+


=============================================================================
Known issues and important information:
=============================================================================

After Reset to Factory Defaults by a non-imported AD user, the UI/tree is not automatically refreshed. The device may remain visible despite its changed state, and selecting it before refreshing the tree may trigger error messages.

=============================================================================
New features:
=============================================================================

[Console, common] 
- Removed: Third Party Licenses menu entry from the UMS Console Help menu.

[Installer (linux)] 
- Updated: Apache Tomcat from version 11.0.24 to 11.0.26 
- Updated: Azul Zulu JRE from version 21.0.12+8 to 21.0.12.1+1 

[Installer (windows)] 
- Updated: Apache Tomcat from version 11.0.24 to 11.0.26 
- Updated: Azul Zulu JRE from version 21.0.12+8 to 21.0.12.1+1 

[UMS common]   
- Added: Some administrator settings can now be set through external configuration (file / environment variables). See the KB   for more details. 
- Removed: Microsoft Windows Server 2019 (64 bit) from supported environments.

=============================================================================
Resolved issues:
=============================================================================

[Admin tasks]
- Fixed: Administrative tasks configured to repeat every n minutes were not executed between the top of the hour and the configured start minute.

[App Proxy] 
- Fixed: Issue where archived or hidden Applications were still appearing in results. Data retrieval now correctly respects filter preferences across all views. 
- Fixed: DB connection pool exhaustion.

[Cloud IdP / SSO] 
- Fixed: Disconnects caused by reset_to_factory being executed by a non-superuser. 

[Configuration Dialog]
- Fixed: Unchanged values in the configuration dialog are no longer incorrectly marked as modified. 

[Default Directory Rules] 
- Fixed: Incomplete label. 

[Device Connector]
- Changed: Qualify HTTP 401 on device connects with WWW-Authenticate reason, so that a device can distinguish "you are no longer registered here" from "I cannot authenticate you right now" and avoid unintended release of UMS information. 

[Device Service] 
- Fixed: When the OS send an empty magic_number, we do set value to default value.

[License Service] 
- Changed: License status lookups are now cached briefly, reducing server load with no change in behavior for users. 

[UMS common] 
- Fixed: Improved performance of the OAuth2 token introspection endpoint.
- Fixed: Synchronization between UMS servers failed for files whose names contained spaces. 

[View Service] 
- Fixed: Search filter for device attribute number.

[WebDAV]
- Fixed: Files larger than a few megabytes could not be synchronized in a distributed/HA environment.

=============================================================================
# UMS Web App #
=============================================================================
=============================================================================
New features:
=============================================================================

[Apps]
- Added: The servers and repositories hosting an app version's binaries are now shown via the version card.

[Configuration]
- Added: Quick Assign now shows object paths.

[Devices]
- Added: Secure remote terminal sessions are now available for devices running IGEL OS 12 or later.
- Added: File transfer status is now available in device details.
- Added: Assignment dialogs now show object paths.
- Added: FIPS status is now displayed on device cards.

[IGEL Managed Hypervisor]
- Added: Left navigation tab available now to user IGEL Managed Hypervisor section.
- Added: External storages can be managed now under IMH > External Storages.
- Added: Create, Update and Delete External Storages for managing your IMH exported images.
- Added: Exporter Image Inventory - Manage images that were exported from the IMH Exporter.
- Added: Image lifecycles are now manageable from Exporter Image Inventory. Cycle through Deploy, Publish and Retire images.
- Added: VM Management is now available as part of IMH - Perform Start, Stop, Backup, Restore, Reimage, Wipe actions per VM or select multiple VMs to perform bulk Start all, Stop all operations.
- Added: Image details now available when selecting an image. It showcases the complete image metadata and a list of all VMs using this image.
- Added: Profile configuration now allows selection of External Storage and Image + Version for a IMH VM profile. 

[Misc] 
- Added: Quick Search: search for Devices, Profiles, Priority Profiles, Persona Profiles, CICs, Files, and directories.
- Added: Quick Search: jump to the selected Devices, Profiles, Priority Profiles, Persona Profiles, CICs, and Files. 
- Added: Updated the Side Navigation and Top Toolbar for improved usability. 

=============================================================================
Resolved issues:
=============================================================================

[Automation]
- Fixed: Administrative tasks scheduled to repeat every "x" minutes missed executions after the start of each hour.
- Fixed: Jobs could not be created when a time was specified in the cancellation criteria.
- Fixed: Server selection was sometimes unavailable when creating admin tasks in installations with multiple servers.
- Fixed: Newly created admin tasks were not automatically selected in the sidebar.
- Fixed: Job counts in the navigation tree included Dual Boot Events.
- Fixed: The "Never" execution option is no longer available for jobs; set a job to Inactive instead.

[Configuration]
- Changed: Profiles can now be created based on any version of an app if at least one version is configurable.
- Changed: Folders now appear faster when assigning profiles.
- Changed: Files moved to the Recycle Bin are now hidden from profile views and reappear when restored.
- Fixed: Confirmation dialog for app version changes in the Profile Configurator was missing.
- Fixed: Renaming Template Keys.

[Devices]
- Added: Devices are now reindexed when their directory is renamed.
- Added: A warning is now displayed when BCrypt is enabled while FIPS devices are registered.
- Added: A warning is now displayed when FIPS devices are registered, explaining that assigning apps may affect FIPS compliance.
- Changed: Device states now load faster.
- Changed: Invalid network names were accepted when renaming devices with automatic network-name adjustment enabled.
- Fixed: The TCP scanning option was ignored when scanning the local network or an IP range.
- Fixed: Errors occurred when saving an EST CA Proxy configuration.
- Fixed: The device's "Assign Object" dialog could remain stuck loading when a large number of profiles existed.

[Dual Boot]
- Added: All devices on the current page can now be selected at once.

[Misc]
- Changed: The interface now responds faster during normal use.
- Changed: Large object selection trees now load and scroll more smoothly.
- Fixed: Authentication tokens were written to error logs when connections failed.
- Fixed: Scrollbars were displayed incorrectly in Firefox.
- Fixed: Authentication failures could cause an endless redirect loop.


=============================================================================
=============================================================================
Including changes from UMS 12.14.120
=============================================================================
=============================================================================
IGEL Universal Management Suite
=============================================================================
Version 12.14.120
Release date: 11.11.2026

HTML version of this Readme is available at:  https://kb.igel.com/en/universal-management-suite/current/ums-release-notes


=============================================================================
Supported environment:
=============================================================================
UMS Server: 
Microsoft Windows Server 2019 (64 bit) 
Microsoft Windows Server 2022 (64 bit)
Microsoft Windows Server 2025 (64 bit)
Ubuntu 22.04 (64 bit)
Ubuntu 24.04 (64 bit)
Oracle Linux 7 (64 bit)
Oracle Linux 8 (64 bit)
Red Hat Enterprise Linux (RHEL) 7 (64 bit)
Red Hat Enterprise Linux (RHEL) 8 (64 bit)
Red Hat Enterprise Linux (RHEL) 9 (64 bit)
Amazon Linux 2

UMS Client: 
Microsoft Windows 10 (64 bit) 	
Microsoft Windows 11 (64 bit) 
Microsoft Windows Server 2019 (64 bit) 
Microsoft Windows Server 2022 (64 bit)
Microsoft Windows Server 2025 (64 bit)
Ubuntu 22.04 (64 bit)
Ubuntu 24.04 (64 bit)
Oracle Linux 7 (64 bit)
Oracle Linux 8 (64 bit)
Red Hat Enterprise Linux (RHEL) 7 (64 bit)
Red Hat Enterprise Linux (RHEL) 8 (64 bit)
Red Hat Enterprise Linux (RHEL) 9 (64 bit)
Amazon Linux 2


Backend database (DBMS):
Microsoft SQL Server 2017 (with cluster support)
Microsoft SQL Server 2019 (with cluster support)
Microsoft SQL Server 2022 (with cluster support)
Oracle 19c (with cluster support)
Oracle 21c (with cluster support)
PostgreSQL 11–18
Apache Derby 10.9–10.14
Amazon Aurora PostgreSQL (compatible with PostgreSQL 11–18)
Azure SQL Managed Instance

Regular support for Apache Derby has expired. The support for Apache Derby will end in a later UMS version.
	See also: https://kb.igel.com/en/igel-subscription-and-more/current/support-policies-for-connections-to-third-party-en


Browser:
Microsoft Edge 151.0+
Mozilla Firefox 154.0+
Google Chrome 151.0+


=============================================================================
Resolved issues:
=============================================================================

[UMS common]
- Fixed: Security issues.

=============================================================================
=============================================================================
Including changes from UMS 12.14.110
=============================================================================
=============================================================================
IGEL Universal Management Suite
=============================================================================
Version 12.14.110
Release date: 08.10.2026

HTML version of this Readme is available at:  https://kb.igel.com/en/universal-management-suite/current/ums-release-notes


=============================================================================
Supported environment:
=============================================================================
UMS Server: 
Microsoft Windows Server 2019 (64 bit) 
Microsoft Windows Server 2022 (64 bit)
Microsoft Windows Server 2025 (64 bit)
Ubuntu 22.04 (64 bit)
Ubuntu 24.04 (64 bit)
Oracle Linux 7 (64 bit)
Oracle Linux 8 (64 bit)
Red Hat Enterprise Linux (RHEL) 7 (64 bit)
Red Hat Enterprise Linux (RHEL) 8 (64 bit)
Red Hat Enterprise Linux (RHEL) 9 (64 bit)
Amazon Linux 2

UMS Client: 
Microsoft Windows 10 (64 bit) 	
Microsoft Windows 11 (64 bit) 
Microsoft Windows Server 2019 (64 bit) 
Microsoft Windows Server 2022 (64 bit)
Microsoft Windows Server 2025 (64 bit)
Ubuntu 22.04 (64 bit)
Ubuntu 24.04 (64 bit)
Oracle Linux 7 (64 bit)
Oracle Linux 8 (64 bit)
Red Hat Enterprise Linux (RHEL) 7 (64 bit)
Red Hat Enterprise Linux (RHEL) 8 (64 bit)
Red Hat Enterprise Linux (RHEL) 9 (64 bit)
Amazon Linux 2


Backend database (DBMS):
Microsoft SQL Server 2017 (with cluster support)
Microsoft SQL Server 2019 (with cluster support)
Microsoft SQL Server 2022 (with cluster support)
Oracle 19c (with cluster support)
Oracle 21c (with cluster support)
PostgreSQL 11–18
Apache Derby 10.9–10.14
Amazon Aurora PostgreSQL (compatible with PostgreSQL 11–18)
Azure SQL Managed Instance

Regular support for Apache Derby has expired. The support for Apache Derby will end in a later UMS version.
	See also: https://kb.igel.com/en/igel-subscription-and-more/current/support-policies-for-connections-to-third-party-en


Browser:
Microsoft Edge 151.0+
Mozilla Firefox 154.0+
Google Chrome 151.0+


=============================================================================
Resolved issues:
=============================================================================

[Automatic License Deployment (ALD)] 
- Fixed: Add-on licenses were not automatically deployed when a device was in certain license states.
  Note: If you have used the "Deploy/Exchange device licenses" administrative task as a workaround for the issue with deploying add-on licenses and wish to continue running the task regularly, 
  it is recommended—for performance reasons—to run it no more frequently than every few hours, rather than every few minutes. 


=============================================================================