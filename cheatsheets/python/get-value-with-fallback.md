---
title: Get value with fallback
description: Get a value from a data structure even if the key/attribute is not present
---

The "safe" approaches below handle errors internally so you don't have to check.

## Dictionary

```python
y = {'a': 123}
```

Unsafe:

```python
y['a']
# 123

y['b']
# KeyError: 'b'
```

Safe:

```python
y.get('a', 'my default')
# 123

# Not lack of a 2nd parameter as a default does not cause an error, as `None` is used.
y.get('b')
# None

y.get('b', 'my default')
# 'my default'
```

## Get attribute of a class

```python
class MyClass:
    a = 123
    
my_object = MyClass()
```

Unsafe:

```python
my_object.a
# 123

my.object.b
# AttributeError: 'MyClass' object has no attribute 'b'

# Note lack of 3rd parameter as default will actually cause an error.
getattr(my_object, 'b')
# AttributeError: 'MyClass' object has no attribute 'b'
```

Safe:

```python
getattr(my_object, 'a', 'my default')
# 123

getattr(my_object, 'b', 'my default')
# 'my default'
```

