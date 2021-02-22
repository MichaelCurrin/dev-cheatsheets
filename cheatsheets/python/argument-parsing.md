# Argument parsing


## Basic

Without using a library.

```python
if len(sys.argv) != 2:
    sys.stderr.write(f"Usage: {__file__} DIRECTORY\n")
    sys.exit(1)
```

The snippet I used setup the dynamic value as `sys.argv[0]. The value of that will be like script name if running standalone as an install package. But if running as `python app.py`, it will be `python`.

I used `__file__` above - so you'll have `app.py`. Or the full path.


## Argparse

- [Argparse Tutorial](https://docs.python.org/3/howto/argparse.html) in PY3 docs.
- [argparse](https://docs.python.org/3/library/argparse.html) module in the docs.
