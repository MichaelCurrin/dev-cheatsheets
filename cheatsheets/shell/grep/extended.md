---
title: Extended
description: About using extended grep matching
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
egrep "support|help|windows" myfile.txt
```

```sh
egrep '^[a-zA-Z]+$' myfile.txt
```

Using a flag like `--count`.

```sh
egrep -c '^begin|end$' myfile.txt
```

Note brackets are not needed as these both work.

```sh
egrep 'Foo bar|baz: ' myfile.txt
egrep '(Foo bar)|(baz: )' myfile.txt
```
