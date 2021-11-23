# Looping 

## while

### Basic

Wait a second between actions.

```python
import time


while True:
    print("Hello")
    time.sleep(1)
```

### Fixed count

You can set up a while loop to act like a for loop with an incrementing counter, but a for loop is much neater for that.

But sometimes you are handling data and you don't know how many iterations to do. Like getting batches of 10 rows at a time from a database or REST API. 

So you might do something like this:

```python 
resp = None

while resp is None or resp.has_next_page is True:
    resp = do_request()
```


### while-else

Here with while-else such that the `else` block is executed if `break` is _not_ applied. i.e. the loop exited because the expression became false.

```python
while my_condition:
    do_stuff()

    if some_cond:
        break
else:
     do_more_stuff()
```


## for

### Basic

Iterate over an iterable.

```python
for foo in foos:
    print(foo)
```

### String

```python
for c in "abc":
    print(c)
# a
# b
# c
```

### List, tuple, or set

```python
my_items = ["abc", "def"]

for x in my_items:
    print(x)
# abc
# def
```

If you need the index and the value:

```python
for i, x in enumerate(my_items):
    print(i, x)
# 0 abc
# 1 def
```

Please _avoid_ using `range` to get the index of items in an a list and then get each item. I see people doing that because they are used to a C-style array. 

i.e. Do _not_ do this in Python. It is messier and slower.

```python
my_items = ["abc", "def"]

for i in range(len(my_items)):
    print(x[i])
# abc
# def
```

### Range

Iterate over a series of numbers.

Note that zero start is implied and the upper value is excluded. 

```python
for i in range(5):
    print(i)
# 0
# 1
# 2
# 3
# 4
```

Set a minimum.

```python
for i in range(1, 5):
    print(i)
# 1
# 2
# 3
# 4
```

### Dictionaries 

Iterating over a dictionary will unpack its keys. You can use `my_dict` or `my_dict.keys()` (to be more explicit), but it will be the same result.

```python
my_dict = {"abc": 123, "def": 456}

for k in my_dict.keys():
    print(k)
# abc
# def
```

If you need the values:

```python 
for v in my_dict.values():
    print(v)
```

If you need both the key and value, then unpack as tuples:

```python 
for k, v in my_dict.items():
    print(k, v)

# Same as:
for i in my_dict.items():
    k, v = i
    print(k, v)

# Or:
for i in my_dict.items():
    print(i[0], i[1])
```

### for-else

Here with for-else such that the `else` block is executed if `break` is _not_ applied. i.e. the loop exited because the last item was reached.

```python
for foo in foos:
    do_stuff()

    if some_cond:
        break
else:
     do_more_stuff()
```
