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

### Restore a deleted file

Bring back a file which was previously deleted.

```sh
git reset COMMIT_REF file.txt
```

If you are on a feature branch and the file is still on master, you can reset to the master (note targeting just the file path).

If you are already on master, you will have to find the commit _before_ that file was deleted.

Find the last commit that affected the given path. As the file isn't in the HEAD commit, this commit must have deleted it.
sh

```sh
git rev-list -n 1 HEAD -- PATH
```

Checkout the version at the commit before, using the caret (^) symbol:
```sh
git checkout <deleting_commit>^ -- <file_path>
```

Or in one command, if `$file` is the file in question.

```sh
git checkout $(git rev-list -n 1 HEAD -- "$file")^ -- "$file"
```
<!--stackedit_data:
eyJoaXN0b3J5IjpbMTY3MDMwOTY4OF19
-->