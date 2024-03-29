# Representing objects

Rather than just getting the string-formatted version of an object, you can get the string reprentation.

The latter means `None` will appear as `None` and not an empty string, and that strings have quotes around them.


## Calling methods

Printing a string and using `repr`.

```python
>>> print('abc')
abc
>>> print(repr('abc'))
'abc'
```

Printing using f-stirngs and `!r`.

```python
x = None

f"My value is {x!r}"
# 'My value is None'

x = ''
"My value is ''"
```

Printing using `.format` and `!r`.

```python
>>> print('{}'.format('abc'))
abc
>>> print('{!r}'.format('abc'))
'abc'
```

Without using print, the value is quoted.

```python
>>> '{}'.format('abc')
'abc'
>>> '{!r}'.format('abc')
"'abc'"
```

The `repr` function gives out which can be used to create a new object. So a string must be quoted.

```python
>>> print(repr('abc'))
'abc'
>>> print(repr(123))
123
>>> print(repr(True))
True
```


## Defining repr on a class

When making a class, it can be useful to override the built-in  methods:

- `__str__` - string formatted
- `__repr__` - string representation

For classes, the `__repr__` might be set to exactly match the contents so a new instance be created, or it might be a summary. But it won't be set by default.

From [Python String Conversion 101: Why Every Class Needs a “repr”](https://dbader.org/blog/python-repr-vs-str) article.

```python
class Foo:
    def __init__(self, color, mileage):
        self.color = color
        self.mileage = mileage

    def __repr__(self):
       return (f'{self.__class__.__name__}('
               f'{self.color!r}, {self.mileage!r})')

    def __str__(self):
        return f'a {self.color} foo'
```
