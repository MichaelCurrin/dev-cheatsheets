# xargs

Take white-space separated input and split. These can be passed as arguments to a utility.

If you pass the contents of a file, it will flatten the lines into one lines.

## Man page

```sh
$ man xargs
```

```
NAME
     xargs -- construct argument list(s) and execute utility

SYNOPSIS
     xargs [-0opt] [-E eofstr] [-I replstr [-R replacements]] [-J replstr]
           [-L number] [-n number [-x]] [-P maxprocs] [-s size]
           [utility [argument ...]]

DESCRIPTION
     The xargs utility reads space, tab, newline and end-of-file delimited
     strings from the standard input and executes utility with the strings as
     arguments.

     Any arguments specified on the command line are given to utility upon each
     invocation, followed by some number of the arguments read from the standard
     input of xargs.  The utility is repeatedly executed until standard input is
     exhausted.

     Spaces, tabs and newlines may be embedded in arguments using single
     (`` ' '') or double (``"'') quotes or backslashes (``\'').  Single quotes
     escape all non-single quote characters, excluding newlines, up to the match-
     ing single quote.  Double quotes escape all non-double quote characters,
     excluding newlines, up to the matching double quote.  Any single character,
     including newlines, may be escaped by a backslash.
 ```
 
 
## Flags
 
Use the number zero as a flag.

```
      -0      Change xargs to expect NUL (``\0'') characters as separators, instead of spaces and newlines.  This is expected
             to be used in concert with the -print0 function in find(1).
```

Here is an example I found that uses that.

```sh
$ find Pictures/tecmint/ -name "*.png" -type f -print0 | xargs -0 tar -cvzf images.tar.gz
```

In general, I would not use `xargs` with `find`. Rather use the ability of `find` to run a shell command for each file it finds - such as delete or rename a file.

 
## Examples

```sh
$ ls
abc   def
ghi   jkl
```

```sh
$ ls | xargs
abc def ghi jkl
```

Note that using `ls` is not that useful.

Instead.

```
$ ls *upload* | xargs wc
```

You could get the same output with:

```sh
wc *upload*
```

### which

You can use `xargs` in a functional programming style to pipe output, so you don't need a `for` loop. That is probably also more efficient a `for` loop.

Here I want to lookup a list of paths as output from a command and show target if any of them are symlinks.

```sh
$ which -a python3
/usr/local/bin/python3
/usr/bin/python3
```

```sh
$ which -a python3 | xargs
/usr/local/bin/python3 /usr/bin/python3
```

```sh
$ which -a python3 | xargs ls -l
-rwxr-xr-x  1 root     wheel  31488 22 Sep 02:29 /usr/bin/python3
lrwxr-xr-x  1 mcurrin  admin     38 13 Oct 13:15 /usr/local/bin/python3 -> ../Cellar/python@3.9/3.9.0/bin/python3
```

Here is that using a `for` loop instead.

```sh
for P in $(which -a python3); do
  ls -l $P
done
```
```
lrwxr-xr-x  1 mcurrin  admin  38 13 Oct 13:15 /usr/local/bin/python3 -> ../Cellar/python@3.9/3.9.0/bin/python3
-rwxr-xr-x  1 root  wheel  31488 22 Sep 02:29 /usr/bin/python3
```

### git and xargs

In git, you might want to loop over your branchs or remotes do clean them up.

Here, deleting branches with `xargs`.

```sh
$ echo 'foo bar' | xargs git branch -D

echo 'foo
bar' | xargs git branch -D
```

Though, commands let you pass multiple options, so you don't need actually `xargs` in this case. Here is a simpler form.

```sh
$ git branch -D foo bar
```

Or a `for` loop that does this.

```sh
$ git branch -D foo
$ git branch -D bar
```
