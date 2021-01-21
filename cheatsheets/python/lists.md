# Lists


## Empty array

```python
>>> []
[]
>>> list()
[]
```

## Null list 

This is only safe for primitive types.

```python
>>> x = [None]*10
[None, None, None, None, None, None, None, None, None, None]
>>> x[0] = 'abc'
>>> x
['abc', None, None, None, None, None, None, None, None, None]
```

For data structures, this gives unexpected reuslts as each element points to the same variable.

```python
>>> x = [[]]*10
>>> x
[[], [], [], [], [], [], [], [], [], []]

>>> # Append a value inside the first item.
>>> x[0].append('abc')
>>> # It gets added to all.
>>> x
[['abc'], ['abc'], ['abc'], ['abc'], ['abc'], ['abc'], ['abc'], ['abc'], ['abc'], ['abc']
```

You can't use this either.

```python
[list()]*10
```

You'll need a `lambda`.

Or list comprehension. With `[]` or `list()` inside.

```python
>>> x = [[] for _ in range(10)]
>>> x[0].append('abc')
>>> x
[['abc'], [], [], [], [], [], [], [], [], []]
```


## Initialize with values

```python
>>> [10, 13]
[10, 13]
```

```python
>>> list([10, 13])  
[10, 13]
```

You must pass an iterable to `list`. Passing a single `str` or `int` will fail.

```python
>>> list(1)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: 'int' object is not iterable
```


## Copy a list

Use either:
```python
list(my_list)
my_list[:]
```

Example:

```python
>>> x = [10, 13]
>>> y = list(x)  
[10, 13]
>>> y.append(14)
>>> x
[10, 13]
>>> y
[10, 13, 14]
```

### Cast to list

Tuple to list.

```python
>>> x = (10, 13)
>>> list(x)  
[10, 13]
```

Set to list.

```
>>> x = {1, 1, 2}  # Or set((1, 1, 2))
{1, 2}
>>> x
{1, 2}
>>> list(x)
[1, 2]
```

String to list

```python
>>> list('abc')
['a', 'b', 'c']
```
