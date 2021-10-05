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
