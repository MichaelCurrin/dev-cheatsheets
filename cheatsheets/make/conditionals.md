# Conditionals

## Related

- [Definition][] page, including default values for variables.

[Definition]: {% link cheatsheets/make/variables/definition.md %}


## Shell if

Using `if`, identical to the Bash `if` except you have add backslash escapes across multiple lines.

This can be used as a check used in other commands.

Optionally use `@` to make it quiet.

```make
foo:
	@if [ -z $(FOO) ]; then \
		echo "FOO must be set. Use `export FOO=<foo>`"; \
		exit 1; \
	fi
```

## One line if

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


## If value defined

```mk
ifndef FOO
	FOO = abc
endif
```

Sample from Git's Makefile.

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

Presumably these can be provided optionally by the user in the CLI.

```sh
$ make SHELL_PATH=/bin/bash install
```


## Error on value not defined

My own code to abort if a value is not defined:

```makefile
.check-env:
ifndef DEPLOYMENT_ENVIRONMENT
	echo "Must set DEPLOYMENT_ENVIRONMENT"
	exit 1
endif
	echo "DEPLOYMENT_ENVIRONMENT: $(DEPLOYMENT_ENVIRONMENT)"

deploy: .check-env
	# do stuff
```

Cause an error:

```sh
$ make .check-env
```

Print environment:

```sh
$ DEPLOYMENT_ENVIRONMENT=development make .check-env
```
