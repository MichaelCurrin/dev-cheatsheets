# Data class

See [Data class](https://docs.python.org/3/library/dataclasses.html) in PY3 docs.


## About

- Added in Python `3.7`.
- A container of attributes, when you want to store data and not add methods, but methods are allowed. 
- Allows attribute lookup like a class or named tuple. Also allows lookup as if a `dict`.
- Lighter than a plain class - no `__init__` method needed.
- Allows defaults.
- Raises an error if an attribute without a default is omitted.
- Has types and keeps the structure, unlike a `dict` - note that it does not validate automatically so see [Validation](#validation).
- Not frozen, but it can be frozen.

[namedtuple]: {% link cheatsheets/python/builtins/data-structures/named-tuple.md %}
[dict]: {% link cheatsheets/python/builtins/data-structures/dictionary.md %}


## Usage

### Define

- Add a decorator to a class.
- Add class-level attributes.
- Add methods if you need.

```python
from dataclasses import dataclass


@dataclass
class InventoryItem:
    """
    Class for keeping track of an item in inventory.
    """
    name: str
    unit_price: float
    quantity_on_hand: int = 0

    def total_cost(self) -> float:
        return self.unit_price * self.quantity_on_hand
```

Equivalent definition _without_ using a data class:

```python
class InventoryItem:
    """
    Class for keeping track of an item in inventory.
    """
    def __init__(self, name: str, unit_price: float, quantity_on_hand: int=0):
        self.name = name
        self.unit_price = unit_price
        self.quantity_on_hand = quantity_on_hand
```

Note that for `float` type, an input `int` will get converted to `float`.

### Use instance

```python
item = InventoryItem("Foo", 123.4)

item
# => InventoryItem(name='Foo', unit_price=123.4, quantity_on_hand=0)

item.name
# 'Foo'
```

```python
# Validation
item = InventoryItem()
# TypeError: __init__() missing 2 required positional arguments: 'name' and 'unit_price'
```

```python
item.__dict__
{'name': 'Foo', 'unit_price': 123.4, 'quantity_on_hand': 0}
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

By default you do **not** get an error for using the wrong type.

But, you can use Mypy to check types for you. Example from [Additional features](https://mypy.readthedocs.io/en/stable/additional_features.html) docs page.

```python
from dataclasses import dataclass, field


@dataclass
class Application:
    name: str
    plugins: List[str] = field(default_factory=list)


test = Application("Testing...") 
# OK

# Passing a string instead of list of strings:
bad = Application("Testing...", "with plugin")  
# Error: List[str] expected
```

Or you could use a separate package like [dataclass-type-validator](https://pypi.org/project/dataclass-type-validator/).
