---
title: Branches
---

## Delete local branches

### Delete one branch

```sh
$ git branch -d BRANCH_NAME
# Delete even if not merged.
$ git branch -D BRANCH_NAME
```

### Delete branches no longer needed

Based on ZSH alias `gbda`.

Select all merged branches,exclude `master` and `develop` and then run branch delete.

```sh
$ git branch --no-color --merged | command grep -vE "^(\+|\*|\s*(master|develop)\s*$)" | command xargs -n 1 git branch -d'
```

## Delete origin branches

### Delete one

<!-- TODO: test

```sh
$ git branch -d origin/BRANCH_NAME
```
 -->

### Delete many

You can use this to delete local references to remote branches that have been deleted.

```sh
$ git remote prune origin
```

## Delete branch on remote

Do a `push` with a delete flag.

```sh
$ git push -d origin BRANCH_NAME
```

This works on branches and tags.

This has no effect on the local branch or tag.
