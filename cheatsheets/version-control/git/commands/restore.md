# restore

I haven't used this but here are notes from the [git restore](https://git-scm.com/docs/git-restore) docs.

> git-restore - Restore working tree files

```
git restore [<options>] [--source=<tree>] [--staged] [--worktree] [--] <pathspec>…​
git restore [<options>] [--source=<tree>] [--staged] [--worktree] --pathspec-from-file=<file> [--pathspec-file-nul]
git restore (-p|--patch) [<options>] [--source=<tree>] [--staged] [--worktree] [--] [<pathspec>…​]
```

> Restore specified paths in the working tree with some contents from a restore source. If a path is tracked but does not exist in the restore source, it will be removed to match the source.
> 
> The command can also be used to restore the content in the index with `--staged`, or restore both the working tree and the index with `--staged --worktree`.
> 
> By default, if `--staged` is given, the contents are restored from HEAD, otherwise from the index. Use `--source` to restore from a different commit.

```sh
$ git switch master
$ git restore --source master~2 Makefile  (1)
$ rm -f hello.c
$ git restore hello.c                     (2)
```
