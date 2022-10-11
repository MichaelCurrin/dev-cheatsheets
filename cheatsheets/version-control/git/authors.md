---
title: Authors
description: Show author names and their contributions to a repo
---


## Show

In a Git repo, show a summary of GitHub users (using author names) and the number of commits by each, sorted by commit count.

```console
$ git shortlog -n -s
   969  michaelcurrin
   123  MichaelCurrin
   116  Alessio Benvenuti
```

For more info, see the [shortlog][] command.

[shortlog]: {% link cheatsheets/version-control/git/commands/shortlog.md %}


## Edit

Change the author of a commit.

### Edit one commit

How to update one commit at a time, using Git manually one command at a time.

This logic comes from the first part of the tutorial linked above and is provided as
instructions below.

1. Set your new author name and email in a variable. e.g.
    ```sh
    $ export AUTHOR="John Doe <john@doe.org>"
    ```
1. Start a rebase, starting with one commit _before_ the first commit you want to update.
    ```sh
    $ git rebase -i -p COMMIT_REFERENCE
    ```
    e.g. use the carat and the target first commit to get one commit before it.
    ```sh
    $ git rebase -i -p fd27b00ac^
    ```
1. Change `pick` to `edit` or `e` for each commit where you want to change the author. **Warning** - this will replace the author regardless of who it was.
1. Save the content in the editor view then exit.
1. Now you adjust each commit one at a time with these two commands:
   ```sh
   $ git commit --amend --author="$AUTHOR" --no-edit
   $ git rebase --continue
   ```

### Bulk editing

For bulk editing, see [MichaelCurrin/rewrite-git-author](https://github.com/MichaelCurrin/rewrite-git-author) repo.
