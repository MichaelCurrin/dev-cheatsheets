---
title: Type checks
description: How to add type safety to Python
---

In Python 3.6, type-hints were added as allowed syntax which can optionally be checked with a tool like MyPy.


## Resources

- MyPy library 
    - [mypy-lang.org](https://mypy-lang.org/) homepage.
    - [MyPy Docs](https://mypy.readthedocs.io/en/stable/) page.
    - [Type hints cheat sheet (Python 3)](https://mypy.readthedocs.io/en/stable/cheat_sheet_py3.html) in the docs.
- [typing](https://docs.python.org/3/library/typing.html) - builtin module.
- Real Python
    - [Python Type Checking](https://realpython.com/python-type-checking/) tutorial.
    - [Type Hinting](https://realpython.com/lessons/type-hinting) lesson.


## Validation

Note that the Python interpreter will **not** validate the types for you.

However, you can **optionally** use a type checker like **MyPy**, which will run static type checks against all your code.

This is similar to running a linter. This can be done locally and ideally as part of your deploy flow.


## How to install and run

- Install MyPy.
    - Install redirectly.
        ```sh
        $ pip install mypy
        ```
    - Or install from requirements (make sure to add `mypy` to your file first).
        ```sh
        $ pip install -r requirements-dev.txt
        ```
- Run MyPy.
    - All.
        ```sh
        $ mypy .
        Success: no issues found in 4 source files
        ```
    - Targeted
        ```sh
        $ mypy my_app tests
        Success: no issues found in 4 source files
        ```



## Samples

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


## Benefits of type checking

MyPy can pick up things to alert on you, like:

- Check if a variable changes type unexpectedly. Like here:
    ```python
    x = 'hello'
    x =  2
    ```
- Making sure you don't pass a bad type e.g. pass `None` or `int` type when only `str` is allowed.
- Allow a range of types to be allowed (e.g. `None` or `int`)
- Validate types of data structures
- Create custom types to better represent concepts e.g. A `Coordinates` type which could be say a tuple of two `float` values. This makes the code easier to read especially for nested data structure. Note you don't have to pass in a class instance of `Coordinates`, you just need to pass in a tuple which matches the structure of the expected type.
