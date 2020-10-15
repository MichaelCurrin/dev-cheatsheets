---
description: Configure aliases for git
---
# Aliases


Set aliases in the `~/.gitconfig` file.


I did a blog post [here](https://dev.to/michaelcurrin/dotfiles-git-config-348o) on git aliases.


## Invoke the shell notes

The hash is necesary to prevent using the argument - only matters with echo where you want commet out the rest.

```toml
foo = "! echo \"Hello, $1!\" #"
```
Define and call function.

```toml
bar = "!f() { echo \"Hello, $1!\" } ; f"
```
