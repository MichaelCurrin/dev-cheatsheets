# Missing imports


See [Missing imports](https://mypy.readthedocs.io/en/stable/running_mypy.html#missing-imports) in the docs.


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

### Bad

This code is also valid to run.

```python
import foo


foo.greet()
```

But since it not clearly local, Mypy will think it is external (installed) and complain that it can't be found.

> error: Cannot find implementation or library stub for module named "foo"


## Ignore

There are multiple ways to ignore untyped libraries.


## Ignore by name in config

- `setup.cfg` - ignore `foobar` imports.
    ```toml
    [mypy-foobar.*]
    ignore_missing_imports = true
    ```

## Ignore all in config

- `setup.cfg`
    ```toml
    [mypy-]
    ignore_missing_imports = true
    ```

### Ignore line in file

```python
import foo  # type: ignore
```
