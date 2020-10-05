---
title: Default target
description: Setting the default command if no args are given to `make`
---


When running `make` without arguments, it will run the _first_ command in the file.

```make
help:
	@echo 'Welcome!'

install:
	@echo 'Installing deps...'
```

Running without an argument execute the first.


```sh
$ make
Welcome!
```


Traditionally, a Makefile will have an `all` or `default` command.

The target word can be anything must be setup _first_ in the file in order to be the default when running without arguments.

```make
default: install

help:
	@echo 'Welcome!'

install:
	@echo 'Installing deps...'
```

Running without an argument execute the first - here, the `default` option.

```sh
$ make
Installing deps...
```

The GNU docs recommend `all` but the `default` makes more sense to me. The `all` can be useful if there are many steps to run while `default` I would setup as one command.

```make
default: install
```
```make
all: install build test
```

Alternatively use `.DEFAULT_GOAL`

e.g.

```make
.DEFAULT_GOAL = build

dev: deps serve
build: deps site
```

See the [docs](https://www.gnu.org/software/make/manual/html_node/Special-Variables.html)
