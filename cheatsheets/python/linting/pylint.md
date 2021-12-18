# Pylint

## What is Pylint?

From the FAQ:

> Pylint is a static code checker, meaning it can analyse your code without actually running it. 
> 
> Pylint checks for errors, tries to enforce a coding standard, and tries to enforce a coding style.


## Resources

- [pylint.org](https://pylint.org/)
- [FAQ](https://pylint.pycqa.org/en/latest/faq.html) - in particular, see sections of message control and on working with other linters.


## CLI

### Help

```sh
$ pylint --help
```
```
Usage: pylint [options]

...
```

See also:


```sh
$ pylint --long-help
```

### Flags

From the docs:

```
--ignore=<file[,file…]>
 	Add files or directories to the blacklist. They should be base names, not paths.
--output-format=<format>
 	Select output format (text, html, custom).
--msg-template=<template>
 	Modify text output message template.
--list-msgs	Generate pylint’s messages.
--full-documentation
 	Generate pylint’s full documentation, in reST format.
```

### Example

Pass a file path.

```sh
$ pylint fizz.py
$ pylint fizz.py foo/bar.py
```

Pass a directory path.

```sh
$ pylint .
$ pylint foo
```

### GUI

Requires `tkinter`.

```sh
$ pylint-gui
```

### Generate config

> The `--generate-rcfile` option will generate a commented configuration file on standard output according to the current configuration and exit.

```sh
$ pylint --generate-rcfile
$ pylint --generate-rcfile > .pylintrc
```

You might want to pass flags to it and see if those are saved.


## Status codes

The exit codes of the `pylint` command:

> Pylint returns bit-encoded exit codes. If applicable the table lists related stderr stream message output.

exit code	| meaning
--- | --- 
0	| no error
1	| fatal message issued	
2	| error message issued	
4	| warning message issued	
8	| refactor message issued	
16	| convention message issued	 
32	| usage error	

### Pylint exit package

Those are not so easy to read.

But you can use the `pylint-exit` library to give more useful messages printed and exit on a fatal error. You can also change the level by passing flags to it.

Here we run `pylint-exit` if `pylint` gave a non-zero status (which could be a warning error) and pass the `pylint` status code to `pylint-exit`.

```sh
$ pylint foo || pylint-exit $?
```

- GitHub: [jongracecox/pylint-exit](https://github.com/jongracecox/pylint-exit)
- PyPI: [pylint-exit](https://pypi.org/project/pylint-exit/)


## Config file

There are multiple names and places for a config, but the common choice is:

- `.pylintrc` at the repo root.


### Sample

Here ignoring `FIXME` comments, `except Exception` lines, and naming (such as when you do want a single-character variable name).

```ini
[MESSAGES CONTROL]
disable=
  fixme,
  broad-except,
  invalid-name
```

Also look at disabling `global-statement` to avoid error on use of `global`.

### Generate

```sh
$ pylint --disable=bare-except,invalid-name --class-rgx='[A-Z][a-z]+' --generate-rcfile
```

> You can generate a sample pylintrc file with `--generate-rcfile`.
> 
> Every option present on the command line before this will be included in the rc file

> For example:

```python
$ pylint --disable=bare-except,invalid-name --class-rgx='[A-Z][a-z]+' --generate-rcfile
```


## Ignore

Disable rules for a scope.

The rules are comma-separated and you can also add a space after the comma.

### Disable current line

```python
# pylint: disable=RULES
```

e.g.

```python
global VAR # pylint: disable=global-statement
```

```python
# pylint: disable=fixme,line-too-long
```


### Disable next line

```python
# pylint: disable-next=...
```

### Disable for a block

> A block is either a scope (say a function, a module), or a multiline statement (try, finally, if statements, for loops). 
> 
> It's currently impossible to disable inside an else block

```python
def my_function():
    # pylint: disable=some-rule
```

### Disable for module

Place at the top of the file:

```python
# pylint: disable=wildcard-import, method-hidden
# pylint: enable=too-many-lines
```

Or ignore the whole file:

```python
# pylint: skip-file
```
