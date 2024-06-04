---
description: CLI tool for Linux or Ubuntu to interact with clipboard data
---
# xsel

This content is based on this [video](https://www.youtube.com/watch?v=aMzdeZ8vGXQ).

Xsel is a command-line tool designed for the X Window System (X11) that allows you to interact with the clipboard data. In simpler terms, it's a program you can use in your terminal to manage what gets copied and pasted between applications.

A feature of this tool is that is supports secondary selection. Many graphical environments have a secondary selection buffer (middle mouse button) in addition to the main clipboard. This tool can be used to work with this secondary buffer as well.


## Install

```sh
$ sudo apt install xsel
```

## Usage

From the help:

```
  -p, --primary         Operate on the PRIMARY selection (default)
  -s, --secondary       Operate on the SECONDARY selection
  -b, --clipboard       Operate on the CLIPBOARD selection
```

### Read

Copy text to the clipboard:

```sh
$ xsel --input --clipboard
$ xsel --input --clipboard < PATH
$ echo 'Text' | xsel --input --clipboard
```

Copy text to the primary selection - same as above but just `xsel` without arguments.

Copy text to the secondary selection:

```sh
$ xsel --selection secondary
```

### Output

View the contents of the clipboard:

```sh
$ xsel --output --clipboard
$ xsel --output --clipboard | COMMAND
$ xsel --output --clipboard > PATH
```

View the contents of the primary selection:

```sh
$ xsel -o
```

View the contents of the secondary selection:

```sh
$ xsel --selection secondary -o
```


## Configure aliases

Reduce how much you have to type by imitating use of `pbcopy` and `pbpaste` on macOS.

Edit your `~/.bashrc` or `~/.zshrc` with these aliases:

```sh
alias pbcopy='xsel --input --clipboard'
alias pbpaste='xsel --output --clipboard'
```

Then use as:

```sh
$ echo "This is a test" | pbcopy
$ pbpaste > PATH
```
