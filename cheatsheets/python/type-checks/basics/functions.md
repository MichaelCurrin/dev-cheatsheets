# Functions with types

Validate the input and output types on a function.

```python
def greeting(name: str, count: int) -> str:
    return f"Hello {name} - your count is {count}"
```

Python 3.9:

```python
def greet_all(names: list[str]) -> str:
    return f"Hello, {','.join(names)}"
```

Python 3.8:

```python
from typing import List

def greet_all(names: List[str]) -> str:
    return f"Hello, {','.join(names)}"
```

Create a new reusable type called `Vector`, to make your code more expressive.

```python
from typing import List

Vector = List[float]

def scale(scalar: float, vector: Vector) -> Vector:
    return [scalar * num for num in vector]

new_vector = scale(2.0, [1.0, -4.2, 5.4])
```

If you leave out the types on the function, they just won't be checked.
