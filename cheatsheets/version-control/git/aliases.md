---
title: Aliases
description: Configure aliases for git
---


Set up aliases in your global  `~/.gitconfig` file.


## Related

- [MichaelCurrin/dotfiles](https://github.com/MichaelCurrin/dotfiles) repo I set up, including my Git config.
- [Dotfiles - Git Config with Aliases](https://dev.to/michaelcurrin/dotfiles-git-config-348o) blog post.


## Basic

Set up an alias.

```toml
[alias]
	lg = "log -p"
```

Call the `lg` alias.

```sh
$ git lg
```

That will run:

```sh
$ git log -p
```

**Double quotes** are best for aliases whether using git or shell commands. Setting up an alias as `lg = 'log -p'` or `lg = '''log -p'''` would mean it gets called incorrectly as `git 'log -p'`. And the error will be that `log -p` is "not a git command".


## Shell

Use a bang (`!`) at the start to invoke a shell comand.

### Pipe commands

This lets you do ths followign:

```toml
[alias]
    # Not using git.
    greet = "! echo Hello"

    # Run a git command as pass to a shell command.
    tags = "! git tag -n | sort -V -r"
```

If you want to use double quotes inside, escape them or use a heredoc.

```toml
[alias]
    foo = "! echo \"Hello, $1!\" #"
```

```sh
$ git foo bar
Hello, bar!
```

Note that using single quotes will be literal.

```toml
[alias]
	foo = "! echo 'Hello, $1!' #"
```

```sh
$ git foo bar
Hello, $1!
```

### Function

An alternative approach is to define and a shell command in one step. Note that in Bash, calling `f` will execute the function `f()`.

```toml
[alias]
    foo = "! f() { echo \"Hello, $1!\" } ; f"
```


## Arguments

You can pass arguments which are available as `$@`, `$1`, `$2`, etc.

```toml
[alias]
	greet = "! echo $@ #"
```

```sh
$ git greet I am world
I am world
```

First argument.

```toml
[alias]
	greet = "! echo $1 #"
```

```sh
$ git greet I
I
```

### Comment

I recommend adding a comment at the end of a shell command as above, to avoid the params being used twice.

If it is not used:

```toml
[alias]
	greet = "! echo $@"
```

```sh
$ git greet I am world
I am world I am world
```

I think the reason this behavior exists is so you that `git my-alias my-arg -a -b` will be called as the expand the alias and still pass on on the positional and keyword params. 


## Multi-line

See [TOML strings][] cheatsheet for more info.

```toml
[alias]
	undo = """! [ -z \"$(git status --porcelain)\" ] \
		&& git reset --hard HEAD~ \
		|| echo 'Unstaged changes! Stash and try again' \
	"""
```

[TOML strings]: {{ site.baseurl }}{% link cheatsheets/data/toml/strings.md %}
