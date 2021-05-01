# rebase

## Related sections

See [Rebase][] cheatsheet for more help on handling rebases.

[Rebase]: {{ site.baseurl }}{% link cheatsheets/version-control/git/rebase.md %}


## Resources

- [git rebase](https://git-scm.com/docs/git-rebase) in Git docs.
- [Git rebase](https://git-scm.com/book/en/v2/Git-Branching-Rebasing) tutorial in Git docs.
- [Git rebase](https://www.atlassian.com/git/tutorials/rewriting-history/git-rebase) Atlassian tutorial (they're the makers of BitBucket).


## Rebase on a branch

```sh
$ git rebase my-branch
```

Rebase on a branch you don't have locally.

```sh
$ git fetch
$ git rebase origin/my-branch
```


## Fix conflicts

When you have conflicts to fix, you'll have to make some changes and then stage them.

### Stage

```sh
$ git add PATH
```

The CLI also gives you the option of `git rm`

### Continue

Then run:

```sh
$ git rebase --continue
```

I think this also works:

```sh
$ git commit
```

### Abort rebase

If a rebase is no going well, you can revert to the state before you started the rebase.

```sh
$ git rebase --abort
```

### Skip rebase

After correcting a conflict, you might find there is nothing to commit. Like if your local branch and the remote branch both added the same code to the same line.

In that case, you can drop your commit.

```sh
$ git rebase --skip
```

I got this message when running `--continue` with no changes commit.

```
No changes - did you forget to use 'git add'?
If there is nothing left to stage, chances are that something else
already introduced the same changes; you might want to skip this patch.
Resolve all conflicts manually, mark them as resolved with
"git add/rm <conflicted_files>", then run "git rebase --continue".
You can instead skip this commit: run "git rebase --skip".
To abort and get back to the state before "git rebase", run "git rebase --abort".
```


## Rebase interactively

```sh
$ git rebase -i COMMIT_REF
```
