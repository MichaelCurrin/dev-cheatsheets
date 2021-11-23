# List


## Resources

- [list](https://docs.python.org/3/library/stdtypes.html#list) in the standard types.
- [lists](https://docs.python.org/3/tutorial/datastructures.html#more-on-lists) in a tutorial on the docs - that covers the methods on a list and how to use a list as a stack of queue.


## The list keyword

```python
x = [1, 2, 3]
type(x)
# list
isinstance(x, list)
# True

y = (1, 2, 3)
list(y)
# [1, 2, 3]
```


## Methods

Common:

- `.append` - add an element at the end, one argument only.
    ```python
    x.append('def')
    ````
- `.extend` - add multiple elements from an iterable at the end of a list.
    ```python
    x.extend(['ghi','jkl'])
    ```
- `.insert` - add an element at a given position.
    ```python
    x.insert(0, 'def')
    ```
- `.pop` - remove an element from the end or given position.
    ```python
    el = x.pop() # end
    el = x.pop(0) # start
    ```

Less common:

- `.remove` - remove a target value.
    ```python
    x.remove('def')
    ```
- `.index`
    ```python
    x.count('abc')
    # 0
    ```
- `.count`
    ```python
    x.count('abc')
    # 1
    ```
- `.copy`
- `.sort`  - see also `sorted(my_list)`
- `.reverse` - see also `reversed(my_list)`
- `.clear` - empty the lit.


## Create

### Empty array

```python
>>> []
[]
>>> list()
[]
```

### Null list

This is only safe for primitive types.

```python
>>> x = [None]*10
[None, None, None, None, None, None, None, None, None, None]
>>> x[0] = 'abc'
>>> x
['abc', None, None, None, None, None, None, None, None, None]
```

For data structures, this gives unexpected results as each element points to the same variable.

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

### With values

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


## Slices and index

```python
x = ['abc', 'def', 'ghi', 'jkl']
```

Get item.

```python
>>> x[1]
'def'
```

Get a range.

```python
>>> x[:]  # all
['abc', 'def', 'ghi', 'jkl']
>>> x[:1]  # first
['abc']
>>> x[1:2] # second
['def']
>>> x[1:3] # second and third, using index 1 and 2
['def', 'ghi']
>>> x[-1]  # last
'jkl'
>>> x[-2]  # second last
'ghi'
>>> x[-2:]  # last 2
['ghi', 'jkl']
```

Assign.

```python
>>> x[0] = 'ABC'
>>> x
['ABC', 'def', 'ghi', 'jkl']
```

Overwrite a range using an iterable.

```python
>>> x[1:3] = ['DEF', 'GHI']  # Replace items at index 1 and 2.
>>> x
['abc', 'DEF', 'GHI', 'jkl']
```

Insert elements between elements. Here inserting at the start.

```python
>>> x[0:0] = [123, 456]
>>> x
[123, 456, 'abc', 'def', 'ghi', 'jkl']
```


## Copy

See [Copy][] cheatsheet.

[Copy]: {% link cheatsheets/python/copy.md %}


## Cast to list

Tuple to list.

```python
>>> x = (10, 13)
>>> list(x)
[10, 13]
```

Set to list.

```python
>>> x = {1, 1, 2}  # Or set((1, 1, 2))
{1, 2}
>>> x
{1, 2}
>>> list(x)
[1, 2]
```

String to list.

```python
>>> list('abc')
['a', 'b', 'c']
```
