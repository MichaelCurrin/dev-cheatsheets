# Current directory

From [SO](https://stackoverflow.com/questions/18136918/how-to-get-current-relative-directory-of-your-makefile).

## Basic

```mk
current_dir = $(shell pwd)
```

## Absolute path

```mk
current_dir = $(notdir $(shell pwd))
```

## Flexible

Or if invoking `Makefile` from any directory, such as using includes to load a Makefile in another directory.

```mk
mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
current_dir := $(notdir $(patsubst %/,%,$(dir $(mkfile_path))))
```
