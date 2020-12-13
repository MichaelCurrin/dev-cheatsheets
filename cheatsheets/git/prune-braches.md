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

This does a `git fetch` internally.

```sh
$ git remote prune origin
```

Optionally add the `-n, --dry-run` flag for a dry run.

### Fetch and prune

The remote name `origin` is implied here.

```sh
$ git fetch --prune
$ # Or
$ git pull --prune
```

From the help:

- `-p, --prune` - prune remote-tracking branches no longer on remote


To always prune, you can also set the flag in the `.gitconfig` file.

```toml
[fetch]
	prune = true
```

From the docs for `git fetch`:

> `-p` `--prune`
>
> Before fetching, remove any remote-tracking references that no longer exist on the remote. Tags are not subject to pruning if they are fetched only because of the default tag auto-following or due to a `--tags` option. However, if tags are fetched due to an explicit refspec (either on the command line or in the remote configuration, for example if the remote was cloned with the `--mirror` option), then they are also subject to pruning. Supplying `--prune-tags` is a shorthand for providing the tag refspec.

> `-P, `--prune-tags`
>
> Before fetching, remove any local tags that no longer exist on the remote if `--prune` is enabled. This option should be used more **carefully**, unlike `--prune` it will remove any **local** references (local tags) that have been created. This option is a shorthand for providing the explicit tag refspec along with `--prune`, see the discussion about that in its documentation.
