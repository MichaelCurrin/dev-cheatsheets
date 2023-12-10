# Transpose array

Given a 2D array.

```python
matrix = [
    [1,2,3],
    [4,5,6],
    [7,8,9]
]
```

And you want result:

```python
[
    [1,4,7],
    [2,5,8],
    [3,6,9]
]
```

Do this:

```python
result = zip(*matrix)
```

Explanation:

```
x = ['a', 'b', 'c']
y = 1, 2, 3]
list(zip(x, y))
# [
#     ('a', 1), 
#     ('b', 2), 
#     ('c', 3)
# ]
```
