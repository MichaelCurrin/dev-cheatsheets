# Shell Cheatsheet

Unix shell cheatsheet for Mac/Linux Bash/ZSH.

## Shells

### Start subshell

In a bash shell, you can invoke a bash subshell in interactive mode.

```sh
bash
```

If you enter `exit` or press `CTRL`+`D`, then you will return to the outer shell session.

Note that you should **not** use this to switch between shells as the config file will not be executed appropriately. Use the [Start new shell session](start-new-shell-session) section below.


### Reload shell

If you have edited your bash configs and want to reload them, you can do this:

```sh
source ~/.bashrc
source ~/.bash_profile
```

Alternatives below, if you are happy to lose shell history. [source](https://stackoverflow.com/questions/4608187/how-to-reload-bash-profile-from-the-command-line)

Run this. This runs the login option to ensure bash profile is loaded.

```sh
bash -l
```

Or completely replace the current shell. If you exit, the terminal tab will exit and you will no go to the outer shell.

```sh
exec -l bash
```

### Change shell

#### Start new shell session

Replace the current terminal session with a new one. Use the exec command with the --login flag so the shell acts as if invoked by login. [source](https://www.gnu.org/software/bash/manual/html_node/Invoking-Bash.html)

```sh
exec -l zsh

exec -l bash
```

#### Change default shell

To change to ZSH, run one of:

```sh
chsh -s /bin/zsh

chsh -s $(which zsh)
```

## Set options

Set these in a script or at a globla level.

### Prevent accidental file overwrites

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

### Exit on error

From `set` [docs](https://www.gnu.org/software/bash/manual/html_node/The-Set-Builtin.html#The-Set-Builtin).

```sh
set -e

# Reverse it with this:
set +e
```

In a shebang:

```sh
#!/bin/bash -e

echo 'Hello!'
```

Note that if you use this shebang style, you must **not** add options in the shebang otherwise you will get an error. So add the line in the script body.

```sh
#!/usr/bin/env bash

set -e
echo 'Hello!'
```


### Verbose

Print a trace of simple commands

```sh
set -x
```

## Commands

### Link

Create symbolic link to file. 

```sh
ln -s SOURCE TARGET

# e.g.
ln -s ~/foo/bar.txt bar
```

Source is is directory or file to point to. Target is the new link file to create or replace. Add `-f` to override an existing file.
