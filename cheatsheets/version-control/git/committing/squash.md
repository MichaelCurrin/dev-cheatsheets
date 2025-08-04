---
title: Squash
description: Approaches for squashing commits
---

## Notes

- If you've already pushed code, you'll have to force push to overwrite with `git push --force`.
- Tip: Before squashing and changing history, you could make a temporary branch or push your code so you have a backup. Or make sure you know how to use `git reflog`.

## Reset approach

For example, if you are on a feature branch, you could rewind your history to `main` branch and then everything committed between those two points will be in the working tree so you can commit them. Then make a commit or commits with the files.

Make sure things are up to date first:

```sh
$ git checkout main
$ git pull
$ git checkout my-feature
```

```sh
$ git reset main
$ git add PATH
$ git commit
```

Note the implied default flag used for `git reset` is `--soft`, so the changes from the commits are kept.

If you want to squash in general and not compare against main, then do `reset` with a commit hash or a reference e.g. `HEAD~3` for 3 commits back.

More advanced approach with a script with validation [here](https://stackoverflow.com/questions/7275508/is-there-a-way-to-squash-a-number-of-commits-non-interactively) on StackOverflow.


## Rebase approach

This approach requires more manual work.

```sh
$ git rebase -i COMMIT
```

Then mark each commit as `s` for squash.

Then save and close.


## Merge a branch

Pull a branch into the current branch with a squash commit instead of as a series of commits.

```sh
$ git merge --squash BRANCH
```

See [SO thread](https://stackoverflow.com/questions/42332906/squash-git-commits-non-interactively-with-git-rebase) for using this approach in a more advanced way.



## Amend approach

If you have a history of commits to squash, use the approaches above.

If you have a single commit after `main` and you have unstaged changes that you want to add in the commit, you can just amend. And then it doesn't matter how many times you commit, as long as you amend you will have just one commit.

```sh
$ git commit --amend
```
