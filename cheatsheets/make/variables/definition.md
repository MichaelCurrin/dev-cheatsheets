# Definition

From [Setting Variables](https://www.gnu.org/software/make/manual/html_node/Setting.html) in the docs:

- Use as `=`, `:=`, or `::=` and a value.
- White space is ignored.


## Plain definition

```mk
FOO =
CXX = g++
objects = main.o foo.o bar.o utils.o
SHELL = /bin/bash
JS_DIR = assets/js
```

You don't need quotes around multiple words.

You can define a value referencing another variable, including user input.

```mk
FOO = abc
BAR = $(FOO)
```

Evaluating works above without colon unlike next section.


## Evaluation

Note colon and equals sign here.

### shell

Using `:= $(shell ...)` syntax:

```mk
hash := $(shell printf '\043')
var := $(shell find . -name "*.c")
```

### if 

Using a Make `if` statement.

```mk
BUZZ := $(if $(FOO), 'abc', $(FIZZ))
```

### not equal 

Using `!= ...` syntax:

> If the result of the execution could produce a `$`, and you don’t intend what follows that to be interpreted as a `make` variable or function reference, then you must replace every `$` with `$$` as part of the execution.

```mk
hash != printf '\043'
file_list != find . -name '*.c'
```


## Default value

Here are two equivalent ways to set a variable if it is not defined.

```mk
FOO ?= bar
```

```mk
ifeq ($(origin FOO), undefined)
FOO = bar
endif
```


## User input with a default value

Use the `?=` syntax to set a Make variable with a default value which can be overridden by the user.

Code:

- `Makefile`
    ```mk
    name ?= World

    greet:
        @echo "Hello, $(name)!"
    ```

Usage:

```sh
$ make greet
Hello, World!

$ make greet name=dev
Hello, dev!
```

Note that variable names are case-sensitive - so make sure what you pass in on the shell matches what is in the `Makefile`.

See [Parameters]({{ site.baseurl }}{% link cheatsheets/make/variables/custom-parameters.md %}) section on passing variables.


## Export variables

How to let Make variables be accessible to subprocesses.

The Make variables are always accessible as Make variables.

```mk
ENV = dev

foo:
    echo $(ENV)
```

But variables are **not** accessible in Shell commands, unless you use Make's `export` prefix.

```mk
export ENV = dev

foo:
    echo $$ENV
```

Using `export` _within_ a target does not work, as variables are not persisted between commands in a target.

But you can use like this. Here we simulate a command using `ENV` by doing an `echo` inside a subshell.

```mk
test:
	ENV=dev bash -c 'echo $$ENV'

    # More verbose.
	@export ENV=dev && bash -c 'echo $$ENV'
```
