# Rebase


## Related sections

See [rebase][] page in Git section for more help on handling rebases.

[rebase]: {{ site.baseurl }}{% link cheatsheets/version-control/git/commands/rebase.md %}


## Perform a rebase

### Use the pull subcommand

I find these the most useful, as it is one line and forces pulling in the remote with an implied `git fetch`.

This implies a rebase of current branch on the remote branch of the same name. Useful for working on master or a feature branch when you have unpushed changes to rebase.

```sh
$ git pull --rebase
```

Useful for rebasing a feature branch on master.

```sh
$ git pull --rebase origin master
```

**Warning** - that last one above goes across branches and this will likely alter the history of your feature branch. So you'll have to do a **force push**. And other machines with the branch checked out will have to deal with differeing histories such as deleting and recreating the branch on that machine.

Similarly, you can rebase your fork's feature branch or master branch on the original upstream repo's master, but changing `origin` to `upstream` above.

### Use the rebase subcommand

This gives you more control, as you get to leave out the `git fetch` if you want and can be used without an internet connection. However, I find I don't use this so much because you have to remember to do two steps.

Rebase on a remote branch. You don't have to have the branch created, you just need a reference to the latest remote.

```sh
$ git fetch
$ git rebase origin/master
```

Rebase on a local branch. Warning - that local branch may not be up to date.

```sh
$ git rebase master
```

## Rebase a feature branch on the main branch

The same info as above, but from verbose and basic to succinct.

These approaches give equivalent results for the feature branch.

### pull main branch

Note that if you are rebasing on a remote master, you have to do a pull first. Which is tedious to do regularly.

```sh
git checkout main
git pull

git checkout my-feat
git rebase master
```

### rebase on origin 

You can also do it this way, without updating local main or leaving your feature branch.

```sh
git checkout my-feat
git fetch
git rebase origin/main
```

### pull rebase

Or simply this, in even fewer commands:

```sh
git checkout my-feat
git pull --rebase origin main
```

Then do:

```sh
git push 
```

Implied to be:

```sh
git push origin my-feat
```

Note that all the approaches here have the same outcome. And they are safe to do repeatedly and doesn't require a force push. As they only rebase _unpushed_ commits, which is the golden rule of rebasing. See [article](https://www.atlassian.com/git/tutorials/merging-vs-rebasing) for more info that rule.


## Dealing with conflicts

### Possible actions

#### Update and continue

Common flow:

1. Edit a file to remove conflicts.
2. Add or remove.
    ```sh
    $ git add PATH
    $ # OR
    $ git rm PATH
    ```
3. Continue.
    ```sh
    $ git rebase --continue
    ```

I think you can also just run `git commit` to add and continue.


#### Skip

Skip the current commit.

This is useful if after removing conflicts there are no changes to add or commit.

```sh
$ git rebase --skip
```

#### Abort

```sh
$ git rebase --abort
```

#### Restore

I am not familiar with this but it comes from the suggested commands.

Unstage a file.

```sh
git restore --staged PATH
```

#### Show patch

When you experience a conflict, you can use this to see the patch (diff) for the current commit.

This was suggested on a conflict.

```sh
$ git am --show-current-patch
```

Using `git am`:

> Apply a series of patches from a mailbox
>
> Splits mail messages in a mailbox into commit log message, authorship information and patches, and applies

### Messaging

Message from rebase result on a conflict:

```
CONFLICT (content): Merge conflict in ...
...
git add/rm <conflicted_files>", then run "git rebase --continue".
You can instead skip this commit: run "git rebase --skip".
To abort and get back to the state before "git rebase", run "git rebase --abort".
```

Message from `git status`:

```
  (fix conflicts and then run "git rebase --continue")
  (use "git rebase --skip" to skip this patch)
  (use "git rebase --abort" to check out the original branch)

Unmerged paths:
  (use "git restore --staged <file>..." to unstage)
  (use "git add <file>..." to mark resolution)
	both modified:   ...
```
