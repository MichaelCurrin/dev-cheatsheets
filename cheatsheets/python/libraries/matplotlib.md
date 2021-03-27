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


## Examples

From [Usage](https://matplotlib.org/stable/tutorials/introductory/usage.html) tutorial.

### Simple plot

Create a figure containing a single axes. Then plot some data on the axes.

```python
fig, ax = plt.subplots()  
ax.plot([1, 2, 3, 4], [1, 4, 2, 3]) 
```

Shorter:

```python
plt.plot([1, 2, 3, 4], [1, 4, 2, 3]) 
```

### Three lines on a plot

Using the PyPlot interface.

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

