# Classes

## Check variable is a subclass of a class

### Example with class instance

Based on [Tutorial](https://mypy.readthedocs.io/en/stable/common_issues.html#declaring-a-supertype-as-variable-type)

```python
class Shape:
    pass


class Circle(Shape):
    pass


class Triangle(Shape):
    pass



# mypy infers the type of shape to be Circle.
shape = Circle()
# Then gives an error here.
shape = Triangle()

# mypy infers the type of shape to be Shape because we anntate.
shape_2: Shape = Circle()
# And no error here because Triangle is a subclass of Shape.
shape_2 = Triangle()
```

### Example with function parameters

```python
class Shape:
    pass


class Circle(Shape):
    pass


class Dog:
    pass


def my_function(x: Shape):
    pass


# Circle is a subclass of Shape so no error.
circle = Circle()
my_function(circle)
# Success: no issues found in 1 source file

dog = Dog()
my_function(dog)
# error: Argument 1 to "my_function" has incompatible type "Dog"; expected "Shape"  [arg-type]
```

If you want to pass a class like `Circle` rather than an instance like `Circle()`, you can do this.

```python
from typing import Type


class Shape:
    pass


class Circle(Shape):
    pass


class Dog:
    pass

def my_function_accepts_type(x: Type[Shape]):
    pass


my_function_accepts_type(Circle)
# No error

my_function_accepts_type(Dog)
# error: Argument 1 to "my_function_accepts_type" has incompatible type "type[Dog]"; expected "type[Shape]"
```
