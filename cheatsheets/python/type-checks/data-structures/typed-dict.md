# Typed dict

A typed dictionary is useful for defining a type to represent a recurring object structure or an object with many fields. Then your functions can be lighter to define.


## Benefits 

A dictionary but with structure and types enforced to give you safety. 

So you can validate that a dictionary passed around meets the following:

- Object has all the fields it needs.
- There are no unexpected fields.
- Fields are of the correct type.
- Fields are only null when allowed to be.


## Syntax 

Here we define and used a `TypeDict` type. This is resuable, unlike a plain `Dict[TYPE, TYPE]` setup.

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


## Ways to use the type

Here specifically using a `Movie` type, defined as follows.

```python
Movie = TypedDict('Movie', {'name': str, 'year': int})
```

### Annotation

Here we annotate the type with comment explicitly.

```python
movie = {'name': 'Toy Story', 'year': 1995}  # type: Movie
```

### Constructor

Use it as a constructor. Similar to a class.

```python
movie = Movie(name='Toy Story', year=1995)
```

### Function parameter

```python
def foo(movie: Movie): -> None
    print(movie['name'])
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
