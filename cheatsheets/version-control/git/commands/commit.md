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

Highlights of flags I am most likely use.

### Allow empty

`--allow-empty-message`

### Message

`-m <msg>, --message=<msg>`

> Use the given <msg> as the commit message. If multiple `-m` options are given, their values are concatenated as separate paragraphs.
>
> The -m option is mutually exclusive with `-c`, `-C`, and `-F`.

### File

`-F <file>, --file=<file>`

> Take the commit message from the given file. Use `-` to read the message from the standard input.

### Patch

Interactive patch mode.

`-p, --patch`

### Edit

`-e, --edit`

> The message taken from file with `-F`, command line with `-m`, and from commit object with `-C` are usually used as the commit log message unmodified. This option lets you further edit the message taken from these sources.

For example, set a message with a short string or a empty string but force edit mode so you get a prompt, where you don't have to worry about how the shell handles quotes and line breaks.

```sh
$ git commit --edit -m 'Start of commit message'
```

This is especially useful if you are doing a squash merge, where prefilled commit message is potentially a hundred lines and so could be tedious to delete the terminal in the next step.

### Reuse

`-C <commit>, --reuse-message=<commit>`

> Take an existing commit object, and reuse the log message and the authorship information (including the timestamp) when creating the commit.

Use like this to point to last completed commit.

```sh
$ git commit -C HEAD
```

### Reuse and edit

`-c <commit>, `--reedit-message=<commit>`

> Like `-C`, but with `-c` the editor is invoked, so that the user can further edit the commit message.
