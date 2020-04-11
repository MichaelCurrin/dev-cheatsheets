# Path cheatsheet

## Script path and directory

Note that getting the current directory with `pwd` will give the working directory of the user. If a script is not the the working directory, then you need something more precise. If you want to get the directory where a script is in, from inside the script, use this.  

### Option A

Get path to the current script.

```sh
SCRIPT_PATH="$(
  cd "$(dirname "$0")" >/dev/null 2>&1
  pwd -P
)"
```

For script `~/foo/bar.sh`, printing that variable:

```
/Users/my-user/foo/bar.sh
```

From top answer on [SO](https://stackoverflow.com/questions/4774054/reliable-way-for-a-bash-script-to-get-the-full-path-to-itself/4774063). See also [page](http://mywiki.wooledge.org/BashFAQ/028).

### Option B

Get path to the current script and directory using `realpath`. Works on macOS or Debian - requires *coreutils*.

```sh
SCRIPT_FILEPATH=$(realpath $0)
SCRIPT_DIR=$(dirname $SCRIPT)

# Or, in oneline:
SCRIPT_DIR=$(dirname $(realpath $0))
```

For a script `~/foo/bar.sh`, printing those variables gives:

```
/Users/my-user/foo/bar.sh
/Users/my-user/foo
```

To leave symlinks unresolved: 

```sh
realpath -s $0`
```

## Current directory
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTE2OTUwMTQxMDcsLTEwNTE5NjA2NTksLT
E2OTQ2NjM3MzVdfQ==
-->