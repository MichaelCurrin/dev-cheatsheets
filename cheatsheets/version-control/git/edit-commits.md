---
title: Edit commits
description: Workflow to edit various details of a commit
---

You're about to edit commits locally. This changes the git history, rather than adding on top of it with new commits. A `git revert` commit is a good way of undoing work without changing the history.

See also: [git rebase](https://git-scm.com/docs/git-rebase) docs.


## Changing history

### A warning about editing

Before deciding to edit commit locally (whether the message, contents, whatever).

Check if you have **already pushed** the commit. 

If you have **not pushed** yet, then nothing to worry about.

But if you **have pushed** already, then after your edit, you are going to need to do a **force push** to replace the existing commits on GitHub with your altered commits. This is usually fine if you are the **only** one working on a feature branch. And sometimes it might be okay to do it on **master** or **main.

```sh
$ git push --force
$ # Or preferably the safer option.
$ git push --force-with-lease
```

If there are other machines (your own or someone elses which have the old commits and you push your new ones, they may get surprised and will have to resolve conflicts.

### Pulling in forced-pushed commits on another machine

Here are two ways to drop the old history and use the new ones. Note if there are any unpushed changes on the old history, these will be lost.

- Delete and recreate branch.
    ```sh
    $ git branch -D my-feature
    $ git fetch
    $ git checkout -b my-feature
    ```
- Point a local branch and the latest force-pushed commit on GitHub.
  ```sh
  $ git checkout my-feature
  $ git fetch
  $ git reset --hard origin/my-feature
  ```


## Edit latest commit

This is an easy approach but only works for the **most recent commit**.

Here we get the chance to edit the commit message of the commit in the prompt that comes up.

```sh
$ git commit

$ git commit --amend
```

If you committed some files but accidentally left some out, you can add them to the last commit.

```sh
$ git commit

$ # Edit foo.txt and bar.sh
$ # ...

$ # Commit both changed files.
$ git commit . --amend
```

If you prefer more precision, add just the one changed file:

```sh
$ git commit foo.txt --amend
```

If you prefer to stage first or made a new file:

```sh
$ git add foo.txt bar.sh
$ git commit --amend
```


## Edit multiple commits

Edit any number of commits in your history. A certain commit in your history, multiple commits, or even all commits (like if you want to change the email).

### Interactive rebase

Start an interactive rebase with a reference to a commit to rebase on top of. 

If you want to change the last 3 commits, then would do this:

```sh
$ git rebase -i HEAD~3
```

This describes the following:

- `HEAD` - current commit.
- `HEAD~` - one commit before current.
- `HEAD~2` - two commits before current.
- `HEAD~` - three commits back. This will **not** be edited, but we will rebase on **top** of this commit.

You'll get an editor prompt like this, showing the 3 commits we are editing.

```
pick 2d2bf05 Latest message
pick e624deb One back message
pick f6f2295 Two back message

# Rebase 69e697c..f6f2295 onto 69e697c (3 commands)
```

At the bottom, you'll see a commented section with options available. 

```
# Commands:
#  p, pick = use commit
#  r, reword = use commit, but edit the commit message
#  e, edit = use commit, but stop for amending
#  s, squash = use commit, but meld into previous commit
#  f, fixup = like "squash", but discard this commit's log message
#  x, exec = run command (the rest of the line) using shell
```

You'll have to change at least one `pick` keyword to another option, then save, so you get to edit some commits.

All options described in the [GitHub docs](https://docs.github.com/en/github/using-git/about-git-rebase).

Some are covered next in more detail.

### Pick commit

The word `pick` means you want to **keep** the commit in your commit history (i.e. don't drop it), but that you **don't** want to edit it.

### Edit commit message

Using the interactive mode above, we can edit the wording of a commit message without changing the diff.

Change one or more of the `pick` keywords to either `r` or `reword`.

e.g.

```
reword 2d2bf05 Latest message
pick e624deb One back message
reword f6f2295 Two back message
```

Then save that message.

You will then get prompted **one commit at a time** to write a new commit message and save it. You can over course save without changing.

After the last one is done, you'll see that the rebase is done.

Then you can check like this:

```sh
$ git log
```

You'll see the commit messages changes. And the commit hashes will be different - starting from the earliest commit you changed and then affecting every commit after that too (a commit hash depends on the hash of the commit before it).
