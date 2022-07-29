## rm


## Help

```shell
$ git rm -h
usage: git rm [<options>] [--] <file>...

    -n, --dry-run         dry run
    -q, --quiet           do not list removed files
    --cached              only remove from the index
    -f, --force           override the up-to-date check
    -r                    allow recursive removal
    --ignore-unmatch      exit with a zero status even if nothing matched
```

## Usage

Remember to run `git commit` afterwards.

### Basic

```sh
$ git rm PATH
```

### Keep file

Remove from the working tree without deleting it.

```sh
$ git rm --cached PATH
```

### Delete directory

```sh
$ git rm -r PATH
```

## Alternative

Another approach without `git rm` - using the plain `rm` shell command rather.

```sh
$ rm PATH
$ git add PATH
$ git commit
```
