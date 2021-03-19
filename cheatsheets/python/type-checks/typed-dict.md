# Typed dictionary

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

Define a type.

```python
Movie = TypedDict('Movie', {'name': str, 'year': int})
```

### Approaches to using the type

#### Annotation

Here we annotate the type with comment explicitly.

```python
movie = {'name': 'Toy Story', 'year': 1995}  # type: Movie
```

#### Constructor

Use it as a constructor. Similar to a class.

```python
movie = Movie(name='Toy Story', year=1995)
```


## Errors

When you use a typed dictionary, Mypy can detect an invalid key or value type and give an error:

```python
director = movie['director']
# Error: 'director' is not a valid key
```
