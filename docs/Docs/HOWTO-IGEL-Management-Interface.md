# HOWTO IGEL Management Interface (IMI)

IGEL Management Interface (IMI) enables you to connect UMS to systems management tools. It is a programming interface that can create and delete thin clients, move them between directories, reboot them and much more. Its implementation as a REST API makes IMI agnostic of hardware platforms, operating systems and programming languages, thus ensuring maximum interoperability.

-----

## IMI Documentation

- [KB: IGEL Management Interface (IMI)](https://kb.igel.com/igelimi-v2/en/igel-management-interface-imi-4233737.html)

-----

## Powershell IGEL API


PSIGEL is a powershell module that makes use of the REST API provided by the IGEL Management Interface (IMI).

- [IGEL Community on GitHub: PSIGEL](https://github.com/IGEL-Community/PSIGEL/tree/master)

- <a href="https://github.com/IGEL-Community/PSIGEL/archive/refs/heads/master.zip" download>Download PSIGEL from GitHub</a> 

-----

-----

## Sample Scripts

Script using the `curl` command

```bash linenums="1"
#!/bin/bash
set -x
trap read debug

#
# Sample IGEL IMI Commands
#

#
# Variables -- Edit for your UMS configuration
#

IGEL_Account="account:password"
IGEL_URL="https://igel-server-name:8443"

#
# Get IGEL Cookie header
#

COOKIEHDR=`curl --insecure --request POST --user "$IGEL_Account" $IGEL_URL/umsapi/v3/login | cut -c 13-99 | sed s/\"}$//`


# Get Asset Information

curl --insecure --request GET --header "Cookie: $COOKIEHDR" $IGEL_URL/umsapi/v3/assetinfo

# Get Asset Information for device id 64721 (replace with a valid ID)

#curl --insecure --request GET --header "Cookie: $COOKIEHDR" $IGEL_URL/umsapi/v3/thinclients/64721
#curl --insecure --request GET --header "Cookie: $COOKIEHDR" $IGEL_URL/umsapi/v3/thinclients/64721?facets=details

# Get Profile

curl --insecure --request GET --header "Cookie: $COOKIEHDR" $IGEL_URL/umsapi/v2/profiles

# Get Master Profile

curl --insecure --request GET --header "Cookie: $COOKIEHDR" $IGEL_URL/umsapi/v3/masterprofiles

# Get Thin Client Directory

curl --insecure --request GET --header "Cookie: $COOKIEHDR" $IGEL_URL/umsapi/v3/directories/tcdirectories

# Get Profile Directory

curl --insecure --request GET --header "Cookie: $COOKIEHDR" $IGEL_URL/umsapi/v3/directories/profiledirectories

# Get Firmware

curl --insecure --request GET --header "Cookie: $COOKIEHDR" $IGEL_URL/umsapi/v3/firmwares

# Get Server Status

curl --insecure --request GET --header "Cookie: COOKIEHDR" $IGEL_URL/umsapi/v3/serverstatus

# Logout

curl --insecure --request POST --header "Cookie: $COOKIEHDR" $IGEL_URL/umsapi/v3/logout
```