---
description: Mypy usage
---
# CLI


## Help

```sh
mypy --help
```
```
usage: mypy [-h] [-v] [-V] [more options; see below]
            [-m MODULE] [-p PACKAGE] [-c PROGRAM_TEXT] [files ...]

Mypy is a program that will type check your Python code.

Pass in any files or folders you want to type check. Mypy will
recursively traverse any provided folders to find .py files:

    $ mypy my_program.py my_src_folder

For more information on getting started, see:

- http://mypy.readthedocs.io/en/latest/getting_started.html
...
```


## Usage

See also my [Makefile](https://github.com/MichaelCurrin/py-project-template/blob/master/Makefile) in `py-project-template` repo on GitHub.

Give a path such as a directory or a script:

```sh
$ mypy app_dir
```

You can provide multiple paths:

```sh
$ mypy app_dir tests
```
