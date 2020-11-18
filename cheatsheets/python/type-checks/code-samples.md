# Code samples

Valid the input and output types on a function.

```python
def greeting(name: str, count: int) -> str:
    return f"Hello {name} - your count is {count}"
```

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

You can specify a type on a variable, but this is optional. Also you can get the type checking benefit without adding it yourself, if the type can be inferred.

```python
# With type. This doesn't add much.
x: int = 1
# Without type specified. This will be inferred as int.
y = 2

# Initialize with type but no value. This will be the null value e.g. `0`.
z: int

# Example of initializing a null value.
child: bool
if age < 18:
    child = True
else:
    child = False
```


## Typed dictionary

From [TypedDict](https://mypy.readthedocs.io/en/stable/more_types.html#typeddict) section of Mypy docs.

```python
from typing_extensions import TypedDict
```

Define a type.

```python
Movie = TypedDict('Movie', {'name': str, 'year': int})
```

Use the type - you must add the comment explicitly.

```python
movie = {'name': 'Blade Runner', 'year': 1982}  # type: Movie
```

Use it as a constructor.

```python
toy_story = Movie(name='Toy Story', year=1995)
```

Mypy will detect an invalid key as an error:

```python
director = movie['director']  # Error: 'director' is not a valid key
```
