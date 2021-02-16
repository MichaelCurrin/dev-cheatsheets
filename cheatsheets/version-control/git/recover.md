---
title: Recover
description: Bring back a branch you accidentally deleted and never pushed.
---

Git keeps a history of your actions and even keeps commits which you thought were deleted when a branch was deleted. Though, these can get cleaned up by Git automatically, or with `git gc` I think to run clean.

See a list of your actions.

```sh
$ git reflog
```

Example:

```
...
6252819 (origin/develop, origin/HEAD, develop) HEAD@{7}: checkout: moving from my-feature to develop
ee4527b (HEAD) HEAD@{8}: commit: Some message on my branch
...
```

Here, we moved away from `my-feature` to `develop` and then used `git branch -D my-feature` to delete it. Which is not shown in the reflog.

You can then checkout the commit referernce to the deleted branch, at the point before you moved way. The first line above is develop, the second is the branch.

```sh
$ git checkout ee4527b
Note: switching to 'ee4527b'.

You are in 'detached HEAD' state.   
... 
```

Have a look around. Things will be as they were.

```sh
$ git log
...
message: Some message on my branch
...
```

You can then checkout a new branch from this point. Here using the same name as before.

```sh
$ git checkout -b my-feature
Switched to a new branch my-feature
```

Or, straight after the reflog, without checking out the commit first.

```sh
$ git checkout -b my-feature my-ee4527b
```

