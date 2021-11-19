---
description: Setting the default command if no args are given to `make`
---
# Default target



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

The GNU docs recommend `all` but the `default` makes more sense to me. The `all` can be useful if there are many steps to run while `default` I would set up as one command.

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
    
