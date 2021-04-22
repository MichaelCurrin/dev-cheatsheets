---
description: Changing pagination behavior in git
---
# Pager


## What is it?

Basic non-paging behavior lets you view all output at once (which can be very long like for `git log`).

The pager behavior gives you a paginated view (more user-friendly where you can scroll to output or search). Similar to running `git log | less`.

### Why have both

The non-page behavior I guess might be better for a CI flow (when you want to log output from any command and there is no interactive view). 

I don't see an advantage of using the non-page behavior for writing to a file or piping to another command, as the behavior seems identical from my testing.

e.g.

```sh
$ git -p log | sed 's/feat:/✨ feat:/g'
```

Or

```sh
$ git -p log > test.text
$ git -P log > test2.text
$ vimdiff
```

That says there is no difference.


## Switching paging on and off

- You can switch the behavior using a CLI flag for `git`. 
- You cn a value in your global git config, for an area like branches or log. This was generally _off_ for me on Bash (besides `git log`) and when switching to ZSH on macOS, I found it was configured _on_.

More on switching below in various situations.


## Generic usage

Turn pager on or off for any command.

Relevant flags for `git`

- `-p, --paginate` - Turn on paging.
- `-P | --no-pager` - Turn off paging.

Note that the **order** is important. Use the flag **between** `git` and the subcommand.

```sh
$ git --no-pager SUBCOMMAND [OPTIONS]
```

Note that some subcommands have `-p` as a flag which means something else. So you could do:

```sh
$ git -p log -p
```

See sections below for usage examples.


## Branch usage

### Global config

```sh
$ git config --global pager.branch false
```

### CLI flag
> Use a flag to use pager or not ignoring the global config


```sh
$ git --no-pager branch
$ git --paginate branch
```

That is similar to:

```sh
$ git branch | cat   # Print output
$ git branch | less  # Paginate
```


## Log usage

### Global config

```sh
$ git config --global pager.log false
```

### CLI flag

Log can be very long, so limit it.

```sh
$ git --no-pager log --oneline -40
```

Or with `lol` git alias.

```sh
$ git --no-pager lol -40
```

These long comamnds can be aliased as well.
