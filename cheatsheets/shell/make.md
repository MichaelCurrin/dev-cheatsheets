---
title: Make
---

Use of `make` command in Unix environments.

Makefile templates topic on Github - [makefile-template](https://github.com/topics/makefile-template)

Targets (commands) will differ per project and environment but these can be applied where relevant.

## Phony

```makefile
.PHONY docs

docs:
	echo 'Test'
```

## Help

### Basic

```make
# Show summary of make targets.
help:
	@echo 'Print lines that are not indented (targets and comments) or empty.'
	@egrep '^\S|^$$' Makefile
```

### Extended

If you use `@echo` within your targets:

```make
# Show summary of make targets.
help:
	@echo 'Print lines that are not indented (targets and comments) or empty, plus any indented echo lines.'
	@egrep '(^\S)|(^$$)|\s+@echo' Makefile
```

Alt echo: `@echo "Include left-aligned, empty lines and echo lines."`

### Detailed

Copied from Poetry's [Makefile](https://github.com/python-poetry/poetry/blob/master/Makefile). 

This is complex - I don't know why. I haven't tested yet but maybe something here is useful.

```makefile
# lists all available targets
list:
	@sh -c "$(MAKE) -p no_targets__ | \
		awk -F':' '/^[a-zA-Z0-9][^\$$#\/\\t=]*:([^=]|$$)/ {\
			split(\$$1,A,/ /);for(i in A)print A[i]\
		}' | grep -v '__\$$' | grep -v 'make\[1\]' | grep -v 'Makefile' | sort"
# required for list
no_targets__:

```


## Export

Use variables in commands.

Given file `.env` with variable set as `FOO=bar` and `script_that_echoes_foo.sh` which does `echo $FOO`.

### Do

The combination of `export` and `source` works well.

```makefile
export FOO=''

test:
  source .env && echo $$FOO
  source .env && ./script_that_echoes_foo.sh
```


### Don't do

The following will not work as expected ,due to `make` limitations on environment setting of child processes.

```make
test:
  source .env
  echo $$FOO
```

The following will not work either, with or without `export` set at the top.

```makefile
test:
  export $(<.env) && ./script_that_echoes_foo.sh
```


## Jekyll

```makefile
install:
	bundle config --local path vendor/bundle
	bundle install

upgrade:
	bundle update

s serve:
	bundle exec jekyll serve
```


## Python

See [Makefile in MichaelCurrin/py-project-template](https://github.com/MichaelCurrin/py-project-template/blob/master/Makefile) on Github.
