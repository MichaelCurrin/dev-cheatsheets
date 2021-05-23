# Split


## Split by whitespace

```python
my_string.split()
```

## Split by delimeter

```python
my_string.split(",")
```


## Split by newlines

```python
my_string.split("\n")
```

e.g.

```python
>>> """abc
def
ghi
""".split("\n")
['abc', 'def', 'ghi', '']
```

If reading text from a file, you'll end up with a trailing newline in each string still. Then this more appropriate:

```python
my_string.splitlines()
```

e.g.

```python
"""abc
def
ghi
""".split("\n")
['abc', 'def', 'ghi']
```

This will split by the **newline** characters and will also **remove** them by default. This is useful as you probably don't want to have `"\n"` at the end of each item in the list. 
