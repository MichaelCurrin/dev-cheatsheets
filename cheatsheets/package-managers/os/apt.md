---
title: apt
description: The OS package manager for Debian- and Ubuntu-based Linux systems
---


See [APT manpage](https://manpages.ubuntu.com/manpages/trusty/man8/apt.8.html) on Ubuntu docs.

Note that `apt` is a more modern version of `apt-get`. They are separate packages and commands are mostly the same. See also `aptitude` command for a GUI.

See also my [os-genesis](https://github.com/MichaelCurrin/os-genesis/tree/master/genesis) repo's script, which deal with APT.


## Help

```sh
$ sudo apt -h
```
```
Usage: apt [options] command

apt is a commandline package manager and provides commands for
searching and managing as well as querying information about packages.
It provides the same functionality as the specialized APT tools,
like apt-get and apt-cache, but enables options more suitable for
interactive use by default.

Most used commands:
  list - list packages based on package names
  search - search in package descriptions
  show - show package details
  install - install packages
  reinstall - reinstall packages
  remove - remove packages
  autoremove - Remove automatically all unused packages
  update - update list of available packages
  upgrade - upgrade the system by installing/upgrading packages
  full-upgrade - upgrade the system by removing/installing/upgrading packages
  edit-sources - edit the source information file
  satisfy - satisfy dependency strings
...
```


## Manage packages

Specify one or more packages by name (separated by spaces).

### Install or upgrade package

Use the same command to install a package or upgrade an existing package.

```sh
$ sudo apt install PACKAGE
```

e.g.

```sh
$ sudo apt install bar
```

### Remove package

```sh
$ sudo apt remove PACKAGE
```


## Upgrade all packages

```sh
$ sudo apt upgrade
```

Note that `apt upgrade PACKAGE` will **not** target a single package.


## Autoremove

Uninstall packages no longer needed.

```sh
$ sudo apt autoremove
```


## All

This is useful for a Dockerfile:

```ah
apt update 
  && apt -y upgrade

apt install -y foo

apt autoremove \
  && apt clean
```


## Sources

### Add

Copy instructions from the relevant documentation. Some examples below.

- Based on the [PGAdmin](https://www.pgadmin.org/download/pgadmin-4-apt/) instructions:
    ```sh
    $ sudo sh -c 'echo "deb URL PACKAGE_NAME main" > /etc/apt/sources.list.d/PACKAGE_NAME.list && apt update'
    ```
- Based on the [Node](https://nodejs.org/en/download/package-manager/) instructions.
    ```sh
    $ curl -sL "URL/VERSION" | sudo -E bash -
    ```



### Edit

You might want to remove or update a source if you get errors or no longer need something.

```sh
$ cd /etc/apt/sources.d
```

Files:

```
nodesource.list
official-package-repositories.list
pgadmin4.list
slack.list
vscode.list
```
