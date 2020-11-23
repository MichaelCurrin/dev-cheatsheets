---
description: Restore a file to an earlier state
---
# Undo


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

If the remote branch is the state you want and you have since done local commits, you can restore to the remote state. 

1. Start on your branch.
    ```sh
    $ git checkout my-feature
    ```
1. Update file or files to match the remote. 
    ```sh
    $ git reset origin/my-feature PATH
    ```
1. Get rid of the unstaged changes (You'll have staged changes which you want but also unstaged changes which you don't want. If you stage both or unstage both, you'll get nothing useful out. This command won't affect the staged changes.)
    ```sh
    $ git checkout .
    ```
1. Now just have the staged changes to revert to the remote state. 
    - You can do a commit.
        ```sh
        $ git commit
        ```
    - Or you can the changes, modify them and then commit them.
        ```sh
        $ git reset
        $ # ...    
        $ git commit
        ```

### Restore a deleted file

#### Use reset

Bring back a file which was previously deleted on your branch.

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

When using `reset`, if you leave out `--hard` then you need to remove the unstaged portion of the file.

```sh
$ git checkout .
```

Then commit the file that is staged.

Either way, you get to keep the history of the file, which you can see:

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

#### Checkout file at last known commit

If you are already on `master` and you can't reset to `master` or `origin/master`, then you will have to find the commit on `master` _before_ that file was deleted.

From [StackOverflow](https://stackoverflow.com/questions/953481/find-and-restore-a-deleted-file-in-a-git-repository?rq=1), find the last commit that affected the given path and restore the given path to the commit just before it. Hence use carat - `^`.

```sh
$ git checkout $(git rev-list -n 1 HEAD -- PATH)^ -- PATH
```

As the file isn't in the `HEAD` commit, this commit must have deleted it. 

Note that `HEAD` is literal and `PATH` will be your file or directory.
