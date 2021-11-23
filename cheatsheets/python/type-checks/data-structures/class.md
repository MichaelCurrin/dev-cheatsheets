# Class

See [Class basics](https://mypy.readthedocs.io/en/stable/class_basics.html) in the docs.

You could use a class with type annotations in the constructor.

```python 
class Person:

    def __init__(self, name: str, age: int, height: Optional[float]) -> None:
        self.name = name
        self.age = age
        self.height = height


person = Person("Michael", 31, 1.83)
person.name = "Bob"
person.weight = 70 
# Error: 'Person' has no attribute 'weight'
```

But don't go for a class just for the sake of it. 

If all you need is a container of data, no inheritance, and you could write your methods as standalone functions, then go for a typed dictionary instead of a typed class.

That is the Functional Programming way - to pass around data between functions. And now, thanks to type safety, you can validate only allowed object structures are passed to a function - no unexpected types or missing keys anymore. Actually, FP languages like Haskell enforce the type statically and don't even have classes.

In Python previously, without types, validating a dictionary yourself would be cumbersome. With conditional and additional unit tests. And so you might have resorted to methods on a class which expect values to be set on an instance because of the class's init method. Even though it wasn't a good fit.
