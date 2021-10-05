---
title: Upstream
description: Set the upstream remote reference for a branch.
---


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
