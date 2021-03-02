---
description: Prune all unreachable objects from the object database
---
# prune

You probably **don't** need this command.

From the help:

> In most cases, users should run `git gc`, which calls `git prune`.

If you want to know how clean-up references to **remote-tracking** branches, see the [Prune branches][] page.

[Prune branches]: {{ site.baseurl }}{% link cheatsheets/version-control/git/prune-branches.md %}


## Tutorial

See [git prune](https://www.atlassian.com/git/tutorials/git-prune) tutorial in the Atlassian docs.

> The git prune command is an internal housekeeping utility that cleans up unreachable or "orphaned" Git objects.
>
> Unreachable objects are those that are inaccessible by any refs.
>
> Any commit that cannot be accessed through a branch or tag is considered unreachable. git prune is generally not executed directly. Prune is considered a garbage collection command and is a child command of the `git gc` command.

> The `git prune` command is intended to be invoked as a child command to `git gc`. It is **highly unlikely** you will ever need to invoke `git prune` in a day to day software engineering capacity. Other commands are needed to understand the effects of `git prune`.


## Help

```
git prune [-n] [-v] [--progress] [--expire <time>] [--] [<head>...]
```


## Examples

```sh
$ git prune --dry-run --verbose
```

```sh
$ git prune --dry-run --verbose --expire=now
```

Delete branches which have been deleted on the GitHub remote.

```sh
$ git prune remote origin
```
