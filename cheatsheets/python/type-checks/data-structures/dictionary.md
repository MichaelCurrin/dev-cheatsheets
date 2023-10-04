# Dictionary

In this cheatsheet, we use a dictionary with types assigned for the keys and the values.

A typed dictionary is useful for defining a type to represent a recurring object structure or an object with many fields. Then your functions can be lighter to define.


## Benefits 

A dictionary, but with structure and types enforced to give you safety. 

So you can validate that a dictionary passed around meets the following:

- Object has all the fields it needs.
- There are no unexpected fields.
- Fields are of the correct type.
- Fields are only null when allowed to be.


## Using plain Dict

Here we create a type using a dictionary.

```python
dict[KEY_TYPE, VALUE_TYPE]
```

### Type comment

From the Mypy [Examples](http://mypy-lang.org/examples.html) page. 

_I've only see this comment approach used for a dictionary, I don't know why it is used here and not so much for others, but it seems like the preferred style._

```python
from typing import Dict

d = {}  # type: Dict[str, int]
```

Or, in newer Python without the import:

```python
d = {}  # type: dict[str, int]
```

You could make an alias, for reuse:

```python
MyType = dict[str, int]

d = {}  # type: MyType
```

### Type annotation

Based on [Check dict items](https://mypy.readthedocs.io/en/stable/error_code_list.html#check-dict-items-dict-item).

You can add the type like for other data types.

```python
d: dict[str, int] = {}
```

Or

```python
d: MyType = {}
```


## Use TypedDict

Here we define and use the `TypeDict` type. 

Example from [TypedDict](https://mypy.readthedocs.io/en/stable/more_types.html#typeddict) section of Mypy docs.

### Define

```python
from typing_extensions import TypedDict
```

A generic example, using a single field with type of string.

```python
MyType = TypedDict(
    'MyType', 
    {
        'my_key': str, 
    }
)
```

### Ways to use the type

Here are using a `Movie` type, defined as follows:

```python
Movie = TypedDict('Movie', {'name': str, 'year': int})
```

The 4 approaches are:

#### Annotation

Annotate the type with comment explicitly.

```python
movie = {'name': 'Toy Story', 'year': 1995}  # type: Movie
```

#### Constructor

Use the type as a constructor. Similar to a class.

```python
movie = Movie(name='Toy Story', year=1995)
```

#### Function parameter

```python
def foo(movie: Movie) -> None:
    name = movie['name']
    print(name)
```

### Class inheritance

```python
from typing_extensions import TypedDict


class Point(TypedDict):
    x: int
    y: int


p: Point = {'x': 1, 'y': 4}

# Error: Incompatible types (expression has type "float",
#        TypedDict item "x" has type "int")
p: Point = {'x': 1.2, 'y': 4}
```

From [Check TypedDict items](https://mypy.readthedocs.io/en/stable/error_code_list.html#check-dict-items-dict-item).

### Nesting objects

Example based on asking Rix AI for help.

Note that we define as class and use that to either annonate a `dict` or create a class instance, for the same results.

We validate here that an object has the value types as defined in `Fruit`, and that the value for the `taste` key follows `dict` insdie that matching the structure of `FruitTaste`.

```python
from typing import TypedDict


class Fruit(TypedDict):
    name: str
    color: str 
    taste: 'FruitTaste'
    id: int

class FruitTaste(TypedDict):
    sweetness: int
    sourness: int

apple = Fruit({
    "name": "Apple", 
    "color": "red",
    "taste": {
        "sweetness": 8,
        "sourness": 2,
    },
    "id": 1
})

# This format also works the same for running or checking types.

orange: Fruit = {
    "name": "Orange",
    "color": "orange", 
    "taste": {
        "sweetness": 6,
        "sourness": 4,
    },
    "id": 2  
})
```


## Errors

When you use a typed dictionary, Mypy can detect an invalid key or value type and give an error:

```python
director = movie['director']
# Error: 'director' is not a valid key
```


## Example

Here we define a `Person` type and use it in two functions.

```python
from typing_extensions import TypedDict


Person = TypedDict(
    'Person', 
    {
        'name': str, 
        'age': int, 
        'height': Optional[float]
    }
)


def foo(person: Person) -> None:
    print(person['name'])
    print(person['age'] >= 18)
    print(person['height'])


def greet(person: Person) -> None:
    print(f"Hello, {person['name']}")
```
