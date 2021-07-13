# Split

Using the `str.split` method.


## Split by whitespace

Note that an empty string will give an error but you can use no arguments for the default.

That handles tabs, newlines and spaces.

```python
my_string.split()
```

e.g.

```python
"abc def ghi klm".split()
# ['abc', 'def', 'ghi', 'klm']
```

```python
"abcdef".split()
# ['abcdef']
```

```python
"abc\tdef\nghi klm".split()
# ['abc', 'def', 'ghi', 'klm']
```


## Split by delimeter

### Simple

```python
my_string.split(":")
```

```python
"abc:def:ghi".split(":")
# ['abc', 'def', 'ghi']
```

### Remove whitespace

Split by a sequence of a command _and_ a space.

```python
"abc, def, ghi, klm".split(", ")
# ['abc', 'def', 'ghi', 'klm']
```

If items may or may not have space as in the next example, you can use `str.strip` on each items to remove whitespace if any.

```python
[x.strip() for x in "abc, def,ghi, klm".split(",")]
# ['abc', 'def', 'ghi', 'klm']
```

Warning - here the whitespace is retained in each item, because we only split by a comma.

```python
"abc, def, ghi, klm".split(",")
# ['abc', ' def', ' ghi', ' klm']
```

### Split by newline characters

```python
my_string.split("\n")
```

e.g.

```python
"""abc
def
ghi
""".split("\n")
# ['abc', 'def', 'ghi', '']
```

If reading text from a file, you'll end up with a trailing newline in each string still. Then this more appropriate:

```python
my_string.splitlines()
```

e.g.

```python
with open(path) as f_in:
    text = f_in.read()
    lines = text.splitlines()
```

Or not from a file.

```python
"""abc
def
ghi
""".splitlines("\n")
['abc', 'def', 'ghi']
```

This will split by the **newline** characters and will also **remove** them by default. This is useful as you probably don't want to have `"\n"` at the end of each item in the list. 
