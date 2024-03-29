# HOWTO ICG Free Signed Certificate Option

**NOTE:** [HOWTO Certificates](HOWTO-Certificates.md)

## Recommendation for a Free Signed Certificate for ICG Testing

**NOTE:** This article provides a solution that has not been approved by the IGEL Research and Development department. Therefore, official support cannot be provided by IGEL.

## Overview

This article addresses the issue when the customers need a signed cert for testing / lab environment, but don’t want to use the UMS as CA. This should not be considered a solution for production environment because certificates expire every 3 months and there is no automated way to update them in UMS / ICG.

You can use "letsencrypt" as a CA for quickly and easily grabbing a FREE certificate for your ICG server (or for any server where you need a signed cert) testing / lab work. At this point, LetsEncrypt is trusted by all the browsers and it has a completely automated process for initially retrieving a new singed cert and also for renewing.

## Environment

- UMS version: any

## Instructions

[Certbot Instructions](https://certbot.eff.org/instructions?ws=apache&os=ubuntufocal)

**NOTES: Summary**

- Start up a Linux VM with OS same as your ICG server.

- Open up incoming port 80 (temporarily) on your server firewall to allow for automated verification that you control the domain (see below).

- Choose "spin up a temporary web server" (this is used for let's encrypt to fetch a page and verify that you control the domain).

- Enter your domain names (separated by a comma) that you want to create a cert for and press "enter".

- Finish the remaining questions.

- If all was successful, you'll find your server certificate (`cert1.pema`), root CA Chain (`chain1.pem`), and private key (`privkey1.pem`) in the `/etc/letsencrypt/archive/<your domain name>` folder.

- These files are all ready and in the right format to add to UMS and create your keystore.icg file.
