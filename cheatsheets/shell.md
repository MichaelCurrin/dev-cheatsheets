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

Create an function in your `~/.bashrc` if you easily run it.

```sh
reload_shell() { exec -l $SHELL; }
```

### Get current shell

```sh
echo $0

echo $SHELL
```

[source](https://stackoverflow.com/questions/3327013/how-to-determine-the-current-shell-im-working-on)


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

## Commands and scripting

Use these on the command-line or in shell scripts.

### Link

Create symbolic link to file. 

```sh
ln -s SOURCE TARGET

# e.g.
ln -s ~/foo/bar.txt bar
```

Source is is directory or file to point to. Target is the new link file to create or replace. Add `-f` to override an existing file.

### Current directory

Get path to the parent directory for a script.

From [Stack Overflow](https://stackoverflow.com/questions/59895/how-to-get-the-source-directory-of-a-bash-script-from-within-the-script-itself).

```sh
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
```

### String manipulations

Replace using `sed`.

```sh
echo 'my-input' | sed 's/-/_/'
```

## Control flow

### Check file

If a file exists:

```sh
if [[ -f .env ]]; then
  cat .env
fi
```

If it does not exist:

```sh
if [[ ! -f .env ]]; then
  echo 'File is missing: .env'
fi
```

See [Bash cheatsheet](https://devhints.io/bash) for more info.

### One liner status check

Check if the status of the previous command was a pass or fail.

```sh
[[ $? -eq 0 ]] && echo 'Passed!' || echo 'Failed!'
```

Example use:

- Use the `true` commands to give a zero (pass) exit status.
  ```sh
  $ true
  $ [[ $? -eq 0 ]] && echo 'Passed!' || echo 'Failed!'
  Passed!
  ```
- Use the `false` commands to give a non-zero (fail) exit status.
    ```sh
    $ false
    $ [[ $? -eq 0 ]] && echo 'Passed!' || echo 'Failed!'
    Failed!
    ```

Note the `exit` command is added here, but this is good for a script and not for direct terminal use otherwise you will close the terminal tab. Note the brackets to get the correct behavior.

```sh
[[ $? -eq 0 ]] && echo 'Passed!' || (echo 'Failed!'; exit 1)
```

### If statement

This is a multi-line `if` statement, which is useful for more complex statements or if readability is important.

```sh
if [[ $? -eq 0 ]]; then
  echo 'Passed!'
else
  echo 'Failed!'
  exit 1
fi
```

Show message on failure only:

```sh
if [[ $? -ne 0 ]]; then
  echo 'Failed!';
  exit 1
fi
```

## Work with files

### Open


```sh
$ open directory_name
```

```sh
$ open file.txt
```

```sh
$ open image.png
```


```sh
$ open http://localhost:5000
```

From the macOS `open` manpage:

```
EXAMPLES
     "open '/Volumes/Macintosh HD/foo.txt'" opens the document in the default application for its type (as determined by LaunchServices).

     "open '/Volumes/Macintosh HD/Applications/'" opens that directory in the Finder.

     "open -a /Applications/TextEdit.app '/Volumes/Macintosh HD/foo.txt'" opens the document in the application specified (in this case, TextEdit).

     "open -b com.apple.TextEdit '/Volumes/Macintosh HD/foo.txt'" opens the document in the application specified (in this case, TextEdit).

     "open -e '/Volumes/Macintosh HD/foo.txt'" opens the document in TextEdit.

     "ls | open -f" writes the output of the 'ls' command to a file in /tmp and opens the file in the default text editor (as determined by LaunchServices).

     "open http://www.apple.com/" opens the URL in the default browser.

     "open 'file://localhost/Volumes/Macintosh HD/foo.txt'" opens the document in the default application for its type (as determined by LaunchServices).

     "open 'file://localhost/Volumes/Macintosh HD/Applications/'" opens that directory in the Finder.

     "open -h NSView" lists headers whose names contain NSView and allows you to choose which ones to open.

     "open -h NSView.h" immediately opens NSView.h.

     "open -h NSView -s OSX10.12" lists headers whose names contain NSView in the MacOSX 10.12 SDK and allows you to choose which ones to open.
```

### Iterate over a file

```sh
for ROW in $(cat requirements.txt)
do
  echo "pip install $ROW"
done
```

From `xargs` manpage:

> The xargs utility reads space, tab, newline and end-of-file delimited strings from the standard input and executes utility with the strings as arguments.


```sh
cat requirements.txt | xargs pip install
```

### Dotenv

Export the vars in `.env` file into your shell:

```sh
export $(< .env) | xargs)
```

Check if it exists first:

```sh
if [ -f .env ]; then
  export $(cat .env | xargs)
fi
```

Ignore comments:

```sh
export $(egrep -v '^#' .env | xargs)
```

[source](https://gist.github.com/judy2k/7656bfe3b322d669ef75364a46327836)
