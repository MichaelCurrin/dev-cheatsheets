---
title: Pathlib
description: A built-in alternative to using `os.path`, since Python 3.4
---


## Resources

- [pathlib](https://docs.python.org/3/library/pathlib.html) in Python 3 docs.
- [pathlib intro](https://pbpython.com/pathlib-intro.html) on PBPython
- [Pathlib](https://realpython.com/python-pathlib/) on RealPython


## Set up

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

### Parent path

Directory of current script:

```python
my_dir = Path(__file__).parent
```

Navigate up the path tree for any number of levels.

```python
my_dir = Path(file_path).resolve().parent.parent.parent
# Or simply:
my_dir = Path(file_path).resolve().parents[3]
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
p.glob(PATH)

# e.g.

list(p.glob('*/*.py'))
list(p.glob('*/abc/*.py'))
```

Use recursive globe with `.rglob`.

```python
list(p.rglob('*.py'))
# equivalent to:
list(p.glob('**/*.py'))
```

### Opening a file

```python
with q.open() as f_in:
    text = f_in.readline()
```

## Path relative to current script

Get the path to the current script, the directory of the module, then add the path to that base.

```python
CSV_PATH = Path(__file__).parent / "var" / "my-data.csv"
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

Expand user directory.

```python
p = Path("~/abc")
p
# PosixPath('~/abc')
p.expanduser()
# PosixPath('/Users/my-user/abc')
```

## Path properties

```python
p = Path("abc/def.txt")

p
# PosixPath('abc/def.txt')

p.name
# 'def'

p.parts
('abc', 'def')

p.stem
# 'def'

p.suffix
# '.txt'
```


## Check path properties

```python
p.exists()
p.is_file()
p.is_dir()
p.is_symlink()
```


## Resolve

Resolve to an absolute path - it will resolve symlinks and eliminate ".." components.

```python
p.resolve()
```

This adds the _current working directory_ to the path object. e.g.

```python
p = Path("abc/def")

p.resolve()
# PosixPath('/Users/.../repos/testing/abc/def')
```

## Path joining

Combine `Path` objects or `Path` and `str`.

```python
Path("my_directory") / "another_dir" / "file.txt"
```

```python
p = Path('/etc')

q = p / 'init.d' / 'reboot'
# => PosixPath('/etc/init.d/reboot')

q.resolve()
# => PosixPath('/etc/rc.d/init.d/halt')
```

## Relative to

Computes the relative path from one path to another (i.e., “subtracts” a base path from a full path).

Useful for printing, to show only the end part for a few levels, without the base.

```python
path.relative_to(base_path)
```

Printing a path object will just be the file or foldername. And using resolve above will make it very long. So you can use this to specify a path that the object should be relative to.

## Directories

### Create with mkdir

e.g.

```python
folder_path.mkdir(parents=True, exist_ok=True)
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
