# Path cheatsheet

## Current script

Get path to the current script:

```sh
SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
```

From top answer on [SO](https://stackoverflow.com/questions/4774054/reliable-way-for-a-bash-script-to-get-the-full-path-to-itself/4774063). See also [page](http://mywiki.wooledge.org/BashFAQ/028).

Or, using `realpath`. Works on macOS or Debian.

```sh
SCRIPT=$(realpath $0)
SCRIPTPATH=$(dirname $SCRIPT)
```

To leave symlinks unresolved: 

```sh
realpath -s $0`
```

## Current directory
<!--stackedit_data:
eyJoaXN0b3J5IjpbMTYxNDA3NTU0NV19
-->