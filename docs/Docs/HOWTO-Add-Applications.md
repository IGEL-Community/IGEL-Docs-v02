# HOWTO Add Applications

-----

## OS11 & OS12 Via Custom Partitions

[IGEL Community on GitHub - Custom Partitions](https://github.com/IGEL-Community/IGEL-Custom-Partitions)

Sample OS11 Profiles to test some of the most common Custom Partitions created by the automated builder scripts on GitHub link above.

| Application | Profile |
|-------------|---------|
| Chrome | <a href="../Profiles/HOWTO-Add-Application-Chrome-CP-profile.xml" download>LINK to Profile</a> |
| Frame | <a href="../Profiles/HOWTO-Add-Application-Frame-CP-profile.xml" download>LINK to Profile</a> |
| LibreOffice | <a href="../Profiles/HOWTO-Add-Application-LibreOffice-CP-profile.xml" download>LINK to Profile</a> |
| Microsoft Edge | <a href="../Profiles/HOWTO-Add-Application-Microsoft-Edge-CP-profile.xml" download>LINK to Profile</a> |
| VLC | <a href="../Profiles/HOWTO-Add-Application-VLC-CP-profile.xml" download>LINK to Profile</a> |
| Webex | <a href="../Profiles/HOWTO-Add-Application-Webex-CP-profile.xml" download>LINK to Profile</a> |
| Zoom | <a href="../Profiles/HOWTO-Add-Application-Zoom-CP-profile.xml" download>LINK to Profile</a> |

### IGEL Disclaimer

The provided packages for use with the IGEL OS Custom Partition feature are without any warranty or support by IGEL Technology.

The files are not designed for production usage, use at your own risk. IGEL Technology will not provide any packages for production use and will not create or support any other packages or the implementation for other 3rd party software.

IGEL Technology is not responsible for any license violation created with the custom partition technology or the provided technical demonstation packages.

The custom partition technology can create a permanent damage in the IGEL OS host system, services related to the wrong usage/misinstallation of a custom partition and/or the deployed packages are not covered by the warranty in any kind.

You will not get support as long the custom partition is used on a system, to avoid conflicts you've to reset the device back to factory defaults before opening a support call.

All packages are designed as technical demonstration samples!

Use at your own risk! 

-----

## [OS12 App Portal](https://kb.igel.com/howtocosmos/en/igel-app-portal-77865794.html)

- With IGEL OS 12, the modular principle is introduced – you can install and update single applications like Citrix or AVD client, Chromium browser, etc. individually. All applications currently available for IGEL OS 12 can be found in the IGEL App Portal. 

-----

## OS12 App SDK (Coming soon)

- Build your own IGEL OS App with IGEL OS App SDK

-----

## Do you have a UD Pocket with IGEL OS 12 from Disrupt?

## Want to test out OS12 with App Portal without UMS12?

Here are some steps to try out

Steps to test out your UDPocket or OS12 installed device

- Boot device
- Skip -- Let's connect to the company network
- Skip -- Use the one-time password to onboard this device?
- Obtain IGEL OS 12 Evaluation License -- Are you implementing as IGEL solution for your company? (This is 90 a day day evaluation license)
- Reboot
- Open the App Portal and install applications

### Optional - Use igelpkgctl command line

- Open a Terminal Window as root (add terminal session from setup)

- List packages to install:

```bash linenums="1"
igelpkgctl list
```

- Update to latest version of IGEL OS

```bash linenums="1"
igelpkgctl install base_system
```

- Install lastest AVD client:

```bash linenums="1"
igelpkgctl install avd
```

- Open Setup to add a AVD session: ++ctrl+alt+s++ 

- Install lastest Chromium client:

```bash linenums="1"
igelpkgctl install chromium
```

- Open Setup to add a Chromium session: ++ctrl+alt+s++ 

[Options for igelpkgctl](https://igel-community.github.io/IGEL-Docs-v02/Docs/Cheatsheet-IGELCommunity/?h=igelpkgctl#igelos-12-packages-igelpkgctl)


### Optional - How to reset a device

Run the following command as root in terminal window:

```bash linenums="1"
mount -o remount,rw /license && rm -rf /license/dsa/licenses/*.lic && reset_to_defaults && reboot
```
Or (new command with OS12 - `delete_igel_licenses ALL`)
```bash linenums="1"
delete_igel_licenses ALL && reset_to_defaults && reboot
```
