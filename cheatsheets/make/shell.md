# Shell


## Choosing your shell

> The program used as the shell is taken from the variable `SHELL`. If this variable is not set in your makefile, the program `/bin/sh` is used as the shell [source](https://www.gnu.org/software/make/manual/html_node/Choosing-the-Shell.html)


## macOS

Your `/bin/sh` is probably one of:

- `/bin/bash`
- `/bin/zsh`


## Linux

On Ubuntu, your `/bin/sh` probably points to `/bin/dash`.

This can cause issues with certain syntax, like:

```sh
echo ${FILENAME/_/}

[[ CONDITION ]]
```


## Override

```make
SHELL = /bin/bash

foo:
    echo $$SHELL
```
