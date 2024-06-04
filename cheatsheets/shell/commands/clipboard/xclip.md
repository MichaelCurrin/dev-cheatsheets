---
description: Command-line tool for X11 to interact with clipboard data
---
# xclip

`xclip` is a command-line utility available on many Linux systems that enables you to manage the clipboard data within the X Window System (X11) environment. It provides functionality similar to the built-in `pbcopy` and `pbpaste` commands found on macOS.

A feature of this tool is that is supports secondary selection. Many graphical environments have a secondary selection buffer (middle mouse button) in addition to the main clipboard. This tool can be used to work with this secondary buffer as well.


## Installation

The installation method for `xclip` varies depending on your Linux distribution. It might already be installed.

Here are some common approaches:

- **Debian-based systems**
    ```sh
    sudo apt install xclip
    ```
- **Red Hat-based systems:**
    ```sh
    $ sudo yum install xclip
    ```
- **Arch Linux and Manjaro:**
    ```sh
    $ sudo pacman -S xclip
    ```

## Usage

### Manual

For detailed information on these options and more, refer to the `xclip` man page:

```sh
$ man xclip
```

Use `xclip` - see [man page](https://linux.die.net/man/1/xclip).

> xclip [OPTION] [FILE]...
>
> Description
>
> Reads from standard in, or from one or more files, and makes the data available as an X selection for pasting into X applications. Prints current X selection to standard out.

See clipboard management tasks below.

### Read

Store value in **X** clipboard selection.

Pipe to `xclip`:

```sh
$ COMMAND | xclip
```

```sh
$ echo 'My content' | xclip
```

Read a file:

```sh
$ xclip -i PATH
$ # OR
$ xclip < PATH
$ # OR
$ xclip PATH
```

### Output

Print clipboard contents:

```sh
$ xclip
```

Paste clipboard contents to a file:

```sh
$ xclip -o PATH
$ # OR
$ xclip > PATH
```

### Selection

- `-selection clipboard`: This specifies the primary clipboard (default).
- `-selection primary`: This targets the primrary selection (if available).
- `-selection secondary`: This targets the secondary clipboard (if available).

e.g.

```sh
$ xclip -sel clip PATH
```
