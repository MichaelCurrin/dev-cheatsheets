# Globstar cheatsheet

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

On ZSH at least, the option seems enough to turn single star into recursive.

```sh
ls *
```

```sh
ls **/*.py
```

```sh
ls -1 **/*.(sh|py)
```
