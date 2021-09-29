# Branches


## View

### Basic

Show local branches.

```sh
$ git branch
```
```
  foo
* bar
  master
```

Get the current branch.

```sh
$ git branch --show-current
bar
```

### Verbose

Show local branches with references to the remote.

```sh
$ git branch -v
```
```
  foo                                                    4c677a0 [gone] Some commit message
* bar                                                    a89446e Another message
  master                                                 5680e85 Yet another commit message
  ```

### Remotes

Show only remote branches.

```sh
$ git branch -r
```
```
  origin/bar
  origin/HEAD -> origin/master
  origin/master
```

You can also run this with the verbose flag to which commit each points to.

```sh
$ git branch -r -v
  origin/bar                                 a89446e Another message
  origin/HEAD                                -> origin/master
  origin/master                              5680e85 Yet another commit message
```

### All

View both local and remote branch references.

```sh
$ git branch -a
```
```
  foo
* bar
  master
  remotes/origin/bar
  remotes/origin/baz
  remotes/origin/HEAD -> origin/master
  remotes/origin/master
```



## Delete local branches

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

#### Using -d or -D flag

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


### Restore deleted branch

Even often a branch is deleted, you can still create it from the local remote reference.

```sh
$ git branch -d foo
$ git checkout foo
Branch 'foo' set up to track remote branch 'foo' from 'origin'.
Switched to a new branch 'foo'
```

From the `git checkout` manpage:

> If `<branch>` is not found but there does exist a tracking branch in exactly one remote (call it `<remote>`) with a matching name, treat as equivalent to

```sh
$ git checkout -b <branch> --track <remote>/<branch>
```

e.g.

```sh
$ git checkout -b foo --track origin/foo
```

### Delete multiple branches

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
    
#### Single grep and xargs
    
Based on the ZSH alias `gbda`. Which probably stands for "git branch delete all".

This will use `xargs` to take each branch name and run the delete branch command against it one at a time.
    
```sh
$ git branch --no-color --merged \
    | command grep -vE "^(\+|\*|\s*(main|master|develop)\s*$)" \
    | command xargs -n 1 git branch -d
```
    
### Double grep
    
Based on another source I found.
    
Here we get the branch names as one long string, excluding the current branch (starting with `*` and the special branches.

Then remove line breaks with `tr`. 

And pass the output all the delete branch command as multiple arguments.
    
```sh
$ git branch -d $(git branch --merged \
    | grep -v '^*' \
    | grep -v 'main|master|develop' \
    | tr -d '\n')
```
    
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

How to delete local remote references with no branch on GitHub

Even though you've deleted a branch locally as covered above, your git repo will have a local reference to that remote branch. And also the branch might still exist on GH itself.

Use this to remove local references to remote branches which have been deleted on GitHub.

```sh
$ git remote prune origin
```

This will not delete your local branch. Just the origin references you see with:

```sh
$ git branch -r
```
```
origin/foo
origin/bar
origin/master
```


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


## Set upstream

This is needed the first time pushing an new branch created locally.

```sh
$ git checkout -b my-feature
```

Use the `--set-upstream` flag when pushing.

```sh
$ git push -u origin my-feature
$ # Or
$ git push -u origin $(git branch --show-current)
```

Or configure the branch then push.

```sh
$ git branch --set-upstream-to=origin/my-feature my-feature
$ git push
```

As a shortcut, you can skip setting upstream by adding `HEAD`. You'll just have to do this on _every_ push.

```sh
$ git checkout -b my-feature
$ git push HEAD
```

There is a also way to configure git to always set the upstream for you. But I think it is better to have more control, such as to avoid recreating a branch you deleted. You'll get an error when pushing and can stop and think if you are on the right branch.


## Rename branch

### Locally

Use the `--move` flag.

```sh
$ git branch -m CURRENT NEW
```

### On GitHub

In GitHub settings for a default branch, you can rename the branch .

You get this prompt for renaming from `master` to something else.

> Your members will have to manually update their local environments. We'll let them know when they visit the repository, or you can share these commands:

```sh
$ git branch -m master <BRANCH>
$ git fetch origin
$ git branch -u origin/<BRANCH> <BRANCH>
```

After a rename, GH gives you a filled snippet to copy, like:

```sh
$ git branch -m master main
$ git fetch origin
$ git branch -u origin/main main
```
