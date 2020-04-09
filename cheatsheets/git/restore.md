# Restore cheatsheet
> Restore a file to a versioned state.

Restore a target. Path is required, otherwise nothing will change.

```sh
git checkout PATH
```

Restore directory using a single dot. This is recursive - current directory and below. Do this from the repo root if needed.

```sh
git checkout .
```

Restore to earlier commit, such as a tag number, a branch name or a commit hash.

```sh
git checkout COMMIT_REF PATH

# e.g.
git checkout master file.txt

# 
git checkout my-feature
git checkout master file.txt
```

Restore file to 
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTEwNjkzNDUwODFdfQ==
-->