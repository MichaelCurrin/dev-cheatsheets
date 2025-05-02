---
description: Setting the default command if no args are given to `make`
---
# Default target

See [Goals in Make docs](https://www.gnu.org/software/make/manual/html_node/Goals.html)

## First command

When running `make` without arguments, it will run the _first_ command in the file.

```make
help:
	@echo 'Welcome!'

install:
	@echo 'Installing deps...'
```

Running without an argument execute the first.

```console
$ make
Welcome!
```

Traditionally, a Makefile will have an `all` or `default` command, as below.

The target word can be anything must be set up _first_ in the file in order to be the default when running without arguments.

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

The GNU docs recommend `all`, but the `default` makes more sense to me. The `all` can be useful if there are many steps to run while `default` I would set up as one command.

```make
default: install
```
```make
all: install build test
```

## Make variable

Alternatively use `.DEFAULT_GOAL` variable.

e.g.

```make
.DEFAULT_GOAL = build

dev: deps serve
build: deps site
```

See the [docs](https://www.gnu.org/software/make/manual/html_node/Special-Variables.html)

Alternatively, set the default like this, if `all` was not first.

```make
.DEFAULT_GOAL := all
```


## Multiple files

If you have two files for `make` commands, in the imported file becomes the _first_ and its first target will be the default.

So either add a default to the second:

- `Makefile`
    ```make
    include release.mk
    
    default: install
    
    install:
    	# ...
    ```
- `release.mk`
    ```make
    default: install
    
    tag:
    	# ...
    ```
    
Or make sure the import is _after_ the default:

- `Makefile`
    ```make
    default: install
    
    include release.mk
    
    install:
    	# ...
    ```
- `release.mk`
    ```make
    tag:
    	# ...
    ```
    
