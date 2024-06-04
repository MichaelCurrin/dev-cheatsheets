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

### macOS

Using the `pbcopy` and `pbpaste` option is recommended.

### Linux

Choosing between `xclip` and `xsel`:

- In many cases, either tool will work well for basic clipboard management.
- If you need to read data from **files** and set it as the clipboard content, `xclip` is the better choice.
- If you need to specifically target the **secondary** selection buffer or prefer a potentially simpler tool, `xsel` might be sufficient.
