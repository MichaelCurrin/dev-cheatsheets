# Basics


## Functions with types

Validate the input and output types on a function.

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


## Variables with types

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


## Kinds of types

See [Kinds of types](https://mypy.readthedocs.io/en/latest/kinds_of_types.html) in the docs.

Based on [Type hints cheat sheet (Python 3)](https://mypy.readthedocs.io/en/stable/cheat_sheet_py3.html).

Note from Python 3.9, you can use `dict` and `list` instead of `Dict` and `List`, avoiding imports.

### Built-in types

```python
x: int = 1
x: float = 1.0
x: bool = True
x: str = "test"
x: bytes = b"test"
```

```python
x: List[int] = [1]
x: Set[int] = {6, 7}

x = [1]  # type: List[int]
```

A dictionary.

```python
x: Dict[str, float] = {
    'field': 2.0
}
```

See also the Typed Dictionary section.

Fixed size `tuple`. More details in Tuple section below.

```python
x: Tuple[int, str, float] = (3, "yes", 7.5)
```

For a variable size `tuple` - use ellipsis.

```python
x: Tuple[int, ...] = (1, 2, 3)
```

Allow a value to be `None`. More details in Optional section below.

```python
x: Optional[str] = some_function()
```

Mypy understands a value can't be `None` in used an if-statement.

```python
if x is not None:
    print(x.upper())
```

If a value can never be `None` due to some invariants, use an `assert`.

```python
assert x is not None
print(x.upper())
```


## Tuple

```python
Tuple[TYPE, TYPE, ...]
```

e.g.

```python
from typing import Tuple


def foo() -> Tuple[bool, str]:
    return True, 'Yes'
```


## Multiple types 

Use Union to allow a variable to be one of given types.

```
Union[TYPE, TYPE, ...]
```

Here we allow an integer or string.

```python
def bar(bazz: bool) -> Union[int, str]:
    if bazz:
        return 'Yes'

    return 12
```

Tip: From Python 3.10 you can use a pipe like:

```python
int | str
```


## Optional values

Allow a variable to be `None`.

```
Optional[TYPE]
```

Declare a type for a variable. This was recommended by the docs.

```python
foo: Optional[str] = None

foo = 'abc'
```

Here we return a string or `None`. The second case shows a necessary annotation. Note you must declare the time on the first declariation from top to bottom - not the 2nd and not both.

```python
def foo() -> Optional[str]:
    pass


def bar(bazz: bool) -> Optional[str]:
    if bazz:
        buzz: Optional[str] = 'Yes'
    else:
        buzz = None
    
    return buzz
```

You may can an error from Pylint:

```
E1136: Value 'Optional' is unsubscriptable (unsubscriptable-object)
```

You can use use `Union` instead. But then you have to use it twice.

```python
def bar(bazz: bool) -> Union[str, None]:
    if bazz:
        buzz: Union[str, None] = 'Yes'
    else:
        buzz = None
    return buzz
```

Or you have to use `Optional` like this.

```python
def bar(bazz: bool) -> Union[str, None]:
    if bazz:
        buzz: Optional[str] = 'Yes'
    else:
        buzz = None
    return buzz
```

Unless you use a `return` sooner and so don't define `buzz`.
 
