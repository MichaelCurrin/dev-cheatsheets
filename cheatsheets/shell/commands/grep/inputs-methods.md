# Input methods

## Overview

General

```sh
grep PATTERN PATH
```

From file

```sh
cat PATH | grep PATTERN
```

From string

```sh
echo 'TEXT' | grep PATTERN
```

In a directory such as `.`, `*` or a directory name.

```sh
grep PATTERN DIR

grep -r PATTERN DIR
```

Use `-i` or `-ir` for case insensitive.



## File

```sh
$ grep PATTERN foo.txt
```

```sh
$ grep PATTERN *.txt
```


## Directory

```sh
$ grep -r PATTERN .
```

```sh
$ grep -r PATTERN my_dir
```



## stdin

If you omit the paths, then `grep` reads from stdin.

```sh
echo 'hello world' | grep 'hello'
```


## Heredoc

Use a heredoc or herestring to pass a multiline string.

See [Here strings](https://en.wikipedia.org/wiki/Here_document#Here_strings) on Wikipeida.

### Inline

```sh
$ grep PATTERN <<< STRING
```

e.g.

One line.

```sh
$ grep 'hello' <<< 'hello world'
hello world
```

Multiple lines.

```sh
$ grep 'hello' <<< 'hello world
and hello devs
greetings'
```
```
hello world
and hello devs
```


## Using multi-line variable

```sh
MY_VAR='hello world'

grep 'hello' <<< $MY_VAR
```

Maybe quotes is safer on the variable, but might not make a difference for heredocs.
