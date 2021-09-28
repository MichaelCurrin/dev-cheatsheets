---
description: Restore a file to an earlier state
---
# Restore file


## Using checkout

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


## Use reset or checkout

Restore a file to an earlier state. This includes bringing back a file that was deleted.

If you are on a _feature branch_ and the file is still on `master`, you can reset to the `master` (note targeting just the file path). Either of these will work:

```sh
$ git reset --hard COMMIT_REF PATH
$ git checkout COMMIT_REF PATH
```

e.g.

```sh
$ git reset --hard master foo.txt
$ git checkout master foo.txt
```

Note - when using `reset`, if you leave out `--hard` then you need to remove the unstaged portion of the file like this:

```sh
$ git checkout .
```

Then commit the file that will be staged for you.

Either way, if you bring back a file, you get to keep the history of the file, which you can see:

```sh
$ git log PATH
```

e.g.
```sh
$ git log foo.txt
```

The approach works great on a directory too, to restore multiple deleted or changed files to what is on `master`. Use of these:

```sh
$ git reset --hard .
$ git checkout .
```


## Restore file deleted file

If you are are a feature branch, you can use the `reset` or `checkout` approaches above against `master` to bring a file back. But, if you are already on `master` and pushed, you can't use target `master` or `origin/master` to bring a file back. 

So now you have to use the last-known commit - you have to find the commit on `master` _before_ that file was deleted.

From [StackOverflow](https://stackoverflow.com/questions/953481/find-and-restore-a-deleted-file-in-a-git-repository?rq=1), find the last commit that affected the given path and restore the given path to the commit just before it. Hence use carat - `^`.

```sh
$ git checkout $(git rev-list -n 1 HEAD -- PATH)^ -- PATH
```

As the file isn't in the `HEAD` commit, this commit must have deleted it. 

Note that `HEAD` is literal and `PATH` will be your file or directory.

I've also seen a recommendation for this but don't know if it works.

```sh
$ git checkout -- PATH
```
