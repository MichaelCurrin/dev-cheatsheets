---
description: New builtin alternative to `os.path`
---
# Pathlib



## Resources

- [pathlib](https://docs.python.org/3/library/pathlib.html) in Python 3 docs.
- [pathlib intro](https://pbpython.com/pathlib-intro.html) on PBPython
- [Pathlib](https://realpython.com/python-pathlib/) on RealPython


## Basics

### Import

```python
from pathlib import Path
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

### Querying path properties:

```python
q.exists()

q.is_dir()
```

### Opening a file

```python
with q.open() as f_in:
    text = f_in.readline()
```

## Real projects

### Absolute path to app directory

If it dangerous to just use `Path('.')` as that is the current working directory, not the directory of the script.

The approach is useful when running the script from anywhere in or outside the repo and keeping paths relative to that app directory i.e. the top-level module inside the repo.

```
my_repo/
    my_app/
        my_app.py
        constants.py
```

After research, I found this to be effective. It resolves relative and symlinks (I think?) and the directory will get parent directory.

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
