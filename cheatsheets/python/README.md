# Python cheatsheet

Some useful commands, boilerplate code from my existing projects or things to use in new development.


## Python

- [Command line and environment](https://docs.python.org/3/using/cmdline.html) on Python 3 docs - how to use the `python` command.

Run in unbuffered mode (printing is printed immediately rather than when the buffer reaches a certain size).

```sh
$ python -U
```

## Pip

See also [project packages](cheatsheets/package_managers/project_packages) section of this project and look for pip or Python pages.

### Protect global environment

Prevent accidentally installing or upgrading in your user's global Python environment.

In Linux/macOS, set this value in your `~/.bashrc` or `~/.zshrc` file.

```sh
PIP_REQUIRE_VIRTUALENV=true
```

Now, any time you run `pip install` **outside** a virtual environment you'll get an error.

How to force global install:

```sh
$ PIP_REQUIRE_VIRTUALENV=false pip install PACKAGE
```

### Pip commands

- `install PACKAGE`
- `install PACKAGE==VERSION`
- `install PACKAGE --user`
- `install PACKAGE -U|--upgrade`
- `install -r REQUIREMENTS_TXT_PATH`
- `install pip --upgrade`
- `uninstall PACKAGE`

### Ways to access pip

#### Outside virtual environment

Run global pip (probably uses Python 2).

```sh
$ pip
```

Run global pip for Python 3.

```sh
$ pip3
```

Or

```sh
$ python3 -m pip
```

Or target a more specific version which is not your system default.

```sh
$ python3.8 -m pip
```

Upgrade pip. If you get permissions errors, as `--user` flag.

```sh
$ PIP_REQUIRE_VIRTUALENV pip install --upgrade pip
# OR
$ PIP_REQUIRE_VIRTUALENV python3 -m pip install --upgrade pip
```

#### Within a virtual environment

Run the pip which is in the scope of the environment - this requires the environment to be activated.

```sh
$ source venv/bin/activate
$ pip
```

Even if using Python 3, you won't need to use `pip3` - using `pip` in a virtual environment is fine.

This approach does **not** require the activate step.

```sh
$ venv/bin/pip
```

## Libaries

Links are all for Python 3.

- [Python standard library](https://docs.python.org/3/library/index.html)
- [argparse](https://docs.python.org/3/library/argparse.html)
- [os](https://docs.python.org/3/library/os.html)
- [logging](https://docs.python.org/3/library/logging.html)
- [File and directory access](https://docs.python.org/3/library/filesys.html)


## Formatting

Some VS Code choices - this is a free text field for provider, plug configurations for each.

- autopep8
- black (PY 3 only)
- yapf

## Linting

Some VS Code choices - there are flags for each (so multiple can be used), plus a linting enabled switch.

- [pylint](#pylint)
- [flake8](#flake8)
- [mypy](#mypy)


### Pylint

- [docs.pylint.org](https://docs.pylint.org/en/latest/index.html)
- [Pylint messages](http://pylint-messages.wikidot.com/all-codes)
- [Pylint message-control](https://pylint.readthedocs.io/en/latest/user_guide/message-control.html)

#### Rules

Formats that Pytlint accepts - copied from message-control doc.

> For all of these controls, `pylint` accepts the following values:
> -   a symbolic message: `no-member`, `undefined-variable` etc.
> -   a numerical ID: `E1101`, `E1102` etc.
> -   The name of the group of checks. You can grab those with `pylint --list-groups`. For example, you can disable / enable all the checks related to type checking, with `typecheck` or all the checks related
> to variables with `variables`
> -   Corresponding category of the checks
>     -   `C` convention related checks
>     -   `R` refactoring related checks
>     -   `W` various warnings
>     -   `E` errors, for probable bugs in the code
>     -   `F` fatal, if an error occurred which prevented `pylint` from doing further processing.
> -   All the checks with `all`

#### How to disable

Approaches to disabling a *pylint* rule.

Disable for scope. Either at the top of a file or scope like a function.

```
def test():
    # pylint: disable=no-member
    ...
```

Disable for line.

```
a, b = ... # pylint: disable=unbalanced-tuple-unpacking
```

Using [symbolic names](https://docs.pylint.org/en/latest/faq.html#do-i-have-to-remember-all-these-numbers)

```
# pylint: disable=locally-disabled, multiple-statements, fixme, line-too-long
```

Using config file:

```
disable= wildcard-import,
 method-hidden,
 too-many-lines
 ```
 
 
### Flake8

#### Disable

Disable for file:

`# flake8: noqa`

Disable inline - all.

```
... #noqa
```

Disable inline - comma-separated codes.

```
... # noqa: E234
```

## MyPy

Optional static typing for Python.

- [mypy-lang.org](https://mypy-lang.org/) homepage.
- [Read the docs](https://mypy.readthedocs.io/en/stable/) page.


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

## Working with strings

### Repeating

```python
>>> '---'*10
'------------------------------'

>>> ['---']*10
['---', '---', '---', '---', '---', '---', '---', '---', '---', '---']

>>> print(" | ".join(['---']*10))
--- | --- | --- | --- | --- | --- | --- | --- | --- | ---
```

### Convert strings to markdown table

```python
header = "a,b,c".split(',')
row = "1,2,3".split(",")

print(" | ".join(header))
print(" | ".join(['---']*len(header)))
print(" | ".join(row))
```

```markdown
a | b | c
--- | --- | ---
1 | 2 | 3
```

a | b | c
--- | --- | ---
1 | 2 | 3

### Convert strings to dict

```python
header = "a,b,c".split(',')
row = "1,2,3".split(",")

row_dict = {k: v for k, v in zip(header, row)}

print(row_dict)
# {'a': '1', 'b': '2', 'c': '3'}
```
