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


## Delete multiple branches

Here I assume you've got all your Pull Requests merged or closed.
    
This will delete all your **merged** local branches, aside from the current or special branches (`main`, `master` and `develop`).
        
Note the significance of the star for the current branch, as it will be used below in the regex.

```console
$ git branch
  abc
* foo
  main
  xyz
```

Note on accuracy:

- Run `git fetch` (or `git pull`) first to make sure you are up to date with the remote.
- Push any in-progress work in case you need to recover a branch from the remote.
    
### Use single grep and xargs
    
Based on the ZSH alias `gbda`. Which probably stands for "git branch delete all".

This will use `xargs` to take each branch name and run the delete branch command against it one at a time.
    
```sh
$ git branch --no-color --merged \
    | command egrep -v "^(\+|\*|\s*(main|master|develop)\s*$)" \
    | command xargs -n 1 git branch -d
```
    
### Use double grep
    
Based on another source I found.
    
Here we get the branch names as one long string, excluding the current branch (starting with `*` and the special branches.

Then remove line breaks with `tr`. 

And pass the output all the delete branch command as multiple arguments.
    
```sh
$ git branch -d $(git branch --merged \
    | grep -v '^*' \
    | egrep -v 'main|master|develop' \
    | tr -d '\n')
```

Note `egrep` (or `grep -E`) to handle the pipe pattern specifically.
    
Sample output:
    
``` 
Deleted branch foo (was 06e07e7).
Deleted branch bar (was 125f0d2).
```
    
Equivalent to:
    
```sh
$ git branch -d abc def xyz
```
   
### Aggressive

A branch might actually be merged (such as using a PR merge button), but might not known to `git` as merged if it was a **squash** merge. 

In that case:

- Omit the `--merged` flag in the commands below.
- Use `-D` to force a delete instead of a warning.

Instead of using `tr`, here using `xargs` as a more elegant way to put all the arguments on one line i.e. remove line breaks.

```sh
$ git branch -D $(git branch \
    | grep -v '^*' \
    | grep -v 'main|master|develop' \
    | xargs)
```
    

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

