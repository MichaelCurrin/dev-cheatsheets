# Git viewing

## Links

- [Pretty formats](https://git-scm.com/docs/pretty-formats)

## Tags

## Simple

```
$ git tags
```
e.g.

```
v0.0.1
v0.1.0
v0.2.0
```

## View tags and date

Optionally add commit message.

```sh
$ git log --tags --simplify-by-decoration --pretty="format:%ci %d %h"
```
e.g.

```
2020-01-14 12:18:44 +0200  (tag: v0.2.0) 18a4265
2020-01-04 22:24:05 +0200  (tag: v0.1.0) 0f16936
2020-01-04 11:08:37 +0200  (tag: v0.0.1) abc1234
2020-01-04 10:49:06 +0200  a6947a9
```

This flag is used to show tags only.

```
--simplify-by-decoration
           Commits that are referred by some branch or tag are selected.
```
