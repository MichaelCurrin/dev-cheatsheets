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

```python
from enum import Enum


class Color(Enum):
    RED = 1
    GREEN = 2
    BLUE = 3

Color.RED
#
```
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTE4NjMzMDAwOTYsMTk4NjIyMjIyMF19
-->