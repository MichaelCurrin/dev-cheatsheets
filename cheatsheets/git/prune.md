# Git prune cheatsheet

Tutorial: https://www.atlassian.com/git/tutorials/git-prune

```sh
git prune --dry-run --verbose
```

```
git prune --dry-run --verbose --expire=now
```

```
git fetch --all && git remote prune
```

Shorter:

```
git fetch --prune
```

> The `git prune` command is intended to be invoked as a child command to `git gc`. It is highly unlikely you will ever need to invoke `git prune` in a day to day software engineering capacity. Other commands are needed to understand the effects of `git prune`.
<!--stackedit_data:
eyJoaXN0b3J5IjpbMTc5NzQ3MzgyMl19
-->