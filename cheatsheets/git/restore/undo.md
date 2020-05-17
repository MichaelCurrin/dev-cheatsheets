# Undo

## Undo commit

Undo latest commit and drop all changes. Warning - any other changes files will also be reset.

```sh
git reset --hard HEAD~
```

Safer:

```sh
[[ -z $(git status --porcelain) ]] && git reset --hard HEAD~ || echo 'Unstaged changes!'
```

Then run

```sh
git stash --include-untracked
```

Then try again.


## Restore local to match remote

This will get rid of any unpushed commits.

```sh
git checkout origin/master .
```
<!--stackedit_data:
eyJoaXN0b3J5IjpbNDY5NjgyNjY1LC0xNjc5Njc5MjgxXX0=
-->