---
title: Clipboard
description: Use content from the clipboard or copy content to it
----

## Features

Here's a breakdown of what these tools can do:

* **View Clipboard Contents:** Retrieve the current text or data stored in the clipboard.
* **Set Clipboard Contents:** Copy text directly from the command line into the clipboard.
* **Simplify Scripting:** Automate clipboard interactions within scripts using a shell command.

## Which one to use

See also this [StackOverflow answer](https://stackoverflow.com/questions/749544/pipe-to-from-the-clipboard-in-bash-script) for usage and shortcuts.

### macOS

Using the `pbcopy` and `pbpaste` option is recommended.

### Linux

You can use either `xclip` and `xsel` for similar results.

If you need to read data from **files** and set it as the clipboard content, `xclip` has the `-in` option while with `xsel` you need to pipe content.
