# Lists


## Empty array

```python
>>> []
[]
>>> list()
[]
```

## Null list 

```python
>>> [None]*10
[None, None, None, None, None, None, None, None, None, None]
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
