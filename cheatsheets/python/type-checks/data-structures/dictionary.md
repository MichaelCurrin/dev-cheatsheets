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


## Basic

Here we create a type using a dictionary.

```python
dict[KEY_TYPE, VALUE_TYPE]
```

From the Mypy [Examples](http://mypy-lang.org/examples.html) page:

```python
from typing import Dict

d = {}  # type: Dict[str, int]
```

Or, in newer Python:

```python
d = {}  # type: dict[str, int]
```

You could make an alias, for reuse:

```python
MyType = dict[str, int]

d = {}  # type: MyType
```

This should also work:

```python
d: dict[str, int] = {}
```


## Using TypedDict

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

The 3 approaches are:

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
