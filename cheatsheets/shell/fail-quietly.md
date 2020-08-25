---
title: Fail quietly
---

How to perform an action without causing an error status and reducing stderr output logged where possible.

The assumption is this set as start of the script such that any errors would cause the script to abort.

```sh
set -e
```

## Default

Assume that `CMD` references a failing command such as running copy, move or remove on a file or folder that is not valid to operate on. e.g. `rm foo.txt` when `foo.txt` does not exist.

```sh
CMD
```

Run `echo $?` after and you'll see `1` or another error status code.

You'll also have any error messages logged on stderr.


## Continue without aborting

```sh
CMD || true
```
If you run `echo $?` you'll see `0` for success.


## Run quietly

Silence stderr, but keep stdout.

```sh
CMD &> /dev/null 
```

## Continue without aborting and fail silently 

Combine the sections above:

```sh
CMD &> /dev/null || true
```
