---
title: Working with shells
---


## Start subshell

In a Bash shell, you can invoke another Bash *subshell* in interactive mode.

```sh
$ bash
```

You might not see anything different in the prompt. Though  some variables from the outer shell won't be available. Any variables you set in the inner shell won't be available in the outer shell. Also your Python environment could no longer be active.

If you enter `exit` or press <kbd>CTRL</kbd>+<kbd>D</kbd>, then you will return to the outer shell session.

Note that you should **not** use this to switch between shells, as the config file will not be executed appropriately. Use the [Start new shell session](#start-new-shell-session) section below.


## Get current shell

This will print the program name, which in the case of the shell is the actual shell. [source](https://stackoverflow.com/questions/3327013/how-to-determine-the-current-shell-im-working-on)

### Conditional

In short, the most reliable way in conditional flow is this. To be tested. Perhaps it can work with `case`.

```sh
IS_BASH=false
IS_ZSH=false

if [[ "$0" == *bash* ]]; then
  IS_BASH=true
else if [[ "$0" == *zsh* ]];
  IS_ZSH=true
fi

# OR - more lines but DRY.

case "$0)" in
  *bash* )
    IS_BASH=true
    ;;
  *zsh* )
    IS_LINUX=true
    ;;
esac
```

Note:

If using a single boolean:

```sh
$ IS_ZSH=$([[ "$ZSH_NAME" ]] && echo 'true' || echo 'false')
```

### Using $0

#### Tested on macOS

- Bash
	```sh
	$ echo $0
	-bash
	# Or

	```
- ZSH
	```sh
	$ echo $0
	-zsh
	```

#### Tested on Linux

```sh
$ # In terminal.
$ echo $0
/bin/bash
```

```sh
$ # In subshell.
$ bash -c 'echo $0'
bash
```

ZSH - to be checked.

### Using BASH or ZSH_NAME variables

- Bash
	```sh
	$ echo $BASH
	# ?
	```
	- This is only set when using Bash. However, this weirdly gave response as `/bin/zsh` when using Bash when ZSH was the default shell, so need to investigate this further.
- ZSH
	```sh
	$ echo $ZSH_NAME
	zsh
	```

### Using SHELL

This shows the _default_ shell, not your current shell.

```sh
$ echo $SHELL
```

[source](https://stackoverflow.com/questions/3327013/how-to-determine-the-current-shell-im-working-on)


## Change shell

### Start new shell session

Replace the current terminal session with a new one. Use the exec command with the --login flag so the shell acts as if invoked by login. [source](https://www.gnu.org/software/bash/manual/html_node/Invoking-Bash.html)

```sh
$ exec -l zsh

$ exec -l bash
```

### Change default shell

To change to ZSH, run one of:

```sh
$ chsh -s /bin/zsh

$ chsh -s $(which zsh)
```


## Reload shell

If you have edited your Bash configs and want to reload them, you can do this:

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

Create an function in your `~/.bashrc` if you easily run it. This reloads the _default_ shell, not your current shell.

```sh
reload_shell() { exec -l $SHELL; }
```
