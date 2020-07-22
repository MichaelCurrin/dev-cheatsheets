---
title: Hooks
description: Understanding and using git hooks
---


## Resources

- [githooks.com](https://githooks.com/) homepage
    - It has a nice "Reading" section with info.
    - The "Projects" section shows existing projects you can integrate with.
        - A couple of hook managers.
        - This one prevents bad Python commits - [git-pre-commit-hook](https://pypi.org/project/git-pre-commit-hook/)
- [Hooks](https://git-scm.com/docs/githooks) in the Git docs
    - How hooks work
    - The hook types and descriptions.
    - Here is the source file - [githooks.txt](https://github.com/git/git/blob/master/Documentation/githooks.txt)
- [Customizing Git - Git Hooks](https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks) in the Git docs


## Hook samples

You get a few sample hook files in a `.git` directory which you can rename to use. Or create a new file.

## All hook types

Copied from githooks homepage. I've grouped for convenience.

### Patch

- `applypatch-msg`
- `pre-applypatch`
- `post-applypatch`

### Commit

- `pre-commit`
    - Allows editing of contents of a commit - not ideal for updating message.
    - This is invoked using `git commit`, before obtaining the commit log message
    - It takes no parameters.
- `prepare-commit-msg`
    - Allow updating commit message in place before the user sees it.
    - This invoked `git commit` right after preparing the default log message, but before the editor is started.
    - Params - It takes one to three parameters:
        1. The first is the **name of the file** that contains the commit log message. 
        2. The second is the **source** of the commit message, and can be: 
            - `message` (if the `-m` or `-F` option was given)
            - `template` (if the `-t` option was given or the configuration option `commit.template` is set)
            - `merge` (if the commit is a merge or a .`git/MERGE_MSG` file exists)
            - `squash` (if a `.git/SQUASH_MSG` file exists)
            - `commit`
        3. followed by a commit SHA-1 (if a -c, -C or --amend option was given).
    - Aborting
        - If the exit status is non-zero, git commit will abort.
    - The sample prepare-commit-msg hook that comes with Git removes the help message found in the commented portion of the commit template.
- `commit-msg`
    - This is invoked by `git commit` and `git merge`.
    - Params
        - It takes a single parameter.
            1. The **name of the file** that holds the proposed commit log message.
    - Aborting
        - Exiting with an error status causes the command to **abort**.
- `post-commit`
    - This is used primarily for notification and cannot affect the outcome of a commit.

### Merging and branches

- `pre-rebase`
- `post-checkout`
- `post-merge`

### Receive and update

I don't know what these are for.

- `pre-receive`
- `update`
- `post-receive`
- `post-update`

### Clean

- `pre-auto-gc`

### Rewrite

- `post-rewrite`

### Push

- `pre-push`

