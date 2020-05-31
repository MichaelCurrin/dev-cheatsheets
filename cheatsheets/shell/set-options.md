# Set options cheatsheet

Set these in a script or at a global level.

## Prevent accidental file overwrites

[source](https://unix.stackexchange.com/questions/452865/are-there-any-disadvantages-of-setting-noclobber)

```sh
alias cp='cp -i'
alias mv='mv -i'
```

> Prevent output redirection using ‘>’, ‘>&’, and ‘<>’ from overwriting existing files. [source](https://www.gnu.org/software/bash/manual/html_node/The-Set-Builtin.html#The-Set-Builtin)

```sh
set -C
```

Similar to the above. [source](https://www.cyberciti.biz/tips/howto-keep-file-safe-from-overwriting.html)

```sh
set -o noclobber
```

When this is on, `> file` gives an error but `>| file` seems to force but need to confirm.

## Exit on error

From `set` [docs](https://www.gnu.org/software/bash/manual/html_node/The-Set-Builtin.html#The-Set-Builtin).

```sh
set -e

# Reverse it with this:
set +e
```

In a shebang:

```sh
#!/bin/bash -e

echo 'Hello!'
```

Note that if you use this shebang style, you must **not** add options in the shebang otherwise you will get an error. So add the line in the script body.

```sh
#!/usr/bin/env bash

set -e
echo 'Hello!'
```


## Verbose

Print a trace of commands before running.

```sh
set -x
```
