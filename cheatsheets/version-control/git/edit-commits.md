---
title: Edit commits
description: Workflow to edit various details of a commit
---

You're about to edit commits locally. This changes the git history, rather than adding on top of it with new commits. A `git revert` commit is a good way of undoing work without changing the history.


## Changing histoy

### Warning on editing

Before deciding to edit commit locally.

Check if you have already pushed the commit. If not then, no issue.

But if you have pushed already, then you are going to need to do a **force push** to replace the existing commits on GitHub with your altered commits. This is usually fine if you are the **only** one working on a feature branch. And sometimes it might be okay to do it on **master** or **main.

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

This is an easy approach but only works for the last commit.

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

### Interactive rebase

Start an interactive rebase for 3 commits back.

```sh
$ git rebase -i HEAD~3
```

You'll get an editor prompt like this, with the 3 commits:

```
pick 2d2bf05 Latest message
pick e624deb Second message
pick f6f2295 First message

# Rebase 69e697c..f6f2295 onto 69e697c (3 commands)
```

You'll see a key of options available.

The word `pick` means you want to keep the commit in your commit history (i.e. don't drop it), but that you don't want to edit it.

### Edit commit messages

Using the interacive mode above.

Change one or more of the `pick` words to `r` or `reword`.

e.g.

```
reword 2d2bf05 Latest message
pick e624deb Second message
reword f6f2295 First message
```

Then save the content.

You'll then get prompted one commit at a time to write a new commit message and save it. 

After that, you can run:

```sh
$ git log
```

You'll see the commit messages changes. And the commit hashes will be different - starting from the earliest commit you changed and then affecting every commit after that too (a commit hash depends on the hash of the commit before it).
