# Shell

Unix shell cheatsheet for Mac/Linux Bash/ZSH.

## Shells


### Start new shell session

Replace the current terminal session with a new one. Use the exec command with the --login flag so the shell acts as if invoked by login. [source](https://www.gnu.org/software/bash/manual/html_node/Invoking-Bash.html)

```sh
exec -l zsh

exec -l bash
```

### Change default shell

To change to ZSH, run one of:

```sh
chsh -s /bin/zsh

chsh -s $(which zsh)
```


## Prevent accidental file overwrites

[source](https://unix.stackexchange.com/questions/452865/are-there-any-disadvantages-of-setting-noclobber)

```sh
alias cp='cp -i'
alias mv='mv -i'
```

> Prevent output redirection using ‘>’, ‘>&’, and ‘<>’ from overwriting existing files. [source](https://www.gnu.org/software/bash/manual/html_node/The-Set-Builtin.html#The-Set-Builtin)

```sh
set -C
```

Similar to the above. [source](https://www.cyberciti.biz/tips/howto-keep-file-safe-from-overwriting.html)

```sh
set -o noclobber
```

When this is on, `> file` gives an error but `>| file` seems to force but need to confirm.

## Exit on error

From `set` [docs](https://www.gnu.org/software/bash/manual/html_node/The-Set-Builtin.html#The-Set-Builtin).

```sh
set -e
```

## Verbose

Print a trace of simple commands

```sh
set -x
```
