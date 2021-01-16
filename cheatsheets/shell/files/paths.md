---
description: Getting the path value in shell scripts or the command-line
---
# Paths


## Basics

### The dirname command

Get the parent directory of a file or directory.

```sh
dirname PATH
```

```sh
$ dirname foo/bar
foo
```

The path does not have to exist as this is a string operation.

### The realpath command

Expand a relative path to a full path - resolving symlinks. The path must be valid.

Works on macOS or Debian - requires _coreutils_.

```
REALPATH(1)

NAME
       realpath - print the resolved path

SYNOPSIS
       realpath [OPTION]... FILE...

DESCRIPTION
       Print the resolved absolute file name; all but the last component must exist
```

Example:

```sh
$ realpath Documents/mono.conf
/home/michael/Documents/mono.conf
```

Given that `~/bin` is a symlink, this command will resolve it by default.

```sh
$ realpath ~/bin/
/home/michael/repos/shell-dev-setup/bin
```

To leave symlinks _unresolved_:

```sh
$ realpath -s ~/bin
/Users/mcurrin/bin
```

_Warning: If you run `cd` in a script then you will change the working directory and then `realpath` will be relative to that, not the original working directory._

### Working directory

Get the current _working directory_ - where the commands or scripts are run from, not where they are located.

Print value:

```sh
pwd
```

Use in a string:

```sh
echo "You are here: $PWD"
echo "You are here: $(pwd)"
```

As an approximation, the current working directory and relative path to a script can be combined to a full path.

```sh
$PWD/$0
```

However, it is safer using one of the approaches covered next.


## Get path of a script within a script

Note that getting the current directory with [pwd](#working-directory) will give the working directory of the user. If a script is not the the working directory, then you need something more precise. If you want to get the directory where a script is in, from inside the script, use this.

### File path


The path to a script from within a script. Note that `$0`is the relative path to current script and the working directory will be prepended to it.

```sh
realpath $0

SCRIPT_PATH=$(realpath $0)
```


#### Fallback

If you can't use `realpath` for some reason, use this:

```sh
SCRIPT_FILEPATH="$(
  cd "$(dirname "$0")" >/dev/null 2>&1
  pwd -P
)"

# Equivalent - a shell linter wraps it over multiple lines.
SCRIPT_FILEPATH="$(cd "$(dirname "$0")" >/dev/null 2>&1; pwd -P)"
```

For script `~/foo/bar.sh`, printing that variable:

```
/Users/my-user/foo/bar.sh
```

From top answer on [SO](https://stackoverflow.com/questions/4774054/reliable-way-for-a-bash-script-to-get-the-full-path-to-itself/4774063).

See also [BashFAQ page](https://mywiki.wooledge.org/BashFAQ/028).


### Directory

```sh
dirname $0

SCRIPT_DIR=$(dirname $0)
```

To resolve symlinks:

```sh
dirname $(realpath $0)

SCRIPT_DIR=$(dirname $(realpath $0))
```
