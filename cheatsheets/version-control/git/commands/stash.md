# stash

Stashes are numbered where index `0` is the most recent. New stashes are added to the front of the list to become the new index `0`.


## Stash references

A stash can be referenced like this:

- Long reference: `stash@{0}`, `stash@{1}`, etc.
- Short reference: `0`, `1`, etc. 

If you omit the reference, then the index `0` is implied. Which means the most recent stash.


## Manage stashes

A workflow for creating, viewing, applying and deleting stashes.

Stash everything including untracked.

```sh
$ git stash -u
```

See what we stashed at stash index `0`. First file names and then file changes.

```sh
$ git stash show

$ git stash show -p
```

### List

Look at all the stashes.

```sh
$ git stash list
```

### View
Look at the stash before it at stash `1`. Or whatever index.

```sh
$ git stash show 1
```

### Drop

Drop that stash:

```sh
$ git stash drop 1
```

### Apply

Then view and apply the stash which was at `2` and which is now shifed to be at `1`.

```sh
$ git apply 1
```



## Create

Note you cannot stash on a repo with zero commits.

### Basic

Create stash.

```sh
$ git stash
```

### Untracked

Stash everything, tracked or not.

```sh
$ git stash --include-untracked
```

Or use `add` if you need to include untracked files then stash.

```sh
$ git add .
$ git stash
```

### Message

Give the stash a message.

```sh
$ git stash save MESSAGE
$ # e.g.
$ git stash save 'Description of stash'
```


## Show

### Basic

List stashes. 

```console
$ git stash list
stash@{0}: On foo-bar: My stash name
stash@{1}: On master: Another stash name
stash@{3}: WIP on master: a5a067af Commit message
```

Note the most recent one at the top of the output will have index `0`.

The mesesage of the stash will be shown if possible, or the commit message.

### File names

Show files names in a stash.

```sh
$ git stash show [STASH_REF]
```

### Diff

Show the diff or "patch" of a stash.

```sh
$ git stash show [STASH_REF] -p
```


## Apply

### Apply and drop

Apply the stash, then _remove_ from the stashes.

```sh
$ git stash pop [STASH_REF]
```

### Apply and keep

Apply the stash, but _keep_ it on the stash pile.

```sh
$ git stash apply [STASH_REF]
```

If you need to, you can get rid of your changes to get back to a clean state, then apply your stash again.

```sh
$ git reset --hard
$ git stash apply
```

Or you can commit your changes and drop the stash, if you no longer need it.

```sh
$ git commit .
$ git stash drop
```


## Delete

Delete the stash without applying it.

```sh
$ git stash drop [STASH_REF]
```


## Split changed files

If you have say 10 files changed and you want to stash just some of them, you can do this.

1. Stage the files you want to stage.
    ```sh
    $ git add foo
    ```
1. Stash only staged files using the `--keep-index` flag.
    ```sh
    $ git stash -k
    ```
1. Optionally, you can now can stash the files which were not staged, so you'll end up with two stashes.
    ```sh
    $ git stash
    ```
