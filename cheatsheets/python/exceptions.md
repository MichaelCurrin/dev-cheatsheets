# Exceptions

## Resources

- [Built-in exceptions](https://docs.python.org/3/library/exceptions.html)

The `RuntimeError` exception is a catch-all which you can use for your own raising and subclassing errors.


## Raise

```python
>>> raise RuntimeError("Message")
```
```
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
RuntimeError: Message
```

## Catch and re-raise

Python 3 syntax - you don't have to catch and raise `e` explicitly.

```python
try:
    foo = "My foo"
    bar(foo)
except Exception:
    print(f"Foo: {foo}")
    raise
```


## Custom error

### Basic

You can use `pass` or docstring or both.

```python
class Foo(RuntimeError):
    """Description of Foo error"""
```

```python
raise Foo("Message")
```
Output:
```
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
__main__.Foo: Message
```

```pythpn
try:
    # Function call that raises this...
    raise NetworkError("Message")
except NetworkError as e:
    print(e)
    print(e.args)
```
```
Message
('Message',)
```

### Override init

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
