---
title: NumPy
description: The fundamental package for scientific computing with Python
---


## Resources

- [Homepage](https://numpy.org/)
- [Quickstart](https://numpy.org/doc/stable/user/quickstart.html)
- Unofficial
    - [Numpy cheatsheet](https://s3.amazonaws.com/assets.datacamp.com/blog_assets/Numpy_Python_Cheat_Sheet.pdf) by Datacamp. From [blog](https://www.datacamp.com/community/blog/python-numpy-cheat-sheet) post.
    - [Numpy cheat sheet](https://www.dataquest.io/blog/numpy-cheat-sheet/) on DataQuest.


## Installation

From [Install](https://numpy.org/install/) page.

Using Conda.

```sh
$ conda install numpy
```

Using Pip.

```sh
$ pip install numpy
```


## Basics

```python
import numpy as np


a = np.arange(15).reshape(3, 5)

a
# array([[ 0,  1,  2,  3,  4],
#        [ 5,  6,  7,  8,  9],
#       [10, 11, 12, 13, 14]])

a.shape
# (3, 5)

a.ndim
# 2

a.dtype.name
# 'int64'

a.itemsize
# 8

a.size
# 15

type(a)
# <class 'numpy.ndarray'>

b = np.array([6, 7, 8])

b
# array([6, 7, 8])

type(b)
# <class 'numpy.ndarray'>
```
