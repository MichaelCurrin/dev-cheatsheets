# Get info


## which

Alias:

```console
$ which ls
ls is an alias for ls -G`
```

Function:

```console
$ which upgrade-deps
upgrade-deps () {
if [[ -n "$(git status --porcelain)" ]]
then
...
```


## Type

```console
$ type upgrade-deps
upgrade-deps is a shell function from /Users/mcurrin/.aliases`
```

```console
$ type ls
ls is an alias for ls -G
```


## ln

Check if a symlink is valid.

If valid:

```console
$ ln -s abc def
$ ln def
ln: ./def: File exists
```

If not valid:

```console
$ ln -s abc def
$ rm abc
$ ln def
ln: def: No such file or directory
```
