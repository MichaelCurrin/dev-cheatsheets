---
title: sys
description: Using the builtin `sys` module
---

[PY 3 docs](https://docs.python.org/3/library/sys.html)

## Path

### View

```
sys.path
```

> A **list** of strings that specifies the search path for modules. Initialized from the **environment** variable `PYTHONPATH`, plus an installation-dependent default.
> 
> As initialized upon program startup, the **first** item of this list, `path[0]`, is the directory containing the script that was used to invoke the Python interpreter.
> 
> If the script directory is **not** available (e.g. if the interpreter is invoked interactively or if the script is read from standard input), `path[0]` is the **empty string**, which directs Python to search modules in the **current directory** first. Notice that the script directory is inserted before the entries inserted as a result of `PYTHONPATH`.

### Modify

```python
sys.path.insert(0, path)
```


Allow imports to be done when executing this file directly with `python foo/script.py` or `python ~/repo-name/foo/script.py`. This will get the absolute path to current directory of the script, regardless of where running the script from.

```python
import os
import sys
sys.path.insert(0, os.path.abspath(os.path.dirname(__file__))
```

If you need to go up further, use `.pardir`.

```python
import os
import sys
sys.path.insert(0, os.path.abspath(os.path.join(
    os.path.dirname(__file__), os.path.pardir, os.path.pardir)
))
```
