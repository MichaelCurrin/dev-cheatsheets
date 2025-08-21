---
title: Commands
description: Cheatsheets for git subcommands
---


See Git CLI [docs](https://git-scm.com/docs/git).


### Help

The `log` subcommand is used for the examples below.

### Summary

```sh
$ git log -h
```

### Detailed

```sh
$ git log --help
```

Or

```sh
$ man git-log
```


## Reset, restore and revert

> There are three commands with similar names: git reset, git restore and git revert.

> git-revert[1] is about making a new commit that reverts the changes made by other commits.

> git-restore[1] is about restoring files in the working tree from either the index or another commit. This command does not update your branch. The command can also be used to restore files in the index from another commit.

> git-reset[1] is about updating your branch, moving the tip in order to add or remove commits from the branch. This operation changes the commit history.
