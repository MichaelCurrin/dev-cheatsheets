---
title: describe
description: Get latest tag
---

From [git describe](https://git-scm.com/docs/git-describe) docs:

> git-describe - Give an object a human readable name based on an available ref
>
> The command finds the most recent tag that is reachable from a commit....

## Basic

Shows tag number found, the number of commits back as a number and then a short commit hash.

```sh
$ git describe
v0.19.0-1-gdc17e80
```

Another case for 32 commits back. The hash is `9641372`. The `-g` always seems to appear as a prefix.

```sh
$ git describe
v1.0.2-32-g9641372
```

If the current commit already has a tag, only the tag will be shown.

```sh
$ git checkout gdc17e80
$ git describe
v0.19.0
```


## Abbreviate

Show just commit reference by setting the hash length to zero.

```sh
$ git describe --abbrev=0
v0.19.0
```


## Show all tags not just annotated

> By default (without `--all` or `--tags`) git describe only shows **annotated** tags

Including tags that are not annotated.

```sh
$ git describe --tags
```
