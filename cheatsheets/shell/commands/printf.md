---
title: printf
description: Print format
---

Named after `printf` in C.

- [Manpage](https://ss64.com/bash/printf.html) on SS64.


## Text

Print text - _without_ trailing newline by default.

```console
$ printf Hello
Hello
```

With newline.

```console
$ printf "Hello\n"
Hello
```


## Expression

```console
$ X=abc
$ printf "$X\n"
abc
```


## Format type

### Integer

```console
$ printf "%d\n" 5
5
```

```console
$ DISTANCE=15
$ printf "Distance is %5d km\n" $DISTANCE
Distance is 15 km
```

### Float

Use 6 decimal places by default.

```console
$ printf "%f\n" 5
5.000000
```


## Multiline

```sh
$ printf %s "\
with quotes we can echo
several lines at a time
"
```

## Store

Store the output in a variable, without printing.

> `-v`   Cause the output to be assigned to the variable var rather than being printed to the standard output.

```console
$ printf -v MY_VAR "Hello $USER"
$ echo $MY_VAR
Hello mcurrin
```

