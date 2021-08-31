# Conditionals


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


## ifneq

If an expression match is false evaluate the block.

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
