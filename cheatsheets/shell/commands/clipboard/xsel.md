---
description: CLI tool for Linux or Ubuntu to interact with clipboard data
---
# xsel

This content is based on this [video](https://www.youtube.com/watch?v=aMzdeZ8vGXQ).

Xsel is a command-line tool designed for the X Window System (X11) that allows you to interact with the clipboard data. In simpler terms, it's a program you can use in your terminal to manage what gets copied and pasted between applications.



## Comparison with other tools

Note that [pbcopy / pbpaste][] is available for macoS and not available on Linux, but you can configure Linux to use `xsel` like it.

A feature of `xsel` is that is supports secondary selection. Many graphical environments have a secondary selection buffer in addition to the main clipboard. `xsel` can be used to work with this secondary buffer as well.


[pbcopy / pbpaste]: {% link cheatsheets/shell/commands/clipboard/pbcopy-pbpaste.md %}


## Install

```sh
$ sudo apt install xsel
```


## Configure aliases


Edit your `~/.bashrc` or `~/.zshrc` with these aliases:

```sh
alias pbcopy='xsel --input --clibboard'
alias pbpaste='xsel --output --clibboard'
```

Then use as:

```sh
$ echo "This is a test" | pbcopy
$ pbpaste > test.txt
```
