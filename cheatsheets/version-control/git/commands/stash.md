# stash

Stashes are numbered where index `0` is the most recent. New stashes are added to the front of the list to become the new index `0`.


## Stash reference

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

Look at all the stashes.

```sh
$ git stash list
```

Look at the stash before it at stash `1`. Or whatever index.

```sh
$ git stash show 1
```

Drop that stash:

```sh
$ git stash drop 1
```

Then view and apply the stash which was at `2` and which is now shifed to be at `1`.

```sh
$ git apply 1
```



## Create

Note you cannot stash on a repo with no commits.

Create stash.

```sh
$ git stash
```

Stash everything, tracked or not.

```sh
$ git stash --include-untracked
```

Or use `add` if you need to include untracked files then stash.

```sh
$ git add .
$ git stash
```

```sh
$ git stash save 'Name of stash'
```


## Show

List stashes. Note the most recent one at the top of the output will have index `0`.

```sh
$ git stash list
```
e.g.
```
stash@{0}: On foo-bar: stash name
stash@{1}: On master: another stash name
stash@{3}: WIP on master: a5a067af Commit message
```

Show files names in a stash.

```sh
$ git stash show [STASH_REF]
```

Show the diff of a stash.

```sh
$ git stash show [STASH_REF] -p
```


## Unstash

### Pop

Apply and remove from the stashes.

```sh
$ git stash pop [STASH_REF]
```

### Apply

Apply the stash, but also keep it on the stash pile.

```sh
$ git stash apply [STASH_REF]
```

Then you can get rid of your changes to get back to a clean state, then apply your stash again.

```sh
$ git reset --hard
$ git stash apply
```

Or you can commit your changes and drop the stash, since you no longer need it.

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
