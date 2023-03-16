# HOWTO Zero Trust Networking

-----
## Zero Trust?

Zero Trust provides a security model to adapt to the complexity of working anywhere.

## Zscaler Client Connector

Using [Zscaler Client Connector](https://github.com/IGEL-Community/IGEL-Custom-Partitions/tree/master/CP_Source/Network/Zscaler_Client), users can get all of the benefits of the Zscaler service for Internet traffic, as well as granular, policy-based access to internal resources from a single point.

- With Zscaler Client Connector's Internet Security feature, you can protect your users' web traffic even when they are outside your corporate network. You can also protect your users’ mobile traffic, whether they’re connected to Wi-Fi or cellular networks. The app forwards user traffic to the Zscaler service and ensures that your organization's security and access policies are enforced wherever they might be accessing the internet.

- With Zscaler Private Access (ZPA), you can enable your users to securely access enterprise applications from outside the corporate network. ZPA establishes a secure transport for accessing your enterprise apps and services.

- With Zscaler Digital Experience (ZDX), you can monitor your organization’s user devices to detect user experience and productivity issues. ZDX relies on Zscaler Client Connector to perform synthetic probing to a desired Software-as-a-Service (SaaS) application or internet-based service (e.g., OneDrive, Gmail, etc.).

-----

## Tailscale VPN

[Tailscale](https://github.com/IGEL-Community/IGEL-Custom-Partitions/tree/master/CP_Source/Network/Tailscale_VPN) creates end-to-end encrypted mesh connections directly between users and services, avoiding the need for central concentrators. It offers direct IP-based connectivity, but prevents lateral movement through centrally-controlled packet filters running on each node.

-----

## Additional Notes

### [Zscaler vs. Tailscale (Blog post from Tailscale)](https://tailscale.com/compare/zscaler/)
