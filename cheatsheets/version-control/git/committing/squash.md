---
title: Squash
description: Approaches for squashing commits
---

Notes:

- For `TARGET_COMMIT` below, use `HEAD~3` for 3 commits back, or use a hash for a particular commit.
- If you've already pushed code, you'll have to force push to overwrite with `git push --force`.
- Tip: Before squashing and changing history, make a temporary branch or push your code so you have a backup. Or make sure you know how to use `git reflog`.

## Reset approach

For example if you are on a feature branch, you could rewind your history to `main` branch and then everything committed between those two points will be in the working tree so you can commit them.

```sh
$ git reset TARGET_COMMIT
```
Note the implied default flag used for `git reset` is `--soft`.

Then make a commit or commits with the files.

```sh
$ git add PATH
$ git commit
```

You can also use `git commit --amend` if you want to edit that commit instead of adding a new one.

More advanced approach with a script with validation [here](https://stackoverflow.com/questions/7275508/is-there-a-way-to-squash-a-number-of-commits-non-interactively) on StackOverflow.


## Rebase approach

This requires more manual work.

```sh
$ git rebase -i COMMIT
```

Then mark each commit as `s` for squash.

Save and close.


## Merge a branch

```sh
$ git merge --squash BRANCH
```

See [SO thread](https://stackoverflow.com/questions/42332906/squash-git-commits-non-interactively-with-git-rebase) for using this approach in a more advanced way.
