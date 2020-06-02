# Disk usage command

```
du - estimate file space usage

SYNOPSIS
du [OPTION]... [FILE]...
```

See `man du`.


## Flags

- `-h --human-readable` - Show human readable format.
- `--si` - Like `-h`, but use powers of 1000 not 1024.
- `-c` - Add a summary total to the bottom of the output.
- `-s, --summarize` - Show only a total. Same as setting depth to zero. Using `-c` and `-s` together is not worthwhile.
- `-d, --max-depth=N`- set number of levels.
- `-a, --all` - write counts for all files, not just directories.
- `--time` - Add last modified time.
- `--exclude=PATTERN` - Exclude files that match pattern. e.g. `--exclude="*.txt"`


## Path

Path can be empty or `.` for current directory.

Use a specific directory.

Or user directory or root.

Use a star to cover all the directories at a level.


## General-purpose


### One-line total for current level

```sh
df -sh
```

### Breakdown of folders at a current level with summary total

Depth of zero.

```sh
df -shc *
```

### Specify depth

```sh
df -h -d 1
```


## User

Summary of home.

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


## Detailed

Find largest files/directories starting from root directory.

```sh
$ cd /
```

```sh
$ sudo du -s -h *
```

Then focus with `cd`.

```
$ cd snap
$ sudo du -sh *
```

Or replacing the path.

```sh
$ sudo du -sh snap/*
4.0K    snap/bin
1.2G    snap/code
531M    snap/core
4.0K    snap/README
```
