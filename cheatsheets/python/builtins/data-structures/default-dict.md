# Default dict

[defaultdict](https://docs.python.org/3/library/collections.html#collections.defaultdict)

```python
from collections import defaultdict
```


## Number

Use default as zero.

```python
d = defaultdict(int)

d['a']
# => 0

d['b'] += 1
d
# => defaultdict(<class 'int'>, {'a': 0, 'b': 1})
```

Use default as another number. You can't pass a `1` but you can pass a `lambda`.

```python
d = defaultdict(lambda: 1)

d['c']
# => 1
d
# => defaultdict(<function <lambda> at 0x10fa69ee0>, {'c': 1})
```


## List


```python
d = defaultdict(list)

d['a'].append(2)

d
# => defaultdict(<class 'list'>, {'a': [2]})
