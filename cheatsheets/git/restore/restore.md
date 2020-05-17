# Undo cheatsheet
> Restore a file to a versioned state.


Restore a target. Path is required, otherwise nothing will change.

```sh
git checkout PATH
```

Restore directory using a single dot. This is recursive - current directory and below. Do this from the repo root if needed.

```sh
git checkout .
```

Restore to a commit reference. Such as a tag number, a commit hash, or a branch name (e.g. `master`, `my-feature`) .

```sh
git checkout COMMIT_REF PATH
```

If the remote branch is that state you want and you have since done local commits, you can restore to the remote state.

```sh
# Now on feature branch.
git checkout my-feature

# Restore files to remote state.
git checkout origin/my-feature .
```

Your local files are changed but not committed, so you might want to add and commit them now. I found when restoring to a branch name or remote branch, changes were changed. So I had to do this to unstage changes (does not change the files).

```sh
git reset
```

<!--stackedit_data:
eyJoaXN0b3J5IjpbLTgyNzg1MDE2OF19
-->