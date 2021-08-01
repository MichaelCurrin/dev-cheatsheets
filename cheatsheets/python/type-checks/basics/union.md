# Union

Use Union to allow a variable to be one of given types.

Python 3.10:

```
TYPE | TYPE | TYPE
# e.g.
float | int | str
```

Python 3.8:

```
Union[TYPE, TYPE, ...]
# e.g.
float | int | str
```

Here we allow an integer or string.

```python
def bar(bazz: bool) -> int | str:
    if bazz:
        return 'Yes'

    return 12
```

