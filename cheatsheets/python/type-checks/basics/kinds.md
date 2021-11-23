# Kinds of types

See [Kinds of types](https://mypy.readthedocs.io/en/latest/kinds_of_types.html) in the docs.

Based on [Type hints cheat sheet (Python 3)](https://mypy.readthedocs.io/en/stable/cheat_sheet_py3.html).

Note from Python 3.9, you can use `dict` and `list` instead of `Dict` and `List`, avoiding imports.


## Built-in types

```python
x: int = 1
x: float = 1.0
x: bool = True
x: str = "test"
x: bytes = b"test"
```

```python
x: List[int] = [1]
x: Set[int] = {6, 7}

x = [1]  # type: List[int]
```

A dictionary.

```python
x: Dict[str, float] = {
    'field': 2.0
}
```

See also the Typed Dictionary section.

Fixed size `tuple`. More details in Tuple section below.

```python
x: Tuple[int, str, float] = (3, "yes", 7.5)
```

For a variable size `tuple` - use ellipsis.

```python
x: Tuple[int, ...] = (1, 2, 3)
```

Allow a value to be `None`. More details in Optional section below.

```python
x: Optional[str] = some_function()
```

Mypy understands a value can't be `None` in used an if-statement.

```python
if x is not None:
    print(x.upper())
```

If a value can never be `None` due to some invariants, use an `assert`.

```python
assert x is not None
print(x.upper())
```
