---
title: clone
---

See [git clone](https://git-scm.com/docs/git-clone) docs.


## Default

```sh
$ git clone URL
```

e.g.

```sh
$ git clone git@github.com:MichaelCurrin/dev-cheatsheets.git
```


## Custom directory

```sh
$ git clone URL DIRECTORY_NAME
```

e.g.

```sh
$ git clone git@github.com:MichaelCurrin/dev-cheatsheets.git custom-name
$ cd custom-name
```


## Shallow

Clone just one commit, to make downloading quicker. This implies fetching of the one branch only.

```sh
$ git clone URL --depth 1
```

When you check the log, you'll see something like this.

```sh
$ git log
* b385b6c (grafted, HEAD -> master, origin/master, origin/HEAD) Added foo to bar
```


## Branch

Target a branch to clone rather than the default. Just saves having to do `cd` after.

```sh
$ git clone URL --branch my-branch
```

You probably don't need to do this, since shallow achies the same.

```sh
$ git clone URL --single-branch
```

Clone a target branch and no others.

```sh
$ git clone URL --branch my-branch --single-branch
```


## Flags

- `--branch <name>`
    > Instead of pointing the newly created `HEAD` to the branch pointed to by the cloned repository’s `HEAD`, point to `<name>` branch instead. In a non-bare repository, this is the branch that will be checked out. 
    > 
    > `--branch` can also take tags and detaches the `HEAD` at that commit in the resulting repository.
- `--depth <depth>`
    > Create a shallow clone with a history truncated to the specified number of commits. 
    > 
    > Implies `--single-branch` unless `--no-single-branch` is given to fetch the histories near the tips of all branches. 
    > 
    > If you want to clone submodules shallowly, also pass `--shallow-submodules`.
- `--single-branch`
    > Clone only the history leading to the tip of a single branch, either specified by the `--branch` option or the primary branch remote’s `HEAD` points at. 
    > 
    > Further fetches into the resulting repository will only update the remote-tracking branch for the branch this option was used for the initial cloning. 
    > 
    > If the `HEAD` at the remote did not point at any branch when `--single-branch` clone was made, no remote-tracking branch is created.
