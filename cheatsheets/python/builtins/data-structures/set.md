# Set

An unordered collection of elements without any duplicates.

- [Python reference](https://python-reference.readthedocs.io/en/latest/docs/sets/)
- [Python docs](https://docs.python.org/3/tutorial/datastructures.html#sets)


## Create

New empty set.

```python 
x = set()
```

Note that `{}` would create a dict, so you need the `set` keyword as above.

Set with values.


```python
my_set = {VALUE, VALUE, VALUE}

# e.g.
x = {"abc", "abc", 123, True, False, False}
# {"abc", 123, True, False}
```


## Membership testing 

The values in a set are hashed, like dictionary keys, so it is very efficient to check if a value is in a set - O(1) time. While checking membership for a value in a set is O(n) time. So you should consider storing a list as a set if order doesn't matter and lookup time needs to be fast.

```python
"abc" in x
# True

"def" in x
# False 
```


## Add element

```python 
my_set.add(VALUE)
```


## Add elements 

Pass an iterable, such an list or another set.

```python
my_set |= ITERABLE

# or
my_set.update(ITERABLE)
```

e.g.

```python
x = {"apple", "banana", "cherry"}
y = {"google", "microsoft", "apple"}

x.update(y)
```


## Operations

Do a join to see what a set has in common or different from another.

Use bitwise operators or methods. The former only works with two sets while the latter works with iterables.

### Intersection

OR

Returns a new set with elements common to the set and the other set.

The order does not matter.

```python
x | y

# or
x.intersection(y)
```

### Union

AND

Returns a new set with elements from the set and the other set.

```python
x & y

# or
x.union(y)
```

### Difference

NOT

Returns a new set with elements in the set that are not in the other set.

Note the order matters, as you remove elements of the 2nd from the 1st.

```python
x - y

# or
x.difference(y)
```

### Symmetric difference

XOR

Returns a new set with elements in either the set or the other set but not both.

```python
x ^ y

# or
x.symmetric_difference(y)
```
