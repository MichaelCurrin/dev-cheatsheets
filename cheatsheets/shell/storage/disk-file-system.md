# Disk file system command


```
NAME
       df - report file system disk space usage

SYNOPSIS
       df [OPTION]... [FILE]...
```

See `man df`.

Shows storage on disk by mount point (partions, hard drives, external media) and shows a percent usage. This can give a wider picture than `du` command.

See [answer](https://unix.stackexchange.com/questions/64815/how-to-print-the-percentage-of-disk-use-from-df-hl/64840) on Unix Stack Exchange site.


## Flags

- `-h, --human-readable` - Print sizes in powers of 1024 (e.g., 1023M)
- `-H, --si` - Print sizes in powers of 1000 (e.g., 1.1G)


## Total

Total for all local mounts:

```sh
$ df --total -hl
```

```sh
$ df -hl --total PATH_A PATH_B
```

## All

If the mount for `/` path is close to 100% then you'll errors running your machine.

This does not need root privileges.

```sh
$ df -h
Filesystem                Size  Used Avail Use% Mounted on
udev                      3.9G     0  3.9G   0% /dev
tmpfs                     790M   26M  764M   4% /run
/dev/sda7                  19G   17G  1.1G  94% /
tmpfs                     3.9G   73M  3.8G   2% /dev/shm
...
```

## Path

```sh
$ df -h ~
```

```sh
$ df -h / ~
Filesystem            Size  Used Avail Use% Mounted on
/dev/sda7              19G   17G  1.1G  94% /
/dev/mapper/vg0-home   98G   41G   53G  44% /home
```


## Types

Add `-T` to show type.

e.g. `ext4`, `tmpfs`, `vfat`.

If you want to list all mounts except the ‘special’ ones, you can use the -x option to exclude by partition type.

```sh
alias my-df='df -h -x devtmpfs -x tmpfs -x debugfs'
```
