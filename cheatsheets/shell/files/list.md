# List files

## List command

### List files

```sh
ls
```

```sh
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
ls -A
```

```
     -A      List all entries except for . and ...  Always set for the super-user.

     -a      Include directory entries whose names begin with a dot (.).
```

### List directories

List directories. Note that `ls *` without `-d` flag would look at files inside each directory rather show the directory itself.

```sh
ls -d [PATH]

# e.g.
ls -d ~
```

## Globbing

See [globstar](globstar.md) page.


## Find command

### List files recursively

```sh
find .
# OR
find .

find DIR_NAME
```

### Filter

```sh
find . -name '*.py'
```

```sh
find . -type f
```

## du command

### List files recursively

```
# --all Include files not just directories. 
# --human-readable Show human-readable sizes.
du -ah
```
