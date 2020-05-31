# Globstar cheatsheet

You may need to enable _globstar_ to get `**` to work in Bash or ZSH. Then you can iterate recursively.

The `globstar` option in Bash 4.

```
globstar
    If set, the pattern ** used in a pathname expansion context will
    match all files and zero or more directories and subdirectories.
    If the pattern is followed by a /, only directories and
    subdirectories match.
```

### Set option

Bash:

```sh
shopt -s globstar
```

ZSH:

```sh
setopt extended_glob
```

### Example use

```sh
ls **/*.py
```

```sh
ls -1 **/*.(sh|py)
```
