# Counter

See the [docs](https://docs.python.org/3/library/collections.html#collections.Counter).


## Create

```python
c = Counter()                           # a new, empty counter
c = Counter('gallahad')                 # a new counter from an iterable
c = Counter({'red': 4, 'blue': 2})      # a new counter from a mapping
c = Counter(cats=4, dogs=8)             # a new counter from keyword args
```


## Update

### Single

```python
c.update(value)
```

e.g.

```python
c = Counter()
c.update('a')

# c
Counter({'a': 1})
```

If you want to a pass a tuple, put it in a list to stop the tuple from being broken up.

```python
c = Counter()
my_tuple = (123, 456)
c.update([my_tuple])

c 
# Counter({(123, 456): 1})
```

### Multiple

Pass multiple values at once.

```pythob
c.update(iterable)
```

e.g.


Strings

```python
c = Counter()
c.update('abc', 'def')
Counter({'abc': 1, 'def': 1})
```

Characters

```python
c.update(('a', 'b'))
# OR
c.update('ab')

c
# Counter({"a": 1", "b": 2})
```


## View

### Elements

```python
c = Counter(a=4, b=2, c=0, d=-2)
sorted(c.elements())
['a', 'a', 'a', 'a', 'b', 'b']
```

### Most common

Request `n` elements, or all if omitted.

```python
c = Counter('abracadabra')
c.most_common(3)
# [('a', 5), ('b', 2), ('r', 2)]
````

### Dict properties

Use `keys`, `values`, and `items` as methods, as usually done on a `dict` object.

```python
c = Counter(a=1, b=2)

c.keys()
# dict_keys(['a', 'b'])

c.values()
# dict_values([1, 2])

c.items()
# dict_items([('a', 1), ('b', 2)])
```


## Example

```python
from collections import Counter

c = Counter()
c.update('a')
c.update('a')
c.update('b')

c
# Counter({'a': 2, 'b': 1})

c.most_common()
# [('a', 2), ('b', 1)]

for k, v in c.items(): 
    print(k, v)
# a 2
# b 1
```


## Grouping

Here is an equivalent without `Counter`.

```python
groups = collections.defaultdict(int)

for foo in bars:
    groups[foo.category] += 1
```
