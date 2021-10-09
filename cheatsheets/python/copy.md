---
title: Copy
description: Copying objects in Python
---


## Resources

- [lib.copy](https://docs.python.org/3/library/copy.html) builtin docs
	> Shallow and deep copy operations
- [copy in Python (Deep Copy and Shallow Copy)](https://www.geeksforgeeks.org/copy-python-deep-copy-shallow-copy/) tutorial


## Reference

If you don't use a copy approach, then assignment just creates a reference for data structures.

e.g. Here you can modify either list and both get the result.

```python
>>> x = [123]
>>> y = x
>>> y.append(456)
>>> x
[123, 456]
>>> y
[123, 456]
```

## Shallow copies

This is an improvement on the plain reference.

> Shallow copies of dictionaries can be made using dict.copy(), and of lists by assigning a slice of the entire list, for example, `copied_list = original_list[:]`.

### list

```python
new_list = list(original_list)
# OR
# Make a slice using every element, like doing original_list[0:len(original_list)]
new_list = original_list[:]
# OR
new_list = original_list.copy()
```

e.g.

```python
>>> x = [123]
>>> y = list(x)
>>> y.append(456)
>>> y
[123, 456]
>>> x  # original got modified too
[123, 456]
```

### dictionary

```python
new_dict = original_dict.copy()
```

### Why shallow copies can be bad

A shallow copy is fine if you have primitives.

e.g.

```python
>>> x = ['a', 'b', 'c']
>>> y = x.copy()
>>> y.append('d')
>>> y
['a', 'b', 'c', 'd']
>>> x  # original preserved
['a', 'b', 'c']
```

If you have any dictionaries or lists in your structure, as Python will create one structure and reference it in both. This is efficient for memory.

But will cause unexpected behavior, as modifying one object's structure affects the other object's structure.

e.g. Note how only the new list `y` is modified, but `x` gets the change too.,

```python
>>> x = ['abc', {}]
>>> y = x.copy()
>>> y[1]['a'] = 1
>>> y
['abc', {'a': 1}]
>>> x  # original got modified too
['abc', {'a': 1}]
```

### Use copy library

I don't know if this is useful, as it is only a shallow copy and you can save an import by using built-in approaches above.

```python
import copy

new_list = copy.copy(original_list)
new_dict = copy.copy(original_dict)
```


## Deep copies

If you have data structures in your data structures and you don't want them to be connected, then use a deep copy.

```python
import copy

new_list = copy.deepcopy(original_list)
new_dict = copy.deepcopy(original_dict)
```


e.g.

```python
>>> x = ['abc', {}]
>>> y = copy.deepcopy(x)
>>> y[1]['a'] = 1
>>> y
['abc', {'a': 1}]
>>> x  # original preserved
['abc', {}]
```
