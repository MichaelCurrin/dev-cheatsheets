# Delete


## Local branches

### Delete one branch

Both of these will delete a branch immediately. In the case of the first one, you'll get a warning if the branch is not merged, but it will continue anyway.

```sh
$ git branch -d BRANCH_NAME
$ git branch -D BRANCH_NAME
```

You can supply multiple branch names if you want.

```sh
$ git branch -d foo bar
```

#### Use -d or -D flag

If you use `-d` , you'll get warnings on unmerged branches. Using `-D` will delete it anyway.

Here with `-d`:

```
error: The branch 'foo' is not fully merged.
If you are sure you want to delete it, run 'git branch -D foo'.
```

Perhaps this can be extended to exclude the current git branch.

If you have list of branches from `git branch`, you can pass them to the delete command without a `for` loop.

```sh
echo 'foo
bar
baz' | xargs git branch -D
```

### Delete specified branches

Check your branches list:

```console
$ git branch
  abc
* foo
  main
  xyz
```

Then delete by passing one or more branch names:
    
```sh
$ git branch -d abc def xyz
```

### Delete multiple merged branches

To delete all your **merged** local branches, aside from the current (started with asterisk like `* BRANCH_NAME`) and special branches (`main`, `master` and `develop`).

Tips for actions to follow before you run the commands:

- Get your Pull Requests merged or closed on GitHub.
- Run `git fetch` (or `git pull`) to make sure you are up to date with the remote.
- Push any in-progress work in case you need to recover a branch from the remote. Alteratively, recover a branch using `git reflog`.

### Delete branches which are deleted on the remote

Note on approach for deleting branches: When using the `git branch --merged` flow to find merged branches, it won't pick up where the remote branch is deleted (`[gone]` in `git branch -v`). That can happen if a branch was deleted without being merged in or if a PR was merged with a rebase or squash so it looks like the branch is not merged even though it was.

Looking for `[gone]` is the most reliable approach.

```sh
$ git fetch -p && git branch -vv | grep ': gone]' | awk '{print $1}' | xargs git branch -d
```

Change the `-d` to `-D` to more aggressively delete the branches.

**Here is how that breaks down:**

* `git fetch -p`: The `-p` (prune) flag tells Git to delete any local references to remote branches that no longer exist on the server.
* `git branch -vv`: Displays branches with extra detail, including the relationship to the remote. If the remote is gone, Git explicitly labels it `: gone]`.
* `grep ': gone]'`: Filters for only those "ghost" branches.
* `awk '{print $1}'`: Grabs the name of the branch.
* `xargs git branch -d`: Deletes them safely.

You can also preview what would be deleted:

```sh
$ git branch -vv | grep ': gone]' | awk '{print $1}'
```

#### Delete all merge branches at once using a simple `grep` pattern
    
Here we get the branch names as a single string, then in two steps we remove the current branch and then special branches. All the branch names are passed at once to delete branch action.


```sh
$ git branch -d $(git branch --no-color --merged \
    | grep -v '^*' \
    | egrep -v 'main|master|develop' \
    | xargs)
```

Note `egrep` (or `grep -E`) to handle the pipe pattern specifically.
  
#### Delete all merged branches at once using a long `grep` pattern
    
Based on the ZSH alias `gbda`. Which is "git branch delete all". This is can be harder to read than above as it uses `command` and longer regex pattern but gives the same outcome.

This uses `xargs` to take each branch name and run the delete branch command against it one at a time.
    
```sh
$ git branch --no-color --merged \
    | command egrep -v "^(\+|\*|\s*(main|master|develop)\s*$)" \
    | command xargs -n 1 git branch -d
```

Sample outptut:

```
Deleted branch foo (was d1e73df07).
Deleted branch bar (was bd31cf305).
...
```

Using `command COMMAND` avoids using any aliases you have setup I guess.
    
#### Aggressively delete branches regardless of merged status

This approach doesn't check whether a branch is deleted or not, it just deletes **all** branches besides the current one and the special branches.

A branch might _actually_ be merged on the remote (such as using a PR merge button), but still not be _recognized_ by Git as merged like if there was a **squash** merge (which creates a new commit and so the PR commits do not appear on the main branch).

In that case, modifiy one of the commands above:

- Omit the `--merged` flag in the command.
- Use `-D` flag to _force_ a delete instead of a warning.


## Delete local references to remote branches

How to delete local remote references with no branch on GitHub.

Even though you've deleted a branch locally as covered above, your git repo will have a local reference to that remote branch. And also the branch might still exist on GH itself.

List your local references to remote branches:

```console
$ git branch -r
origin/foo
origin/bar
origin/master
```

Use this to remove local references to remote branches which have been _deleted_ on GitHub.

```sh
$ git remote prune origin
#  ...
#  * [pruned] origin/foo
#  * [pruned] origin/bar
```

Then your output might be shorter like:

```console
$ git branch -r
origin/master
```

You do not have to use any other delete commands from this page to take care of those.

This will only delete remote branch references e.g. those starting with `origin/` and see with `-r` above.


## Delete branch on GitHub remote

How to delete the actual branch on GitHub, using the command-line rather than clicking delete the Branches tab.

Do a `push` with a _delete_ flag.

```sh
$ git push -d origin BRANCH_NAME
```

This works on branches and tags.

```sh
$ git push -d origin foo
$ git push -d origin v1.2.3
```

This has _no_ effect on a local branch or tag.

