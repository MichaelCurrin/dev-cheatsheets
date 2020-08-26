---
title: Match types
---


## Basic

Find word.

```sh
grep foo PATH
```


## Exact match

```sh
grep -w 'foo' bar.txt
```


## Invert match

```sh
grep -v 'foo' bar.txt
```

That will invert the match on each line.

If you want to want to find entire files which do not match a pattern, use:

```sh
grep -L 'foo' bar.txt baz.txt
```



## Regex

There are three types of regex:

1. basic (BRE)
2. extended (ERE)
3. perl (PCRE)

The basic one supports matching such as these:

```sh
grep '\sfoo' PATH
```

Blank line

```sh
grep '^$' filename
```
