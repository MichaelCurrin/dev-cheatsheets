# Services

Set up a service to start now and then start up whenever you boot the machine. This uses `launchd`.

## Example 

Sample instructions given when installing `dnsmasq`.

To have `launchd` start `dnsmasq` now and restart at startup:

```sh
$ sudo brew services start dnsmasq
```
