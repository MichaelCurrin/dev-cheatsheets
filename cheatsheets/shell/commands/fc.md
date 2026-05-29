---
title: fc
description: fix command
---

[Wikipedia](https://en.wikipedia.org/wiki/Fc_(Unix))

## Purpose

* Opens previous shell commands in a text editor to easily modify and fix typos before running them.
* Re-executes past commands instantly without an editor, including the option to substitute text on the fly.
* Displays a customizable list of command history by line numbers, ranges, or search strings.

## Edit and run

| Use case | Command | Description |
| --- | --- | --- |
| **Edit and execute last command** | `fc` | Opens the very last command in your default text editor. |
| **Edit and execute specific command** | `fc N` | Opens command number `N` from your history. |
| **Edit and execute by search** | `fc string` | Opens the most recent command that starts with `string`. |
| **Edit a range of commands** | `fc N M` | Opens commands from number `N` to number `M` in one editor session. |
| **Change default editor** | `fc -e editor` | Opens the last command using a specific editor (e.g., `fc -e nano`). |
| **Combine editor and specific command** | `fc -e nano string` | Opens the last command starting with `string` directly in nano. |
| **Re-run last command instantly** | `fc -s` | Re-executes the last command immediately without opening an editor. |
| **Re-run with substitution** | `fc -s old=new` | Re-runs the last command, replacing the first occurrence of `old` with `new`. |


## History

| Use case | Command | Description |
| --- | --- | --- |
| **List recent history** | `fc -l` | Lists the last 16 commands. |
| **List specific range** | `fc -l N M` | Lists commands from history number `N` to number `M`. |
| **List recent matching string** | `fc -l string` | Lists recent commands starting with `string`. |
| **List without line numbers** | `fc -ln` | Lists recent commands without numbers (useful for copying text). |
| **List in reverse order** | `fc -lr` | Lists recent commands in reverse chronological order. |


## How to exit without executing

`fc` executes whatever text is left in the file when the editor closes. To abort the execution completely, you must empty the file before saving and exiting.

### In Nano

1. Press `Ctrl + K` repeatedly until the file is completely blank.
2. Press `Ctrl + O` then `Enter` to save the empty file.
3. Press `Ctrl + X` to exit.

### In Vim / Vi

1. Press `Esc` to ensure you are in normal mode.
2. Type `dG` to delete all text.
3. Type `:wq` and press `Enter` to save and exit.
*Shortcut: You can also type `:cq` and press `Enter` to abort instantly without deleting the text.*
