---
title: Squash
description: Approaches for squashing commits
---

Notes:

- For `COMMIT` below, use `HEAD~3` for 3 commits back, or use a hash for a particular commit.
- If you've already pushed code, you'll have to force push to overwrite with `git push --force`.


## Reset approach

```sh
$ git reset --soft COMMIT
$ git commit
```

That will _add_ a commit with all your changes.

Use this if you want to _replace_ that existing commit, including its changes and everything you did after:

```sh
$ git commit --amend
```

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
