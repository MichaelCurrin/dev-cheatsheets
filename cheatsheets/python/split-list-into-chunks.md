# Split a list into equal-sized chunks

The last chunk might be smaller.

```python
chunk_size = 2

my_list = [1, 2, 3, 4, 5, 6, 7, 8, 9]
result = [my_list[i:i + chunk_size] for i in range(0, len(my_list), chunk_size)]
# [[1, 2], [3, 4], [5, 6], [7, 8], [9]]
```

As a function, with a generator:

```python
def divide_chunks(values, size):
    for i in range(0, len(values), size):
        yield values[i:i + size]
```

There's probably a way to do it with `iter`, `zip`, or `itertools`. Here is an okay way that is still messy.

```python
from itertools import zip_longest


def group_elements(n, iterable, padvalue='x'):
    return zip_longest(*[iter(iterable)]*n, fillvalue=padvalue)

my_list = ['1','2','3','4','5','6','7','8','9','10']

for output in group_elements(3, my_list):
    print(output)
('1', '2', '3')
('4', '5', '6')
('7', '8', '9')
('10', 'x', 'x')
```

Or my own idea:

```python
my_loop = [(i, i +1) for i in range(0, 9, 2)]
# [(0, 1), (2, 3), (4, 5), (6, 7), (8, 9)]

my_list = ['a', 'b','c', 'd', 'e', 'f', 'g', 'h']

[my_list[x:y+1] for x, y in my_loop]
# [['a', 'b'], ['c', 'd'], ['e', 'f'], ['g', 'h'], []]
```
