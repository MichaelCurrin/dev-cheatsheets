---
title: du
description: Disk usage shell command
---

## API

From man page:

```sh
NAME
     du -- display disk usage statistics

SYNOPSIS
     du [-H | -L | -P] [-a | -s | -d depth] [-c] [-h | -k | -m | -g] [-x] [-I mask] [file ...]

```

Generalized:

```
du [FLAGS] [PATH]
```

## Flags

```
[-a | -s | -d depth]

      -a      Display an entry for each file in a file hierarchy.
      
      -c      Display a grand total.
      
      -s      Display an entry for each specified file.  (Equivalent to -d 0)
      -d depth
             Display an entry for all files and directories depth directories deep.

      -h      "Human-readable" output.  Use unit suffixes: Byte, Kilobyte, Megabyte, Gigabyte, Terabyte and Petabyte.
```


## Examples 

You'll probably want to use `-h` most of the time.

```sh
du -h
du -h .
du -h *
du -h 
```

Depth of one.

```sh
$ du -h -d 1
100K    ./bin
4.0K    ./docs
4.0K    ./hooks
112K    ./configs
3.3M    ./.git
4.0K    ./.vscode
3.5M    .

$ du -d 1
200     ./bin
8       ./docs
8       ./hooks
224     ./configs
6752    ./.git
8       ./.vscode
7256    .
```

Depth of zero but using glob to match files and folders at current level. This is similar to using depth of 1 above but this flow includes files (without having to use `-a` and excludes hidden directories.

```
du -h -s *
4.0K    LICENSE
4.0K    Makefile
4.0K    README.md
4.0K    TODO
100K    bin
112K    configs
4.0K    docs
4.0K    hooks
4.0K    setup_configs.sh
```

```sh
$ du -s
3.5M    .
```

Sort by human readable size properly and with biggest first:

```sh
du -h | sort -h -r
```
