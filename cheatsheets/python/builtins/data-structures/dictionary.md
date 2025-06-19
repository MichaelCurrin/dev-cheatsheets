# Dictionary


Mutable of object of key-value pairs. 

Keys must be immutable so they can be hashed. e.g. `str`, `int`, `tuple`. Not a `list` or `dict`.

## Related

- [dict](https://docs.python.org/3/library/stdtypes.html#dict) in the Python docs.
- [dictionary type checks][] for how to annotate your dict and validate usage with type checking.

[dictionary type checks]: {% link cheatsheets/python/type-checks/data-structures/dictionary.md %}


## Create

```python
{"a": 1, "b": 2}
```

```python
dict(a=1, b=2)
```

## Get

```python
x['abc']
```

Implies returning `None` if key does not exist.

```python
x.get('abc')
# None

x.get('abc', 0)
# 0
```

## Set

```python
x.update('abc', 1)

x['abc'] = 1
```

## Delete

```python
del x['abc']
```

## Iterate

```python
x.keys()
```

```python
x.values()
```

```python
x.items()
```
