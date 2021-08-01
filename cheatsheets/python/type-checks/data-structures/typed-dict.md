# Typed dict

A typed dictionary is useful for defining a type to represent a recurring object structure or an object with many fields. Then your functions can be lighter to define.


## Syntax

Here using a single key with type as string.

```python
MyType = TypedDict(
    'MyType', 
    {
        'my_key': str, 
    }
)
```


## Example

Define and use a `Python` type.

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
