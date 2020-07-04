---
title: Python
---

Some useful commands, boilerplate code from my existing projects or things to use in new development.

See [pythoncheatsheet.org/](https://www.pythoncheatsheet.org/)


## Python command

- [Command line and environment](https://docs.python.org/3/using/cmdline.html) on Python 3 docs - how to use the `python` command.

Run in unbuffered mode (printing is printed immediately rather than when the buffer reaches a certain size).

```sh
$ python -U
```

## Find example usage

See [programcreek.com/python/index/module/list](https://www.programcreek.com/python/index/module/list). When you go into functions of a module, you can see where other code uses that.


## Dotenv files

How to load a dotenv file, then use the values in your application.

Install [python-dotenv](https://pypi.org/project/python-dotenv/). Use the `-U` flag if installing globally to restrict to your user, or omit if in a virtual environment (recommended).

```sh
$ pip install python-dotenv
```

Create a `.env` file which follows Bash Shell syntax, with content such as:

```sh
# a comment that will be ignored.
REDIS_ADDRESS=localhost:6379
MEANING_OF_LIFE=42
MULTILINE_VAR="hello\nworld"
```

Load the file in Python such as in `settings.py` file.

```python
# settings.py
from dotenv import load_dotenv


load_dotenv()

# OR, the same with increased verbosity
load_dotenv(verbose=True)

# OR, explicitly providing path to '.env'
from pathlib import Path  # python3 only
env_path = Path('.') / '.env'
load_dotenv(dotenv_path=env_path)
```

Variables are now accessible through the OS environment variables, as if set with `export` command.

```python
import os


SECRET_KEY = os.getenv("EMAIL")
DATABASE_PASSWORD = os.getenv("DATABASE_PASSWORD")
```

## Pitfalls

Don't define data structures in function parameters. Only constants.

```python
def foo(x=[]):
    x.append('test')
    print(x)

foo()
# => ['test']
foo()
# => ['test', 'test']
```

Best practice way:

```python
def foo(x=None):
    if x is None:
        x = []
    x.append('test')
    print(x)

foo()
# => ['test']
foo()
# => ['test']
```

## Copy

- [lib.copy](https://docs.python.org/3/library/copy.html) builtin docs
	> Shallow and deep copy operations
- [copy in Python (Deep Copy and Shallow Copy)](https://www.geeksforgeeks.org/copy-python-deep-copy-shallow-copy/) tutorial

### Shallow copies

> Shallow copies of dictionaries can be made using dict.copy(), and of lists by assigning a slice of the entire list, for example, copied_list = original_list[:].

```python
copied_list = original_list[:]

copied_dict = original_dict.copy()
```

Where `original_obj` is a `dict` or `list`:

```python
import copy

copied_obj = copy.copy(original_obj)
```


### Deep copies

Where `original_obj` is a `dict` or `list`:

```python
import copy

copied_obj = copy.deepcopy(original_obj)
```
