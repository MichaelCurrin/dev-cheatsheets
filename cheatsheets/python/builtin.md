# Builtin

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


[Enum](https://docs.python.org/3/library/enum.html) in PY 3 docs.

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
# [<Color.RED: 1>, <Color.BLUE: 2>, <Color.GREEN: 3>]
```

## Data class

A container of info that is lighter than plain class and 

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
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTMzNzYxOTMwNSwxOTg2MjIyMjIwXX0=
-->