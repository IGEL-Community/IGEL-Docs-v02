# HOWTO COSMOS

## [IGEL KB - How to Start with IGEL COSMOS](https://kb.igel.com/howtocosmos/en/how-to-start-with-igel-cosmos-77865726.html)

----------

----------

## FAQ - IGEL Education

**Q:** What are the training options for IGEL COSMOS?

**A:** Please enroll in [IGEL Academy](https://www.igel.com/learn-and-connect/igel-education/) for formal training courses on IGEL products geared towards beginners and experienced users alike.

-----

## FAQ - Time Service

**Q:** Do I really have to have the correct time / date on all my computers?

**A:** YES! In SSL, clocks are used for certificate validation. The client needs to make sure that it talks to the right server; for that, the client will validate the server's certificate. Validation implies verifying a lot of things; two of them involve clocks:

  - The server's certificate (and all involved CA certificates) must include the present time in their validity time range. Each certificate as a notBefore and a notAfter fields; the current time must fall between these two dates.
  - The client is supposed to obtain the revocation status of each certificate, by obtaining (and validating) a CRL (Certificate Revocation List) from the appropriate issuers (the CA). A CRL is deemed acceptable if (in particular) it is "not too old": again, the CRL has a thisUpdate field that says when it was produced, and a nextUpdate field that more-or-less serves as expiration date for the CRL.

If the client's clock is off, then it will break either or both of these functionalities. For instance, the server's certificate will be considered as "long expired", or "not usable yet", leading to rejection.

  - OS 12: `Setup > System > Time and Date > Use NTP time server`
  - OS 12: `NTP time server` pool.ntp.org
  - OS 12: Check that time NTP is enabled: `get system.time.ntp_enabled`
  - OS 12: Check NTP time server: `get system.time.ntp_timeserver`

-----

## FAQ - Licensing

**Q:** How do I convert OS 11 licenses to OS 12 licenses?

**A:** No conversion needed. Your normal WE licenses work with OS 12. There is not a specific license type for OS 12.

**Q:** What is needed for UMS 12 to support OS 11 licensing?

**A:** EMP will need to be created from WP licensing.  [Using IGEL OS 11 with Cosmos PAS: Creating an EMP Product Pack from a WE Product Pack](https://kb.igel.com/licensesmore-igelos11/en/using-igel-os-11-with-cosmos-pas-creating-an-emp-product-pack-from-a-we-product-pack-81506422.html)

  - **NOTE:** ~~This is currently only accessible by the primary account users, anyone with Service Provider access will not see this button.~~

**Q:** Can UMS 12 remove licenses in the ILP for deleted OS 12 devices?

**A:** Yes! Details can be found here - [HOWTO Remove IGEL Device License](https://igel-community.github.io/IGEL-Docs-v02/Docs/HOWTO-Remove-IGEL-Device-License/#ums-12)

**Q:** What happens when a license expires?

**A:** Details can be found here - [Entitlements that Come with an IGEL COSMOS Platform Access Subscription (PAS) and Effects of Expiry](https://kb.igel.com/licensesmore-igelos11/en/entitlements-that-come-with-an-igel-cosmos-platform-access-subscription-pas-and-effects-of-expiry-81516637.html)

**Q:** Does UMS 12 support demo license automatic deployment?

**A:** Yes! As of UMS 12, demo licenses for IGEL OS 12 and IGEL OS 11 devices are supported by Automatic License Deployment. [UMS 12 License Deployment](https://kb.igel.com/endpointmgmt-12.01/en/deployment-77865002.html)

-----

## FAQ - UMS


**Q:** We noticed that UMS 6 is no longer listed on [IGEL download site](https://www.igel.com/software-downloads/workspace-edition/). We are not ready to move to UMS 12.

**A:** UMS 12 is the next version of UMS 6.x.x and supports OS 11 only environments as well as mixed OS 11 / OS 12 environments.

**Q:** How are OS 12 profiles created or modified?

**A:** UMS Web App `MUST` be used to create / modify OS 12 profiles.

**Q:** When will proxy mode support for UMS 12 be released?

**A:** As of 3 May, it is still in development and target release date by end of July. The work around for the UMS to access the App Portal is to manually import applications into the UMS.

**Q:** What is feature matrix between UMS Web App and UMS Console?

**A:** Here is link to [Feature Matrix: UMS Web App vs. UMS Console](https://kb.igel.com/endpointmgmt-12.01/en/overview-of-the-igel-ums-81500680.html#Overview-FeatureMatrix:UMSWebAppvs.UMSConsole)

**Q:** How to see the App Portal from Web App? I upgraded from UMS6 to UMS12 and cannot see the App Portal.

**A:** Open `UMS Console` and add `General - WebApp > App Management > Allow`  permission to account(s). Steps:

  - Start `UMS Console`
  - Select `System` > `Administrator accounts`
  - Select Administrator account
  - `Edit`
  - `General - WebApp` select `Allow`

  ![image-howto-cosmos-01](Images/HOWTO-COSMOS-01.png)

**Q:** Trying to connect OS 12 to UMS using the one-time password method but I get this message: `could not manage your device because of an internal error (#45)`.

**A:** You may have to create a new endpoint web certificate that has all the IP addresses, Fully Qualified Domain Names, and short names that the device can connect to. Steps:

  - Start `UMS Console`
  - Open `UMS Administration`
  - Select `Global Configuration` > `Certificate Management` > `Web`
  - Add new endpoint web certificate with all the IP addresses, fully qualified domain names (FQDN), and short names that the device can connect to

  ![image-howto-cosmos-02](Images/HOWTO-COSMOS-02.png)

  **NOTE:** `Web Certificates`

  - The web certificate is used for the web server port (Default port: 8443)
  - This port is used for transferring files to the device, all WebDav actions, interserver communication, the IMI, and the `UMS Web App`.
  - Additional details [Creating the End Certificates ](https://kb.igel.com/endpointmgmt-12.01/en/using-your-own-certificates-for-communication-over-the-web-port-default-8443-77864040.html#UsingYourOwnCertificatesforCommunicationovertheWebPort(Default:8443)-CreatingtheEndCertificates)
  - [Video showing steps to create and enable a new web cert](https://raw.githubusercontent.com/IGEL-Community/IGEL-Docs-v02/main/docs/Docs/videos/HOWTO-COSMOS-New_Web_Cert.mp4)


**Q:** How do I use `rmagent-register` to register OS 12 device to my UMS?

**A:** Follow steps to test `rmagent-register`

  - Start `UMS Console`
  - Open `UMS Administration`
  - Select `Global Configuration` > `First-authentication Keys`
  - Select `(+) `
  - Create `Mass-deployment key` with `First-authentication key` TRY-IGEL

  ![image-howto-cosmos-03](Images/HOWTO-COSMOS-03.png)

  - On IGEL OS 12 open a `Terminal` window as root and type

    ```bash linenums="1"
    rmagent-register -s UMS-SERVER-NAME-OR-IP -p 8443 -a TRY-IGEL
    ```

**Q:** What are the steps to upgrade distributed UMS 6.10 to 12.01 on Windows?

**A:** [Upgrade Distributed UMS from 6.10 to 12.01.110 on Windows Server](https://kb.igel.com/endpointmgmt-12.01/en/known-issues-ums-12-01-110-88023333.html)

**Q:** What can be done to increase performance for UMS?

**A:** Make sure you have met requirements for [RAM and vCPUs](https://kb.igel.com/endpointmgmt-12.01/en/igel-ums-installation-types-diagrams-77864360.html), [performance optimizations](https://kb.igel.com/endpointmgmt-12.01/en/performance-optimizations-77864390.html), and [Java heap size](https://kb.igel.com/endpointmgmt-12.01/en/how-to-configure-java-heap-size-for-the-ums-server-77864106.html).

**Q:** Having issues joining OS 12 devices to UMS 12 server running on Windows 11. How do I debug?

**A:** UMS server is not supported on Windows 11. Please select a supported OS and reinstall UMS. [Supported Environment UMS 12.01.110](https://kb.igel.com/endpointmgmt-12.01/en/supported-environment-ums-12-01-110-81510942.html)

-----

## FAQ - OS 12

**Q:** What are the hardware requirements for OS 12?

**A:** [Requirements for IGEL OS 12](https://kb.igel.com/hardware/en/devices-officially-supported-by-igel-os-12-81496425.html)

**Q:** I want to quickly test out OS 12. What are the steps to test?

**A:** See the following note: [Want to test out OS 12 with App Portal without UMS 12](https://igel-community.github.io/IGEL-Docs-v02/Docs/HOWTO-Add-Applications/#want-to-test-out-os12-with-app-portal-without-ums12)

**Q:** I'm testing OS 12 and want to reset a device and remove trial license. How do I do that?

**A:** See the following note:  [How to reset a device](https://igel-community.github.io/IGEL-Docs-v02/Docs/HOWTO-Add-Applications/#optional-how-to-reset-a-device)

**Q:** How do I update an OS 11 device to OS 12?

**A:** Currently OS 11 to OS 12 is a re-install. Upgrade from OS 11 to OS 12 will be availiable in the Fall - 2023.

**Q:** When will Citrix username / password auto login support in cloud environment be supported?

**A:** As of May 10, this is being worked on with Citrix. Date pending for release.

**Q:** When using the first-time auth key to connect OS 12 to the UMS 12 it asks for a `communication token` - where is this found? 

![image-howto-cosmos-04](Images/HOWTO-COSMOS-04.png)

**A:** This is only shown if a public certificate is not used. It is the third fingerprint of the root web certificate for your UMS 12. Details can be found in [Deploying a Certificate Chain with a Public Root CA](https://kb.igel.com/endpointmgmt-12.01/en/using-your-own-certificates-for-communication-over-the-web-port-default-8443-77864040.html#UsingYourOwnCertificatesforCommunicationovertheWebPort(Default:8443)-DeployingaCertificateChainwithaPublicRootCADeployingaCertificateChainwithaPublicRootCA)

![image-howto-cosmos-05](Images/HOWTO-COSMOS-05.png)

**Q:** OS 12 missing `System > System Customization > Custom Commands > Post Session`. Need to `logoff/reboot` the endpoint when a user disconnects from a Citrix Self-Service session. When will this feature be released?

**A:** Not currently implemented in OS 12. Do not have a date from IGEL. Please vote for this [feature request](https://igel.nolt.io/widget/202)

-----

## FAQ - ICG 12

**Q:** Is ICG 12 needed with UMS 12 for OS 12 devices not on the same network as the UMS 12?

**A:** That depends on if your security team will allow UMS 12 on port 8443 to be opened to the Internet or connected to internet via load balancer with SSL pass through (such as F5 / NetScaler / Azure Application Gateway with end to end SSL/TLS encryption and WebSocket support) that forwards encrypted SSL traffic to the UMS without decryption. If the above options cannot be met, an ICG 12 will be needed to support OS 12 devices. Similar sizing guidelines for ICG 12 (setting connection limit to 2K / 2.5K devices). See [ICG 12 KB](https://kb.igel.com/igelicg-12.01/en/igel-cloud-gateway-icg-81512143.html).

**Q:** Does ICG 12 support OS 11 devices?

**A:** Yes!

**Q:** I upgraded my UMS and ICG to 12 and I am now getting `Could not manage your device because of an internal error (#37)` when trying to connect OS 12 devices. What are the steps to fix this item?

**A:** Remove the cert chain from UMS completely, reboot the ICG's and then reconnect to them from UMS.  ~~Generate a new ICG certificate in UMS 12.~~

**Q:** IGEL OS devices are reconnecting to ICG 12.01.100 every 30 minutes. How can this be fixed?

**A:** Details on fix can be found here: [Configuration of Unlimited Session Timeout for ICG 12.01.100](https://kb.igel.com/igelicg-12.01/en/known-issues-configuration-of-unlimited-session-timeout-for-icg-12-01-100-88016384.html)

-----

## FAQ - Onboarding Service (OBS)

**Q:** What are the steps to setup OBS?

**A:** [Initial Configuration of the IGEL Onboarding Service (OBS)](https://kb.igel.com/howtocosmos/en/initial-configuration-of-the-igel-onboarding-service-obs-77865754.html)

**Q:** What are the steps to onboard an OS 12 device?

**A:** [Onboarding IGEL OS 12 Devices](https://kb.igel.com/howtocosmos/en/onboarding-igel-os-12-devices-77865898.html)

**Q:** What is the OBS sequence for registering an OS 12 device?

**A:** Here is the sequence.

```mermaid
sequenceDiagram
  participant A as IGEL OS 12
  participant B as UMS 12
  participant C as OBS
  participant D as Service Hub
  participant E as Customer IDP (AAD, Okta, Ping Identity)
  A->>C: 1 - Request Onboarding Params from email
  C->>D: 2 - Request IDP from email
  D->>C: 3 - Respond with IDP Credentials
  C->>E: 4 - oAuthLogin on IDP
  E->>C: 5 - ID Token
  C->>D: 6 - Request OBS Params
  D->>C: 7 - Respond with OBS Params
  C->>A: 8 - Send OBS Params to IGEL OS
  A->>B: 9 - Initiate Onboarding
```

**Q:** How to test OBS connection?

**A:** Open web browser and connect to `https://obs.services.igel.com/auth/user@domain.com`. Use the browser developer tools to look at returned content. Here is link to [Chrome DevTools](https://developer.chrome.com/docs/devtools/)

**Q:** What do the error codes from onboarding mean?

**A:** [Troubleshooting: Possible Error Codes During the Onboarding](https://kb.igel.com/howtocosmos/en/onboarding-igel-os-12-devices-77865898.html#OnboardingIGELOS12Devices-Troubleshooting:PossibleErrorCodesDuringtheOnboarding)

-----

## FAQ - Microsoft AVD

**Q:** How to pass Microsoft Excel keyboard shortcut keys?

**A:** [Microsoft Excel keyboard shortcut keys](https://www.computerhope.com/shortcut/excel.htm) can be passed to AVD session by enabling `System > app > avd > avd% > options > remote-keymapping`. In OS 11 (11.08.330) `System > Registry > sessions.wvd%.options.remote-keymapping`