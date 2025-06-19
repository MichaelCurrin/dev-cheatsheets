# Default dict

Python docs: [defaultdict](https://docs.python.org/3/library/collections.html#collections.defaultdict)

With this variation of a dictionary, you can perform an operation on a value in the object without getting a key error that it does not exist. For example incrementing a value or appending to a list.

## Setup

```python
from collections import defaultdict
```


## Syntax

```python
defaultdict(DEFAULT_VALUE)
```

For value.

- Pass a type. e.g.
    - `int`
    - `list`
    - `dict`
- Or a callable i.e. a function.
    - `lambda: 1`
    - `lambda: 'Not set'`

## Examples

### Overview

Here we set default as `0`.

```python
>>> from collections import defaultdict

>>> x = defaultdict(int)
>>> # Get a key that doesn't get exist. Actually creates the key.
>>> x['abc']
0
>>> x
defaultdict(<class 'int'>, {'abc': 0})

>>> # Increment a key that does not exist, setting it to 1.
>>> x['def'] += 1
>>> x
defaultdict(<class 'int'>, {'abc': 0, 'def': 1})

>>> # Increment a key that this time exist, setting it to 2.
>>> x['def'] += 1
```


### Display

```python
>>> x = defaultdict(int)
>>> x['abc'] += 1

>>> x
defaultdict(<class 'int'>, {'abc': 1})

>>> dict(x)
{'abc': 1}

>>> x.items()
dict_items([('abc', 2)])
```

### Number

Use a default value as zero. So you can increment a key's value without checking if the key is set.

```python
d = defaultdict(int)

d['a']
# => 0

d['b'] += 1
d
# => defaultdict(<class 'int'>, {'a': 0, 'b': 1})
```

Or pick another number as the default, such as `1` or `1.0`.

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
```

### Dictionary of lists

Nest two levels of dictionaries, with a list as the value of the inner dictionary.

This is useful for example if you are a iterating over a flat data structure, such as a CSV of rows as :

- name
- value
- year
- category

And you want a nested structure like:

Expected structure.

```python
{
    "2016": {                               # Outer dict key, with a dict as value.
        "category A": [                    # Inner dict key, with a list value
           { "x": "some name", "y": 123 }, # Dictionary.
           { ... }
        ]
        "category B": [ ],
   } ,
  "2017": [ ... ]
}
```

Here is the code.

```python
d = defaultdict(lambda: defaultdict(list))

year = "2016"
category = "Category A"
name = "Foo"
value = 123

data_point = dict(x=name, y=value)
d[year][category].append(data_point)
```

Note that we don't enforce the type of the list items. They might be simply strings or numbers. In this example, each point is a dictionary.


## Remove item

Use `.pop(key)`.

```python
x = defualtdict(int)
x['abc'] += 1

x.pop('abc')
# 1

x.pop('abc')
# KeyError: 'abc'

# Give fallback.
x.pop('abc', None)
# None
```
