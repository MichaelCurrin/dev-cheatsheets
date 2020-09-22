---
title: Sync fork
description: How to bring your fork inline with the original repo, without a merge commit
---

## Background

The thing with forking a repo on GitHub is that yours can go out of sync with the original ("upstream") when commits are made to it.

You can make a Pull Request from upstream to your fork, either by hand or using a GH Action. Unfortunately, this introduces a **merge commit** (even if you use the squash or rebase PR options). Which is out of place in your commit history as it is a commit that does not exist on the "upstream" and therefore it would add noise if you tried to contribute a change which includes this commit. Also you'll see your repo tell you that your branch is 1 commit ahead of upstream, even though the content is identical.


## Solution

Use git on the command-line to bring your fork up to speed.

This can be done using the _git merge_ command, but there is a small risk of commit histories looking different. Such as if the upstream repo had _all_ commits rebased so email address could be updated - I've had this experience before. Or if you happen to have made any local commits on master.

I recommend the `git reset` option rather. This will not try and do a merge between the two repos but will update your `master` branch HEAD to point to the same commit as the fork's latest commit - regardless of if your fork is ahead or behind.

Warning: You will lose any unsaved file changes locally. And the force push will overwrite any changes on your fork which differ from the upstream.

Here is my example flow:

```sh
$ git clone git@github.com:MichaelCurrin/birdseye.git
$ cd birdseye
$ git remote add upstream git@github.com:alexmojaki/birdseye.git
$ git fetch upstream master
$ git reset --hard upstream/master
$ git push origin master
```

Where this is my fork: `MichaelCurrin/birdseye`

This is the "upstream" repo added as remote: `alexmojaki/birdseye`.

And `master` is the default branch. Alternatively one could check what the current branch is when doing the initial clone. Note that the upstream might change to `dev` or `main` etc. and delete `master`, when you still use `master`.

That could be redone using variables:

```sh
$ REPO=birdseye
$ ME=MichaelCurrin
$ UPUSER=alexmojaki
$ BRANCH=master
```
