# Data class

See [Data class](https://docs.python.org/3/library/dataclasses.html) in PY3 docs.

- Added in Python `3.7`.
- A container of attributes, when you want to store data and not add methods, but methods are allowed. Similar to a `namedtuple` or `dict`.
- Lighter than a plain class - no `__init__` method needed.
- Raises an error if an item omitted.
- Allows defaults.
- Has types and keeps the structure, unlike a `dict` - **Note that does not validate**. See [Validation](#validation).
- Not frozen but it can be frozen.
- Lookup - allows attribute lookup and you can also lookup as a dict or tuple.


## Definition

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


## Usage

```python
item = InventoryItem("Foo", 123.4)

item
# => InventoryItem(name='Foo', unit_price=123.4, quantity_on_hand=0)
```


## Parameters

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

## Validation

You do **not** an error for using the wrong type.

But, you can use Mypy to check types for you. Example from [Additional features](https://mypy.readthedocs.io/en/stable/additional_features.html) docs page.

```python
from dataclasses import dataclass, field

@dataclass
class Application:
    name: str
    plugins: List[str] = field(default_factory=list)

test = Application("Testing...")  # OK
bad = Application("Testing...", "with plugin")  # Error: List[str] expected
```

Or you could use a separate package like [dataclass-type-validator](https://pypi.org/project/dataclass-type-validator/).
