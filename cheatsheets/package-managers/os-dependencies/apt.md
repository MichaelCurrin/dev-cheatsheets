---
title: APT
description: The OS package manager for Debian- and Ubuntu-based Linux systems
---


See [APT manpage](https://manpages.ubuntu.com/manpages/trusty/man8/apt.8.html) on Ubuntu docs.

Note that `apt` is a more modern version of `apt-get`. They are separate packages and commands are mostly the safe. See also `aptitude` command for a GUI.

You should use the `sudo` prefix for all the commands here, unless you are root. Some installs will fail without root privileges.

See also my [os-genesis](https://github.com/MichaelCurrin/os-genesis/tree/master/genesis) repo's script which deal with APT.


## Manage package

Specify one or more packages by name (separated by spaces).

### Install package

```sh
$ apt install PACKAGE
```

e.g.

```sh
$ apt foo bar
```

### Upgrade package

```sh
$ apt upgrade PACKAGE
```

### Remove package

```sh
$ apt remove PACKAGE
```



## Update all packages

```sh
$ apt update
```
