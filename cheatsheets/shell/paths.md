# Path cheatsheet

## Current script

Get path to the current script.

### Option A

```sh
SCRIPTPATH="$(
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

Alternative, using `realpath`. Works on macOS or Debian.

```sh
SCRIPT=$(realpath $0)
SCRIPTPATH=$(dirname $SCRIPT)
```

For script `~/foo/bar.sh`, printing those variables:

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
eyJoaXN0b3J5IjpbLTE2OTQ2NjM3MzVdfQ==
-->