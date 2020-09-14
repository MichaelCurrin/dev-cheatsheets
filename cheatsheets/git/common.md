---
title: Common
---

My commonly used commands for quick reference. Especially the command and flag combinations I **frequently** use or need to lookup or get confused with (e.g. do I use `-r` or `-v` on `git branch`, or was that `git remote` ?). Leaving out any which are already memorized or painfully obvious if you're not a beginner. 

Ideally this can all fit on a page especially by leaving out explanations and output or putting them in compressed setions. There can be links to other sections for more variations, or details on that subcommand.


## Add all

```sh
$ git add . -A
```

## Remote full URLs

```sh
$ git remote -v
```

## All branches

```sh
$ git branch -a
```


## View changes

```sh
$ git log -p
$ # OR
$ git show
```

To show file names only:

```sh
$ git diff --name-status HEAD~ # OR two hashes
```
<!-- `--name-only` will exclude 'A' etc. -->


## Stash

```sh
$ git stash show [-p]  # Extend from file summary to details.
```


## Diff

```sh
$ git checkout feature
$ git diff HEAD..master
```
