---
description: CLI tool for macOS to interact with clipboard data
---
# pbcopy / pbpaste

## Note for Linux users

You can setup `xsel` to behave like this tool - see [xsel][]


## Installation

This comes installed on macOS.


## Usage

```sh
$ echo "This is a test" | pbcopy
$ pbpaste > test.txt
```

[xsel]: {% link cheatsheets/shell/commands/clipboard/xsel.md %}
