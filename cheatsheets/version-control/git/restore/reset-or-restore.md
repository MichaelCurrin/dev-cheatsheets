# Reset or restore git branches


## Restore local master to remote master

Restore your master branch to the state on the remote.

```sh
git checkout master
git fetch
git reset --hard origin/master
```

You can also replace instances of `master` with `feature-branch`.

This is useful if you have local commits on a branch that you haven't pushed. Or a rebase has been done on the remote and you are happy to use that remote and drop local commits.


## Restore feature branch to remote master


This can be useful if you have a feature branch you want to throw away but you want to keep the name.

```sh
git checkout feature-branch
git reset --hard origin/main
```


## Clean directory

Unstage changes and revert files to version control state.

```sh
$ git reset --hard
```

Or unstage changes and then revert files to version control state.

```sh
git reset
git checkout .
```

Note `reset HEAD` is implied.

You can also target a branch or commit.

```sh
$ git reset --hard HEAD~
```

```sh
$ git reset --hard origin/main
```

