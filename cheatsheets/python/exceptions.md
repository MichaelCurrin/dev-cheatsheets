# Exceptions

## Resources

- [Built-in exceptions](https://docs.python.org/3/library/exceptions.html)

The `RuntimeError` exception is a catch-all which you can use for your own raising and subclassing errors.


## Raise

```python
raise ValueError("My message")
```
Output:
```
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
ValueError: My message
```


## Catch

```python
def foo():
    raise ValueError("Dummy error")
```

### Bare

Not recommended.
  
```python
try:
     foo()
except:
     print("Do something")
```

### Broad

```python
try:
     foo()
except Exception:
     print("Do something")
```

```python
try:
     foo()
except Exception as e:
     print(f"Something bad happened {str(e)}")
```

### Specific

```python
try:
     foo()
except KeyError:
     print("Do something")
```

### Chained

```python
try:
     foo()
except ConnectioError:
    print("Could not connect")
except KeyError:
     print("We had a bad key")
except Exception:
     print("Default")     
```


## Catch and re-raise

### Implicit

No need to assign the exception to a variable. Just use `raise` after your custom logic and the caught exception will be raised. This will keep the message.

```python
try:
    foo = "My foo"
    # Expecting bar to fail here.
    bar(foo)
except Exception:
    print(f"Foo: {foo}")
    
    raise
```

### Explicit

Here we use the same error type but a custom message.

```python
try:
    foo = "My foo"
    # Expecting bar to fail here.
    bar(foo)
except Exception as e:
    print(f"Foo: {foo}")
    
    raise type(e)("My custom message")
```


## Base classes

See [Base classes](https://docs.python.org/3/library/exceptions.html#base-classes) in the docs.

```python
try:
    raise ValueError("My message")
except Exception as e:
    print(e)
    print(str(e))
    print(e.args)
```
```
My message
My message
('My message',)
```

Recommended - use `str(e)` when putting your error inside a string like `"Got error - {str(e))`.

What is avaiable as public attributes and methods:

> `args` - The tuple of arguments given to the exception constructor. 
> 
> `with_traceback(tb)` - This method sets tb as the new traceback for the exception and returns the exception object.


Example from the docs:

```
try:
    ...
except SomeException:
    tb = sys.exc_info()[2]
    raise OtherException(...).with_traceback(tb)
```


## Custom exception

If you don't want to use one of the built-in exception types like `ValueError`, or a library's exceptions like `requests.ConnectionError`, you can make your own with an class.

### Basic

Empty class - you can use `pass` or docstring or both for the contents.

```python
class Foo(RuntimeError):
    """Description of Foo error"""
```

Usage:

```python
raise Foo("Message")
```
Output:
```
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
__main__.Foo: Message
```


### Override init

Here with a custom value on the error.

```python
class NetworkError(RuntimeError):
    def __init__(self, msg):
        self.msg = msg

```

```python
try:
    # Function call that raises this...
    raise NetworkError("Message")
except NetworkError as e: 
    print(e.msg)
```
Output:
```
Message
```
