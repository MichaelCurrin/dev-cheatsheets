---
title: Paths
description: Getting the path value in shell scripts or the command-line
---

## Basics

### Directory

Get the parent directory of a file or directory.

```sh
dirname PATH
```

```sh
$ dirname foo/bar
foo
```

The path does not have to exist as this is a string operation.

### Realpath command

Expand a relative path to a full path - resolving symlinks. The path must be valid.

Works on macOS or Debian - requires *coreutils*.

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

Given that `~/bin` is a symlink, this command will resolve it.

```sh
realpath ~/bin/
/home/michael/repos/shell-dev-setup/bin
```

To leave symlinks _unresolved_:

```sh
realpath -s $0`
```


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
```

For script `~/foo/bar.sh`, printing that variable:

```
/Users/my-user/foo/bar.sh
```

From top answer on [SO](https://stackoverflow.com/questions/4774054/reliable-way-for-a-bash-script-to-get-the-full-path-to-itself/4774063). See also [page](https://mywiki.wooledge.org/BashFAQ/028).


### Directory

```sh
dirname $0
SCRIPT_DIR=$(dirname $0)
```

To resolve symlinks:

```sh
SCRIPT_DIR=$(dirname $(realpath $0))
```


## Working directory

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
