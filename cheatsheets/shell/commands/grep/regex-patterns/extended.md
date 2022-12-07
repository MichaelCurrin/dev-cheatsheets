---
title: Extended
description: About using grep's extended matching
---


## About

Basic grep already supports some patterns, like glob and regex.

To extend the matching to be more powerful, you can use extended grep.

You won't get an error using `grep` here in place of `egrep` - you'll probably just get an error.


## Usage

```sh
$ egrep PATTERN PATH
```

Or `grep -e` in place of `egrep`.


## Examples

Find numbers:

```sh
$ egrep '[0-9]'
```

Note that some versions of egrep will allow `\d` but not on WSL, from my testing.

Find alphabetic characters:

```sh
$ egrep '^[a-zA-Z]+$' myfile.txt
```

Find alphanumeric characters:

```sh
$ egrep 'My prefix \w\w\w\w'
```

Find words:

```sh
$ egrep "support|help|windows" myfile.txt
```

Add `-c` for count.

```sh
$ egrep -c '^begin|end$' myfile.txt
```

```sh
$ egrep '^[a-z -]+:' Makefile
```

Find Go version in a Go module file.

```sh
$ egrep 'go \d+\.\d+' go.mod
go 1.15
```

Note that brackets are optional in the simple case.

```sh
$ egrep 'Foo bar|baz: ' myfile.txt
$ egrep '(Foo bar)|(baz: )' myfile.txt
```

But brackets are meaningful here:

```sh
$ egrep -H '[^0] to (add|destroy)' *
```
