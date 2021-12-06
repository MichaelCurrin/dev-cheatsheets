# Sorting


## Resources

See [Sorting](https://docs.python.org/3/howto/sorting.html) guide in the Python 3 docs.


## Iterables

### Sorted function

Using `sorted` built-in function to create a new list which is sorted. You can use it on a `list`, `tuple` or `set` but you always get a `list`.

On a list:

```python
sorted([5, 2, 3, 1, 4])
# [1, 2, 3, 4, 5]
```

On a tuple:

```python
>>> sorted (( 1,5, 3))
[1, 3, 5]
```

On a set:

```python
>>> sorted({ 1 , 5, 3})
[1, 3, 5]
```

Some more practical `list` examples.

Here we keep both lists.

```python
my_strings = ["abc", "xyz", "def"]

my_sorted_strings = sorted(my_strings)
my_sorted_strings
# ['abc', 'def', 'xyz']
```

Here we overwrite the original list.

```python
my_strings = ["abc", "xyz", "def"]

my_strings = sorted(my_strings)
my_strings
# ['abc', 'def', 'xyz']
```

Neatly with a `for` loop:

```python
my_strings = ["abc", "xyz", "def"]

for s in sorted(my_strings):
    print(s)
```


### Sort method

Use `list.sort` method to modify _in place_. Only available on the `list` type.

```python
a = [5, 2, 3, 1, 4]
a.sort()
a
# [1, 2, 3, 4, 5]
```

```python
my_strings = ["abc", "xyz", "def"]

my_strings.sort()
my_strings
# ['abc', 'def', 'xyz']
```

### List of dictionaries

If you try and apply `sorted`

## Dictionaries

Applying `sorted` on `dict` will sort and return its keys only.

```python
my_dict = {1: 'D', 2: 'B', 3: 'B', 4: 'E', 5: 'A'}
sorted(my_dict)
# [1, 2, 3, 4, 5]
```

You can use `dict.item` to get a list of tuples (each with a key and value). If you sort that list, the key will be used first to sort on. If two items have the same key, then the value will also be used.

```python
sorted(my_dict.items())
# [(1, 'D'), (2, 'B'), (3, 'B'), (4, 'E'), (5, 'A')]
```

You could use that like this, unpacking the two values of the tuple pair as key and value pairs.

```python
for k, v in sorted(my_dict.items()):
    print(k, v)

# 1 D
# 2 B
# 3 B
# 4 E
# 5 A
```

Or iterate over the sorted keys and get the value too.
This can be used to get keys and values together though.

```python
my_dict = {1: 'D', 2: 'B', 3: 'B', 4: 'E', 5: 'A'}

for k in sorted(my_dict):
     print(k, my_dict[k])
 
# 1 D
# 2 B
# 3 B
# 4 E
# 5 A
```


## Sort functions

### Key functions

This works with both `sorted` and `list.sort`.

Supply a function to apply. Usually as an anonymous function, but you can reference an existing function if you like.

Here we sort a `list` as if all the elements were lowercase, but we keep the original values.

```python
my_list = "This is a test string from Andrew".split()

sorted(my_list, key=str.lower)
# ['a', 'Andrew', 'from', 'is', 'string', 'test', 'This']
```

Sort a list of class instances by the age attribute:

```python
class Student:

    def __init__(self, name, grade, age):
        self.name = name
        self.grade = grade
        self.age = age

    def __repr__(self):
        return repr((self.name, self.grade, self.age))


student_objects = [
    Student('john', 'A', 15),
    Student('jane', 'B', 12),
    Student('dave', 'B', 10),
]

sorted(student_objects, key=lambda student: student.age)
[('dave', 'B', 10), ('jane', 'B', 12), ('john', 'A', 15)]
```

### Operator module functions

These are easier and faster than key functions from above.

```python
from operator import itemgetter


sorted(student_objects, key=itemgetter(2))
# [('dave', 'B', 10), ('jane', 'B', 12), ('john', 'A', 15)]
```

Or

```python
from operator import attrgetter


sorted(student_objects, key=attrgetter('age'))
# [('dave', 'B', 10), ('jane', 'B', 12), ('john', 'A', 15)]
```

The operator module functions allow multiple levels of sorting. For example, to sort by grade then by age:

```python
sorted(student_objects, key=itemgetter(1, 2))
# [('john', 'A', 15), ('dave', 'B', 10), ('jane', 'B', 12)]
```

```python
sorted(student_objects, key=attrgetter('grade', 'age'))
# [('john', 'A', 15), ('dave', 'B', 10), ('jane', 'B', 12)]
```


## Reverse

### Reverse function

This returns an iterator, so remember to use convert to a list or use in a `for` loop.
```python
my_strings = ['abc', 'def', 'xyz']

reversed(my_strings)
# <list_reverseiterator object at 0x10f343a90>

list(reversed(my_strings))
# ['xyz', 'def', 'abc']
```

### Reversed method

```python
my_strings = ['abc', 'def', 'xyz']

my_strings.reversed()

my_strings
# ['xyz', 'def', 'abc']
```
