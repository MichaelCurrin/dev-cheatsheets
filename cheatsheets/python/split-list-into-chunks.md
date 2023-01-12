# Split a list into equal-sized chunks

The last chunk might be smaller.

## List comprehension

```python
chunk_size = 2

my_list = [1, 2, 3, 4, 5, 6, 7, 8, 9]
result = [my_list[i:i + chunk_size] for i in range(0, len(my_list), chunk_size)]
# [[1, 2], [3, 4], [5, 6], [7, 8], [9]]
```

Make that a generator using `(...)` instead of `[...]`.


## Generator

As a function, with a generator:

```python
def divide_chunks(values, size):
    for i in range(0, len(values), size):
        yield values[i:i + size]
```


## Using itertools

Useful for something that works well on large data structures without loading them all into memory at once.


### Using islice

```python
from itertools import islice


def chunks(data: list, size=1000):
    it = iter(data)

    for i in range(0, len(data), size):
        yield [k for k in islice(it, size)]
        
```

e.g.

```python
list(chunks(range(20), 3))
# [[0, 1, 2],
#  [3, 4, 5],
#  [6, 7, 8],
#  [9, 10, 11],
#  [12, 13, 14],
#  [15, 16, 17],
#  [18, 19]]
```

### groupby and count

This is a lazy loading approach where you only get the value but evaluating the item not just iterating over the values.

```python
from itertools import groupby, count


def list_chunks(iterable, size=50):
    c = count()
    for _, g in groupby(iterable, lambda _: next(c) // size):
        yield g
```

e.g.

```python
list(list_chunks(range(20), 3))
# [<itertools._grouper at 0x7f7f5052d610>,
#  <itertools._grouper at 0x7f7f5052da50>,
#  <itertools._grouper at 0x7f7f5052de10>,
#  <itertools._grouper at 0x7f7f5052da90>,
#  <itertools._grouper at 0x7f7f5052d050>,
#  <itertools._grouper at 0x7f7f5052db50>,
#  <itertools._grouper at 0x7f7f5052ddd0>]

[list(x) for x in list_chunks(range(20), 3)]
# [[0, 1, 2],
# [3, 4, 5],
# [6, 7, 8],
# [9, 10, 11],
# [12, 13, 14],
# [15, 16, 17],
# [18, 19]]
```

### zip_longest

```python
from itertools import zip_longest


def group_elements(n, iterable_data, pad_value='x'):
    return zip_longest(*[iter(iterable_data)]*n, fillvalue=pad_value)


my_list = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10']

for output in group_elements(3, my_list):
    print(output)
# ('1', '2', '3')
# ('4', '5', '6')
# ('7', '8', '9')
# ('10', 'x', 'x')
```

Or my own idea, using `range` to get the indices and use that to slice a list.

```python
my_list = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h']

my_loop = [(i, i+1) for i in range(0, 9, 2)]
# [(0, 1), (2, 3), (4, 5), (6, 7), (8, 9)]

[my_list[x:y+1] for x, y in my_loop]
# [['a', 'b'], ['c', 'd'], ['e', 'f'], ['g', 'h'], []]
```
