---
title: Pathlib
description: A new built-in alternative to using `os.path`
---



## Resources

- [pathlib](https://docs.python.org/3/library/pathlib.html) in Python 3 docs.
- [pathlib intro](https://pbpython.com/pathlib-intro.html) on PBPython
- [Pathlib](https://realpython.com/python-pathlib/) on RealPython


## Setup

```python
from pathlib import Path
```

## Basics

### Working directory

```python
my_dir = Path('.')
```

### Path to current script

```python
my_dir = Path(__file__)
```

### Directory of current script

```python
my_dir = Path(__file__).parent
```

### Build a path

```python
my_path = my_dir / 'foo' / 'bar.txt'
```

### List subdirectories

```python
p = Path('.')

dir_paths = [x for x in p.iterdir() if x.is_dir()]
```

### Glob

```python
list(p.glob('**/*.py'))
```

### Navigating

```python
p = Path('/etc')

q = p / 'init.d' / 'reboot'
# => PosixPath('/etc/init.d/reboot')

q.resolve()
# => PosixPath('/etc/rc.d/init.d/halt')
```

### Opening a file

```python
with q.open() as f_in:
    text = f_in.readline()
```


## Home

```python
h = Path.home()
# PosixPath('/Users/mcurrin')
```

```python
Path.home() / 'abc'
# PosixPath('/Users/mcurrin/abc')
```


## Path properties

```python
p = Path("abc/def")  # Or Path("./abc/def")

p
# PosixPath('abc/def')

p.name
# 'def'

p.parts
('abc', 'def')
```


## Check path properties

```python
p.exists()
# True | False

p.is_dir()
# True | False
```


## Resolve

This adds an absolute path to the current working directory to the path.

```python
p = Path("abc/def")

p.resolve()
# PosixPath('/Users/mcurrin/repos/testing/abc/def'
```


## Practical examples

From my projects.

### Absolute path to app directory

It is dangerous to just use `Path('.')` as that is the current working directory, not the directory of the script.

So use `Path(__file__)` rather.

Then `.resolve()` to make it absolute. This is useful when running the script from anywhere in or outside the repo and keeping paths relative to that app directory i.e. the top-level module inside the repo.

```
my_repo/
    my_app/          # App directory.
        my_app.py    # Current script
        constants.py
```

After research, I found this to be effective. It resolves relative and symlinks (I think?).

```python
APP_DIR = Path(__file__).resolve().parent
```

This should be set in the config or constants module, so it can be imported by other scripts.

```python
from constants import APP_DIR
```

### Path to var directory

For writing CSV or log files, for example.

```python
VAR_DIR = APP_DIR / "var"
APP_LOG_PATH = VAR_DIR / "app.log"
```
