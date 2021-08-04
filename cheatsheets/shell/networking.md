# Networking


## Get current IP address

```sh
$ hostname -I
```

### ip command

Linux only, not macOS.

From [tutorial](https://www.howtogeek.com/657911/how-to-use-the-ip-command-on-linux/). That explains what the output means.

Use one of these equivalent commands.

```sh
$ ip address show
$ ip addr show
$ ip addr
$ ip a
```

To look-up for specific network:

```sh
$ ip addr show dev lo
$ ip addr show dev enp0s3
```

### ifconfig

On Linux and macOS.

```sh
$ ifconfig en0
```
```
en0: flags=8863<UP,BROADCAST,SMART,RUNNING,SIMPLEX,MULTICAST> mtu 1500
	options=400<CHANNEL_IO>
	ether 88:e9:fe:57:a8:6b
	inet6 fe80::1c4a:70f:5ec6:fb68%en0 prefixlen 64 secured scopeid 0x5
	inet 192.168.0.161 netmask 0xffffff00 broadcast 192.168.0.255
	nd6 options=201<PERFORMNUD,DAD>
	media: autoselect
	status: active
```


## Routes

See IP routes on your machine.

```sh
$ ip route
```


## Check connection

Request an address every second.

This is useful to check an IP on your network.

```sh
$ ping 192.168.4.44
```

Or that a site is reachable.

```sh
$ ping https://google.com
```


## Understanding IP address ranges

Any machine can connect to the host.

```
0.0.0.0
```

Maximum values.

```
255.255.255.255
```

Address of your machine.

```
127.0.0.1
localhost
[::]
```

Typical address of your router.

```
192.168.0.1
192.168.8.1
```

When configuring, you'll see slash notation at the end of an IP range.

It is the number of bits allowed that are fixed - 24, 8 or 16.

The `/24` here indicates that the first 24 bits are part of the network address (`192.168.10`) leaving only the remaining `8` bits able to be changed for specific host addresses (`0-254`).

IP | Range | Description
--- | --- | ---
`10.0.0.0/24` | `10.0.0.1` – `10.0.0.254` | Can assign the last number
`10.0.0.0/16` | `10.0.0.1` – `10.0.255.254` | Can assign the last two numbers
`10.0.0.0/8` | `10.0.0.1` – `10.255.255.254` | Can assign the last three numbers

The limits are short for octet masks which are applied. Note a mask is inverted so 255 becomes 0 and means the octet can only be 0 and if the mask is 0 then it means the max is 255 so you have `0-255`.

Short | Subnet mask | Total IP addresses
--- | --- | ---
`/32` | `255.255.255.255` | 1
`/24` | `255.255.255.0` | 256
`/16` | `255.255.0.0` | 65,536
`/8`  | `255.0.0.0` | 16,777,216

See this [table](https://docs.netgate.com/pfsense/en/latest/network/cidr.html) of subnet masks.
