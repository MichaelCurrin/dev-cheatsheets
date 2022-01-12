# Functions with types

Validate the input and output types on a function.

```python
def FUNCTION(VAR: TYPE, VAR2: TYPE, VAR3: TYPE = DEFAULT) -> RETURN_TYPE:
    EXPRESSION
```

e.g.

```python
def greeting(name: str, count: int) -> str:
    return f"Hello {name} - your count is {count}"
```


## Default values

If you have a default value, you can set the type too:

```python
def greet(v: int = 123):
    print(v)


greet(456)

greet("456")
# Argument 1 to "greet" has incompatible type "str"; expected "int"
```

### Warning

If you _omit_ the type, then Mypy will _not_ infer it.

```python
def greet(v=123):
    print(v)


greet(456)

greet("456")
# No error raised unfortunately.
```


## Data structures

Python 3.9 - `list`, `tuple`, `dict`, etc.

```python
def greet_all(names: list[str]) -> str:
    msg = ','.join(names)
    
    return f"Hello, {msg}"
```

Python 3.8 - `list`, `Tuple`, `Dict`, etc.

```python
from typing import List


def greet_all(names: List[str]) -> str:
    msg = ','.join(names)
    
    return f"Hello, {msg}"
```


## Custom type

Create a new reusable type called `Vector`, to make your code more expressive.

```python
from typing import List

Vector = List[float]


def scale(scalar: float, vector: Vector) -> Vector:
    return [scalar * num for num in vector]

new_vector = scale(2.0, [1.0, -4.2, 5.4])
```

If you leave out the types on the function, they just won't be checked.
