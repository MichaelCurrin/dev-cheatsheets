---
title: Copy
description: Copying objects in Python
---

- [lib.copy](https://docs.python.org/3/library/copy.html) builtin docs
	> Shallow and deep copy operations
- [copy in Python (Deep Copy and Shallow Copy)](https://www.geeksforgeeks.org/copy-python-deep-copy-shallow-copy/) tutorial


## Shallow copies

> Shallow copies of dictionaries can be made using dict.copy(), and of lists by assigning a slice of the entire list, for example, copied_list = original_list[:].

```python
copied_list = original_list[:]

copied_dict = original_dict.copy()
```

Where `original_obj` is a `dict` or `list`:

```python
import copy

copied_obj = copy.copy(original_obj)
```


## Deep copies

Where `original_obj` is a `dict` or `list`:

```python
import copy

copied_obj = copy.deepcopy(original_obj)
```
