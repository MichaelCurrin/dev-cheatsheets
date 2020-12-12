# prune
> Prune all unreachable objects from the object database


## Tutorial

See [git prune](https://www.atlassian.com/git/tutorials/git-prune) tutorial in the Atlassian docs.

> The git prune command is an internal housekeeping utility that cleans up unreachable or "orphaned" Git objects. Unreachable objects are those that are inaccessible by any refs. Any commit that cannot be accessed through a branch or tag is considered unreachable. git prune is generally not executed directly. Prune is considered a garbage collection command and is a child command of the `git gc` command.


## Help

```
git prune [-n] [-v] [--progress] [--expire <time>] [--] [<head>...]
```
