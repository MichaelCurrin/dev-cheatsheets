---
title: Extended
description: About using grep's extended matching
---

## About

Basic grep already supports some patterns, like glob and regex.

To extend the matching to be more powerful, you can use extended grep.


## Usage

```sh
egrep PATTERN PATH
```

Or `grep -e` in place of `egrep`.


## Examples

```sh
$ egrep "support|help|windows" myfile.txt
```

```sh
$ egrep '^[a-zA-Z]+$' myfile.txt
```

```sh
$ egrep -c '^begin|end$' myfile.txt
```

Note that brackets are not needed in the simple case.

```sh
$ egrep 'Foo bar|baz: ' myfile.txt
$ egrep '(Foo bar)|(baz: )' myfile.txt
```

But are meaningful here:

```sh
$ egrep -H '[^0] to (add|destroy)' *
```
