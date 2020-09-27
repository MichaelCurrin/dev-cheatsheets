---
title: Permissions
---

## Defaults

### Directory

```
775
```

```sh
$ mkdir TEST
$ ls -l TEST
drwxrwxr-x 2 michael 4.0K Sep 27 15:22 TEST
```

### File

```
664
```

```sh
$ touch TEST.txt
$ ls -l TEST.txt
-rw-rw-r-- 1 michael 0 Sep 27 15:22 TEST.txt
```

## Change

### Make executable

```sh
$ chmod +x PATH
```

### Set with octet

```
ugo
```

```sh
$ chmod 775 PATH
```

### Set by column

```sh
$ chmod u=rwx,go=rx PATH
```


## Help

Chmod manpage extract.

```sh
$ man chmod
```
```
NAME
       chmod - change file mode bits

SYNOPSIS
       chmod [OPTION]... MODE[,MODE]... FILE...
       chmod [OPTION]... OCTAL-MODE FILE...
       chmod [OPTION]... --reference=RFILE FILE...

DESCRIPTION
       This  manual  page  documents  the GNU version of chmod.  chmod changes the file mode bits of each given file according to mode, which can be either a symbolic representation of
       changes to make, or an octal number representing the bit pattern for the new mode bits.

       The format of a symbolic mode is [ugoa...][[-+=][perms...]...], where perms is either zero or more letters from the set rwxXst, or a single letter from the  set  ugo.   Multiple
       symbolic modes can be given, separated by commas.
       
       ...
```
