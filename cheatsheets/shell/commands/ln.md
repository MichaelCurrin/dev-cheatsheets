---
title: ln
description: Command to make links
---


## Related

- [Links][] shell cheatsheet.

[Links]: {% link cheatsheets/shell/links.md %}


## Help

```
NAME
     link, ln -- make links

SYNOPSIS
     ln [-Ffhinsv] source_file [link_name]
     ln [-Ffhinsv] source_file ... link_dirname
     link source_file link_name
...
```


## Create

### Symbolic link

A one-way pointer:

```sh
$ ln -s TARGET DEST
```

e.g. Create `venv` in current directory.

```sh
$ ln -s ~/.local/virtualenvs/daylio-csv-parser venv
```

Or another directory.

```sh
$ ln ~/.local/virtualenvs/daylio-csv-parser ~/my-project/venv
```

### Hard link

A two-way link. No flags needed. I don't think I've ever had to use this.

```sh
$ ln TARGET DEST
```

### Relative symlink

This doesn't work on macOS with the BSD `ln`. So I don't use this.

```sh
$ ln -s -r TARGET DEST
```

e.g.

```console
$ ln -s -r my-target.txt my-dir/my-symlink
$ # Check it.
$ ls -l my-dir
my-symlink -> ../my-target.txt
```

Note how the reuslt using `../`.

Without the `-r` flag, the created link would be **invalid** - tThe symlink would point to a file as `./my-target.txt` in its _own_ directory rather than one level up.

e.g.

```console
$ ln -s my-target.txt my-dir/my-symlink
$ # Check it.
$ ls -l my-dir
my-symlink -> my-target.txt
```

Here is a workaround to get the same behavior, without using the `-r` flag, by using `cd`.

```console
$ cd my-dir
$ ln -s ../my-target my-dest
$ cd ..
$ # Check it.
$ ls -l my-dir
my-symlink -> ../my-target.txt
```

### Force

You'll get a warning if the destination already exists, so use the force flag.

```sh
$ ln -s -f TARGET DEST
```


## Flags

```
     -i    Cause ln to write a prompt to standard error if the target file exists.  If the response
           from the standard input begins with the character `y' or `Y', then unlink the target
           file so that the link may occur.  Otherwise, do not attempt the link.  (The -i option
           overrides any previous -f options.)
```

```
     -F    If the target file already exists and is a directory, then remove it so that the link
           may occur.  The -F option should be used with either -f or -i options.  If none is spec-
           ified, -f is implied.  The -F option is a no-op unless -s option is specified.``
```

```
  -f    If the target file already exists, then unlink it so that the link may occur.  (The -f
           option overrides any previous -i options.)
```


## Examples

### Git hooks

See [Add symlink][] in the Git hooks cheatsheet.

[Add symlink]: {% link cheatsheets/version-control/git/hooks.md %}#add-symlink

