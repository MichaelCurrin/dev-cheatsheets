---
title: Optional
description: Allow a variable to be `None`
---


## Optional type

The docs say that this is the preferred way. See [page](https://mypy.readthedocs.io/en/latest/kinds_of_types.html).

### Import

```python
from typing import Optional
```

### Use Optional

Allow a variable to be `None`:

```
Optional[TYPE]
```

Declare a type for a variable. This was recommended by the docs.

```python
foo: Optional[str] = None

foo = 'abc'
```

 
 
## Union approach

Use the `Union` type. This is not preferred but might be needed in some cases.

```python
Union(float, None)

# Python 3.10
float | None
```


## Function examples

Here we return a string or `None`.

```python
def foo() -> Optional[str]:
    pass
```

The second case shows a necessary annotation. Note you must declare the type on the _first_ declaration of a variable and on that one _only_.
 
```python
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

You can use use `Union` instead.

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

Or, you can use a `return None` sooner and so don't define `buzz` at that point so `buzz` is never `None` but the function can return `None`.

### Parameters

For function parameters which have defaults, you can avoid using `Optional` or `Union` by ensuring the default is not set as `None`.

e.g.

```python
def foo(fizz, buzz:Optional[float]=None):
    pass
    
def foo(fizz, buzz:float=0.0):
    pass
```
