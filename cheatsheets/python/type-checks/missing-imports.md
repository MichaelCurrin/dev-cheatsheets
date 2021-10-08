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

Here are ways to ignore untyped libraries.

See also `ignore_errors` option.


### Ignore line in file

```python
import foo  # type: ignore
```

### Ignore whole file

```python
# type: ignore

import foo
```

### Ignore by name in config

Note - if you get irregular behavior after you remove a config file, delete `.mypy_cache` and try again.

Ignore `foobar` imports. This is equivalent to adding `# type: ignore` to every import of `foobar`.

- `setup.cfg` - first heading is to ensure the section below it actually gets evaluated.
    ```cfg
    [mypy]
    
    [mypy-foobar.*]
    ignore_missing_imports = True
    ```

OR

- `mypy.ini` - first heading is to avoid a warning, but doesn't affect functionality at least in this case.
    ```ini
    [mypy]

    [mypy-foobar.*]
    ignore_missing_imports = True
    ```

### Ignore imports globally in config

Ignore all missing imports across libraries.

- `setup.cfg`
    ```cfg
    [mypy]
    ignore_missing_imports = True
    ```

### Ignore from CLI

```sh
$ mypy --ignore-missing-imports
```

See also Mypy issue [#10660](https://github.com/python/mypy/issues/10660).

