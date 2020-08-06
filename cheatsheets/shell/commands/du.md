---
title: du
description: Disk usage shell command
---

```
[-a | -s | -d depth]

      -a      Display an entry for each file in a file hierarchy.
      
      -c      Display a grand total.
      
      -s      Display an entry for each specified file.  (Equivalent to -d 0)
      -d depth
             Display an entry for all files and directories depth directories deep.

      -h      "Human-readable" output.  Use unit suffixes: Byte, Kilobyte, Megabyte, Gigabyte, Terabyte and Petabyte.
```

e.g. 

```
du -h -d 1
```

Sort by human readable size properly and with biggest first:

```sh
du -h | sort -h -r
```
