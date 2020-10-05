---
title: Variables
---


## Setting variables

From [Setting Variables](https://www.gnu.org/software/make/manual/html_node/Setting.html) in the docs.

- Use `=`, `:=`, or `::=` and a value.
- White space is ignored.


### Simple

Example:

```mk
FOO =
CXX = g++
objects = main.o foo.o bar.o utils.o
SHELL = /bin/bash
JS_DIR = assets/js
```

### Evaluate

- Using `!= ...`. 
    > If the result of the execution could produce a `$`, and you don’t intend what follows that to be interpreted as a `make` variable or function reference, then you must replace every `$` with `$$` as part of the execution.
    ```mk
    hash != printf '\043'
    file_list != find . -name '*.c'
    ```
- Using `:= $(shell ...)`
    ```mk
    hash := $(shell printf '\043')
    var := $(shell find . -name "*.c")
    ```

### Default value

> If you’d like a variable to be set to a value only if it’s not already set, then you can use the shorthand operator `?=` instead of `=`. These two settings of the variable ‘FOO’ are identical:

```mk
FOO ?= bar
```

```mk
ifeq ($(origin FOO), undefined)
FOO = bar
endif
```


## Export variables

This makes the variable available in subprocesses, after executing source command.
But also make sure not to overwrite a value set already, such as with Netlify secrets.

```make
export GITHUB_TOKEN := $(if $(GITHUB_TOKEN), $(GITHUB_TOKEN), '')

foo:
    # ...
```

Using the Bash `export` style.
```mk
foo:
	@export ENVIRONTMENT=prod
    # ...
```

## Defaults files

Setup default values in another file.


Set defaults.

- `defaults.mk`
    ```mk
    FIZZ=${FIZZ}
    BUZZ=${BUZZ}

    export
    ```

Import the defaults.

- `Makefile`
    ```make
    include defaults.mk
    
    foo:
        # ...
    ```
