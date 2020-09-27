---
title: rysnc
---

## Purpose

This can be used for copying/moving 

- Within your file-system
- From your local to a remote
- From a remote to a local

## Examples

### Basic

Sync directory.

```sh
$ rsync -avz ./src /dest
```

Add trailing slash to sync contents.

```sh
$ rsync -avz ./src/ /dest
```

### Display

```
-q, --quiet
-v, --verbose

    --stats
-h, --human-readable

    --progress
-P                  # same as --partial --progress
```

### Transfer

```
-z compress


-l, --links   # Copy symlinks as links
-a, --archive

-r, --recursive


--delete     # Delete extra files     
```

### Preserve

Preserve permissions, etc.

```
-p, --perms   
-t, --times
-g, --group 
-o, --owner
```

### Skip

```
-u, --update     # skip files newer on dest
-c, --checksum   # skip based on checksum, not mod-time & size
```


## Help

[Rsync cheatsheet](https://devhints.io/rsync) on DevHints.

Linux manpage - [link](https://linux.die.net/man/1/rsync).

```
Name
rsync -- a fast, versatile, remote (and local) file-copying tool
Synopsis

Local:  rsync [OPTION...] SRC... [DEST]
Access via remote shell:
  Pull: rsync [OPTION...] [USER@]HOST:SRC... [DEST]
  Push: rsync [OPTION...] SRC... [USER@]HOST:DEST
Access via rsync daemon:
  Pull: rsync [OPTION...] [USER@]HOST::SRC... [DEST]
        rsync [OPTION...] rsync://[USER@]HOST[:PORT]/SRC... [DEST]
  Push: rsync [OPTION...] SRC... [USER@]HOST::DEST
        rsync [OPTION...] SRC... rsync://[USER@]HOST[:PORT]/DEST

Usages with just one SRC arg and no DEST arg will list the source files instead of copying. 
```
