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
- `-s, --summarize` - Show only a total. Same as setting depth to zero.
- `-d, --max-depth=N`- set number of levels.
- `-a, --all` - write counts for all files, not just directories.
- `--time` - Add last modified time.
- `--exclude=PATTERN` - Exclude files that match pattern. e.g. `--exclude="*.txt"`


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
