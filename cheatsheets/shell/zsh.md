# ZSH

See ZSH [options](https://zsh.sourceforge.net/Doc/Release/Options.html) in the docs for what config options are available.


## Navigation

```sh
DIRNAME

# Same as:
cd DIRNAME
```

```sh
..

# Same as:
cd ..
```

## Config files

**Note:** You usually need to create these files if they don't exist on a new setup.

### `.zshenv` | `.bashrc` and `.bash_profile`

**Summary:** Loaded first for all shell instances (login, interactive, scripts). Used for global environment variable settings.

### `.zprofile` | `.bash_profile`

**Summary:** Executed only for login shells, after the initial environment setup and before the interactive configuration. Suitable for one-time login commands.

### `.zshrc` | `.bashrc`

**Summary:** Main configuration for interactive shells, loaded on each new terminal. Used for prompt, aliases, functions, options, and plugin loading.

### `.zlogin` | `.bash_login`

**Summary:** Executed for login shells, after the main interactive configuration. Less common, for actions after the primary login setup.

### `.zlogout` | `.bash_logout`

**Summary:** Executed when logging out of a login shell. Used for logout cleanup.

## Git

On install Git with Brew while using ZSH:


```
zsh completions and functions have been installed to:
  /usr/local/share/zsh/site-functions
```


## History

See `~/.oh-my-zsh/lib/history.zsh`.

```sh
## History command configuration
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data
```

You can override those in your own config.

```sh
unsetopt share_history
```

Warning - the `history.sh` file gets loaded _after_ your `~/.zshrc` file.
