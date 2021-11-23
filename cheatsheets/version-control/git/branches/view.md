# View

## Basic

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

## Verbose

Show local branches with references to the remote.

```sh
$ git branch -v
```
```
  foo                                                    4c677a0 [gone] Some commit message
* bar                                                    a89446e Another message
  master                                                 5680e85 Yet another commit message
  ```

## Remotes

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

## All

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
