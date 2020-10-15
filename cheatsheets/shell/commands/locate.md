---
description: Utility to search for files or folders my name
---
# locate


The `locate` command is an efficient way of searching a database which lists the files and folders on your machine. The DB is updatedly nightly for you.

SEe [article](https://www.bonusbits.com/wiki/HowTo:Install_Locate_on_MacOS_with_Homebrew)


## Help

From [manpage](https://man7.org/linux/man-pages/man1/locate.1.html) for Linux.

Official descripton:

> locate - list files in databases that match a pattern


## Setup

### Install

```sh
$ brew install findutils
```

Note that locate database (`/var/db/locate.database`) will not exist.

### Configure

To create the database, run the following command:

```sh
$ sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist
```


## Usage

```sh
$ locate 'search terms'
```

e.g.

```sh
$ locate .py | head
```
