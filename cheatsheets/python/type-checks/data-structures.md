---
title: Data structures
description: How to choose a type approach for your data structure 
---

## Approaches 

### Parameters

For some cases you might be okay without a naming a structure as a type and go for a simpler approach of just using a function expecting 2 or 3 named parameters with types.

```python
def foo(name: str, age: int, height: float): -> None
    print(name)
    print(age >= 18)
    print(height)
```


### Typed dict

A typed dictionary is useful for defining a type to represent a recurring object structure or an object with many fields. Then your functions can be lighter to define.

```python
from typing_extensions import TypedDict

Person = TypedDict(
    'Person', 
    {
        'name': str, 
        'age': int, 
        'height': float
    }
)


def foo(person: Person): -> None
    print(person['name'])
    print(person['age'] >= 18)
    print(person['height'])


def greet(person: Person): -> None
    print(f"Hello, {person['name']}")
```


### Class

You could use a class with type annotations. 

```python 

```

But don't go for a class just for the sake of it. 

If all you need is a container of data, no inheritance, and you could write your methods as standalone functions, then go for a typed dictionary instead of a typed class.

That is the Functional Programming way - to pass around data between functions. And now, thanks to type safety, you can validate only allowed object structures are passed to a function - no unexpected types or missing keys anymore. Actually, FP languages like Haskell enforce the type statically and don't even have classes.

In Python previously, without types, validating a dictionary yourself would be cumbersome. With conditional and additional unit tests. And so you might have resorted to methods on a class which expect values to be set on an instance because of the class's init method. Even though it wasn't a good fit.

