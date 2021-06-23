---
description: About the git commit command
---
# commit


[git commit](https://git-scm.com/docs/git-commit) docs.


## Usage

```
git commit [-a | --interactive | --patch] [-s] [-v] [-u<mode>] [--amend]
	   [--dry-run] [(-c | -C | --fixup | --squash) <commit>]
	   [-F <file> | -m <msg>] [--reset-author] [--allow-empty]
	   [--allow-empty-message] [--no-verify] [-e] [--author=<author>]
	   [--date=<date>] [--cleanup=<mode>] [--[no-]status]
	   [-i | -o] [--pathspec-from-file=<file> [--pathspec-file-nul]]
	   [-S[<keyid>]] [--] [<pathspec>…]
```


## Flags

Highlights of flags I am most likely to use.

### Allow empty

`--allow-empty-message`

### Message

`-m <msg>, --message=<msg>`

> Use the given <msg> as the commit message. If multiple `-m` options are given, their values are concatenated as separate paragraphs.
>
> The -m option is mutually exclusive with `-c`, `-C`, and `-F`.

```sh
$ git commit -m 'My commit message'
```

It is rather tedious to handle the quotes, escape any quotes in the message and to check that multiline messages look right. So I mostly skip this flag and use an editor like `nano` to edit the message as a next step. You can use the Git config to choose Vim, Nano, or even VS Code.

You won't be prompted to edit the message, unless you add the [Edit](#edit) flag.

### File

`-F <file>, --file=<file>`

> Take the commit message from the given file. Use `-` to read the message from the standard input.

### Patch

Interactive patch mode. If you have an IDE like VS Code, it is much easier to use that than to step through interactive patch mode in the terminal.

`-p, --patch`

### Edit

`-e, --edit`

> The message taken from file with `-F`, command line with `-m`, and from commit object with `-C` are usually used as the commit log message unmodified. This option lets you further edit the message taken from these sources.

For example, set a message with a short string or a empty string but **force** edit mode so you still get a prompt, where you don't have to worry about how the shell handles quotes and line breaks.

```sh
$ git commit --edit -m 'Start of commit message'
```

This is especially useful if you are doing a squash merge, where prefilled commit message is potentially a hundred lines and so could be tedious to delete the terminal in the next step.

### No edit

`--no-edit`

Useful when amending and you don't want to edit the commit message.

```sh
$ git commit --amend --edit
```

### Reuse

`-C <commit>, --reuse-message=<commit>`

> Take an existing commit object, and reuse the log message and the authorship information (including the timestamp) when creating the commit.

Use it like this to point to the last completed commit.

```sh
$ git commit -C HEAD
```

Perhaps make an alias if you do this often enough.

### Reuse and edit

`-c <commit>, `--reedit-message=<commit>`

> Like `-C`, but with `-c` the editor is invoked, so that the user can further edit the commit message.


## Commit without adding

Beginners learn to use `git add` and `git commit`, but it gets annoying to do both each time.

Here is time saver. You can use `git commit` against a path as below, without `git add`. Don't worry - you can always preview what is going to be committed in the commented out section of the commit message, so you can abort if you made a mistake.

Note - if the file is untracked because it is new, you will have to use `git add` though. But the benefit is that if you have a bunch of untracked files and one tracked file that is modified, using `git commit .` will ignore the untracked files.

```sh
$ # Add and commit directory foo, bar and file.txt etc. Everything in current directory and below.
$ git commit .

$ # Add and commit everything in foo/ and below
$ git commit foo/

# Target a file
$ git commit file.txt
$ git commit foo/file.txt

$ # Target files
$ git commit foo/ bar/*.js package*.json README.md about.md
```
