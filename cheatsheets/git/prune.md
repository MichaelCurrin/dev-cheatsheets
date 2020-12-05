# Prune
> How to remove clean-up remote branches that no longer exist

## About

If `my-feature` no longer exists on GitHub, then after doing a fetch or pull, you'll have a remote branch missing a GitHub reference.

- `origin/my-feature`

You can clean this up in your local reference to remote branches using pruning as below.


## Commands

See tutorial: [git prune](https://www.atlassian.com/git/tutorials/git-prune)

```sh
git prune --dry-run --verbose
```

```sh
git prune --dry-run --verbose --expire=now
```

Or

```sh
git fetch --all && git remote prune
```

Shorter:

```
git fetch --prune
```

> The `git prune` command is intended to be invoked as a child command to `git gc`. It is highly unlikely you will ever need to invoke `git prune` in a day to day software engineering capacity. Other commands are needed to understand the effects of `git prune`.
