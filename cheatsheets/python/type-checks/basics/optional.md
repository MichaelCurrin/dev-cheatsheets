# Optional

For height to be optional, you could have a union using `float` and `None`. 

e.g.

```python
Union(float, None)
# Python 3.10
float | None
```

The docs say that prefered way is `Optional[float]` - see [page](https://mypy.readthedocs.io/en/latest/kinds_of_types.html).

Or just set `height=0.0` as a default as then it is never None type and the float type will be inferred.


## Using Optional

Allow a variable to be `None`.

```
Optional[TYPE]
```

Declare a type for a variable. This was recommended by the docs.

```python
foo: Optional[str] = None

foo = 'abc'
```

Here we return a string or `None`. The second case shows a necessary annotation. Note you must declare the time on the first declariation from top to bottom - not the 2nd and not both.

```python
def foo() -> Optional[str]:
    pass


def bar(bazz: bool) -> Optional[str]:
    if bazz:
        buzz: Optional[str] = 'Yes'
    else:
        buzz = None
    
    return buzz
```

You may can an error from Pylint:

```
E1136: Value 'Optional' is unsubscriptable (unsubscriptable-object)
```

You can use use `Union` instead. But then you have to use it twice.

```python
def bar(bazz: bool) -> Union[str, None]:
    if bazz:
        buzz: Union[str, None] = 'Yes'
    else:
        buzz = None
    return buzz
```

Or you have to use `Optional` like this.

```python
def bar(bazz: bool) -> Union[str, None]:
    if bazz:
        buzz: Optional[str] = 'Yes'
    else:
        buzz = None
    return buzz
```

Unless you use a `return` sooner and so don't define `buzz`.
 
