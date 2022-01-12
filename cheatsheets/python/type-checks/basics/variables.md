# Variables with types


## Explicit

You can add a explicit type for a variable with a value.

```python
x: int = 1
```

But this gives no benefit. See next section.


## Implicit

Here Mypy will infer as an `int`.

```python
x = 2
```

You can assign as another value of the same type.

```python
x = 123
x = "abc"
# error: Incompatible types in assignment (expression has type "str", variable has type "int")
```


## Initialize with null value

Here `x` starts as `0`. We can assign it to other `int` values but other types like `None` or `str`.

```python
x: int

x = 123
x = 'abc'
# Incompatible types in assignment (expression has type "str", variable has type "int")
```


Example of initializing a null value:

```python
child: bool

if age < 18:
    child = True
else:
    child = False
```
