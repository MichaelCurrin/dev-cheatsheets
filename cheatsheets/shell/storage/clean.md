---
title: Clean
description:  Common approaches to clearing space on your machine
---

Sources:

- [5 ways to free up space on Ubuntu](https://www.omgubuntu.co.uk/2016/08/5-ways-free-up-space-on-ubuntu)
- [Free up space on Ubuntu](https://itsfoss.com/free-up-space-ubuntu-linux/)

## Temporary files

### Clear tmp directory

```sh
$ rm -rf /tmp/*
```

### Delete cache

On macOS:

```sh
$ rm -rf ~/Library/Caches/*
```

On macOS and Linux:

```sh
$ rm -rf ~/.cache/*
```

### Delete logs

Just the zip files.

On macOS:

```sh
rm -f /private/var/log/*.{bz2,gz}
```

### Remove thumbnails

Linux:

```sh
$ du -sh ~/.cache/thumbnails
818M    /home/michael/.cache/thumbnails
```

```sh
$ rm -rf ~/.cache/thumbnails/*
```


## APT

For Debian/Ubuntu.

### Remove cache

[Essential Guide: 5 Simple Ways To Free Up Space on Ubuntu](https://www.omgubuntu.co.uk/2016/08/5-ways-free-up-space-on-ubuntu)

```sh
$ sudo apt-get clean
```

Check size of archives. This dropped to `184K` after running `clean` above.

```sh
$ sudo du -sh /var/cache/apt/archives
1.8G    /var/cache/apt/archives
```

### Remove unused packages

```sh
$ sudo apt-get autoremove
```

### Remove packages by name

```sh
$ sudo apt-get remove package-name1 package-name2
```
