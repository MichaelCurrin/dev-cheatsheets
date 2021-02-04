# pylint


- [pylint.org](https://pylint.org/)


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
