# switch

[git switch](https://git-scm.com/docs/git-switch/) docs

This newer command is marked as experimental (usage may change).

It does the same as a combination of `git branch` and `git checkout`.


## Change branch 

```sh
$ git switch BRANCH
```

Like 

```sh
$ git branch BRANCH
```


## Change and merge

If you have modified changes when you change, the CLI might give an error.

Then do a 3-way merge between your current branch and the target branch.

```sh
$ git switch -m BRANCH
```

And check changes with

```sh
$ git diff
```


## Change to previous branch 

```sh
$ git switch -
```

Like

```sh
$ git checkout -
```


## Create branch and switch to it

Using `--create`.

```sh
$ git switch -c BRANCH
```

Equivalent to:

```sh
$ git branch BRANCH
$ git switch BRANCH
```

Or

```sh
$ git checkout -b BRANCH
```
