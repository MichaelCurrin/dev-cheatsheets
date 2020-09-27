---
title: rysnc
---

## Purpose

This can be used for copying/moving...

- Within your file-system
- From your local to a remote
- From a remote to a local

It is similar to `scp`. But `rsync` has some more advanced features.


## Local examples

### Basic

Sync directory. The manpage uses `-avz` in examples.

```sh
$ rsync -avz foo bar
```

Add trailing slash to `foo/` to sync contents.

### Move

By default, `rsync` will copy files.

If you want to move them (i.e. delete after copy), you can use these flags:

```
--remove-source-files   sender removes synchronized files (non-dir)
```

Note that the `--delete` flag and its variations will delete on the receiver (destination) so it is not appropriate here.


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
```

This is useful if trying a few times to sync and not syncing files which are already processed.

```
-c, --checksum   # skip based on checksum, not mod-time & size
```


## Remote examples

Syncing over SSH.


### Copy to remote

```sh
$ rsync [OPTIONS] SOURCE [USER@]HOST:DEST
```

e.g.

- Copy to absolute path on host.
    ```sh
    $ rsync [OPTIONS] foo michael@192.168.1.35:/foo/bar/baz
    ```
- Copy to user path on a host identified from `/etc/hosts`. Note that `USER@` is not needed if you've setup the remote user in the config, or perhaps if the user names are identical across systems.
    ```sh
    $ rsync [OPTIONS] foo michael@dell:~/Documents/baz
    ```

Note that tab completion is supported to.

### Copy from remote

Same as above but reversed.

```sh
$ rsync [OPTIONS] [USER@]HOST:SOURCE DEST
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
