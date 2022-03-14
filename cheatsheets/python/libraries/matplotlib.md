---
title: Matplotlib
description: Visualization with Python
---

- [Homepage](https://matplotlib.org/)
- [Docs](https://matplotlib.org/stable/contents.html)
- [Gallery](https://matplotlib.org/stable/gallery/) of examples.


## Installation

See [Installing](https://matplotlib.org/stable/users/installing.html) doc for other options.

```sh
$ pip install matplotlib
```


## Imports

```python
import matplotlib.pyplot as plt
import numpy as np
```


## Line graph

From [Usage](https://matplotlib.org/stable/tutorials/introductory/usage.html) tutorial and [plot](https://matplotlib.org/stable/api/_as_gen/matplotlib.axes.Axes.plot.html#matplotlib.axes.Axes.plot) method docs.

### Simple plot

```python
plot(x, y)        # plot x and y using default line style and color
plot(x, y, 'bo')  # plot x and y using blue circle markers
plot(y)           # plot y using x as index array 0..N-1
plot(y, 'r+')     # ditto, but with red plusses
```

e.g.

```python
x = [1, 2, 3, 4]
y = [1, 4, 2, 3]

fig, ax = plt.subplots()  
ax.plot(x, y) 

# Or in one line:
plt.plot(x, y) 
```

### Multiple lines on a plot

```python
x = np.linspace(0, 2, 100)

plt.plot(x, x,    label='linear')  
plt.plot(x, x**2, label='quadratic') 
plt.plot(x, x**3, label='cubic')

plt.xlabel('x label')
plt.ylabel('y label')
plt.title("Simple Plot")
plt.legend()
```


## How to run Matplotlib

See [Backends](https://matplotlib.org/stable/tutorials/introductory/usage.html#backends) in the docs.

- Run Jupyter notebooks and draw inline plots for quick data analysis. 
- Embed plots into GUIs like PyQt or PyGObject to build rich applications. 
- Use batch scripts to generate postscript images from numerical simulations.
- Run web application servers to dynamically serve up graphs.

