---
title: Git pager
description: View all output at once or use a paginated view
---

The _pager_ functionality can be off or on depending on global config.

This was off for me on Bash and when switching to ZSH on macOS, I found it was configured out.


## Generic

Turn pager on or off for any command.

Relevant flags for `git`

- `-p, --paginate` - Turn on paging
- `-P | --no-pager` - Turn off paging

See sections below for usage examples.



Note that the **order** is important - `git --no-pager COMMAND` and not `git COMMAND --no-pager`.


## Branch

### Global

```sh
$ git config --global pager.branch false
```

### Once-off
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


## Log

### Global

```sh
$ git config --global pager.log false
```

### Once-off

Log can be very long, so limit it.

```sh
$ git --no-pager log --oneline -40
```

Or with `lol` git alias.

```sh
$ git --no-pager lol -40
```

These long comamnds can be aliased as well.
