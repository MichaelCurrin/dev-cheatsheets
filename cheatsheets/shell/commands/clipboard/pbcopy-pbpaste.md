---
description: CLI tool for macOS to interact with clipboard data
---
# pbcopy / pbpaste

## Note for Linux users

You can setup `xsel` to behave like this tool - see the aliases section on the [xsel][] cheatsheet.

[xsel]: {% link cheatsheets/shell/commands/clipboard/xsel.md %}


## Installation

This comes installed on macOS.


## Usage

```sh
$ echo "This is a test" | pbcopy
```

### Read with `pbcopy`

Copy file to the clipboard.

```sh
$ pbcopy < PATH
```

Or:

```sh
$ cat PATH | pbcopy
```

### Output with `pbpaste`

Print the clipboard contents:

```sh
$ pbpaste
```

Pipe clipboard contents to a command:

```sh
$ pbpaste | head
```

Write clipboard contents to a file:

```sh
$ pbpaste > test.txt
```
