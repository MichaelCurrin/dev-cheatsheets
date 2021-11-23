# Enumerate

Get the zero-based index of items when iterating over them.


## List

```python
items = ['a', 'b', 'c']

for i, item in enumerate(items):
    print(i, item)
    
# 0 a
# 1 b
# 2 c
```


## Dictionary

Unpack the tuple as index and another tuple, which also gets unpacked as key and value.

```python
my_dict = {'a': 123, 'b': 456}

for i, (k, v) in enumerate(my_dict.items()):
   print(i, k, v)
# 0 a 123
# 1 b 456   
```

Compare with basic:

```python
for k, v in my_dict.items():
   print(k, v)
# a 123
# b 456   
````

For more detail:

```python
enumerate(my_dict)
# <enumerate object at 0x101e265c0>

# list(enumerate(my_dict))
[(0, 'a'), (1, 'b')]
```
