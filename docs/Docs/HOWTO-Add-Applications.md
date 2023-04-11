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

## OS12 App Portal (Coming 18 April)

-----

## OS12 App SDK (Coming 18 April)

-----

## Do you have a UD Pocket with IGEL OS 12 from Disrupt?

Here are some steps to try out until 18 April GA

Steps to test out your UDPocket

- Boot device
- Skip -- Let's connect to the company network
- Skip -- Use the one-time password to onboard this device?
- Obtain IGEL OS 12 Evaluation License -- Are you implementing as IGEL solution for your company? (This is 90 a day day evaluation license)
- Reboot
- Open a Terminal Window as root (add terminal session from setup)
- Register device in my personal UMS: rmagent-register -s 73.98.126.35 -p 8443 -a TRY-IGEL 
- List packages to install: igelpkgctl list
- Install lastest Chromium: igelpkgctl install $(igelpkgctl list | grep chromium- | tail -1)
- Open Setup to add a Chromium session

[Options for igelpkgctl](https://igel-community.github.io/IGEL-Docs-v02/Docs/Cheatsheet-IGELCommunity/?h=igelpkgctl#igelos-12-packages-igelpkgctl)

If you need to reset device then direct message on IGEL Community on Slack (`@Ron Neher - IGEL`) about the device (IGEL ABOUT) and I will delete it.

Then you can reset device and add it back in:

Run the following command as root in terminal window:

mount -o remount,rw /license && rm -rf /license/dsa/licenses/*.lic && reset_to_defaults && reboot

-----

**NOTE:** Can also be used to test out OS12 without a UMS12.

-----
