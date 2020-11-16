---
description: Restore a file to a versioned state
---
# Undo



Restore a target. Path is required, otherwise nothing will change.

```sh
git checkout PATH
```

Restore directory using a single dot. This is recursive - current directory and below. Do this from the repo root if needed.

```sh
git checkout .
```

Restore to a commit reference. Such as a tag number, a commit hash, or a branch name (e.g. `master`, `my-feature`). The path could be `.` or a directory or filename.

```sh
git checkout COMMIT_REF PATH
```

If the remote branch is the state you want and you have since done local commits, you can restore to the remote state. 

1. Start on your branch.
    ```sh
    git checkout my-feature
    ```
1. Update file or files to match the remote. 
    ```sh
    git reset origin/my-feature PATH
    ```
1. Get rid of the unstaged changes (You'll have staged changes which you want but also unstaged changes which you don't want. If you stage both or unstage both, you'll get nothing useful out. This command won't affect the staged changes.)
    ```sh
    git checkout .
    ```
1. Now just have the staged changes to revert to the remote state. 
    - You can do a commit.
        ```sh
        git commit
        ```
    - Or you can the changes, modify them and then commit them.
        ```sh
        $ git reset
        $ # ...    
        $ git commit
        ```

### Restore a deleted file

Bring back a file which was previously deleted.

```sh
git reset COMMIT_REF PATH

# e.g.
git reset master foo.txt
```
The file then appears as both deleted and created (staged0.

Or

```sh
git checkout COMMIT_REF PATH

# e.g.
git checkout master foo.txt
```

This creates the file and stages it. This might be better than the process above for keeping the history as the same file.

If you are on a feature branch and the file is still on master, you can reset to the master (note targeting just the file path).

If you are already on master, you will have to find the commit _before_ that file was deleted.

From [StackOverflow](https://stackoverflow.com/questions/953481/find-and-restore-a-deleted-file-in-a-git-repository?rq=1).

Find the last commit that affected the given path. As the file isn't in the HEAD commit, this commit must have deleted it.
sh

```sh
git rev-list -n 1 HEAD -- MY_PATH
```

Checkout the version at the commit before, using the caret (^) symbol:

```sh
git checkout DELETING_COMMIT^ -- MY_PATH
```

Or in one command.

```sh
git checkout $(git rev-list -n 1 HEAD -- "MY_PATH")^ -- "MY_PATH"
```
