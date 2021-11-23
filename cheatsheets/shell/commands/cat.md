---
title: cat
description: built-in concatenate command
---


## Related

- [bat](https://github.com/sharkdp/bat) - a more advanced `cat`, such as with syntax highlighting.


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


## Combine

```sh
$ cat file.txt file-2.txt
```

More interactive mode and the name of each file at the top, use `less` rather:

```sh
$ less file.txt file-2.txt
```
