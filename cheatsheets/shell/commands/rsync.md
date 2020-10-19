# rysnc

## Purpose

This can be used for copying/moving...

- From local to local (whether on your file-system, or across removable media)
- From your local to a remote
- From a remote to a local

It is similar to `scp`. But `rsync` has some more advanced features.


## Local examples

### Basic

Sync directory. The manpage uses `-avz` in examples.

```sh
$ rsync [OPTIONS] foo bar
```

Add trailing slash to `foo/` to sync contents.

### Common flag usage

Archive, verbose, compressed, human-readable.

```sh
$ rsync -avzh SOURCE DEST
```

Add `-c` f

### Move

By default, `rsync` will copy files.

If you want to move them (i.e. delete after copy), you can use these flags:

Sender removes synchronized files (non-dir).

```
--remove-source-files
```

> This tells rsync to remove from the sending side the files (meaning non-directories) that are a part of the transfer and have been successfully duplicated on the receiving side.

Note that the `--delete` flag and its variations will delete on the receiver (destination) so it is not appropriate here.

### Dry run

```
--dry-run
```

### Display

```
-q, --quiet
-v, --verbose
```
```
    --stats
```
```
-h, --human-readable
```

> This option tells rsync to print information showing the progress of the transfer. This gives a bored user something to watch. This option is normally combined with -v. Using this option without the -v option will produce weird results on your display.
```
    --progress
```

Same as `--partial --progress`.

```
-P
```

### Transfer

```
-z compress
```

Copy symlinks as links
```
-l, --links
```

Archive

> This is equivalent to `-rlptgoD`. It is a quick way of saying you want recursion and want to preserve almost everything (with -H being a notable omission). The only exception to the above equivalence is when `--files-from` is specified, in which case -r is not implied

```
-a, --archive
```

Handled by the above.

```
-r, --recursive
```

```
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

### Sync safely
> Handle long, repeat runs of possibly interrupted syncs

#### Partial

> By default, rsync will **delete** any partially transferred file if the transfer is **interrupted**.
>
> In some circumstances it is more desirable to **keep** partially transferred files. Using the `--partial` option tells rsync to keep the partial file which should make a subsequent transfer of the rest of the file much faster.

```
--partial
```

This is perhaps safer than ignore existing, as partial will do a checksum to see if the file is the same as the one it wants to copy, rather than just checking its presence.

Also partial might handle picking up from transferring a single large file without starting over.

#### Ignore existing

Ignore files which are already synced to the destination.

> This tells rsync to skip updating files that already exist on the destination (this does not ignore existing directories, or nothing would get done).

```
--ignore-existing
```

#### Checksum

> skip based on checksum, not mod-time & size

Note that this is expensive to compute on both sides.

```
-c, --checksum
```


### Skip updated
Skip files newer on dest to avoid overwriting remote changes.

```
-u, --update
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
