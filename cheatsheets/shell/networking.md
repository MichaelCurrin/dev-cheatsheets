# Networking


## Get current IP address

```sh
$ hostname -I
```

### ip command

From [tutorial](https://www.howtogeek.com/657911/how-to-use-the-ip-command-on-linux/). That explains what the output means.

Use one of these equivalent commands.

```sh
$ ip address show
$ ip addr show
$ ip addr
$ ip a
```

To lookup for specific network:

```sh
$ ip addr show dev lo
$ ip addr show dev enp0s3
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
