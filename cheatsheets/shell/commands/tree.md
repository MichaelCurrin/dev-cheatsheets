---
title: tree
description: List contents of directories in a tree-like format.
---


## Installation

This must be installed separately such as with Brew.


## Usage

```sh
$ tree [DIRECTORY]
```

## Examples

### Test directory

```sh
$ tree my-dir
```
```
my-dir
├── some-dir
│   └── test2.txt
└── test.txt

1 directory, 2 files
```

### Project

```sh
$ cd my-project
$ tree
```

Example output:

```
.
├── Pipfile
├── Pipfile.lock
├── helloworld_project
│   ├── __init__.py
│   ├── settings.py
│   ├── urls.py
│   └── wsgi.py
└── manage.py

1 directory, 7 files
```

### Sizes

```sh
$ cd ~
$ tree -h
```
```
.
├── [ 544]  Applications
│   ├── [  96]  Audacity.app
│   │   └── [ 416]  Contents
│   │       ├── [1.8K]  CodeResources
│   │       ├── [ 640]  Frameworks
│   │       │   ├── [2.1M]  libwx_baseu_release-3.1.3.0.0.dylib
│   │       │   ├── [  35]  libwx_baseu_release-3.1.3.dylib -> libwx_baseu_release-3.1.3.0.0.dylib
...     

```



## Flags

Highlights from the many flags.

- `-d` - List directories only (much shorter output).
    e.g.

    ```
    .
    ├── Foo
    │   └── Bar
    │       ├── Baz
    │       │   ├── A
    │       │   ├── B
    │       │   ├── C
    │       │   ├── Multi word
    │       │   └── Last
    │       ├── Next
    ...
    ```
- `-l` - Follow symlinks.
- `-f` - Include the full path prefix for each file.
- `-s` - Include file size.
- `-h` - Human-readable size. The default is no size.
- `-D` - Print the date of the last modification time for the file listed.
- `-t` - Sort the output by last modification time instead of alphabetically.
- `--dirsfirst` - List directories before files.


## Help

Linux manpage - [link](https://linux.die.net/man/1/tree)

Note there are a lot of options there.

## Help

```
NAME
       tree - list contents of directories in a tree-like format.

SYNOPSIS
       tree  [-acdfghilnpqrstuvxACDFQNSUX]  [-L  level  [-R]] [-H baseHREF] [-T title] [-o filename] [--nolinks] [-P pattern] [-I pattern] [--inodes] [--device]
       [--noreport] [--dirsfirst] [--version] [--help] [--filelimit #] [--si] [--prune] [--du] [--timefmt format]  [--matchdirs]  [--fromfile]  [--]  [directory
       ...]


DESCRIPTION
       Tree is a recursive directory listing program that produces a depth indented listing of files, which is colorized ala dircolors if the LS_COLORS environ-
       ment variable is set and output is to tty.  With no arguments, tree lists the files in the current directory.  When directory arguments are  given,  tree
       lists all the files and/or directories found in the given directories each in turn.  Upon completion of listing all files/directories found, tree returns
       the total number of files and/or directories listed.
...
```
