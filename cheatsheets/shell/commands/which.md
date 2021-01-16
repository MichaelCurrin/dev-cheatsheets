# which


See also `locate` command.


## Help

```sh
$ man which
```

```
WHICH(1)                  BSD General Commands Manual                 WHICH(1)

NAME
     which -- locate a program file in the user's path

SYNOPSIS
     which [-as] program ...

DESCRIPTION
     The which utility takes a list of command names and searches the path for
     each executable file that would be run had these commands actually been
     invoked.

     The following options are available:

     -a      List all instances of executables found (instead of just the first
             one of each).

     -s      No output, just return 0 if all of the executables are found, or 1
             if some were not found.

     Some shells may provide a builtin which command which is similar or identi-
     cal to this utility.  Consult the builtin(1) manual page.

SEE ALSO
     builtin(1), csh(1), find(1), locate(1), whereis(1)
```


## Examples

Find an executable.

The **first** match from `PATH` is returned.

```sh
$ which python3
/usr/bin/python
```

Missing program - returns an error status and prints an error.

```sh
$ which foo
foo not found
```

Find all matches.

```sh
$ which -a python3
/usr/local/bin/python3
/usr/bin/python3
```

Use `xargs` to iterate over them to check if any are symlinks.

```sh
$ which -a python3 | xargs ls -l
-rwxr-xr-x  1 root     wheel  31488 22 Sep 02:29 /usr/bin/python3
lrwxr-xr-x  1 mcurrin  admin     38 13 Oct 13:15 /usr/local/bin/python3 -> ../Cellar/python@3.9/3.9.0/bin/python3
```

Or without `xargs`.

```sh
ls -l $(which -a python3)
lrwxrwxrwx 1 root 9 Jun  6  2020 /bin/python3 -> python3.8
lrwxrwxrwx 1 root 9 Jun  6  2020 /usr/bin/python3 -> python3.8
```

Note - if `which` returns nothing here, then the subshell will be empty.
