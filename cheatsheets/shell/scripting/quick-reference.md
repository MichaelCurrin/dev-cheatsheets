# Quick reference

Use these on the command-line or in shell scripts.

## Link

Create symbolic link to file.

```sh
ln -s SOURCE TARGET

# e.g.
ln -s ~/foo/bar.txt bar
```

Source is is directory or file to point to. Target is the new link file to create or replace. Add `-f` to override an existing file.


## Current directory

Get path to the directory of the current script.

From [Stack Overflow](https://stackoverflow.com/questions/59895/how-to-get-the-source-directory-of-a-bash-script-from-within-the-script-itself).


```sh
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
```


Here `pwd` would return the top level directory `my-repo`, while the result of `SCRIPT_DIR` will for `bin`.

```sh
$ cd my-repo
$ ./bin/test.sh
```


## String manipulations

Replace using `sed`.

```sh
echo 'my-input' | sed 's/-/_/'
```
