# Clean

Common approaches to clearing space on your machine.

## Temp

```sh
$ rm -rf /tmp/*
```

## APT cache

[Essential Guide: 5 Simple Ways To Free Up Space on Ubuntu](https://www.omgubuntu.co.uk/2016/08/5-ways-free-up-space-on-ubuntu)


```sh
$ sudo apt-get clean
```

Check size of archives. This dropped to `184K` after running `clean` above.

```sh
$ sudo du -sh /var/cache/apt/archives
1.8G    /var/cache/apt/archives
```
