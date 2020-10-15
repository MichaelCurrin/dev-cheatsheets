---
description: Using commands like ls, find and du to show files
---
# List files



## Using List command

See also [ls commmand]({{ site.baseurl }}{% link cheatsheets/shell/commands/ls.md %}) cheatsheet page.

### List files

```sh
ls [PATH]
```

e.g.

```sh
ls Documents

ls ~

ls *
```

Recursive.

```sh
ls -R
```

Show files with and without leading dot.

```sh
ls (.)*
```

Same as this, but this only works with this command while the pattern above is more universal.

```sh
$ ls -A
```

### List directories

List directories. Note that `ls *` without `-d` flag would look at files inside _each_ directory rather show the directory itself.

```sh
$ ls -d [PATH]
```

Examples:

```sh
$ ls ~
Documents/foo.txt
Documents/bar.txt
Downloads/baz.sh
...
```

```sh
$ ls -d ~
Documents
Downloads
...
```

### List hidden paths in home directory

This will include files and directories - use `find` command to filter on type.

The `-d` command looks at directories themselves rather than their contents.

```sh
$ ls -a -l -d ~/.*
```


## Globbing

See [globstar][] page.

[globstar]: {{ site.baseurl }}{% link cheatsheets/shell/files/globstar.md %}


## Using the find command

### List files recursively

```sh
find .
# OR
find .

find DIR_NAME
```

### Filter

Note that parsing the output of the `ls` command is recommended against - it is for humans to read. If you want to filter by size or name for example, use `find` instead.

```sh
find . -name '*.py'
```

```sh
find . -type f
```

## Using the du command

### List files recursively

```
# --all Include files not just directories.
# --human-readable Show human-readable sizes.
du -ah
```
