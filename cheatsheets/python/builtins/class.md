# Class

## Private methods

Use a single underscore by convention to indicate a method is private. 

Use a double underscore to actually make it private. To access it from the outside, you use need to access through a generated method name.

```python
class Foo:
    my_class_variable = 'xyz'

    def __init__(self, abc, def):
        self.abc = abc
        self.def = def
        
    def my_public_method(self):
        pass
     
    def _my_private_method(self):
        pass
        
    def __my_very_private_method(self):
        pass
        

x = Foo(123, 456)
x.my_public_method()
x._my_private_method()
x._Foo__my_very_private_method()
```


## Decorators

### Class method

Note `cls` instead of `self`. So you can access variables or methods on the class without an instance.

```python
class Foo:
    my_class_variable = 'xyz'
    
    def my_public_method(self, abc):
        self.abc = abc
        
    @classmethod
    def my_class_method(cls):
        print(cls.my_class_variable)
        
        my_instance = cls(123)
        
Foo.my_class_method()
```

### Static method

No instance needed.

```python
class Foo:
        
    @staticmethod
    def my_static_method():
        pass

Foo.static_method()
```
