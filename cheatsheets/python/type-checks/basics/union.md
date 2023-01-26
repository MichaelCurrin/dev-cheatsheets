# Union

Use Union to allow a variable to be one of given types.

## Python 3.10

```python
TYPE | TYPE | TYPE

# e.g.
float | int | str
```

## Python 3.8

```python
Union[TYPE, TYPE, ...]

# e.g.
float | int | str
```


## Example

Here we allow return value as integer or string.

```python
def bar(bazz: bool) -> int | str:
    if bazz:
        return 'Yes'

    return 12
```

