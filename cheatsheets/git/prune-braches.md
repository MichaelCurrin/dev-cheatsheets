# Prune
> How to remove clean-up remote branches that no longer exist


## About

If your branch `my-feature` no longer exists on GitHub, then after doing a fetch or pull, you'll have a local reference to remote branch that no longer exists on GitHub reference. As `origin/my-feature`

It will appear when listing all branchs (including remote references_.

```sh
$ git branch -a
```

You can clean this up in your local reference to remote branches using pruning as below.


## Commands

Both approaches below should give the same results. 

They both require an internet connection, to check on the status of remote branches on GitHub.

### Prune remote

This does a `git fetch` internally, which is does not long. 

```sh
$ git remote prune origin
```

Optionally add the `-n, --dry-run` flag for a dry run.

### Fetch and prune

The remote name `origin` is implied here.

```sh
$ git fetch --prune
```

From the help:

- `-p, --prune` - prune remote-tracking branches no longer on remote
