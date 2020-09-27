---
title: cp
description: The copy shell command
---

## Usage

```
cp [OPTIONS] SOURCE DESTINATION
cp [OPTIONS] SOURCE_A SOURCE_B [...] DESTINATION
```

## Common situations

### Copy files

_Be careful of trailing slash when copying to or from a directory name. I find it works better without. Or maybe that is only `rsync` where is makes a difference?_

```sh
$ cp foo.txt bazz
```

Copy multiple sources.

```sh
$ cp foo.txt bar.txt bazz
$ cp *.mp3 bazz
```

Copy to current location.

```sh
$ cp ~/foo.txt .
```

### Copy directories

Use `-r` for recursive. If you omit the flag then an error message will suggest it. Note that `-R` is similar but not the same.

```sh
$ cp -r foo bazz
```

Copy contents of directory, not the directory itself. If the contents includes directories, you'll need the `-r` flag.

```sh
$ cp foo/* bazz
```

### Copy interactively

Prevent overwriting of targets. You'll have to enter `y` or `n` for each file.

```sh
$ cp -i SOURCE DEST
```

To always use:

```sh
alias cp='cp -i'
```

And then to skip interactive mode selectively:

```sh
$ command cp SOURCE DEST
```

Note that the `-f` flag doesn't help here.

### Verbose

```sh
$ cp -v SOURCE DEST
```

## Help


Linux manpage - [link](https://ss64.com/bash/cp.html).

```
cp

Copy one or more files to another location.

Copy SOURCE to DEST, or multiple SOURCE(s) to DIRECTORY.

Syntax
      cp [options]... Source Dest
      cp [options]... Source... Directory

Key

  -a, --archive                same as -dpR

  -b, --backup                 Make backup before removal.
                               If the copy will overwrite a file in the destination, then
                               the original file will be backed up as 'filename~' before
                               being overwritten.

  -d, --no-dereference         preserve links

  -f, --force                  remove existing destinations, never prompt

  -i, --interactive            prompt before overwrite

  -l, --link                   link files instead of copying

  -p, --preserve               preserve file attributes if possible

  -P, --parents                append source path to DIRECTORY

  -r                           copy recursively, non-directories as files

      --sparse=WHEN            control creation of sparse files

  -R, --recursive              copy directories recursively

  -s, --symbolic-link          make symbolic links instead of copying

  -S, --suffix=SUFFIX          override the usual backup suffix

  -u, --update                 copy only when the SOURCE file is newer
                                 than the destination file or when the
                                 destination file is missing

  -v, --verbose                explain what is being done

  -V, --version-control=WORD   override the usual version control

  -x, --one-file-system        stay on this file system
      --help                   display this help and exit
      --version                output version information and exit.
```
