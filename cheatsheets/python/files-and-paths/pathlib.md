---
title: Pathlib
---


## Resources

- [pathlib](https://docs.python.org/3/library/pathlib.html) in Python 3 docs.
- [pathlib intro](https://pbpython.com/pathlib-intro.html) on PBPython
- [Pathlib](https://realpython.com/python-pathlib/) on RealPython


## Import

```python
from pathlib import Path
```

## List subdirectories

```python
p = Path('.')
[x for x in p.iterdir() if x.is_dir()]
```

## Glob


```python
list(p.glob('**/*.py'))
```

## Navigating

```python
p = Path('/etc')
q = p / 'init.d' / 'reboot'
# => PosixPath('/etc/init.d/reboot')
q.resolve()
# => PosixPath('/etc/rc.d/init.d/halt')
```

## Querying path properties:

```python
q.exists()

q.is_dir()
```

## Opening a file

```python
with q.open() as f_in:
    text = f_in.readline()
```
