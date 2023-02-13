# Delete

## Delete any object

```python
del(my_object)
```


## Remove object from list

```python
x = [1, 2, 3]

del(x[1])
x
# [1, 3]
```

Or 

```python
x = [1, 2, 3]

x.pop(1)
# 2
x
# [1, 3]
```


## Remove key from dictionary

```python
x = {'my_key': 123}
x['my_key']
# 123

del(x['my_key'])
```

## Delete attribute from class instance

Delete an attribute on an object instance (you cannot delete on the class itself).

```python
delattr(object, name)
```

e.g.

```python
class MyClass:
    pass


my_object = MyClass()

my_object.my_attribute = "my value"

my_object.my_attribute
# my value

delattr(my_object, 'my_attribute')
my_object.my_attribute
# AttributeError 'MyClass' object has no attribute 'my_attribute'
```
