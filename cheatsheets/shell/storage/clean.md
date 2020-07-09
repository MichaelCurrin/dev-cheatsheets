---
title: Clean
---

Common approaches to clearing space on your machine.

- [source](https://www.omgubuntu.co.uk/2016/08/5-ways-free-up-space-on-ubuntu)
- [source](https://itsfoss.com/free-up-space-ubuntu-linux/)


## Temporary files

### Clear tmp directory

```sh
$ rm -rf /tmp/*
```

### Thumbnails

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
