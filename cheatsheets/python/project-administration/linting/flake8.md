# Flake8

## Disable

Disable for entire file:

```python
# flake8: noqa
```

Disable inline - all rules

```
foo() # noqa
```

Disable inline - comma-separated codes.

```
foo() # noqa: E234
```

Example config:

- `.flake8`
    ```ini
    [flake8]
    max-line-length = 88
    ignore = E501, E203, W503
    per-file-ignores = __init__.py:F401
    exclude =
        .git
        __pycache__
        setup.py
        build
        .venv
        .vscode
        .github
        foo/utils/_compat.py
        tests/fixtures/
        tests/repositories/fixtures/
        tests/utils/fixtures/
    ```
