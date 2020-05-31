# Globstar cheatsheet

## Standard star


The standard star gives files and directory at the current level.

```sh
for f in *; do
    echo $f
done
```

Using `ls`, you can see files in each top-level directory.

```sh
ls *
```

You use this go show output recursively.

```sh
ls -R
```

But this is not recommended for rename, deleting, etc. And you should not be parsing the output of `ls`.


## What is globstar

To find files recursively, use the globstar symbol - `**`. This must be enabled.

From Bash 4 docs:

```
globstar
    If set, the pattern ** used in a pathname expansion context will
    match all files and zero or more directories and subdirectories.
    If the pattern is followed by a /, only directories and
    subdirectories match.
```


## Set option

Do this once off or in your shell config file.

### Bash

```sh
shopt -s globstar
```

### ZSH

```sh
setopt extended_glob
```


## Example use

```sh
ls **
```

```sh
ls **/*.py
```

```sh
ls -1 **/*.(sh|py)
```
