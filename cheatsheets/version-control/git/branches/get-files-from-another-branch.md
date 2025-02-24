# Get files from another branch

## Move commit head

If you want to move the current branch to point at the same commit as the target branch:

```sh
$ git reset COMMIT
```

## Get file changes

If you want to get file changes from another branch without moving the current commit, you can do this:

```sh
$ git checkout COMMIT PATH
```

e.g.

```sh
$ git checkout my-branch foo.md
```
