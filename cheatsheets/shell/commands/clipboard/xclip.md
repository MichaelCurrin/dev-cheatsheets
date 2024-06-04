---
description: Command-line tool for X11 to interact with clipboard data
---
# xclip

`xclip` is a command-line utility available on many Linux systems that enables you to manage the clipboard data within the X Window System (X11) environment. It provides functionality similar to the built-in `pbcopy` and `pbpaste` commands found on macOS.


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

For detailed information on these options and more, refer to the `xclip` man page:

```sh
$ man xclip
```

See clipboard management tasks below.

### Copy text to clipboard

```sh
$ echo "This is a test" | xclip
```

This copies the string "This is a test" to the clipboard.

### Paste clipboard contents to a file

```sh
$ xclip -o > test.txt
```

This retrieves the clipboard contents and saves them to a file named `test.txt`.

### Additional options:

- `-selection clipboard`: This specifies the primary clipboard (default).
- `-selection secondary`: This targets the secondary clipboard (if available).
- `-in`: Read clipboard content from a file.
- `-out`: Write clipboard content to a file.
