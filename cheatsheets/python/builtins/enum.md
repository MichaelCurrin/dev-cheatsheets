
# Enum

- [Enum](https://docs.python.org/3/library/enum.html) in PY 3 docs.

> An enumeration is a set of symbolic names (members) bound to unique, constant values. Within an enumeration, the members can be compared by identity, and the enumeration itself can be iterated over.

> Having two enum members with the same name is invalid:


## Definition

```python
from enum import Enum


class Color(Enum):
    RED = 1
    GREEN = 2
    BLUE = 3
```


## Get item

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


## Auto enumerate

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
