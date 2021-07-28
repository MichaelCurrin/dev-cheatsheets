# ZSH

See ZSH [options](https://zsh.sourceforge.net/Doc/Release/Options.html).


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
