# HOWTO Re-enable TLSv1 and TLSv1.1 on UMS

## Situation

since version 5.08.100 the UMS Server now provide TLSv1.2 only:

> [Server, common]
>
> - Changed: Because of security reasons, the https connector of the UMS Server does now provide TLSv1.2 only.
>

UDLXV4 Devices are not able to use HTTPS Resources on UMS Server anymore.

## Task

re-enable TSLv1 and TLSv1.1 to enable management for UDLXV4 devices on UMS with versions > 5.08.100

## Implementation

(*tested on UMS 5.08.100 - 6.04.120*)

- open `C:\Program Files (x86)\IGEL\RemoteManager\rmguiserver\conf\server.xml`

- change Line 14:

   \- `sslEnabledProtocols="TLSv1.2"`

   \+ `sslEnabledProtocols="TLSv1,TLSv1.1,TLSv1.2"`

- Restart service IGELRMGUIServer
