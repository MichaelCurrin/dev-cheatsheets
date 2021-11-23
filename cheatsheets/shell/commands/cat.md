---
title: cat
description: built-in concatenate command
---


## Related

- [bat](https://github.com/sharkdp/bat) - a more advanced `cat`, such as with syntax highlighting.



## Show file contents

```console
$ cat file.txt
Hello, World!
```

Equivalent to:

```console
$ < file.txt
Hello, World!
```


## Send file contents to another command

```console
$ cat file.txt | my-cmd
```

Equivalent to:

```console
$ my-cmd < file.txt
```


## Combine files

```sh
$ cat file1 file2
```

```sh
$ cat file1 file2 > file3
```

More interactive mode and the name of each file at the top, use `less` rather:

```sh
$ less file.txt file-2.txt
```




## Help

### Man page

Linux:

- [cat](https://linux.die.net/man/1/cat) on Linux Die.

From macOS:

```
NAME
     cat -- concatenate and print files

SYNOPSIS
     cat [-benstuv] [file ...]

DESCRIPTION
     The cat utility reads files sequentially, writing them to the standard output.  The file operands
     are processed in command-line order.  If file is a single dash (`-') or absent, cat reads from the
     standard input.  If file is a UNIX domain socket, cat connects to it and then reads it until EOF.
     This complements the UNIX domain binding capability available in inetd(8).
...
```

### Flags

Numbering:

```
     -b      Number the non-blank output lines, starting at 1.
     -n      Number the output lines, starting at 1.
     -e      Display non-printing characters (see the -v option), and display a dollar sign (`$') at the
             end of each line.
```

Characters

```
     -t      Display non-printing characters (see the -v option), and display tab characters as `^I'.
     -v      Display non-printing characters so they are visible.  Control characters print as `^X' for
             control-X; the delete character (octal 0177) prints as `^?'.  Non-ASCII characters (with
             the high bit set) are printed as `M-' (for meta) followed by the character for the low 7
             bits.
```
