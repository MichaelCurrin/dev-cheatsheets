# Set

An unordered collection of elements without any duplicates.


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


## Add

```python 
my_set.add(VALUE)
```


## Update 

Pass an iterable, such an list or another set.

```python
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

```python
x | y

# or
x.intersection(y)
```

### Union

```python
x & y

# or
x.union(y)
```
