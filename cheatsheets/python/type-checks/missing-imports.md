# Missing imports


See [Missing imports](https://mypy.readthedocs.io/en/stable/running_mypy.html#missing-imports) in the docs.

There are multiple ways to ignore untyped libraries.


## Ignore

## Ignore by name in config

- `setup.cfg` - ignore `foobar` imports.
    ```toml
    [mypy-foobar.*]
    ignore_missing_imports = True
    ```

## Ignore all in config

- `setup.cfg`
    ```toml
    [mypy-]
    ignore_missing_imports = True
    ```

### Ignore line in file

```python
import foo  # type: ignore
```
