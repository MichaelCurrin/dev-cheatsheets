# Clipboard

Copy to and paste from clipboard. Especially useful for very large files or when you use SSH with no GUI.


See [StackOverflow answer](https://stackoverflow.com/questions/749544/pipe-to-from-the-clipboard-in-bash-script) for usage and shortcuts.


## Linux

Use `xclip` - see [man page](https://linux.die.net/man/1/xclip).

> xclip [OPTION] [FILE]...
>
> Description
>
> Reads from standard in, or from one or more files, and makes the data available as an X selection for pasting into X applications. Prints current X selection to standard out.

### Read

Store value in X selection.

Command output.

```sh
$ COMMAND | xclip
```

Read file.

```sh
$ xclip PATH
```

This lets you paste using the middle mouse button.

If you prefer to traditional pasting:

```sh
$ xclip -sel clip PATH
```

Or according to the manpage:

> -selection
>
>   specify which X selection to use, options are "primary" to use XA_PRIMARY (default), "secondary" for XA_SECONDARY or "clipboard" for XA_CLIPBOARD

### Output

Print.

```sh
$ xclip
```

Pipe.

> -o, -out
>
>   prints the selection to standard out (generally for piping to a file or program)

```sh
$ xclip -o > PATH
```

## macOS

Use `pbcopy` and `pbpaste`.

### Read

Copy file.

```sh
$ pbcopy < PATH
```

### Output

Print.

```sh
$ pbpaste
```

Pipe.

```sh
$ pbpaste | head
```
