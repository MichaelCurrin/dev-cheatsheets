# stash

Stashes are numbered where index `0` is the most recent. New stashes are added to the front of the list to become the new index `0`.

A stash reference is `stash@{0}` and the shorthand is just the index such as `0` in this case.

If the reference is omitted, then index `0` is implied.


## Create

Note you cannot stash on a repo with no commits.

Create stash.

```sh
git stash
```


Stash everything, track and not, without using `add`.

```sh
git stash --include-untracked
```

Or use `add` if you need to include untracked files then stash.

```sh
git add .
git stash
```

```sh
git stash save 'Name of stash'
```


## Show

List stashes

```sh
git stash list
```
e.g.
```
stash@{0}: On foo-bar: stash name
stash@{1}: On master: another stash name
stash@{3}: WIP on master: a5a067af Commit message
```

Show stashed file list.

```sh
git stash show [STASH_REF]
```

Show stashed diff.

```sh
git stash show [STASH_REF] -p
```

## Unstash

Apply and remove.

```sh
git stash pop [STASH_REF]
```

Apply without removing.

```sh
git stash apply [STASH_REF]
```

Remove without applying.

```sh
git stash drop [STASH_REF]
```
