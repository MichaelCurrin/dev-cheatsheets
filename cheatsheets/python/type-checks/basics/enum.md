---
title: Enum
description: Check if a value is in an allowed list
---

See [Literal types](https://mypy.readthedocs.io/en/stable/literal_types.html) in the docs.

Use `Literal` or `Final` for a single value.

```python
a: Final = 19
b: Literal[19] = 19
```

Use the `Literal` type for possible values.

```python
Colors = Literal["red", "blue", "yellow"]
```

Example from the docs:

```python
PrimaryColors = Literal["red", "blue", "yellow"]
SecondaryColors = Literal["purple", "green", "orange"]
AllowedColors = Literal[PrimaryColors, SecondaryColors]

def paint(color: AllowedColors) -> None:
    pass

paint("red")        # Valid
paint("turquoise")  # Invalid
```
