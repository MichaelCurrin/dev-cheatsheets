# Conditionals

## Basic

```python
if CONDITION:
    STATEMENT
    
if CONDITION:
    STATEMENT
else CONDITION:
    STATEMENT
   
if CONDITION:
    STATEMENT
elif CONDITION:
    STATEMENT
```


## Check list

Check all values are truthy i.e. not of one of `False`, `0`, `[]`, `{}`.

```python
values = [True, True, True]
all(values)
# True

values = [True, False, True]
all(values)
# False
```

```python
values = [1, 2, 3]
all(values)
# True

values = [0, 1, 2, 3]
all(values)
# False
```

Use a list comprehension or `lambda` expression to check the items against something specific.

```python
values = [1, 2, 3]
matched = [v > 1 for v in values]
all(filtered)
# False
```


## Match

Added in Python 3.10.

See [post](https://docs.python.org/3/whatsnew/3.10.html).

```python
match subject:
    case <pattern_1>:
        <action_1>
    case <pattern_2>:
        <action_2>
    case <pattern_3>:
        <action_3>
    case _:
        <action_wildcard>
```

e.g.

```python
def http_error(status):
    match status:
        case 400:
            return "Bad request"
        case 404:
            return "Not found"
        case 418:
            return "I'm a teapot"
        case _:
            return "Something's wrong with the internet"
```

```python
case 401 | 403 | 404:
    return "Not allowed"
```
