---
description: Restore a file to an earlier state
---
# Restore file


## Use checkout

Restore a target. Path is required, otherwise nothing will change.

```sh
$ git checkout PATH
```

Restore directory using a single dot. This is recursive - current directory and below. Do this from the repo root if needed.

```sh
$ git checkout .
```

Restore to a commit reference. Such as a tag number, a commit hash, or a branch name (e.g. `master`, `my-feature`). The path could be `.` or a directory or filename.

```sh
$ git checkout COMMIT_REF PATH
```


## Use checkout

Restore a file to an earlier state. This includes bringing back a file that was deleted.

If you are on a _feature branch_ and the file is still on `main`, you can reset to the `main` (note targeting just the file path). 

```sh
$ git checkout COMMIT_REF -- PATH
```

e.g.

```sh
$ git checkout main -- foo.txt
```

You get to keep the history of the file, which you can see:

```sh
$ git log PATH
```

e.g.

```sh
$ git log foo.txt
```

The approach works great on a directory too, to restore multiple deleted or changed files to what is on `main`.

```sh
$ git checkout .
```

If you working tree is not clean, run this first:

```sh
$ git reset --hard
```


## Restore file deleted file

If you are are a feature branch, you can use the approach above against `main` to bring a file back. But, if you are already on `main` and pushed already, you can't use target `main` or `origin/main` to bring a file back. 

So now you have to use the last-known commit. And to get that, you must find the commit on `main` _before_ that file was deleted.

From [StackOverflow](https://stackoverflow.com/questions/953481/find-and-restore-a-deleted-file-in-a-git-repository?rq=1), find the last commit that affected the given path and restore the given path to the commit just before it. Hence use carat - `^`.

```sh
$ git checkout $(git rev-list -n 1 HEAD -- PATH)^ -- PATH
```

As the file isn't in the `HEAD` commit, this commit must have deleted it. 

Note that `HEAD` is literal text here. Replace `PATH` with be your file or directory path.
