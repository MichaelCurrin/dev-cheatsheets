# Vim
---
description: Guide to using the `vim` editor
---

_Vim_ is a text editor program for Unix, cloned from _Vi_.


## Configure

Try out a config and if you like it, set it in the config so it is set up whenever you open a file.

### Once-off

1. Press `esc`.
1. Type `:MY COMMAND`. e.g. `:set number`.
1. Press enter.

### Set in config

1. Open the vim config. You may have to create it.
    ```sh
    $ open ~/.vimrc
    ```
1. Add your command. e.g.
    ```
    set number
    ```
1. Save the file.

## Config options

Set these using one of the approaches above.

See Vim config files [here](https://github.com/amix/vimrc/tree/master/vimrcs) for more options than the ones covered below. You can also follow the installation instructions there if you want to have your configs managed for you.

### Enable line numbers in gutter

```
set number
```

## Run

### Python

Execute Python code from inside vim. Alternatives [here](https://stackoverflow.com/questions/18948491/running-python-code-in-vim).

```sh
:w !python
```
