---
description: Understanding and using git hooks
---
# Hooks



## Resources

- [githooks.com](https://githooks.com/) homepage
    - It has a nice "Reading" section with info.
    - The "Projects" section shows existing projects you can integrate with.
        - A couple of hook managers.
        - This one prevents bad Python commits - [git-pre-commit-hook](https://pypi.org/project/git-pre-commit-hook/)
- [Git Hooks](https://git-scm.com/docs/githooks) in the Git docs
    - How hooks work
    - The hook types and descriptions.
    - Here is the source file - [githooks.txt](https://github.com/git/git/blob/master/Documentation/githooks.txt)
- [Customizing Git - Git Hooks](https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks) in the Git docs
- Repos
    - [#commit-msg](https://github.com/topics/commit-msg) GitHub topic
    - [speedy-commit-msg-hook](https://github.com/alan-agius4/speedy-commit-msg-hook) - NPM package to validate a commit message. This also includes an install step in `src` irectory.
    - [pre-commit/pre-commit-hooks](https://github.com/pre-commit/pre-commit-hooks) GH repo
- [pre-commit.com](https://pre-commit.com/) homepage
    - Good for use with Python projects.

### Integrations

The shell will follow your hook, but VS Code will not use. Well, in my experience is actually uses the commit message hook when you commit with the UI, but the hook cannot use any input values so it ends up being a dumb message generator that ignores what you write if you have a custom mssage.

Here are some GH issues around preparing commit message.

- [Git: Support prepare-commit-msg hook](https://github.com/microsoft/vscode/issues/94274) for VS Code. Closed issue.
- [Git: Support editing the commit message in a text editor](https://github.com/microsoft/vscode/issues/30562) for VS Code. Open issue.

Note that VS Code does follow the [commit template] file though - this can be useful for a branch description or ticket number. Unfortunately writing to this file at the _commit_ step is too late, as the template will have already been used in the hook. You could run a script every second to update the template file so it is always ready when you commit in the VS Code UI (which picks that up every few seconds) - that is just a lot of noise and processing to run it continously.

[commit template]: https://github.com/MichaelCurrin/learn-to-code/blob/master/en/topics/version_control/Git/configure/commit_message_template.md


## Setting up hooks

Note that if you store hooks in a directory like `hooks`, you'll need a manual step on installation to copy them to `.git/hooks`.

See also my [Jekyll Hooks](https://michaelcurrin.github.io/code-cookbook/recipes/jekyll/hooks.html) recipe.

### Copy

Here we use a file from version control in `hooks/` directory with the name and copy it to Git's hooks directory of `.git/hooks`.

```sh
$ cp hooks/pre-commit-msg .git/hooks/pre-commit-msg
```

You should make the file executable in version control for ease.

If it wasn't executable, you'll need to change it now:

```sh
$ chmod +x .git/hooks/pre-commit-msg
```

### Add symlink

An alternative which keeps the Git hooks in sync with the file in version control, so you never have to remmeber to copy after a change.

We'll get this in `.git/hooks`, when viewed with `ls -l`.

```
pre-push -> ../../hooks/pre-push
```

Make sure the file is executable in version control.

Then add a link inside the Git hooks using either approach:

- Linux and macOS.
    ```sh
    $ cd .git/hooks
    $ ln -s ../../hooks/pre-push pre-push
    ```
- Linux - using GNU `ls` which supports `-r`.
    ```sh
    $ ln -s -r hooks/pre-commit-msg .git/hooks/pre-commit-msg
    ```
    
See my [Badge Generator Makefile](https://github.com/MichaelCurrin/badge-generator/blob/master/Makefile) to see this in use.

### Reset

You can also _reset_ the Git hooks directory to remove any of your changes, using this in an existing repo.

```sh
$ git init
```

> It’s important to note that client-side hooks are not copied when you clone a repository. If your intent with these scripts is to enforce a policy, you’ll probably want to do that on the server side; see the example in [An Example Git-Enforced Policy](https://git-scm.com/book/en/v2/Customizing-Git-An-Example-Git-Enforced-Policy#_an_example_git_enforced_policy).



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
    - Allow updating commit message in place before the user sees it. "You may use it in conjunction with a commit template to programmatically insert information."
    - This invoked `git commit` right after preparing the default log message, but before the editor is started.
    - Params - It takes one to three parameters:
        1. The first is the **name of the file** that contains the commit log message.
        2. The second is the **source** or type of the commit message, and can be:
            - `message` (if the `-m` or `-F` option was given)
            - `template` (if the `-t` option was given or the configuration option `commit.template` is set)
            - `merge` (if the commit is a merge or a .`git/MERGE_MSG` file exists)
            - `squash` (if a `.git/SQUASH_MSG` file exists)
            - `commit`
        3. The commit hash - SHA-1 for an amended commit (if a `-c`, `-C` or `--amend` option was given).
    - Aborting
        - If the exit status is non-zero, git commit will abort.
    - The `sample prepare-commit-msg` hook that comes with Git removes the help message found in the commented portion of the commit template.
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
