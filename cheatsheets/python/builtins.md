# Builtins

## Range

```python
range(10)
# => range(0, 10)
```

```python
list(range(10))
# => [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
```

Interval:

```python
range(1, 10, 2)
```

Descending:

```python
range(10, 1, -1)
```

Easy testing in the shell:

```sh
python -c 'print(list(range(1, 10, 2)))'
# => [1, 3, 5, 7, 9]
```


## Enum

- [Enum](https://docs.python.org/3/library/enum.html) in PY 3 docs.

> An enumeration is a set of symbolic names (members) bound to unique, constant values. Within an enumeration, the members can be compared by identity, and the enumeration itself can be iterated over.

> Having two enum members with the same name is invalid:


### Definition

```python
from enum import Enum


class Color(Enum):
    RED = 1
    GREEN = 2
    BLUE = 3
```


### Get item

```python
member = Color.RED
# OR
member = Color['RED']
```

```python
member.name
'RED'
member.value
1
```

### Auto enumerate

```python
from enum import Enum, auto


class Color(Enum):
    RED = auto()
    BLUE = auto()
    GREEN = auto()
```

```python
list(Color)
# => [<Color.RED: 1>, <Color.BLUE: 2>, <Color.GREEN: 3>]
```


## Data Class

- [Data class](https://docs.python.org/3/library/dataclasses.html) in PY3 docs.
- New in PY `3.7`.
- A container of attributes, when you want to store data and not add methods, but methods are allowed. Similar to a named tuple or dict.
- Lighter than a plain class - not `__init__` method needed.
- Raises an error if an item omitted.
- Allows defaults.
- Has types and keeps the structure, unlike a `dict` - **Note that does not validate**. See [Validation](#validation).
- Not frozen but it can be frozen.
- Lookup - allows attribute lookup and you can also lookup as a dict or tuple.


### Definition

```python
from dataclasses import dataclass


@dataclass
class InventoryItem:
    """Class for keeping track of an item in inventory."""
    name: str
    unit_price: float
    quantity_on_hand: int = 0

    def total_cost(self) -> float:
        return self.unit_price * self.quantity_on_hand
```

Equivalent definition without using data class:

```python
def __init__(self, name: str, unit_price: float, quantity_on_hand: int=0):
    self.name = name
    self.unit_price = unit_price
    self.quantity_on_hand = quantity_on_hand
```

Note that for `float` type, an input `int` will be converted to `float`.

### Usage

```python
item = InventoryItem("Foo", 123.4)

item
# => InventoryItem(name='Foo', unit_price=123.4, quantity_on_hand=0)
```

### Parameters

Signature:

```python
@dataclasses.dataclass(*, init=True, repr=True, eq=True, order=False, unsafe_hash=False, frozen=False)
```

See [definitions](https://docs.python.org/3/library/dataclasses.html#module-level-decorators-classes-and-functions).

Example:

```python
@dataclass(frozen=True)


@dataclass(init=True, repr=True, eq=True, order=False, unsafe_hash=False, frozen=False)
```

### Validation

You do not an error for using the wrong type.

You can use [MyPY's additional features](https://mypy.readthedocs.io/en/stable/additional_features.html):

```python
from dataclasses import dataclass, field

@dataclass
class Application:
    name: str
    plugins: List[str] = field(default_factory=list)

test = Application("Testing...")  # OK
bad = Application("Testing...", "with plugin")  # Error: List[str] expected
```

 You have to use something like this [dataclass-type-validator](https://pypi.org/project/dataclass-type-validator/). Or perhaps MyP
