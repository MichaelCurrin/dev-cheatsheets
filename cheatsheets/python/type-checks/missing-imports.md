---
title: Missing imports

description: What to do when Mypy gives an error that it cannot find types for imports
---


See [Missing imports](https://mypy.readthedocs.io/en/stable/running_mypy.html#missing-imports) in the docs.

## Related

- [Install types][] cheatsheet

[Install types]: {{ site.baseurl }}{% link cheatsheets/python/type-checks/install-types.md %}


## Refactor imports

### Good

Be explicit that a module is local.

```python
from . import foo


foo.greet()
```

To import an object directly:

```python
from .foo import greet
```

Unfortunately, any dot imports will break unless you use this approach for your CLI:

```sh
$ python -m my_app.my_module
```

### Bad

This code is also valid to run.

```python
import foo


foo.greet()
```

But since it not clearly local, Mypy will think it is external (installed) and complain that it can't be found.

> error: Cannot find implementation or library stub for module named "foo"

You would run that as:

```sh
$ cd my_app
$ python my_module.py
```


## Ignore

If you can't find types for a library updating coding or installing packages, you can silence the Mypy errors.


[Ignore]: {{ site.baseurl }}{% link cheatsheets/python/type-checks/ignore.md %}

