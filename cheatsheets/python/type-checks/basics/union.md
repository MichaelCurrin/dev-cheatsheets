# Union

Use Union to allow a variable to be one of given types or values.

## Python 3.10

```python
TYPE | TYPE | TYPE

# e.g.
float | int | str

# e.g.
"ABC" | "DEF" | "XYZ"
```



## Python 3.8

```python
Union[TYPE, TYPE, ...]

# e.g.
Union[float, int, str]

# e.g.
Union["ABC", "DEF", "XYZ"]
```


## Example

Here we allow return value as integer or string.

```python
def bar(bazz: bool) -> int | str:
    if bazz:
        return 'Yes'

    return 12
```

Allow a value to be one of three values.

```python
from typing import Union

MyType = Union["ABC", "DEF", "XYZ"]

# This would be valid
foo: MyType = "ABC"
foo = "DEF"

# This would cause a type error
foo = "GHI"
```

