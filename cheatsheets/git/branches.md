---
title: Branches
---

## View

### Basic

```sh
$ git branch
  foo
* bar
master
```

### Verbose

```sh
$ git branch -v
```
```
  foo                                                    4c677a0 [gone] Some commit message
* bar                                                    a89446e Another message
  master                                                 5680e85 Yet another commit message
  ```

### Remotes

```sh
$ git branch -r
```
```
  origin/bar
  origin/HEAD -> origin/master
```


## Delete local branches

### Delete one branch

```sh
$ git branch -d BRANCH_NAME
# Delete even if not merged.
$ git branch -D BRANCH_NAME
```

### Restore deleted branch

Even often a branch is deleted, you can still create it from the local remote reference.

From the `git checkout` manpage:

> If `<branch>` is not found but there does exist a tracking branch in exactly one remote (call it <remote>) with a matching name, treat as equivalent to

```sh
$ git checkout -b <branch> --track <remote>/<branch>
```

e.g.

```sh
$ git checkout -b foo --track origin/foo
```

### Delete unneeded branches

Based on the ZSH alias `gbda` - probably "git branch delete all".

Select all _merged_ branches, excluding `master` and `develop`, then delete each.

```sh
$ git branch --no-color --merged | command grep -vE "^(\+|\*|\s*(master|develop)\s*$)" | command xargs -n 1 git branch -d
```

Note that a branch might be merged but might not known to git if it was a squash merge.

You can run `git fetch` first to make sure you are up to date with the remote.

Here is a more aggressive one (best to run this on master or develop and push your feature branches first, so you can recreate them from the remote references).

```sh
$ git checkout master
$ git branch --no-color | command grep -vE "^(\+|\*|\s*(master|develop)\s*$)" | command xargs -n 1 git branch -D
Deleted branch foo (was 06e07e7).
Deleted branch foo (was 125f0d2).
```

If you use `-d` you'll get warnings on unmerged branches and `-D` will delete it anyway.

Here with `-d`:
```
error: The branch 'foo' is not fully merged.
If you are sure you want to delete it, run 'git branch -D foo'.
```

Perhaps this can be extended to exclude the current git branch.




## Delete origin branches

Even though you've deleted a branch locally as covered above, your git repo will have a local reference to that remote branch. And also the branch might still exist on GH itself.

### Delete many

Use this to remove local references to remote branches which have been deleted on GitHub.

```sh
$ git remote prune origin
```

## Delete branch on remote

Do a `push` with a _delete_ flag.

```sh
$ git push -d origin BRANCH_NAME
```

This works on branches and tags.

This has no effect on the local branch or tag.
