# Basic

The basic one supports matching such as these:


## Simple text match

Note you don't need to add any wildcard before or after.

```sh
$ grep 'foo' PATH
```


## Simple regex

These are all allowed in simple regex.


Whitespace.

```sh
$ grep '\sfoo' PATH
```

Blank line.

```sh
$ grep '^$' PATH
```

```sh
$ grep '^[a-z]' Makefile
```

Using a globstar. 

Note dot matches anything, not a literal dot.

```sh
$ grep 'go *.' go.mod
```

Matches:

module github.com/MichaelCurrin/**go-**project-template

**go 1.**15

github.com/cpuguy83/**go-**md2man/v2 v2.0.0 // indirect

Using escaped dot.

```sh
$ grep 'go \w*\.' go.mod
```

**go 1.**15

