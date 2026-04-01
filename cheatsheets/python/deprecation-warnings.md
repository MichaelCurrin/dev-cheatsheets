# Deprecation warnings as errors

Read more in [Warnings](https://docs.python.org/3/library/warnings.html) in the Python docs.

## Env variable appraoch

```sh
export PYTHONWARNINGS="error::DeprecationWarning"
```


## CLI flag approach

Set `-W error::DeprecationWarning`

e.g.

```sh
pytest -s src/tests -W error::DeprecationWarning
```

```sh
python src/manage.py runserver 0.0.0.0:8000 -W error::DeprecationWarning
```
