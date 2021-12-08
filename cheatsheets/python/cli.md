---
title: CLI
description: Running the `python` command in the terminal
---

## Resources

- [Command line and environment](https://docs.python.org/3/using/cmdline.html) on the Python 3 docs - how to use the `python` command.


## Entry-point

### Interactive console

```sh
$ python FLAGS
```

### Script

```sh
$ python FLAGS SCRIPT_PATH
```

### Module

```sh
$ python FLAGS -m MODULE
```

e.g. 

Use a built-in module.

```console
$ echo '[1, 2, 3'] | python3 -m json.tool
[
    1,
    2,
    3
]
```

```console
$ python3 -m http.server
Serving HTTP on :: port 8000 (http://[::]:8000/) ...
```

Or a globally installed module.

```console
$ pip3 install black --upgrade
$ python3 -m black --version
__main__.py, 21.12b0 (compiled: no)
```

```sh
$ python3 -m venv my-venv
```

```console
$ python3 -m pip install PACKAGE
```


## Flags

Use these flags either when starting the interactive console or when running a module or script.
Interactive console:


### Verbose

```sh
$ python -v
```

### Unbuffered

Run in unbuffered mode, so that output is printed immediately rather than when the buffer reaches a certain size.

There are multiple ways to achieve this.

[StackOverflow](https://stackoverflow.com/questions/107705/disable-output-buffering) discussion.

```sh
$ python -u
```

Or if you are not using `/usr/bin/env python` you can add the flag to your script.

```python
#!/usr/bin/python -u
```

Set `PYTHONUNBUFFERED` in the shell or within your script with `os.env`.

Or within a script on print.

```python
print('Hello, World!', flush=True)
```

Or with a partial:

```python
import functools


print = functools.partial(print, flush=True)

print('Hello, World!')
```
