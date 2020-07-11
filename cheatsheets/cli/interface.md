---
title: Writing a CLI
---

Cross-language guide for writing a command-line interface - focussing on the interface and help messaging.


## Arguments

### Subcommands

```
Subcommands:
  foo
  bar
  baz, b       Baz all the bugs.
```


## Options

#### One argument

```
-f, --foo FOO
```

#### Optional argument

```
-f, --foo [FOO]   Your foo value.  (defaults to bar)
```


#### One or more arguments

```
--foo FOO[,FOO2,...]
```

#### Short and long flag

```
-f, --FOO FOO
```
