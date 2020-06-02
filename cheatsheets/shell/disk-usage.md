# Disk usage


## Flags

- `-h` - human readable.
- `-s` - summary.


## Path

Path can be empty or `.` for current directory.

Use a specific directory.

Or user directory or root.

Use a star to cover all the directories at a level.


## User

Summary.

```sh
$ du -sh ~
```

Breakdown by top-level directories.

```sh
$ du -h ~/*
```


## Whole machine


Summary.

```sh
$ sudo du -sh /
99G
```

Breakdown by top-level directories.

```sh
$ sudo du -h /*
0       /bin
96M     /boot
4.0K    /dev
13M     /etc
...
```





