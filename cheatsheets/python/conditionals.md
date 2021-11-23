# Conditionals

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
