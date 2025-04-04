# Conditionals

## Related

- [Definition][] page, including default values for variables.

[Definition]: {% link cheatsheets/make/variables/definition.md %}


## Shell if

Using `if`, identical to the Bash `if` except you have add backslash escapes across multiple lines.

This can be used as a check used in other commands.

Optionally use `@` to make it quiet for Make output.

```make
foo:
	@if [ -z $(FOO) ]; then \
		echo 'Must set FOO'; \
		exit 1; \
	fi
```

Note that this is used _within_ a target while using Make directives like `ifdef` are evaluated always even if a target is not triggered.

Note using `$(error ...)` does not work within Bash `if` statement since it will always execute, so rather keep it all Bash or all Make.

## One line if

Set a value based on whether another variable is set.

```mk
BUZZ := $(if $(FOO), 'abc', $(FIZZ))
```


## Equal and not equal

Use an `ifeq` expression. Or `ifneq` to negate.

It looks like the conditions have to be something like `$(MY_VALUE), $(MY_OTHER_VALUE)`. I found that this never matched so was not helpful - `$(MY_VALUE), MY_TEXT`.

```
TARGET:
ifeq (CONDITION1, CONDITION2)
  EXPRESSION
endif

TARGET:
ifeq (CONDITION1, CONDITION2)
  EXPRESSION
else
  EXPESSION
endif
```

An example:

```makefile
DEV = development

deploy:
ifeq ($(DEPLOYMENT_ENVIRONMENT), $(DEV))
	cd widget && \
		npm run build:dev
else
	cd widget && \
		npm run build:prod
endif
```

If an expression match is false, evaluate the block.

```makefile
foo:
ifneq ($(wildcard ./fizz/$(BUZZ)),)
	$(eval NAME=$(shell sh -c "grep ..."))
endif
	# ...

```

## If value not defined

```mk
FOO ?= abc
```

This is equivalent to this:

```mk
ifndef FOO
	FOO = abc
endif
```

Sample from Git's Makefile using `ifndef`, though perhaps using `?=` approach is equivalent but lighter to read.

```mk
ifndef SHELL_PATH
	SHELL_PATH = /bin/sh
endif
ifndef PERL_PATH
	PERL_PATH = /usr/bin/perl
endif
ifndef PYTHON_PATH
	PYTHON_PATH = /usr/bin/python
endif

export PERL_PATH
export PYTHON_PATH

TEST_SHELL_PATH = $(SHELL_PATH)
```


## Error on values not set

Abort if a value is not defined using `indef`.

```makefile
ifndef DEPLOYMENT_ENVIRONMENT
    @echo "DEPLOYMENT_ENVIRONMENT is set to: $(DEPLOYMENT_ENVIRONMENT)"
else
    $(error DEPLOYMENT_ENVIRONMENT must be set)
endif

deploy:
	echo 'Deploying'
```

Make sure the value is not empty, using `ifneq`.

```
# Make sure it is always defined but default to empty value.
DEPLOYMENT_ENVIRONMENT ?=

ifneq ($(DEPLOYMENT_ENVIRONMENT),)
    @echo "DEPLOYMENT_ENVIRONMENT is set to: $(DEPLOYMENT_ENVIRONMENT)"
else
    $(error DEPLOYMENT_ENVIRONMENT must be set)
endif

deploy:
	echo 'Deploying'
```

Test it out:

1. Cause an error:
    ```sh
    $ make deploy
    ```
1. Print environment:
    ```sh
    $ DEPLOYMENT_ENVIRONMENT=development make deploy
    ```
    ```sh
    $ make deploy DEPLOYMENT_ENVIRONMENT=development 
    ```
    ```sh
    $ export DEPLOYMENT_ENVIRONMENT=development
    $ make deploy
    ```

