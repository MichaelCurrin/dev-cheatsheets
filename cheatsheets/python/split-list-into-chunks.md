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

Use itertools for something that works well on large data structures without loading them all into memory at once.

Here is an okay way that is still messy.

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
