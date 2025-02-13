# Ignore

Ways to ignore untyped libraries or when you want to ignore your own modules.

See also `ignore_errors` option.


## Ignore line in file

```python
import foo  # type: ignore
```

## Ignore whole file

```python
# type: ignore

import foo
```

## Ignore by name in config

Note - if you get irregular behavior after you remove a config file, delete `.mypy_cache` and try again.

See [Config file](https://mypy.readthedocs.io/en/stable/config_file.html) notes in the docs for referencing modules and for what rules you can add.

Ignore `foobar` imports. This is equivalent to adding `# type: ignore` to every import of `foobar`.

- `setup.cfg` - first heading is to ensure the section below it actually gets evaluated.
    ```ini
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
    
    
e.g. There is `types-Flask` for `Flask` but no types for `Flask-RESTful`.

So you can do this:

```ini
[mypy]

[mypy-flask_restful.*]
ignore_missing_imports = True
```


## Ignore imports globally in config

Ignore all missing imports across libraries.

- `setup.cfg` or `mypy.ini`.
    ```ini
    [mypy]
    ignore_missing_imports = True
    ```

## Ignore from CLI

```sh
$ mypy --ignore-missing-imports
```

See also Mypy issue [#10660](https://github.com/python/mypy/issues/10660).
