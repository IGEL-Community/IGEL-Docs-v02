# HOWTO COSMOS

## [IGEL KB - How to Start with IGEL COSMOS](https://kb.igel.com/howtocosmos/en/how-to-start-with-igel-cosmos-77865726.html)

-----
-----

## FAQ - UMS

**Q:** We noticed that UMS 6 is no longer listed on [IGEL download site](https://www.igel.com/software-downloads/workspace-edition/). We are not ready to move to UMS 12.

**A:** UMS 12 is the next version of UMS 6.x.x and supports OS 11 only environments as well as mixed OS 11 / OS 12 environments.

**Q:** How to see the App Portal from Web App? I upgraded from UMS6 to UMS12 and cannot see the App Portal.

**A:** Open `UMS Console` and add `General - WebApp > App Management > Allow`  permission to account(s). Steps:

  - Start `UMS Console`
  - Select `System` > `Administrator accounts`
  - Select Administrator account
  - `Edit`
  - `General - WebApp` select `Allow`

  ![image-howto-cosmos-01](Images/HOWTO-COSMOS-01.png)

**Q:** Trying to connect OS12 to UMS using the one-time password method but I get this message: `could not manage your device because of an internal error (#45)`.

**A:** You may have to create a new endpoint web certificate that has all the IP addresses, Fully Qualified Domain Names, and short names that the device can connect to. Steps:

  - Start `UMS Console`
  - Open `UMS Administration`
  - Select `Global Configuration` > `Certificate Management` > `Web`
  - Add new endpoint web certificate with all the IP addresses, fully qualified domain names (FQDN), and short names that the device can connect to

  ![image-howto-cosmos-02](Images/HOWTO-COSMOS-02.png)

-----

## FAQ - OS 12

**Q:** I want to quickly test out OS 12. What are the steps to test?

**A:** See the following note: [Want to test out OS 12 with App Portal without UMS 12](https://igel-community.github.io/IGEL-Docs-v02/Docs/HOWTO-Add-Applications/#want-to-test-out-os12-with-app-portal-without-ums12)

**Q:** I'm testing OS 12 and want to reset a device and remove trial license. How do I do that?

**A:** See the following note:  [How to reset a device](https://igel-community.github.io/IGEL-Docs-v02/Docs/HOWTO-Add-Applications/#optional-how-to-reset-a-device)

**Q:** How do I update an OS 11 device to OS 12?

**A:** Currently OS 11 to OS 12 is a re-install. Upgrade from OS 11 to OS 12 will be availiable in the Fall - 2023.

-----

## FAQ - ICG 12

**Q:** Is ICG 12 needed with UMS 12 for OS 12 devices not on the same network as the UMS 12?

**A:** That depends on if your security team will allow UMS 12 on port 8443 to be opened to the Internet. Since most companies will not allow UMS 12 (Windows or Linux) to have port 8443 opened to the Internet, an ICG 12 will be needed to support OS 12 devices. Similar sizing guidelines for ICG 12 (setting connection limit to 2K / 2.5K devices). See [ICG 12 KB](https://kb.igel.com/igelicg-12.01/en/igel-cloud-gateway-icg-81512143.html).

**Q:** Does ICG 12 support OS 11 devices?

**A:** Yes!