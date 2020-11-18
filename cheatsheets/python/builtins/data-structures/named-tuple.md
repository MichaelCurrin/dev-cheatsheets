
# Named tuple
> Create tuples with named fields

Immutable, like a tuple.

See [namedtuple](https://docs.python.org/3/library/collections.html#collections.namedtuple) in the docs.

> factory function for creating tuple subclasses with named fields


## Example

```python
from collections import namedtuple

# Define a type.
Point = namedtuple('Point', ['x', 'y'])

# Instantiate using the type.
p = Point(11, y=22)

p
# => Point(x=11, y=22)
```

Access attributes with class-like attribute syntax.
```python
p.x
# => 111
```
