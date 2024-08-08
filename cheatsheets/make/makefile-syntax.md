# Makefile syntax


Makefile templates topic on GitHub - [makefile-template](https://github.com/topics/makefile-template)

Targets (commands) will differ per project and environment but these can be applied where relevant.

Remember, the `make` command also supports tab autocomplete for targets.

For language specific examples, see my [Code Cookbook](https://github.com/MichaelCurrin/code-cookbook) project's `make` section.


## Phony

Phony is useful if your target matches an actual directory but you don't want to `make` to run against it. Normally, you could run `make DIR` for compiling a C program or similar, but that isn't helpful outside of compiled languages.

This can be done at the start, or just before each target.

Here we use PHONY where `foo` and `docs` are actual directories as well targets.

- `Makefile`
	```makefile
	.PHONY: foo docs

	foo:
		echo 'Foo'

	docs:
		echo 'Test'
	```
- `Makefile`
	```makefile
	.PHONY: foo
	foo:
		echo 'Foo'
		
	.PHONY: docs
	docs:
		echo 'Test'
	```

Some people like to add `.PHONY` to every target, whether in just above each or all at the top of the file. In many cases, this adds no benefit, maybe more useful for C and C++ projects with compile steps where you might have fixed or dynamically generated folders which match commands. However, the often it serves no purpose and just clutters the file. Rather use `.PHONY` where it is needed (like if you do have a folder where yours docs will get generated).


## Comments

You can put a comment anywhere. 

The comment will be printed when the target runs. But you can use `@#` to prevent it from printing.


- `Makefile`
	```mk
	# Comment.
	foo: # Another comment.
		# Yet another comment.
		@# This comment won't be printed.
		echo 'Foo'
	```


## Export

Use variables in commands.

Given file `.env` with variable set as `FOO=bar` and `script_that_echoes_foo.sh` which does `echo $FOO`.

### Do this

The combination of `export` and `source` works well.

- `Makefile`
	```makefile
	export FOO=''

	test:
	  source .env && echo $$FOO
	  source .env && ./script_that_echoes_foo.sh
	```

### Don't do this

The following will not work as expected ,due to `make` limitations on environment setting of child processes.

- `Makefile`
	```make
	test:
		source .env
		echo $$FOO
	```

The following will not work either, with or without `export` set at the top.

- `Makefile`
	```makefile
	test:
		export $(<.env) && ./script_that_echoes_foo.sh
	```


## Control flow

Using conditionals and iteration, similar to shell.

Note that unlike in the shell, the `\` is necessary in a `Makefile` so that the command is combined on one line at run at once.

### For

- `Makefile`
	```make
	foo:
		for bar in my-dir/*; do \
			export fizz=$$(echo $$bar) \
			$(MAKE) plan; \
		done
	```

### If

Note lack of indentation.

- `Makefile`
	```make
	TARGET:
	ifneq (CONDIITION, )
		ACTION
	endif
		ACTION
	```

[Syntax](https://www.gnu.org/software/make/manual/html_node/Conditional-Syntax.html) in Make docs.

Example:

- `Makefile`
	```make
	libs_for_gcc = -lgnu
	normal_libs =

	foo: $(objects)
	ifeq ($(CC),gcc)
		$(CC) -o foo $(objects) $(libs_for_gcc)
	else
		$(CC) -o foo $(objects) $(normal_libs)
	endif
	```

Alternate:

- `Makefile`
	```make
	TARGET:
		@if [ CONDITION ]; then \
			ACTION ; \
		fi
	```


## Get the current target name

- `Makefile`
    ```Makefile
    a:
        echo $(@)
    b:
        echo $(@)
    ```

Shell usage:

```sh
$ make a b
echo a
a
echo b
b
```


## Find files

### Wildcard

Using `wildcard` to evaluate a globstar. 

This will only search at the directory level given - **not** subdirectories.

Don't quote the glob.

```Makefile
files  := $(wildcard *.lock)

a:
	@echo $(all_files)
```
```sh
$ make a
Gemfile.lock
```

Or in a directory.

```Makefile
# Top-level.
docs := $(wildcard *.md)
# CONTRIBUTING.md README.md about.md index.md

# Target directory.
docs := $(wildcard docs/*.md)
# docs/README.md docs/deploy.md docs/development.md docs/installation.md docs/usage.md

# Exactly one level down in any directory. Ignores top-level and 2 levels down.
docs := $(wildcard */*.md)
# _site/about.md docs/README.md docs/deploy.md docs/development.md docs/installation.md docs/usage.md resources/index.md
```

Note using `**/*.md` will **not** work for finding the current directory like if using with `grep`. For Make wildcards, it will still search **one level** below the current directory.

### Shell find

Evaluate a `shell` expression and using `find` command inside it. Quote the glob.

This does not work if you leave out `:=`, `$()` or `shell`.

This will search in subdirectories.

```make
files := $(shell find . -name "*.lock")

a:
	@echo $(all_files)
```

```sh
$ make a
./Gemfile.lock ./vendor/bundle/ruby/2.7.0/gems/http_parser.rb-0.6.0/Gemfile.lock
```

Note that is an array moved to one line.

Here is the original output:

```sh
$ find . -name '*.lock'
./Gemfile.lock
./vendor/bundle/ruby/2.7.0/gems/http_parser.rb-0.6.0/Gemfile.lock
```

