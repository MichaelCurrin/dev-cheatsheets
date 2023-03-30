
# Enum

- [Enum](https://docs.python.org/3/library/enum.html) in PY 3 docs.

> An enumeration is a set of symbolic names (members) bound to unique, constant values. Within an enumeration, the members can be compared by identity, and the enumeration itself can be iterated over.

> Having two enum members with the same name is invalid:


## Definition

### Explicit 

```python
from enum import Enum


class Color(Enum):
    RED = 1
    GREEN = 2
    BLUE = 3
```

### Auto enumerate

```python
from enum import Enum, auto


class Color(Enum):
    RED = auto()
    BLUE = auto()
    GREEN = auto()
```

These wil use 1, 2, etc.

```python
list(Color)
# => [<Color.RED: 1>, <Color.BLUE: 2>, <Color.GREEN: 3>]
```

### String values

```python
class Color(Enum):
    RED = "RED"
    BLUE = "BLUE"
    GREEN = "GREEN"
    
Color.RED
# <Color.RED: 'RED'>
```



## Get item

```python
member = Color.RED
# OR
member = Color['RED']
```

For the integer example:

```python
member.name
'RED'
member.value
1
```

