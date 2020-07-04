---
title: Reset or restore git branches
---


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
git reset --hard origin/master
```


## Clean directory

If you have some changes staged, you need to unstage them otherwise `checkout` won't affect them.

```sh
git reset && git co .
```

Note `reset HEAD` is implied.
