---
title: CLI
description: Running the `python` command in the terminal
---

- [Command line and environment](https://docs.python.org/3/using/cmdline.html) on Python 3 docs - how to use the `python` command.


## Unbuffered

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

Set `PYTHONUNBUFFERED` in the shell or within your script on `os` module.

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
